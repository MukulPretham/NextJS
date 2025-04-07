--> Every data fetching logic is a async function stored in lib.(data.ts)
--> All the tsc types are in th lib folder. (definations.ts)
--> Any funtion which are required in lib (util.ts)
--> All the ui components are in app/ui
--> clsx is a library that lets you toggle class names easily.

--> Fonts
-->Image Element
--> Page and layout.tsx
--> Nav links and styles when active (sePathname hook)

--> Populated database
--> Fetching Data
    -- async components, which render in server
    -- Promise.all() used for parallel time fetching
    -- sequential awaits lead to waterfall fetching

--> search functionality.
step1: 

