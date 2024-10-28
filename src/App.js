import React from 'react';
import { Card } from '@/components/ui/card';

const App = () => {
  return (
    <div className="container mx-auto p-4">
      <Card className="p-6">
        <h1 className="text-2xl font-bold mb-4">NFC Connect</h1>
        <p className="text-gray-600">
          Application de transfert de fichiers via NFC
        </p>
      </Card>
    </div>
  );
};

export default App;
