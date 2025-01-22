#!/usr/bin/env bash
cd frontend;
npm run build;
cd ..;
cp frontend/dist/index.html templates/
cp frontend/dist/assets/* static/