import React from 'react';
import ReactDOM from 'react-dom/client';
import './index.css';
import App from './App';
import './config/datadog';  // Importer la configuration Datadog

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>
);
