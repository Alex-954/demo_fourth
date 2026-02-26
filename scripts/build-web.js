const fs = require('node:fs');
const path = require('node:path');

const rootDir = path.resolve(__dirname, '..');
const outDir = path.join(rootDir, 'www');
const filesToCopy = ['index.html', 'styles.css', 'script.js'];

if (!fs.existsSync(outDir)) {
  fs.mkdirSync(outDir, { recursive: true });
}

for (const fileName of filesToCopy) {
  const sourcePath = path.join(rootDir, fileName);
  const destinationPath = path.join(outDir, fileName);
  fs.copyFileSync(sourcePath, destinationPath);
}

console.log(`Copied ${filesToCopy.length} files into ${path.relative(rootDir, outDir)}.`);
