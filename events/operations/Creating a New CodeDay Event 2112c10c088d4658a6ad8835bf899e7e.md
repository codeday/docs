# Creating a New CodeDay Event

<aside>
💡 **tl;dr:**
- If this is a totally new city/region, [create a region config in Contentful](Creating%20a%20Region%20City%20Config%20in%20Contentful%20b3b3e5a9984e4425b2fe900541d6848f.md) first.
- Go to Clear → Groups → [Your season] → Add event
- Fill out the fields

</aside>

Visit the “Event Groups” Clear page with an admin account. (If you don’t have an admin account, ask Lola or Tyler to grant you admin permissions.)

[clear-notext-color](https://clear.codeday.org/groups)

Click on the event group your event fits into. (This will be used to determine awards, the event theme, etc.)

Click the “Add Event” button:

![Untitled](Creating%20a%20New%20CodeDay%20Event/Untitled.png)

---

## Fields

<aside>
💡 If this is the first event in a new region, you’ll need to [create a region config](Creating%20a%20Region%20City%20Config%20in%20Contentful%20b3b3e5a9984e4425b2fe900541d6848f.md) first.

</aside>

### Name

The name of the city. This is usually the same as the city the event is being held in, but you can customize it.

### Start Date / End Date

Defaults to the same as the event group, but you can change it.

### Ticket Price

(Displayed in the local region’s currency.)

### Earlybird Ticket Price

Often events will offer a discounted price for people who register early, to encourage people to commit to attending early. This “earlybird” ticket price is in effect until the “Earlybird Registration Cutoff” date defined below.

After that, tickets are sold at the regular ticket price.

You can set this to the same price as “Ticket Price” to disable earlybird pricing.

### School Group Price

Often events will offer a discount to schools if they register a large group of students. This is the price offered, if so. Set to the same as “Ticket Price” to disable this.

### Earlybird Registration Cutoff

This is the last day people can receive discounted earlybird pricing, if available. Usually people choose a week before CodeDay.

### Registration Cutoff

This is the last day people can register, before the website says tickets are off-sale.

Usually this is set to the day of CodeDay (so people can register even once the event has started), but you may want to set it to an earlier day if e.g. the venue’s security needs a list of who’s attending a few days early to print name badges.

### Contentful Region ID

This is the “webname” from the region created in Contentful. (It’s the name in the URL, e.g. `http://event.codeday.org/[webname]`). Make sure you’ve [created a region](Creating%20a%20Region%20City%20Config%20in%20Contentful%20b3b3e5a9984e4425b2fe900541d6848f.md) if we’ve never run events here before.

### Regional Managers

Add all the CodeDay account usernames of the people who can edit this event.

<aside>
💡 Regional Managers need an additional permission to access Clear as an extra security feature. The link to add this permission is pinned in the CodeDay Organizers channel.

</aside>

### Timezone (IANA)

The timezone name the city is in. Find yours here: 

[List of tz database time zones - Wikipedia](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List)

### Age of Majority

The minimum age to sign a contract in your city. Students who are younger than this will require a parent to co-sign their waiver.

### Minimum Age to Stay Overnight

Students who are younger than this will get a message informing them that they can attend CodeDay, but can’t stay overnight.

Usually this should be set to `13`, since younger students tend to be disruptive.

Set to `1` if your event isn’t overnight or doesn’t have a minimum age.

### Minimum Age to Register / Maximum Age to Register

(Self-explanatory.)

### Requires Promo Code

This will prevent anyone from registering from an event without entering a promo code. Use this for invite-only events.

<aside>
💡 **How do we cap attendance?**

You can cap attendance when adding a venue later.

Once the venue max capacity has been reached, the event will show “sold-out”. You don’t need to manually close registrations.

</aside>