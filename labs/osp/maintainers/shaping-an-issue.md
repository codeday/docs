---
parent: For Open Source Maintainers
---
# Shaping An Issue

[Examples of Good Issues](Shaping%20An%20Issue/Examples%20of%20Good%20Issues%206e634d7521904c0ca79476bd962a199c.csv)

Here are the key criteria that we’ve curated when creating a good issue for CodeDay Labs:

## The end goal is clearly explained

- Clearly articulate the expected behavior of the issue
- Call to action
- Example:
    
    > The dialog box should have a button that, when clicked, closes the pop-up
    > 

## Starting points for how to solve the problem are provided

- **Important: make sure to ONLY give starting points** and not specific steps to solve the issue
- Giving students all the steps will remove the “discovery” aspect of solving a problem; it’s like they’re reading an instruction booklet
- Examples:
    
    > Here is a StackOverflow thread that talks about behavior similar to the bug
    > 
    
    > Here is a Python library that implements some of new functionality
    > 

## Descriptive background for the issue

- Clear and concise title that accurately reflects the issue
- Steps to reproduce the issue
- Relevant code snippets or screenshots
- Error messages, if applicable
- Any attempted solutions or workarounds that have been tried but failed
- Any additional context or information that may be helpful to solving the issue, such as browser or operating system being used

## Size of the task

- Bite-sized tasks
- Scale is important here; these are typically small things that seasoned developers would take 30 minutes to solve

## Buckets

Here are a few of our popular issue types to help get you thinking about what kind of issues you want to provide:

<aside>
✨

**Enhancements**
This is precisely what the name says—issues of this type add new functionality to your app. For example, this could be a new API route or a new function added to your library. It is easy to get swept away with complex issues when making new features, so feel free to split your issues up into small parts if you think that they are too big.

Example issues:
****https://github.com/winstonjs/winston/issues/2026 (Change default permissions for file transport)
https://github.com/processing/p5.js/issues/5762 (Add a function to get the target frame rate)

</aside>

<aside>
💄 **UI/UX Improvements**
Does something look a bit unpolished in your application? Or perhaps you don’t like the format in which your data is presented (e.g. table form, list form)? These are the tasks that we are looking to give students to work on. Here are a few examples of issues in this bucket:

https://github.com/freeCodeCamp/classroom/issues/167 (Stop showing dashed names when creating a classroom)
https://github.com/freeCodeCamp/classroom/issues/134 (Creating more UX-friendly alerts)

</aside>

<aside>
🐛 **Bug Fix**
This is the broadest out of the categories. A bug fix can either be a security-related bug or a UI/UX-related bug. This is also the easiest out of the five categories to create since bugs (unfortunately) show up pretty frequently! 

Example issues:
https://github.com/freeCodeCamp/classroom/issues/238
https://github.com/winstonjs/winston/issues/2144

</aside>

<aside>
🧪 **Creating Tests**
Most projects are very large and use TDD to ensure that nothing unexpectedly breaks. Some ideas to get you thinking: creating tests for React components, creating tests for API routes, and creating tests for a function.

Example issue:
https://github.com/wevote/WeVoteServer/issues/1920

</aside>

<aside>
🆕 **Code Improvements**
These types of issues don’t change the end-user experience, but improve the developer experience. Here are some examples of issues that you could create: Moving from Javascript to Typescript (or adding Typescript typedefs), updating files to new coding conventions (e.g. React Classes → React Hooks, removing prop spreading, etc).

Example issue:
https://github.com/wevote/WebApp/issues/3232

</aside>