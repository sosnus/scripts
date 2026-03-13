# Thinkpad

## L440
* F1 - bios
* F10 - diagnostic
* F12 - quick boot menu

# HP

## HP G9 and HP G11
* ??

# Dell – BIOS / Boot Keys

## Klawisze podstawowe

| Klawisz | Funkcja |
|---------|---------|
| F2      | Wejście do BIOS Setup / UEFI |
| F12     | Boot Menu – wybór urządzenia do uruchomienia |
| F10     | BIOS Flash Update (w niektórych modelach Precision/OptiPlex) |
| F1      | System Information / Advanced BIOS Settings (Latitude, Precision) |
| ESC     | Otwiera menu startowe (czasem z opcją BIOS/Boot Menu) |
| CTRL+ESC | Niekiedy dostęp do BIOS przy starszych systemach (rzadko) |

## Dodatkowe uwagi

- Przy laptopach **Latitude / XPS** często F2 → BIOS, F12 → Boot Menu.  
- Przy komputerach stacjonarnych **OptiPlex / Precision**: F2 → BIOS, F12 → Boot Menu, F10 → BIOS Update.  
- Używaj **przewodowej klawiatury USB** przy stacjonarnych Dellach.  
- Jeśli Fast Boot jest włączony, komunikaty POST mogą się nie wyświetlać, ale klawisze nadal działają.  

# Intel NUC – BIOS / Boot Keys

## Klawisze podstawowe

| Klawisz | Funkcja |
|---------|---------|
| F2      | Wejście do BIOS Setup (UEFI) |
| F10     | Boot Menu – wybór urządzenia do uruchomienia |
| F12     | Network Boot (PXE) |
| F7      | BIOS Flash Update / Recovery |
| F3      | Wyłączenie Fast Boot (w niektórych modelach) |
| F9      | Load BIOS Defaults |
| ESC     | Normalny rozruch / zamknięcie menu |

## Power Button Menu (nowsze generacje)

1. Wyłącz NUC (stan S4/S5).  
2. Przytrzymaj przycisk zasilania ~3 sekundy, puszczaj przy migającym LED.  
3. Menu klawiszy:  
   - ESC – Normal Boot  
   - F2  – BIOS Setup  
   - F3  – Disable Fast Boot  
   - F4  – BIOS Recovery  
   - F7  – Update BIOS  
   - F10 – Boot Menu  
   - F12 – Network Boot (PXE)

# IGEL
Igel M340C Quad AMD GC-424CC 4x 2,4GHz 2GB RAM 4GB

Igel D220 Atom

## Klawisze BIOS / Boot dla IGEL – według modeli / generacji

| Model / seria IGEL                  | BIOS / skrót klawisza                         | Uwagi / co robi |
|-------------------------------------|-----------------------------------------------|------------------|
| **IGEL D220 (UD2)**                 | `F2` → BIOS<br>`F9` → Boot Manager            | InsydeH20 BIOS; F9 pokazuje Boot Menu :contentReference[oaicite:1]{index=1} |
| **IGEL D210 (UD2)**                 | `F2` → BIOS                                   | Phoenix MicroCore BIOS :contentReference[oaicite:2]{index=2} |
| **IGEL D200 (UD2)**                 | `DEL` → BIOS<br>`F9` → Boot Menu              | Phoenix Award BIOS; F9 wywołuje boot menu :contentReference[oaicite:3]{index=3} |
| **IGEL 3210 CE Compact**            | `DEL` → BIOS                                  | Phoenix Award BIOS :contentReference[oaicite:4]{index=4} |
| **IGEL M340C (UD3)**                | `DEL` → BIOS                                  | InsydeH20 BIOS; w niektórych firmwarach UEFI :contentReference[oaicite:5]{index=5} |
| **IGEL M350C (UD3)**                | `DEL` → BIOS / Boot Menu                      | InsydeH20 BIOS; Boot Manager / Boot From File :contentReference[oaicite:6]{index=6} |
| **IGEL H820C (UD5)**                | `DEL` → BIOS                                  | AMI / American Megatrends BIOS :contentReference[oaicite:7]{index=7} |
