flutter build web --release
git clone --branch main git@github.com:Mc231/Mc231.github.io.git ../gh-pages
rm -rf ../gh-pages
rsync -av --delete build/web/ ../gh-pages/
# shellcheck disable=SC2164
cd ../gh-pages
# shellcheck disable=SC2035
git add *
git commit -m "Deploy to GitHub Pages"
git push
