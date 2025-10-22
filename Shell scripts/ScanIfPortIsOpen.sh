#!/bin/bash

# Spørger brugeren om portnummer
read -p "Indtast portnummer: " PORT

# Tjekker om netstat findes
if ! command -v netstat &>/dev/null; then
    echo "⚠️  'netstat' er ikke installeret på dette system."
    echo "Prøv at installere det med: sudo apt install net-tools"
    exit 1
fi

# Tjekker om porten er åben
if netstat -tuln | grep -q ":$PORT "; then
    echo "✅ Port $PORT er åben."
    echo
    echo "Detaljer:"
    netstat -tulnp | grep ":$PORT "
else
    echo "❌ Port $PORT er ikke åben."
fi