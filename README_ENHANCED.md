# TM-MedRAG Enhanced - Clinical Intelligence Platform

## 🎯 What's New in v2.0

### Fixed Issues
✅ **Retrieval System Initialization** - Added automatic detection and initialization flow
✅ **Error Handling** - Comprehensive error messages with actionable solutions
✅ **System Status** - Real-time monitoring of all system components

### New Features
🚀 **Professional UI/UX** - Modern, responsive design with smooth animations
📊 **Advanced Analytics** - Detailed confidence metrics and uncertainty quantification
🔄 **Query History** - Track and replay recent queries
⚡ **Quick Start Examples** - Sample queries for immediate testing
🎨 **Enhanced Visualization** - Better case presentation and similarity metrics
⚙️ **System Dashboard** - Complete system status and health monitoring
🔧 **In-App Initialization** - Build retrieval index without command line

## 🚀 Quick Start

### Prerequisites
- Python 3.8+
- Node.js 14+
- 4GB RAM minimum

### Backend Setup

1. **Install Python dependencies**
```bash
cd TM-MedRAG-Complete
pip install -r requirements.txt
```

2. **Start the enhanced backend**
```bash
# Option 1: Use the enhanced API
python src/api/main_enhanced.py

# Option 2: Use uvicorn directly
uvicorn src.api.main_enhanced:app --reload --host 0.0.0.0 --port 8000
```

The API will be available at `http://localhost:8000`

### Frontend Setup

1. **Install dependencies**
```bash
cd frontend
npm install
```

2. **Update to enhanced version**
```bash
# Backup original files
cp src/App.js src/App_Original.js
cp src/App.css src/App_Original.css
cp src/components/QueryInterface.js src/components/QueryInterface_Original.js

# Use enhanced files
cp src/App_Enhanced.js src/App.js
cp src/App_Enhanced.css src/App.css
cp src/components/QueryInterface_Enhanced.js src/components/QueryInterface.js
cp src/components/QueryInterface_Enhanced.css src/components/QueryInterface.css
```

3. **Start the frontend**
```bash
npm start
```

The app will open at `http://localhost:3000`

## 🎨 User Interface Features

### Query Interface
- **Smart Input** - Auto-resizing textarea with helpful placeholders
- **Sample Queries** - Click to load example clinical scenarios
- **Real-time Validation** - Immediate feedback on system readiness
- **Rich Results** - Detailed recommendations with confidence metrics
- **Alternative Treatments** - Multiple treatment options when available
- **Uncertainty Metrics** - Epistemic and aleatoric uncertainty visualization
- **Similar Cases** - Grid view of retrieved cases with similarity scores
- **Query History** - Quick access to recent queries

### System Status Dashboard
- **Component Health** - Real-time status of retriever and data loader
- **Index Information** - Vector count and initialization status
- **Error Reporting** - Clear error messages with timestamps
- **Refresh Control** - Manual health check trigger

### Initialization Panel
- **Interactive Setup** - Visual index building interface
- **Sample Size Control** - Slider to choose number of notes to process
- **Progress Tracking** - Real-time initialization status
- **Time Estimation** - Estimated completion time
- **Background Processing** - Non-blocking initialization

## 🔧 System Initialization

### Method 1: Using the Web UI (Recommended)

1. Start both backend and frontend
2. Click "Initialize Now" banner when prompted
3. Set sample size (start with 100 for testing)
4. Click "Start Initialization"
5. Monitor progress in System Status page

### Method 2: Command Line

```bash
# Generate synthetic data first (if needed)
python src/utils/generate_synthetic_data.py --num-patients 50

# Build the retrieval index
python src/retrieval/build_index.py
```

## 📊 API Endpoints

### Enhanced Endpoints

**POST /initialize** - Initialize retrieval system
```json
{
  "force_rebuild": false,
  "sample_size": 100
}
```

**GET /health** - Enhanced health check
```json
{
  "status": "healthy",
  "components": {
    "retriever": {
      "status": "ready",
      "loaded": true,
      "index_size": 150
    },
    "data_loader": {
      "status": "ready",
      "loaded": true
    }
  }
}
```

**POST /recommend** - Get clinical recommendation
```json
{
  "clinical_text": "Patient scenario...",
  "top_k": 5,
  "include_temporal": false
}
```

**GET /stats** - System statistics

## 🎨 Design Philosophy

### Color Palette
- **Primary**: Medical professional blues (#0A4D68, #088395)
- **Accents**: Modern cyan (#00D9FF)
- **Status Colors**: Success (green), Warning (orange), Error (red)

### Typography
- **Headers**: Urbanist (800 weight) - Modern, professional
- **Body**: Urbanist (400-600 weight) - Clean, readable
- **Code**: JetBrains Mono - Technical clarity

### UI Principles
- **Clarity First**: Medical decisions require clear information
- **Professional**: Clinical setting appropriate design
- **Responsive**: Works on all device sizes
- **Accessible**: High contrast, clear labels
- **Fast**: Optimized animations and transitions

## 🔒 Security & Compliance

⚠️ **IMPORTANT**: This is a research and development platform

- **Not for clinical use** - This system is not FDA approved
- **Research only** - For educational and research purposes
- **Data privacy** - Ensure HIPAA compliance if using real data
- **Validation required** - All recommendations need human review

## 📁 Project Structure

```
TM-MedRAG-Complete/
├── src/
│   ├── api/
│   │   ├── main.py (original)
│   │   └── main_enhanced.py (✨ new)
│   ├── retrieval/
│   │   ├── retriever.py
│   │   └── build_index.py
│   └── ...
├── frontend/
│   ├── src/
│   │   ├── App_Enhanced.js (✨ new)
│   │   ├── App_Enhanced.css (✨ new)
│   │   └── components/
│   │       ├── QueryInterface_Enhanced.js (✨ new)
│   │       ├── QueryInterface_Enhanced.css (✨ new)
│   │       ├── SystemStatus.js (✨ new)
│   │       ├── SystemStatus.css (✨ new)
│   │       ├── InitializationPanel.js (✨ new)
│   │       ├── InitializationPanel.css (✨ new)
│   │       └── Dashboard.js
│   └── package.json
└── data/
    ├── embeddings/
    ├── raw/
    └── processed/
```

## 🐛 Troubleshooting

### "Retrieval system not initialized"
**Solution**: Use the initialization panel in the UI or run `build_index.py`

### Frontend can't connect to backend
**Check**:
- Backend is running on port 8000
- `proxy` in package.json points to `http://localhost:8000`
- No firewall blocking

### Slow initialization
**Tips**:
- Start with smaller sample size (50-100)
- Check CPU/RAM usage
- Ensure sufficient disk space

### Import errors
**Solution**: Install all requirements
```bash
pip install -r requirements.txt --break-system-packages
```

## 🚀 Performance Tips

1. **Sample Size**: Start small (100) for testing, increase for production
2. **Caching**: Backend caches embeddings - subsequent queries are faster
3. **Browser**: Use modern browsers (Chrome, Firefox, Edge)
4. **Network**: Local deployment recommended for best performance

## 📝 Development

### Adding Features
1. Backend: Extend `main_enhanced.py`
2. Frontend: Create new components in `components/`
3. Styling: Follow existing CSS variable patterns

### Code Style
- **Python**: PEP 8, type hints preferred
- **JavaScript**: ES6+, functional components
- **CSS**: BEM naming, CSS variables for theming

## 📄 License

This project is for research and educational purposes. See LICENSE file for details.

## 🤝 Contributing

Contributions welcome! Please:
1. Fork the repository
2. Create a feature branch
3. Follow code style guidelines
4. Submit a pull request

## 📧 Support

For issues and questions:
- Check troubleshooting section
- Review API documentation at `/docs`
- File an issue on GitHub

---

**Version**: 2.0.0  
**Last Updated**: January 2025  
**Status**: Research & Development
