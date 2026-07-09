@echo off
REM TM-MedRAG Enhanced Setup Script for Windows
REM This script automates the setup of the enhanced version

echo ================================
echo TM-MedRAG Enhanced Setup
echo ================================
echo.

REM Check Python installation
echo Checking Python installation...
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Python is not installed or not in PATH
    echo Please install Python 3.8 or higher
    pause
    exit /b 1
)
echo [OK] Python found

REM Check Node.js installation
echo Checking Node.js installation...
node --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Node.js is not installed or not in PATH
    echo Please install Node.js 14 or higher
    pause
    exit /b 1
)
echo [OK] Node.js found

REM Check npm installation
echo Checking npm installation...
npm --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] npm is not installed or not in PATH
    pause
    exit /b 1
)
echo [OK] npm found

echo.
echo ================================
echo Step 1: Setting up Backend
echo ================================

REM Install Python dependencies
echo Installing Python dependencies...
pip install -r requirements.txt
if %errorlevel% neq 0 (
    echo [ERROR] Failed to install Python dependencies
    pause
    exit /b 1
)
echo [OK] Python dependencies installed

echo.
echo ================================
echo Step 2: Setting up Frontend
echo ================================

REM Navigate to frontend directory
cd frontend

REM Install npm dependencies
echo Installing npm dependencies...
npm install
if %errorlevel% neq 0 (
    echo [ERROR] Failed to install npm dependencies
    cd ..
    pause
    exit /b 1
)
echo [OK] npm dependencies installed

REM Backup original files
echo Backing up original files...
if exist "src\App.js" (
    copy /Y "src\App.js" "src\App_Original.js" >nul 2>&1
    copy /Y "src\App.css" "src\App_Original.css" >nul 2>&1
    copy /Y "src\components\QueryInterface.js" "src\components\QueryInterface_Original.js" >nul 2>&1
    echo [OK] Original files backed up
)

REM Copy enhanced files
echo Installing enhanced version...
copy /Y "src\App_Enhanced.js" "src\App.js"
copy /Y "src\App_Enhanced.css" "src\App.css"
copy /Y "src\components\QueryInterface_Enhanced.js" "src\components\QueryInterface.js"
copy /Y "src\components\QueryInterface_Enhanced.css" "src\components\QueryInterface.css"
echo [OK] Enhanced version installed

cd ..

echo.
echo ================================
echo Step 3: Creating Data Directories
echo ================================

REM Create necessary directories
if not exist "data\embeddings" mkdir "data\embeddings"
if not exist "data\raw\synthetic" mkdir "data\raw\synthetic"
if not exist "data\processed" mkdir "data\processed"
if not exist "logs" mkdir "logs"
echo [OK] Data directories created

echo.
echo ================================
echo Step 4: Sample Data (Optional)
echo ================================

set /p GENERATE_DATA="Generate sample synthetic data? (Y/N): "
if /i "%GENERATE_DATA%"=="Y" (
    echo Generating synthetic data...
    python src\utils\generate_synthetic_data.py --num-patients 50
    if %errorlevel% equ 0 (
        echo [OK] Sample data generated
    ) else (
        echo [WARNING] Sample data generation failed (optional step)
    )
) else (
    echo Skipping sample data generation
)

echo.
echo ================================
echo Setup Complete!
echo ================================
echo.
echo Next steps:
echo.
echo 1. Start the backend (in this window):
echo    python src\api\main_enhanced.py
echo    OR
echo    uvicorn src.api.main_enhanced:app --reload
echo.
echo 2. Start the frontend (in a NEW window):
echo    cd frontend
echo    npm start
echo.
echo 3. Open http://localhost:3000 in your browser
echo.
echo 4. Click 'Initialize Now' to build the retrieval index
echo.
echo [WARNING] This is for research purposes only!
echo.

set /p START_BACKEND="Start backend server now? (Y/N): "
if /i "%START_BACKEND%"=="Y" (
    echo.
    echo Starting backend server...
    echo Backend will run on http://localhost:8000
    echo API docs available at http://localhost:8000/docs
    echo.
    python src\api\main_enhanced.py
) else (
    echo.
    echo Run 'python src\api\main_enhanced.py' when ready to start
    pause
)
