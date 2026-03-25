---
layout: default
title: Creating a Region/City Config in Contentful
parent: Operations
grand_parent: Events
nav_order: 2
---
# Creating a Region/City Config in Contentful

{: .note }
> **tl;dr:**
> - All CodeDay software pulls region information from Contentful, which is sort of like a database but anyone can query it over an API.
> - Whenever we launch in a new city someone first has to add it to Contentful.

Log into Contentful (ask for an invite if you don't already have one):

[Contentful](https://app.contentful.com/)

{: .note }
> If you're creating a totally new country, follow the instructions in "Creating a New Region".
>
> If you're creating a new city in an existing region, you can save time by duplicating an existing region.

## Creating a New Region

Visit Content -> Events -> [Regions](https://app.contentful.com/spaces/d5pti1xheuyu/entries?id=HzBNNHNehpav3pEG&contentTypeId=region&order.fieldId=updatedAt&order.direction=descending&displayedFieldIds=contentType&displayedFieldIds=updatedAt&displayedFieldIds=author&folderId=aE9DGbL48Y24VoLL&page=0) to see all existing regions.

Near the top-right, click "Add Entry", and then click "Region":

![Untitled](Creating%20a%20Region%20City%20Config%20in%20Contentful/Untitled.png)

This will create a draft region for you to edit. When everything is complete, hit the Publish button on the right-hand side:

![Untitled](Creating%20a%20Region%20City%20Config%20in%20Contentful/Untitled%201.png)

## Duplicating an Existing Region

Visit Content -> Events -> [Regions](https://app.contentful.com/spaces/d5pti1xheuyu/entries?id=HzBNNHNehpav3pEG&contentTypeId=region&order.fieldId=updatedAt&order.direction=descending&displayedFieldIds=contentType&displayedFieldIds=updatedAt&displayedFieldIds=author&folderId=aE9DGbL48Y24VoLL&page=0) to see all existing regions.

Click on an existing region **in your country.**

Near the top-right of the page, click "...", then click "Duplicate":

![Untitled](Creating%20a%20Region%20City%20Config%20in%20Contentful/Untitled%202.png)

---

## Fields

There are a lot of fields to fill out, because region information is used across a lot of different apps. The information on this page affects how we process payments, websites, presentations, flyers, and more!

### **Accounting Name**

This should be of the format `[Region Code] : [State] : [optional city or other disambiguator)`.

You only need to use the "optional city" part if you expect there will be multiple CodeDays in the area happening simultaneously, for example `US-West : California` has `Bay Area`, `LA`, and `San Diego` but `US-East : Georgia` doesn't have any cities because we expect most will be in Atlanta.

Region Code is one of:

- `US-West`
- `US-Midwest`
- `US-East`
- `US-South`
- `EMEA` (Europe and the Middle East)
- `LATAM` (Latin America)
- `APAC` (Asia and India)
- `Africa`

### Webname

The primary way you want the city referred to in URLs, for example `codeday.org/ba` or `showcase.codeday.org/projects/all/region=mumbai`

### Webname Aliases

Additional ways people might refer to this city, which will be redirected to the primary one.

### Name

Display name for the city.

### Abbreviation

2-4 character shorthand used in some internal dashboards. Usually this is the code of the nearby airport.

### Location

You can use the searchbox under the map to search for the city name. This is used to detect the nearest CodeDay cities and displayed on the globe.

### Timezone

Choose your region's [IANA timezone](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones). In many cases there are multiple "linked" timezones (the same timezones with different names of major cities in that timezone) -- if that's the case the list only has one of the major cities.

### Complication, Primary Color, Motto, Skyline Photo, Region Photos

(These are intended to help customize each city, but right now they aren't used and can be left blank.)

### Large Sticker / Small Sticker

Region-specific sticker, if you have one.

For the large sticker, SVG is preferred as it's better when we get stickers printed.

The small sticker is used when displayed inline with text (for example in Discord emojis). This is usually a similar design to "Large Sticker" but with much simpler graphics. The file can still be a large image, but it will be displayed at small sizes.

You can leave both of these blank if you don't have one.

{: .note }
> You probably don't need to change the settings below if you copied a region instead of creating a new one.

### Country Name, Country Name Short, Country Name Adjective, and Country Name Short Adjective

Choose how the country name should be used in sentences. See the help text for examples.

- USA: `the United States` / `the USA` / `United States` / `US`
- India: `India` / `India` / `Indian` / `Indian`

### Alpha-2 and Alpha-3 Code

Look up from the list [here](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2#Officially_assigned_code_elements) and [here](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-3#Officially_assigned_code_elements).

- USA: `US` / `USA`
- India: `IN` / `IND`

### E.164 Country Code

This is the part of the phone number you add when dialing internationally. Look up from the list [here](https://en.wikipedia.org/wiki/List_of_country_calling_codes#Alphabetical_listing_by_country_or_region).

- USA: `1`
- India: `91`

### ISO 4217 Currency

The three-letter currency name. Look up from the list [here](https://en.wikipedia.org/wiki/ISO_4217#List_of_ISO_4217_currency_codes).

- USA: `USD`
- India: `INR`

### Currency Symbol

The symbol placed before a currency value. Look up from the list [here](https://en.wikipedia.org/wiki/Currency_symbol#List_of_currency_symbols_currently_in_use), and use the ISO 4217 currency code if you don't have one.

- USA: `$`
- India: `₹`

### Payment Provider

- India: `razorpay`
- All others: `stripe`

### Messaging Services

Usually you should keep all of these checked, unless absolutely no one in a region will know what they are.
