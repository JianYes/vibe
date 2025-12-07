# Using GitHub Desktop with Claude Code

## The Problem

You're coding with AI assistance. Claude makes changes to your files. Sometimes the changes work perfectly. Sometimes they don't. You want to try different approaches, but you're afraid of losing what you had before. You can't remember what changed between versions. You want to experiment boldly, but you need a safety net.

**Version control is like an unlimited undo button for your entire project.** Every time you save a snapshot (called a "commit"), you create a restore point. You can always go back to any previous version. You can see exactly what changed. You can experiment fearlessly.

When you combine [GitHub Desktop](https://desktop.github.com) (visual version control) with [Claude Code](https://claude.com/claude-code) (AI coding assistant), you get the best of both worlds: AI writes code fast, and you track every change safely.

## Key Concepts

**Git** is version control software that tracks every change to your files. It runs on your computer and remembers your entire project history.

**GitHub** is a website that stores your code in the cloud. Think of it as cloud backup for code. You can access your projects from any computer and share them with others.

**GitHub Desktop** is an app that makes Git visual and easy. Instead of typing commands, you click buttons. You can see your changes highlighted in green (added) and red (removed).

**Claude Code** is an AI coding assistant that lives in your terminal. You can ask it to write code, fix bugs, explain changes, and even create commits for you.

## Overview

In this tutorial, you'll:
- Set up a demo project in GitHub Desktop
- Ask Claude Code to create a simple timer app (single HTML file)
- Test the app in your browser
- Fix any errors by pasting them to Claude
- Manually commit and push changes (learn the visual way)
- Ask Claude to add a sound notification (it messes up!)
- Roll back to previous working version
- Redo the sound feature from scratch
- Let Claude commit and push automatically (learn the fast way)
- View your project history

## What You'll Need

- **GitHub Desktop** installed ([download here](https://desktop.github.com))
- **Claude Code** installed ([installation guide](https://code.claude.com/docs/en/installation))
- **A GitHub account** (free at [github.com](https://github.com))
- **A web browser** (Chrome, Firefox, Safari, or Edge)
- **Basic terminal familiarity** (you should know how to open a terminal and navigate directories)

## Step 1: Set Up Your Demo Project

Let's create a new project folder for your timer app.

1. Open **GitHub Desktop**
2. Click **File** → **New Repository** (or press `Ctrl+N` on Windows, `Cmd+N` on Mac)
3. Fill in the form:
   - **Name:** `simple-timer`
   - **Description:** `A timer app built with Claude Code`
   - **Local Path:** Choose where to save it (your Documents folder works well)
   - **Check** the box "Initialize this repository with a README"
   - **Git Ignore:** None
   - **License:** None
4. Click **Create Repository**

**What you'll see:** GitHub Desktop creates the folder and shows you're on the `main` branch with one commit (the README file).

5. Click **Publish repository** at the top
6. **Uncheck** "Keep this code private" if you want others to see it (optional)
7. Click **Publish Repository**

**What you'll see:** A progress bar, then the button changes to "Fetch origin". Your project is now on GitHub!

**Why this matters:** You've created both a local project (on your computer) and a remote backup (on GitHub). Any changes you make locally can be pushed to GitHub for safekeeping.

## Step 2: Ask Claude to Create the Timer App

Now let's use Claude Code to build the timer.

1. Open your **terminal** (Command Prompt, PowerShell, or Terminal app)
2. Navigate to your project folder:
   ```
   cd ~/Documents/simple-timer
   ```
   (Adjust the path if you saved it somewhere else)

3. Start Claude Code:
   ```
   claude
   ```

**What you'll see:** Claude Code starts an interactive session. You'll see a prompt where you can type messages to Claude.

4. Type this request to Claude:
   ```
   Create a simple countdown timer app in a single HTML file called timer.html.
   It should have:
   - An input field to set minutes
   - Start and Stop buttons
   - Display showing time remaining in MM:SS format
   - When timer reaches zero, display "Time's up!"
   Keep it simple with inline CSS and JavaScript.
   ```

5. Press **Enter**

**What you'll see:** Claude will create the `timer.html` file and show you the code it wrote. This may take 10-30 seconds.

**Note:** Claude Code can see your project files and create new ones. The file is automatically saved to your project folder.

## Step 3: Test the Timer in Your Browser

Let's see if the timer works!

1. In GitHub Desktop, click **Repository** → **Show in Finder** (Mac) or **Show in Explorer** (Windows)
2. Find the `timer.html` file
3. **Double-click** `timer.html` to open it in your web browser

**What you'll see:** A simple timer interface with an input field and buttons.

4. Try using the timer:
   - Type `1` in the input field (for 1 minute)
   - Click **Start**
   - Watch the countdown

**If the timer works:** Great! Move to Step 5.

**If something doesn't work:** Continue to Step 4.

## Step 4: Fix Errors by Pasting to Claude

If you see errors or unexpected behavior, Claude can fix them.

**Common issues:**
- Buttons don't respond when clicked
- Timer doesn't count down
- Timer displays incorrectly
- Browser shows error messages

**How to fix:**

1. **Open your browser's console** to see error messages:
   - **Chrome/Edge:** Press `F12` or right-click → **Inspect** → click **Console** tab
   - **Firefox:** Press `F12` → click **Console** tab
   - **Safari:** Enable developer tools first (Safari → Settings → Advanced → Show Develop menu), then press `Cmd+Option+C`

2. **Look for red error messages** in the console

3. **Copy any error messages** you see

4. **Go back to Claude Code** in your terminal

5. **Paste the error** and ask Claude to fix it:
   ```
   I'm seeing this error when I try to use the timer:
   [paste the error message here]

   Can you fix it?
   ```

6. Press **Enter**

**What you'll see:** Claude analyzes the error and updates the `timer.html` file with fixes.

7. **Refresh your browser** (press `F5` or `Cmd+R`)

8. **Test again** - the timer should work now

**Why this matters:** AI doesn't always get it right the first time. This error → fix → test cycle is how professional developers work. Version control (coming next) means you can always undo if a fix makes things worse.

**Note:** You can iterate as many times as needed. Each time Claude makes changes, you'll commit them as a snapshot in the next steps.

## Step 5: Review Changes in GitHub Desktop

Let's see what Claude created or changed.

1. Switch to **GitHub Desktop**

**What you'll see:** GitHub Desktop automatically detects the new file. You'll see:
- **Left panel:** List of changed files (`timer.html` with a green "+" icon means it's new)
- **Right panel:** The actual code, with green highlighting showing what was added

2. **Click on `timer.html`** in the left panel

**What you'll see:** All the HTML, CSS, and JavaScript code Claude wrote. Green lines mean "added" (since this is a new file, everything is green).

3. **Read through the code** to understand what Claude created

**Why this matters:** Always review AI-generated code before committing. This visual review helps you understand what changed and catch any issues.

**Note:** If Claude made fixes in Step 4, you'll see those changes here too. Modified lines show the old version in red (removed) and new version in green (added).

## Step 6: Manually Commit in GitHub Desktop

Now let's save this version as a snapshot (commit).

1. At the bottom left of GitHub Desktop, you'll see two text fields:
   - **Summary field** (required): A short description
   - **Description field** (optional): Detailed explanation

2. In the **Summary field**, type:
   ```
   Create initial timer app with start/stop functionality
   ```

3. In the **Description field** (optional), you can add details:
   ```
   - Single HTML file with inline CSS/JS
   - Input field for setting minutes
   - Start and Stop buttons
   - Countdown display in MM:SS format
   - "Time's up!" message when finished
   ```

4. Click the blue **Commit to main** button

**What you'll see:** The changes disappear from the left panel. The commit counter increases by 1. You've created a snapshot!

**Why this matters:** This commit is saved on your computer. If anything goes wrong later, you can always come back to this working version.

**Good commit messages:**
- "Create initial timer app"
- "Fix start button not responding"
- "Add pause functionality"

**Bad commit messages:**
- "changes"
- "update"
- "asdf"

## Step 7: Manually Push to GitHub

Your commit is saved locally. Now let's back it up to GitHub (the cloud).

1. At the top of GitHub Desktop, click the blue **Push origin** button

**What you'll see:** A brief progress indicator, then the button changes back to "Fetch origin". Your changes are now on GitHub!

**Why this matters:** Your code is now backed up in the cloud. If your computer crashes, your work is safe. Others can also see your project on GitHub.

2. Let's verify it's on GitHub:
   - Click **Repository** → **View on GitHub**
   - Your browser opens to your GitHub repository page
   - You'll see the `timer.html` file listed
   - Click on `timer.html` to see the code online

**Note:** You can commit multiple times before pushing. Commits are local snapshots; pushing uploads them all to GitHub at once. For this tutorial, we push after each commit to see the full workflow.

## Step 8: Ask Claude to Add Sound Notification

Let's improve the timer with a sound when it finishes.

1. **Go back to Claude Code** in your terminal (it should still be running)

**If you closed Claude Code:** Restart it with `claude` in your project folder.

2. **Ask Claude to add the feature:**
   ```
   Add a sound notification when the timer reaches zero. Use the browser's
   built-in beep sound or create a simple audio alert.
   ```

3. Press **Enter**

**What you'll see:** Claude modifies `timer.html` to add audio functionality. This takes 10-30 seconds.

4. **Test the new feature:**
   - Switch to your browser
   - **Refresh the page** (`F5` or `Cmd+R`)
   - Set the timer for a few seconds (like 0.1 minutes = 6 seconds)
   - Click **Start**
   - Wait for the countdown to finish

**What you'll see/hear:** When the timer hits zero, you should hear a beep sound and see "Time's up!"

**Note:** Some browsers block autoplay sounds. If you don't hear anything, check your browser's console for permission errors. Claude can help you handle these browser restrictions.

**For this tutorial:** Let's pretend the sound feature doesn't work well - maybe it's too loud, doesn't play, or has issues. Don't commit this yet! Instead, you'll learn how to discard changes.

## Step 9: Roll Back When AI Makes Mistakes

**The situation:** The sound notification isn't working properly. This happens with AI! Rather than trying to fix it or committing broken code, you'll discard the changes and try a different approach.

**This is the power of version control:** You can experiment fearlessly because you can always go back.

### Discard Changes in GitHub Desktop

1. Open **GitHub Desktop**
2. Click **Branch** menu at the top
3. Select **Discard All Changes**
4. Click **Discard Changes** in the confirmation dialog

**What happens:** Your `timer.html` instantly reverts to the last committed version (without the sound feature). The problematic changes are gone.

5. **Test in browser:**
   - Refresh `timer.html` (`F5` or `Cmd+R`)
   - The timer works again without the sound!

**Why this works:** You're throwing away uncommitted changes and going back to your last save point. Quick and simple!

## Step 10: Redo the Feature from Scratch

Now let's try adding sound again, but with a different approach.

1. **Go back to Claude Code** in your terminal

2. **Ask Claude for a better implementation:**
   ```
   Add a sound notification when the timer reaches zero. This time, use an HTML5
   audio element with a simple beep sound generated by the Web Audio API. Make
   sure it handles browser autoplay restrictions gracefully.
   ```

3. Press **Enter**

**What you'll see:** Claude creates a new implementation, hopefully better than the first attempt.

4. **Test immediately:**
   - Refresh your browser (`F5` or `Cmd+R`)
   - Set timer for 0.1 minutes (6 seconds)
   - Click **Start**
   - Wait for the sound

**If it works:** Great! Move to Step 11.

**If it still doesn't work:** You know what to do - paste the error to Claude, or try a third approach. Version control means you can keep experimenting until it works.

## Step 11: Let Claude Commit and Push Automatically

Now that you have a working sound implementation, let's use the faster way: asking Claude to handle version control.

1. **Stay in Claude Code** (your terminal)

2. **Ask Claude to commit and push:**
   ```
   commit and push my changes
   ```

3. Press **Enter**

**What you'll see:** Claude will:
- Check what files changed (`git status`)
- Look at the actual changes (`git diff`)
- Write a descriptive commit message
- Create the commit
- Push to GitHub
- Show you a summary of what it did

This takes 10-20 seconds.

**Example of what Claude might write:**
```
Add improved sound notification with better browser support

- Implemented audio beep using Web Audio API
- Plays tone when countdown reaches zero
- Handles browser autoplay restrictions gracefully
- Replaces previous sound implementation
```

4. **Verify in GitHub Desktop:**
   - Switch to GitHub Desktop
   - Click the **History** tab at the top
   - You'll see the new commit that Claude created

5. **Verify on GitHub:**
   - Go to your GitHub repository in your browser
   - Refresh the page
   - You'll see the new commit listed

**Why this is powerful:** Claude wrote a detailed, professional commit message and handled all the git commands. You saved time and got better documentation.

**When to use each approach:**
- **Manual (Steps 6-7):** When you want to carefully review before committing, when learning, or when you want specific commit messages
- **Automated (Step 11):** When you trust the changes, when working quickly, or when you want Claude to write descriptive messages

## Step 12: View Complete History

Let's see how your project evolved.

### In GitHub Desktop

1. Open **GitHub Desktop**
2. Click the **History** tab at the top

**What you'll see:** A clean history of your project:
- Initial commit (README)
- Create initial timer app with start/stop functionality
- Add improved sound notification with better browser support

3. **Click on any commit** to see exactly what changed in that version

**What you'll see:** Files changed, with red (removed) and green (added) highlighting.

**Notice what's NOT there:** The first failed sound attempt. Because you discarded those changes before committing, they're not in your history. Only working code made it into your commits!

### On GitHub.com

1. Go to your repository on GitHub (click **Repository** → **View on GitHub**)
2. Click the **commits** link (shows a number like "3 commits")

**What you'll see:** All commits with timestamps and messages - only the successful versions.

3. **Click on any commit** to see the changes online

**Why this matters:** You experimented locally, threw away what didn't work, and only committed working code. Your commit history is clean and professional. This is how professionals work - try things locally, discard failures, commit successes.

## How to Return and Reopen

### Opening GitHub Desktop

**On Windows:**
- Click the **Start** menu → type "GitHub Desktop" → press Enter
- Or find it in your Applications list

**On Mac:**
- Press `Cmd+Space` to open Spotlight → type "GitHub Desktop" → press Enter
- Or open **Applications** folder → double-click **GitHub Desktop**

**What you'll see:** Your repository opens to where you left off. Click "Current Repository" dropdown at the top to switch between projects.

### Opening Claude Code

1. Open your **terminal**
2. Navigate to your project:
   ```
   cd ~/Documents/simple-timer
   ```
3. Start Claude:
   ```
   claude
   ```

**What you'll see:** Claude Code starts fresh but can see your entire project and its history.

### Opening Your Project Files

From **GitHub Desktop:**
- Click **Repository** → **Show in Finder/Explorer**
- Double-click `timer.html` to test in browser
- Right-click `timer.html` → **Open With** → choose your code editor

## Troubleshooting & Help

### "Authentication failed" when pushing

**What this means:** GitHub Desktop can't connect to your GitHub account.

**How to fix:**
1. In GitHub Desktop, click **File** → **Options** (Windows) or **GitHub Desktop** → **Preferences** (Mac)
2. Click **Accounts** tab
3. Click **Sign out**, then **Sign in** again
4. Follow the browser authentication steps

### "Repository not found" on GitHub

**What this means:** The repository wasn't published or was deleted.

**How to fix:**
1. In GitHub Desktop, click **Publish repository** again
2. Make sure you're signed in to GitHub
3. Check your GitHub profile online to verify the repository exists

### Claude Code says "not a git repository"

**What this means:** You're in the wrong folder, or git wasn't initialized.

**How to fix:**
1. Check your current directory:
   ```
   pwd
   ```
2. Navigate to your project:
   ```
   cd ~/Documents/simple-timer
   ```
3. Verify git is initialized:
   ```
   ls -la
   ```
   You should see a `.git` folder

### Timer app doesn't work in browser

**What this means:** There might be JavaScript errors.

**How to fix:**
1. Open browser console (`F12` → **Console** tab)
2. Look for red error messages
3. Copy the error and paste to Claude Code
4. Ask: "I'm getting this error: [paste error]. Can you fix it?"

### Changes not showing in GitHub Desktop

**What this means:** Files weren't saved, or you're looking at the wrong repository.

**How to fix:**
1. Save the file in your editor (`Ctrl+S` or `Cmd+S`)
2. Check GitHub Desktop is showing the correct repository (top-left dropdown)
3. Click **Repository** → **Show in Explorer/Finder** to verify the location

### Need More Help?

- **GitHub Desktop Documentation:** [docs.github.com/desktop](https://docs.github.com/en/desktop)
- **Claude Code Documentation:** [code.claude.com/docs](https://code.claude.com/docs)
- **GitHub Desktop Issues:** [github.com/desktop/desktop/issues](https://github.com/desktop/desktop/issues)
- **Claude Code Community:** [github.com/anthropics/claude-code/issues](https://github.com/anthropics/claude-code/issues)

## What You've Learned

Congratulations! You now know how to:

✅ Create a project with GitHub Desktop
✅ Use Claude Code to generate working code
✅ Test and debug with browser tools
✅ Review changes visually before committing
✅ Create commits manually with clear messages
✅ Push to GitHub for cloud backup
✅ Discard bad changes before committing
✅ Redo features from scratch with confidence
✅ Ask Claude to commit and push automatically
✅ Keep a clean commit history with only working code

## The Complete Workflow

Here's your new development cycle:

1. **Ask Claude to make changes** → 2. **Test in browser** → 3. **If it works:** Review and commit → 4. **If it fails:** Discard changes and try again → 5. **Push to GitHub** → 6. **Repeat**

**Manual commits** when you want control. **Claude commits** when you want speed. Both methods work together seamlessly.

**Discard fearlessly** - uncommitted changes can be thrown away instantly. Only commit working code!

## Next Steps

Now that you know the basics, try adding more features to your timer:

### Quick Wins (Easy)
- **Quick preset buttons:** Ask Claude to add buttons for 5, 10, and 15 minute timers
  ```
  Add three preset buttons: "5 min", "10 min", and "15 min" that set the timer automatically
  ```

- **Pause button:** Let users pause and resume the countdown
  ```
  Add a Pause/Resume button that toggles the timer state
  ```

- **Visual styling:** Make it look better with colors and better fonts
  ```
  Improve the visual design with a modern color scheme, better fonts, and rounded buttons
  ```

### More Challenging (Intermediate)
- **Custom sound:** Replace the beep with music from a free source
  ```
  Replace the beep with an audio file. Let me download a free alarm sound from freesound.org
  and I'll place it in the project folder. Use that file instead of the generated beep.
  ```
  **Tip:** Download a free .mp3 or .wav file, put it in your project folder, then ask Claude to use it!

- **Multiple timers:** Run several timers at once
  ```
  Allow users to create and run multiple timers simultaneously with different labels
  ```

- **Progress bar:** Show visual progress as time counts down
  ```
  Add a progress bar that visually shows how much time remains
  ```

### Remember:
- Test each feature after adding it
- Commit after each working feature
- If something breaks, roll back and try again
- **Ask Claude to explain the code:** "Explain how the countdown logic works"

### Beyond This Project
- **Create branches:** Work on experimental features without affecting the main version
- **Collaborate:** Share your GitHub repository URL with friends and work together
- **Explore [GitHub flow](https://docs.github.com/en/get-started/using-github/github-flow):** Learn professional branching and pull request workflows

The combination of Claude Code and GitHub Desktop gives you superpowers: AI-speed development with professional version control. Happy coding!

---

*Created on December 7, 2025 with help from Claude Code.*
