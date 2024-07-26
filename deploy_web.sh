flutter build web --release
git clone --branch main git@github.com:Mc231/Mc231.github.io.git ../gh-pages
rsync -av --delete build/web/ ../gh-pages/
../cd gh-pages
git add *
git commit -m "Deploy to GitHub Pages"
git push
