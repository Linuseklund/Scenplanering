# Scenplanering

Ett verktyg för att planera filmscener i 3D. Du placerar karaktärer, props och egna figurer från Higgsfield (.glb eller urklippt .png), ställer in kameran per skott och sparar layoutbilder och texter till Higgsfield/Seedance.

## Delar

| Fil | Vad |
|---|---|
| `web/` | Själva programmet (HTML + three.js). Publiceras som webbsida på Vercel. |
| `main.swift` | Mac-programmet: ett fönster runt `web/` som sparar projekt och bilder i en vald mapp. |
| `icon.swift`, `ikon.png` | Programikonen. |
| `bygg.sh` | Bygger om `Scenplanering.app` i mappen ovanför. |

## Webbversionen

På webben sparas projekten i webbläsaren (localStorage). Exportera projektfilen för att flytta den mellan datorer. 3D-modeller (.glb) sparas bara i Mac-programmet.

Vercel: rotkatalog `web`, inget byggsteg.
