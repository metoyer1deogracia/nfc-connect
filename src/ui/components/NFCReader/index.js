import React, { useState, useEffect } from 'react';
import { Card } from '@/components/ui/card';
import { Button } from '@/components/ui/button';

const NFCReader = () => {
  const [isReading, setIsReading] = useState(false);
  const [nfcData, setNfcData] = useState(null);

  const startReading = async () => {
    setIsReading(true);
    // Implémentation NFC à venir
  };

  return (
    <Card className="p-4">
      <h2 className="text-xl font-semibold mb-4">Lecteur NFC</h2>
      <Button 
        onClick={startReading}
        disabled={isReading}
      >
        {isReading ? 'Lecture en cours...' : 'Démarrer la lecture'}
      </Button>
    </Card>
  );
};

export default NFCReader;
