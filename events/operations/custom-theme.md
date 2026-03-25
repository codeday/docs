---
layout: default
title: Configuring a Custom Theme
parent: Operations
grand_parent: Events
nav_order: 4
---
# Configuring a custom theme

By default, events will pull from Contentful (CodeDay’s CMS) to get information about an events theme. However, sometimes you might want to use a different theme (or no theme at all!)

In this case, you can configure this using clear metadata, however there are a few things to keep in mind for this to function properly.

# For Organizers

{: .note }
> All this can be done from the “Edit Advanced Config” page for your Event.
>
> ![Untitled](Configuring%20a%20custom%20theme/Untitled.png)

1. For your custom theme to be displayed, make sure that “Disable Theme” is set to an empty string
    
    ![What this should look like](Configuring%20a%20custom%20theme/Untitled%201.png)
    
    What this should look like
    
    **Any other value than an empty string will cause no theme to be displayed, regardless of the values of other settings**
    
2. Set “Custom theme text” to what you want displayed as the theme.
    
    ![Untitled](Configuring%20a%20custom%20theme/Untitled%202.png)
    
3. Set “Custom theme backgrounds” to a JSON array of strings, each string being a url to an image. The url should point to a CodeDay-controlled CDN ([`images.ctfassets.net`](http://images.ctfassets.net),`f1.codeday.org`, `img.codeday.org`, `uploads.codeday.org`) For help uploading to CodeDay’s CDN, ask your CodeDay point of contact.
    
    for example:
    
    ```json
    ["https://images.ctfassets.net/d5pti1xheuyu/68bkrSFt6RRQtM3oLxOGXO/88271427057006a64bb122138d0690e2/tyler_speaking.jpg", "https://images.ctfassets.net/d5pti1xheuyu/5Eo71EJ6TdVNUDCQp74trZ/36cd6b89ad42297ebd395918dac73356/vyby6cz2rqr5b5x99dptzzrgbdqh9iem49qhkc71uf1vzvbgq9oskiiuym5ryxwycx.jpg"]
    ```
    
    ![Unfortunately, it will not look as pretty as it does in Notion on the actual page.](Configuring%20a%20custom%20theme/Untitled%203.png)
    
    Unfortunately, it will not look as pretty as it does in Notion on the actual page.
    
    {: .note }
    > Not sure what to use for theme backgrounds? Check out [Theme images](picking-a-theme.md) for tips and tricks!
    
4. If both values are set, your theme should now be displayed on the event page
    
    ![Untitled](Configuring%20a%20custom%20theme/Untitled%204.png)
    

## Troubleshooting

Keep in mind that event pages are cached, so any change made to event config can take anywhere from 5-15 minutes to take effect.

Problem 1: **The old theme is showing up instead of my custom one**

This is most likely due to caching. If it has been over 15 minutes since you have made the change, double-check it is not your browser/device doing this by opening your event page in a private browsing tab or on a different device. If those do not show the correct theme, it is possible your changes did not get saved. Refresh Clear and double check that your settings are listed under “metadata” in the main event dashboard. It should look something like this:

![Untitled](Configuring%20a%20custom%20theme/Untitled%205.png)

If you don’t see both `theme: custom: text` and `theme: custom: backgrounds`, try setting them again in the advanced config panel.

Feel free to reach out to your CodeDay point of contact if you need help!

Problem 2: **Instead of my custom theme, no theme is being displayed**

- Make sure “Disable theme” is set to an empty string, as that option overrides any custom theme being set.
- Make sure you have **both** “Custom theme text” **and** “Custom theme backgrounds” set, only having one of them configured will cause it to not display a theme (this is by design)
- Make sure “Custom theme backgrounds” is valid JSON, and in the format specified [here](Configuring%20a%20custom%20theme%2087d8785497f3451aab32a395338ee467.md). Notably, make sure you are using double quotes (`”`) and that your list does not have a trailing comma. To test your JSON for syntax errors, the easiest way is to open your browser console, and check the output of `JSON.parse('YOUR_CONFIG_HERE')` (yes, with the single quotes)

If that doesn’t work, reach out to your CodeDay point of contact who can help investigate

Problem 3: **After configuring a custom theme, my event page is now giving a server error**

The most likely cause of this is improper configuration of metadata. It is recommended to follow the steps listed in Problem 2 above, however if the problem persists please post in the `#fungineering` Discord channel or DM Lola Egherman (discord: `low_lah`)

---

# For Developers

{: .note }
> You don’t need to read this unless you are building software on top of clear’s API that cares about an event’s theme

Any query of event theme should ensure to read from the following metadata of a `ClearEvent`

- `theme.disable`
- `theme.custom.text`
- `theme.custom.backgrounds`

(as with all Clear metadata, these values will always be either strings or null)

If `theme.disable` is set to a truthy value (as considered by JavaScript) this should be treated the same as a `CmsEvent` with `theme` equal to null or an empty string, regardless of any set `theme.custom` values.

In practice, support is only needed for the following values: 

- `1` (true)
- [null] (false)
- [empty string] (false)

If either `theme.custom.text` or `theme.custom.backgrounds` are set (non-null, non-empty strings), any theme data in an associated `CmsEvent` should be ignored.

If an event has one of these metadata values it should be treated identically to a `CmsEvent` having only one of `theme` or `themeBackgrounds`, respectively.

While the value of `theme.custom.text` is in the same format as a `CmsEvent` `theme`, this is not the case for `theme.custom.backgrounds` and a `CmsEvent`'s `themeBackgrounds` field.

`theme.custom.backgrounds` is expected to be a stringified JSON array of strings. (If this is not the case, treat it as an empty array)

The strings should be treated the same as you would a `CmsAsset` `url`

For an example of transforming `theme.custom.backgrounds` into the same structure as `themeBackgrounds` see the reference implementation below.

Reference implementation (from [www-event](https://github.com/codeday/www-event))

```jsx
const { theme, themeBackgrounds } = (event?.customTheme || event?.customThemeBackgrounds) ? {
    theme: event?.customTheme,
    themeBackgrounds: { 
			items: (((_) => {
				try { 
					return JSON.parse(event.customThemeBackgrounds).map((i) => ({ url: i }));
				} catch (e) { 
					return undefined;
				} 
			}).call() || []) },
  } : (event?.eventGroup?.cmsEventGroup || {});
```

This code assumes `event` is the result of the following fragment:

```graphql
fragment Theme on ClearEvent {
  eventGroup {
    cmsEventGroup {
      theme
      themeBackgrounds {
        items {
          url
        }
      }
    }
  }
  disableTheme: getMetadata(key: "theme.disable")
  customTheme: getMetadata(key: "theme.custom.text")
  customThemeBackgrounds: getMetadata(key: "theme.custom.backgrounds")
}
```