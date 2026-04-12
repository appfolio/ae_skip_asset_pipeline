module.exports = {
  plugins: [
    require('postcss-import'),
    require('postcss-flexbugs-fixes'),
    require('autoprefixer')({
      flexbox: 'no-2009'
    }),
    require('postcss-preset-env')({
      stage: 3
    })
  ]
};
