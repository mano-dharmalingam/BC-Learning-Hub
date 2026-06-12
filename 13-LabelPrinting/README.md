# 13 - Label Printing (ZPL)

| Topic | Description |
|-------|-------------|
| ZPLBasics | ZPL command reference |
| DynamicLabels | Build ZPL from BC data |
| BarcodeGeneration | Code128, EAN-13 in ZPL |
| QRCodes | QR code in ZPL |
| ShippingLabels | 4x6 shipping label template |

## Essential ZPL Commands
| Command | Purpose |
|---------|---------|
| `^XA / ^XZ` | Start / End label |
| `^FO x,y` | Field origin |
| `^FD text ^FS` | Field data |
| `^A0N,h,w` | Scalable font |
| `^BCN,h,Y,Y,N` | Code128 barcode |
| `^BQN,2,5` | QR code |
| `^GB w,h,t` | Graphic box |