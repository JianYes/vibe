# Choose your R version (update as you like)
FROM rocker/shiny-verse:latest

# 1. System deps commonly needed by R packages
RUN apt-get update && apt-get install -y \
    libcurl4-openssl-dev libssl-dev libxml2-dev git curl && \
    rm -rf /var/lib/apt/lists/*

# 2. R packages for VS Code integration: language server + debugger
RUN R -q -e 'install.packages("vscDebugger", repos=c("https://manuelhentschel.r-universe.dev","https://cloud.r-project.org"))'
RUN R -q -e 'install.packages("languageserver", repos="https://cloud.r-project.org")'

# 3. Install Node.js LTS from NodeSource
RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - \
    && apt-get install -y nodejs \
    && npm install -g npm@latest
    
# 4. Install Claude Code globally
RUN npm install -g @anthropic-ai/claude-code

# 5. Install additional R packages for the script
#COPY ./packages.R /tmp/packages.R
#RUN Rscript /tmp/packages.R

# Expose Shiny server port
EXPOSE 3838