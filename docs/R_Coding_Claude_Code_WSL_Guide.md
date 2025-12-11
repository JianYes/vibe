[Home](./)

# R Coding with Claude Code in WSL

You've learned R in VS Code and version control with GitHub Desktop. Now combine them: write R code by describing what you want to Claude Code, run it in WSL's Linux environment, and track changes with Git. Think of it as having an AI pair programmer who writes code while you guide the direction and keep clean save points.

## Key Concepts

- **WSL (Windows Subsystem for Linux)** - A Linux environment running inside Windows where R often runs faster than native Windows
- **Claude Code** - AI assistant in your terminal that writes, runs, and commits code based on your descriptions
- **Two version control options** - Use GitHub Desktop to visually review changes, or let Claude commit directly from the terminal

## What You'll Need

- Finished [R in VS Code](./R_Coding_VS_Code_Guide) tutorial
- Finished [GitHub Desktop with Claude Code](./GitHub_Desktop_Claude_Code_Workflow) tutorial
- WSL installed on Windows (Ubuntu recommended)
- 15-20 minutes

## Step 1: Open VS Code Connected to WSL

- Open **VS Code**
- Look at the **bottom-left corner** for a blue or green button (may show `><` icon)
- Click it to open the Remote menu
- Select **Connect to WSL**
- VS Code reloads and connects to your Linux environment
- The bottom-left now shows **WSL: Ubuntu** (or your distribution name)

## Step 2: Create Project Folder

- In VS Code, click **Terminal > New Terminal**
- The terminal opens inside WSL (you'll see a Linux prompt like `username@computer:~$`)
- Create and open a project folder:

```bash
mkdir -p ~/projects/iris-analysis
cd ~/projects/iris-analysis
code .
```

- VS Code reopens in the new folder (still connected to WSL)

## Step 3: Install R in WSL

- In the terminal, update packages and install R:

```bash
sudo apt update && sudo apt install r-base -y
```

- Enter your password when prompted
- Wait for installation to complete (1-2 minutes)
- Verify R is installed:

```bash
R --version
```

- You should see version information (R 4.x.x)

**Note:** This installs R from Ubuntu's repository, which may be a slightly older version. For most tutorials and learning purposes, this works fine. To install the latest R version, see the [CRAN Ubuntu instructions](https://cran.r-project.org/bin/linux/ubuntu/).

## Step 4: Initialize Git Repository

- In the terminal, initialize version control:

```bash
git init
```

- You'll see: `Initialized empty Git repository in /home/username/projects/iris-analysis/.git/`
- This creates a hidden `.git` folder that tracks all your changes

## Step 5: Start Claude Code

- In the terminal, start Claude Code:

```bash
claude
```

- If this is your first time, a browser window opens for authentication
- Log in with your Claude account
- Return to VS Code after authentication succeeds
- You'll see Claude's welcome message in the terminal

## Step 6: Task 1 - Create Summary Script

- In Claude Code, type this request:

```
Create an R script called iris_summary.R that loads the built-in iris dataset and calculates the mean of Sepal.Length, Sepal.Width, Petal.Length, and Petal.Width for each species. Print the results as a clean table.
```

- Press **Enter**
- Watch Claude create the file (10-20 seconds)
- Claude writes the R code and saves it to `iris_summary.R`

## Step 7: Run the R Script

- In Claude Code, type:

```
run the script
```

- Or exit Claude (type `/exit`) and run manually:

```bash
Rscript iris_summary.R
```

- You'll see a table showing mean values for each species:
  - **setosa** - smaller petals, medium sepals
  - **versicolor** - medium measurements
  - **virginica** - largest petals and sepals

## Step 8: Review Changes in GitHub Desktop

- Open **GitHub Desktop** on Windows
- Click **File > Add Local Repository**
- In the path field, type: `\\wsl$\Ubuntu\home\` then add your username and project path
  - Example: `\\wsl$\Ubuntu\home\john\projects\iris-analysis`
- Click **Add Repository**
- You'll see `iris_summary.R` listed as a new file (green = added)
- **Right panel** shows the code Claude wrote
- Read through to understand what Claude created
- Don't commit yet - we'll add more first

## Step 9: Task 2 - Add Visualization

- Back in VS Code, make sure Claude Code is running (type `claude` if needed)
- Type this request:

```
Update iris_summary.R to also create a bar chart showing the average Petal.Length for each species. Save the chart as petal_chart.png. Use base R graphics.
```

- Press **Enter**
- Claude updates the script to include plotting code
- Run the script again:

```
run the script
```

- The script now outputs the table AND creates `petal_chart.png`

## Step 10: View the Chart

- In VS Code's file explorer (left sidebar), click on `petal_chart.png`
- VS Code displays the bar chart showing:
  - **setosa** with the shortest petal length
  - **versicolor** in the middle
  - **virginica** with the longest petals
- This visualization makes the species differences clear at a glance

## Step 11: Let Claude Commit Your Changes

- In Claude Code, type:

```
commit all my changes with a descriptive message
```

- Claude will:
  - Stage all files (`git add`)
  - Write a commit message describing what was added
  - Create the commit
- You'll see confirmation of the commit

## Step 12: Verify in GitHub Desktop

- Switch to **GitHub Desktop**
- Click **Fetch origin** or refresh if needed
- Click the **History** tab
- You'll see your commit with Claude's message
- Click on it to see exactly what files were added

## Step 13: Push to GitHub (Optional)

- In GitHub Desktop, click **Publish repository**
- Choose a name (or keep `iris-analysis`)
- Uncheck **Keep this code private** if you want it public
- Click **Publish Repository**

Or ask Claude to push:

```
push to origin
```

Your code is now backed up on GitHub.

## Next Steps

- Ask Claude to add a scatter plot: "Add a scatter plot showing Sepal.Length vs Petal.Length, colored by species"
- Try box plots: "Create box plots comparing Petal.Width across species"
- Export data: "Save the summary statistics to a CSV file"
- Explore other datasets: "What other built-in R datasets are available?"

## Troubleshooting

- **"R: command not found"** - Re-run Step 3 to install R. If it still fails, try `sudo apt install r-base-core`.
- **GitHub Desktop can't find WSL folder** - Make sure the path starts with `\\wsl$\Ubuntu\home\`. Check your Ubuntu username with `whoami` in the terminal.
- **Claude authentication fails** - Make sure you have a Claude account at [claude.ai](https://claude.ai). Try running `claude` again.
- **Plot not appearing** - Check that `petal_chart.png` was created in the file explorer. If not, ask Claude to check for errors.

## Workflow Summary

- **VS Code + WSL** - Edit and run code in a Linux environment from Windows
- **Claude Code** - Describe what you want, Claude writes the R code
- **GitHub Desktop** - Visually review changes before or after committing
- **Claude commits** - Let Claude handle Git commands for speed
- **Iterate** - Describe → Run → Review → Commit → Repeat

---

Created by [Steven Ge](https://www.linkedin.com/in/steven-ge-ab016947/) on December 11, 2025.
