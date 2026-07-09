# TM-MedRAG Enhanced - Quick Reference Guide

## 🚀 Getting Started (30 seconds)

### First Time Setup
```bash
# 1. Run setup script
bash setup_enhanced.sh    # Linux/Mac
setup_enhanced.bat        # Windows

# 2. Start backend
python src/api/main_enhanced.py

# 3. Start frontend (new terminal)
cd frontend && npm start

# 4. Visit http://localhost:3000
# 5. Click "Initialize Now" in the banner
```

## 📋 Common Tasks

### Initialize the System
**Via UI (Recommended)**
1. Open http://localhost:3000
2. Click "Initialize Now" banner
3. Set sample size (100 for testing)
4. Click "Start Initialization"
5. Wait ~5 minutes

**Via Command Line**
```bash
python src/retrieval/build_index.py
```

### Query the System
1. Navigate to Query tab
2. Type or select a sample query
3. Click "Get Recommendation"
4. Review results and similar cases

### Check System Status
1. Click "System" tab
2. View component health
3. Click "Refresh" for latest status

## 🔧 Troubleshooting

| Problem | Solution |
|---------|----------|
| "Retrieval system not initialized" | Click "Initialize Now" or run build_index.py |
| Backend won't start | Check port 8000 is free: `lsof -i :8000` |
| Frontend won't start | Check port 3000 is free, delete node_modules and reinstall |
| No similar cases found | Initialize with more samples (500+) |
| Slow queries | Normal on first query, subsequent queries are cached |

## 📊 API Quick Reference

### Health Check
```bash
curl http://localhost:8000/health
```

### Initialize System
```bash
curl -X POST http://localhost:8000/initialize \
  -H "Content-Type: application/json" \
  -d '{"sample_size": 100}'
```

### Get Recommendation
```bash
curl -X POST http://localhost:8000/recommend \
  -H "Content-Type: application/json" \
  -d '{
    "clinical_text": "Patient with chest pain",
    "top_k": 5
  }'
```

### Search Cases
```bash
curl -X POST http://localhost:8000/search \
  -H "Content-Type: application/json" \
  -d '{"query": "diabetes", "top_k": 5}'
```

## 🎨 UI Features Overview

### Query Interface
- ✅ Auto-resizing text area
- ✅ Sample query templates
- ✅ Real-time validation
- ✅ Query history (last 5)
- ✅ Confidence visualization
- ✅ Alternative treatments
- ✅ Uncertainty metrics
- ✅ Similar cases grid

### System Status
- ✅ Component health monitoring
- ✅ Index size tracking
- ✅ Initialization status
- ✅ Error reporting
- ✅ Manual refresh

### Dashboard
- ✅ System statistics
- ✅ Performance metrics
- ✅ Usage analytics

## 📝 Sample Queries

### Chest Pain
```
65-year-old male with chest pain, history of hypertension 
and diabetes. BP 160/95, HR 88. What treatment approach 
should be considered?
```

### Post-Operative Care
```
Post-op patient day 3 after appendectomy with fever 38.5°C 
and elevated WBC. What interventions are recommended?
```

### Respiratory Distress
```
Patient presenting with acute shortness of breath, O2 sat 88%, 
wheezing bilateral. History of COPD. What is the appropriate 
management?
```

## 🔒 Important Notes

⚠️ **FOR RESEARCH ONLY**
- Not FDA approved
- Not for clinical decisions
- Requires human verification
- Educational purposes only

## 📁 Key Files

```
Enhanced Files (New):
- src/api/main_enhanced.py          # Backend API
- frontend/src/App_Enhanced.js       # Main app
- frontend/src/App_Enhanced.css      # Global styles
- frontend/src/components/
  - QueryInterface_Enhanced.js       # Query UI
  - QueryInterface_Enhanced.css      # Query styles
  - SystemStatus.js                  # Status page
  - SystemStatus.css                 # Status styles
  - InitializationPanel.js           # Init UI
  - InitializationPanel.css          # Init styles

Original Files (Backed up):
- src/api/main.py
- frontend/src/App_Original.js
- frontend/src/QueryInterface_Original.js
```

## 🎯 Performance Tips

1. **Start Small**: Use 100 samples for testing
2. **Scale Up**: Increase to 500-1000 for production
3. **Cache**: First query builds cache, subsequent are fast
4. **Browser**: Use Chrome/Firefox for best performance
5. **Local**: Run on localhost for best speed

## 🆘 Getting Help

1. Check this guide
2. Review README_ENHANCED.md
3. Check API docs: http://localhost:8000/docs
4. Review troubleshooting section
5. Check browser console for errors
6. Check backend logs

## 📊 Expected Behavior

### First Query (Cold Start)
- Initialize: ~5 minutes
- First query: ~10 seconds
- Loads models and embeddings

### Subsequent Queries
- Query time: ~1-2 seconds
- Uses cached embeddings
- Much faster than first query

### System Resources
- RAM: ~2-4 GB
- Disk: ~500 MB (with 1000 samples)
- CPU: Moderate (during initialization)

## 🔄 Updates & Maintenance

### Update Dependencies
```bash
# Python
pip install -r requirements.txt --upgrade

# Node.js
cd frontend && npm update
```

### Clear Cache
```bash
# Backend
rm -rf data/embeddings/*

# Frontend
cd frontend && rm -rf node_modules && npm install
```

### Rebuild Index
```bash
python src/retrieval/build_index.py
```

---

**Version**: 2.0.0
**Last Updated**: January 2025
