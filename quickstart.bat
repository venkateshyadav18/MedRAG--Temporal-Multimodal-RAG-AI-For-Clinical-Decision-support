@echo off
REM TM-MedRAG Quick Start Script for Windows

echo ========================================
echo TM-MedRAG Quick Start Script
echo ========================================
echo.

echo Step 1: Creating Python virtual environment...
python -m venv venv
call venv\Scripts\activate.bat
echo Virtual environment created!
echo.

echo Step 2: Installing Python dependencies...
python -m pip install --upgrade pip
pip install -r requirements.txt
echo Dependencies installed!
echo.

echo Step 3: Installing medical NLP models...
python -m spacy download en_core_web_sm
python src\utils\install_medical_models.py
echo Medical models installed!
echo.

echo Step 4: Generating synthetic data...
python src\utils\generate_synthetic_data.py --n-patients 1000
echo Synthetic data generated!
echo.

echo Step 5: Processing clinical notes...
python src\preprocessing\process_notes.py
echo Notes processed!
echo.

echo Step 6: Building search index...
python src\retrieval\build_index.py
echo Index built!
echo.

echo Step 7: Running tests...
pytest tests\ -v --tb=short
echo Tests completed!
echo.

echo ========================================
echo Setup Complete!
echo ========================================
echo.
echo To start the system:
echo.
echo Terminal 1 (Backend):
echo   cd src\api
echo   python main.py
echo.
echo Terminal 2 (Frontend):
echo   cd frontend
echo   npm install
echo   npm start
echo.
echo Access:
echo   Web Interface: http://localhost:3000
echo   API Docs:      http://localhost:8000/docs
echo.
pause
