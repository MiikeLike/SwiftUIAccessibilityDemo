# SwiftUI Accessibility Demo  
*🚀 Technical Test — Accessibility-focused iOS App*

## 📋 Overview  
This is a SwiftUI iOS application developed as part of a technical test, showcasing accessibility best practices aligned with WCAG 2.1 AA guidelines.  
The app demonstrates how to create inclusive, scalable, and user-friendly interfaces with features that ensure everyone can interact with it effectively.

## ✨ Features Implemented  

| Feature            | Description                                                |
|--------------------|------------------------------------------------------------|
| VoiceOver Support  | Accessibility labels, hints, traits, and focus order customization. |
| Dynamic Type       | Adaptive typography using system text styles.              |
| Color & Contrast   | Semantic colors for light/dark mode, meeting WCAG AA contrast ratios. |
| Touch Target Size  | Minimum 44×44 pt tap areas for all interactive elements.   |
| Gesture Alternatives | Button-based fallbacks for gesture-only actions.          |
| Reduce Motion Support | Animations adapt to user’s motion preferences.           |

## 🛠 Technical Details  
- Framework: SwiftUI + Combine  
- Architecture: MVVM  
- Minimum iOS Version: 14.0  
- Languages: Swift (100%)  
- Accessibility Guidelines: WCAG 2.1 AA  

## 📂 Project Structure  
<details>  
<summary>Click to expand</summary>

```
.
├── Accessibility           # Helpers and A11y configurations
│   ├── A11yHelpers
│   └── A11yChecklistView
├── Features                # App feature modules
│   ├── Detail
│   │   └── DetailView
│   ├── Form
│   │   └── FeedbackFormView
│   ├── Home
│   │   ├── HomeListView
│   │   └── ItemRowView
│   └── Settings
│       └── SettingsView
├── Models                  # Data structures
│   └── Item
├── Utilities               # Reusable helper functions
│   ├── HapticStyle
│   └── AccessibleDemoAppApp
├── Assets                  # Asset catalog
└── ContentView              # Main app entry screen
```

</details>

## 🚀 How to Run  
```bash
# Clone the repository:
git clone https://github.com/YourUsername/SwiftUIAccessibilityDemo.git

# Open the .xcodeproj file in Xcode.

# Set the Team to your own account in Signing & Capabilities (currently set to None for portability).

# Build & run on simulator or device.
```

## 💡 Why This Project Stands Out  
- **Clean**, modular, and well-commented code.  
- Accessibility is **not an afterthought** — it’s integrated from the start.  
- Uses **semantic design** to ensure adaptability to any user’s needs.  
- Ready for **localization** and **scalable features**.  

## 📜 License  
This project is intended for technical evaluation purposes only.

## 🔗 Useful Links  
- [Repository](https://github.com/YourUsername/SwiftUIAccessibilityDemo)  
- [Issues](https://github.com/YourUsername/SwiftUIAccessibilityDemo/issues)
