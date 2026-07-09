# 🚀 TM-MedRAG - Quick Start Summary

## 📦 What You Have

You have downloaded **TM-MedRAG-Complete.zip** - a complete clinical decision support system.

## ⚡ Fastest Way to Start

### Option 1: Automated (15-20 minutes)

```bash
# Extract and run
unzip TM-MedRAG-Complete.zip
cd TM-MedRAG-Complete
chmod +x quickstart.sh
./quickstart.sh
```

### Option 2: Manual (Follow EXECUTION_GUIDE.md)

## 📋 What Gets Set Up

1. ✅ Python virtual environment
2. ✅ All dependencies installed
3. ✅ 1,000 synthetic patients generated
4. ✅ ~15,000 clinical notes processed
5. ✅ Semantic search index built
6. ✅ API server ready
7. ✅ Web interface ready

## 🎯 After Setup - How to Use

### Start the System (2 terminals needed):

**Terminal 1 - Backend:**
```bash
cd TM-MedRAG-Complete
source venv/bin/activate  # or venv\Scripts\activate on Windows
cd src/api
python main.py
```

**Terminal 2 - Frontend:**
```bash
cd TM-MedRAG-Complete/frontend
npm install  # first time only
npm start
```

### Access Points:

- 🌐 **Web Interface**: http://localhost:3000
- 📚 **API Documentation**: http://localhost:8000/docs
- ❤️ **Health Check**: http://localhost:8000/health

## 💡 Try It Out

1. Open http://localhost:3000
2. Click "Query" tab
3. Enter a clinical scenario:
   ```
   65-year-old male with chest pain, history of hypertension.
   BP 160/95, HR 88. What treatment should be considered?
   ```
4. Click "Get Recommendation"
5. Review:
   - Treatment suggestion
   - Confidence score
   - Similar cases
   - Uncertainty metrics

## 📖 Documentation

- **EXECUTION_GUIDE.md** - Step-by-step execution instructions
- **SETUP_GUIDE.md** - Detailed setup and troubleshooting
- **README.md** - Full system documentation

## 🔧 Common Issues

**"Module not found"**: Activate virtual environment first
**"Index not found"**: Run `python src/retrieval/build_index.py`
**Port in use**: Kill process on port 8000/3000
**Tests fail**: Ensure data is generated first

See EXECUTION_GUIDE.md for solutions.

## ✅ Success Indicators

- API returns `{"status": "healthy"}` at /health
- Frontend loads without errors
- Can submit queries and get recommendations
- Dashboard shows statistics

## 🆘 Need Help?

1. Read EXECUTION_GUIDE.md (comprehensive troubleshooting)
2. Check terminal error messages
3. Verify all prerequisites installed
4. Ensure ports 3000 and 8000 are free

## 🎉 You're Ready!

The system uses synthetic data and is safe for development/research.
For production, you need real MIMIC-IV data from PhysioNet.

**Happy researching! 🚀**
