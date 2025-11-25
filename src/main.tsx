import React from "react";
import { createRoot } from "react-dom/client";
import { BrowserRouter } from "react-router-dom";
import App from "./App.tsx";
import "./index.css";

// Get root element
const rootElement = document.getElementById("root");

if (!rootElement) {
  throw new Error("Root element not found");
}

// Read route from data-attribute (set by OpenCart .tpl file)
const initialRoute = rootElement.getAttribute("data-route") || "/";

// Render app with router
createRoot(rootElement).render(
  <React.StrictMode>
    <BrowserRouter>
      <App initialRoute={initialRoute} />
    </BrowserRouter>
  </React.StrictMode>
);
