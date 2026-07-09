# 🚀 TM-MedRAG Execution Guide

## 📦 Installation & Execution Steps

### Prerequisites Check

Before starting, verify you have:
- ✅ Python 3.10 or higher
- ✅ Node.js 16 or higher (for frontend)
- ✅ 16GB RAM minimum
- ✅ 10GB free disk space

### Quick Verification

```bash
python --version  # Should show 3.10+
node --version    # Should show v16+
npm --version     # Should be installed
```

---

## 🎯 Execution Method 1: Automated Script (Recommended)

### On Mac/Linux:

```bash
# 1. Extract the ZIP
unzip TM-MedRAG-Complete.zip
cd TM-MedRAG-Complete

# 2. Make script executable
chmod +x quickstart.sh

# 3. Run automated setup
./quickstart.sh
```

### On Windows:

```powershell
# 1. Extract the ZIP
# Right-click TM-MedRAG-Complete.zip → Extract All

# 2. Open PowerShell in the extracted folder

# 3. Run automated setup
.\quickstart.bat
```

**⏱️ Expected Time: 15-20 minutes**

The script will:
1. Create virtual environment
2. Install all Python dependencies
3. Download medical NLP models
4. Generate 1,000 synthetic patients
5. Process all clinical notes
6. Build semantic search index
7. Run comprehensive tests

---

## 🎯 Execution Method 2: Manual Step-by-Step

### Step 1: Setup Environment (5 minutes)

```bash
# Create and activate virtual environment
python -m venv venv

# Activate (choose your OS):
source venv/bin/activate          # Mac/Linux
venv\Scripts\activate              # Windows

# Upgrade pip
pip install --upgrade pip

# Install dependencies
pip install -r requirements.txt
```

### Step 2: Install Medical Models (3 minutes)

```bash
# Install spaCy base model
python -m spacy download en_core_web_sm

# Install biomedical models
python src/utils/install_medical_models.py
```

### Step 3: Generate Data (2-3 minutes)

```bash
# Generate synthetic MIMIC-IV dataset
python src/utils/generate_synthetic_data.py --n-patients 1000
```

**Expected Output:**
```
👤 Generating patients...
🏥 Generating admissions...
🩺 Generating diagnoses...
💊 Generating prescriptions...
🧪 Generating lab events...
📝 Generating clinical notes...
✅ Synthetic dataset generation complete!

📊 Dataset Statistics:
   Patients:      1,000
   Admissions:    3,245
   Diagnoses:     12,891
   Prescriptions: 18,732
   Lab Events:    54,102
   Clinical Notes:12,980
```

### Step 4: Process Notes (3-5 minutes)

```bash
# Extract entities and structure from clinical notes
python src/preprocessing/process_notes.py
```

### Step 5: Build Search Index (5-8 minutes)

```bash
# Build FAISS vector index for semantic search
python src/retrieval/build_index.py
```

**This will download sentence-transformers model (~80MB)**

### Step 6: Run Tests (2 minutes)

```bash
# Verify everything works
pytest tests/ -v
```

**Expected:** All tests should pass ✅

### Step 7: Start Backend API (Terminal 1)

```bash
cd src/api
uvicorn src.api.main:app
```

**You should see:**
```
INFO:     Uvicorn running on http://0.0.0.0:8000
INFO:     Application startup complete.
```

**Keep this terminal open!**

### Step 8: Start Frontend (Terminal 2 - New Window)

```bash
# Open a NEW terminal window
cd frontend

# Install Node dependencies (first time only)
npm install

# Start development server
npm start
```

**Browser should automatically open to http://localhost:3000**

---

## ✅ Verification Steps

### 1. Check API Health

```bash
curl http://localhost:8000/health
```

**Expected Response:**
```json
{
  "status": "healthy",
  "retriever_loaded": true,
  "data_loader_loaded": true
}
```

### 2. Test Search Functionality

```bash
curl -X POST "http://localhost:8000/search?query=chest%20pain&top_k=3"
```

Should return similar clinical cases.

### 3. Test Recommendation Endpoint

```bash
curl -X POST "http://localhost:8000/recommend" \
  -H "Content-Type: application/json" \
  -d '{
    "clinical_text": "65 year old male with chest pain, history of hypertension and diabetes. BP 160/95, HR 88.",
    "top_k": 5
  }'
```

Should return treatment recommendation with confidence scores.

### 4. Use Web Interface

1. Open http://localhost:3000 in browser
2. You should see "TM-MedRAG" dashboard
3. Click "Query" tab
4. Enter test query:
   ```
   Patient presents with acute chest pain radiating to left arm.
   History of type 2 diabetes mellitus and hypertension.
   Vital signs: BP 160/95, HR 88, RR 16, Temp 98.6°F.
   What treatment approach should be considered?
   ```
5. Click "Get Recommendation"
6. Verify you see:
   - Treatment recommendation
   - Confidence score (0-100%)
   - 5 similar historical cases
   - Uncertainty metrics
   - Risk flag (if high uncertainty)

---

## 🎨 Using the System

### Query Interface

**Good Query Example:**
```
72-year-old female with history of CHF presenting with worsening 
dyspnea and bilateral lower extremity edema. BNP elevated at 1200.
Current medications include furosemide 40mg daily. What adjustments 
to management should be considered?
```

**System provides:**
- 💊 Treatment recommendations
- 📊 Confidence score (0-100%)
- 📚 5 most similar historical cases
- 📈 Uncertainty metrics
- ⚠️ Risk flags for review

### Dashboard View

Shows system statistics:
- Total patients in database
- Number of admissions
- Available diagnoses
- Lab results count
- Clinical notes indexed

---

## 🔧 Troubleshooting

### Issue: "ModuleNotFoundError"

**Fix:**
```bash
# Ensure venv is activated (you should see (venv) in terminal)
pip install -r requirements.txt
```

### Issue: "Index not found" in API

**Fix:**
```bash
python src/retrieval/build_index.py
```

### Issue: spaCy model error

**Fix:**
```bash
python -m spacy download en_core_web_sm
python src/utils/install_medical_models.py
```

### Issue: Port 8000 already in use

**Fix:**
```bash
# Find and kill process using port 8000
lsof -ti:8000 | xargs kill -9  # Mac/Linux
netstat -ano | findstr :8000   # Windows (then TaskManager to kill)

# Or use different port:
cd src/api
python -c "import uvicorn; from main import app; uvicorn.run(app, host='0.0.0.0', port=8001)"
```

### Issue: Frontend won't start

**Fix:**
```bash
cd frontend
rm -rf node_modules package-lock.json
npm cache clean --force
npm install
npm start
```

### Issue: Tests failing

**Common causes:**
1. Data not generated: Run `python src/utils/generate_synthetic_data.py`
2. Index not built: Run `python src/retrieval/build_index.py`
3. Wrong directory: Ensure you're in project root

---

## 📊 Expected Performance

After successful setup:

| Component | Status | Count |
|-----------|--------|-------|
| Patients | ✅ Generated | 1,000 |
| Admissions | ✅ Generated | ~3,000-5,000 |
| Diagnoses | ✅ Generated | ~10,000-15,000 |
| Prescriptions | ✅ Generated | ~15,000-20,000 |
| Lab Events | ✅ Generated | ~50,000-60,000 |
| Clinical Notes | ✅ Processed | ~10,000-15,000 |
| Search Index | ✅ Built | ~15,000 vectors |
| API Endpoints | ✅ Active | 8 endpoints |
| Tests | ✅ Passing | 15+ tests |

---

## 🎯 What You Can Do

### 1. Clinical Queries

Enter patient scenarios and get:
- Treatment recommendations
- Similar historical cases
- Confidence metrics

### 2. Patient Exploration

- Browse patient database
- View admission histories
- See temporal timelines
- Review diagnoses and medications

### 3. API Integration

Use the REST API for:
- Automated decision support
- Batch processing
- System integration
- Research applications

### 4. Code Exploration

Study the implementation:
- `src/preprocessing/`: Data processing pipeline
- `src/retrieval/`: Semantic search system
- `src/models/`: ML models (RAG, temporal, uncertainty)
- `src/api/`: FastAPI endpoints
- `frontend/`: React web interface

---

## 📈 Next Steps

After successful execution:

1. **Explore the Interface**
   - Try different clinical scenarios
   - Examine retrieved cases
   - Study confidence scores

2. **Review the Code**
   - Understand the architecture
   - Study preprocessing pipeline
   - Examine model implementations

3. **Run Experiments**
   - Modify retrieval parameters
   - Try different models
   - Adjust confidence thresholds

4. **Customize for Your Needs**
   - Add new data sources
   - Integrate with your systems
   - Extend functionality

---

## 🆘 Need Help?

1. Check `SETUP_GUIDE.md` for detailed setup info
2. Review `README.md` for architecture overview
3. Visit API docs at http://localhost:8000/docs
4. Check logs in `logs/` directory
5. Run `pytest tests/ -v` to identify issues

---

## ✅ Success Checklist

- [ ] Virtual environment created
- [ ] Dependencies installed
- [ ] Medical models downloaded
- [ ] Synthetic data generated (1,000 patients)
- [ ] Clinical notes processed
- [ ] Search index built
- [ ] Tests passing
- [ ] API running (http://localhost:8000)
- [ ] Frontend running (http://localhost:3000)
- [ ] Health check returns "healthy"
- [ ] Can search for cases
- [ ] Can get recommendations
- [ ] Web interface works

If all checkboxes are ✅, congratulations! Your system is fully operational! 🎉

---

## 📞 Support

For issues or questions:
- Review this guide's troubleshooting section
- Check error messages in terminal
- Verify all prerequisites are met
- Ensure ports 3000 and 8000 are available

**Happy researching! 🚀**
