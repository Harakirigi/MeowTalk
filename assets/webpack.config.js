const path = require('path');

module.exports = {
  entry: './assets/js/app.js',  // Your entry point for the application
  output: {
    filename: 'app.js',         // The output bundle file
    path: path.resolve(__dirname, 'priv/static/js'),  // Where to output the bundle
  },
  module: {
    rules: [
      {
        test: /\.jsx?$/,  // Match all .js and .jsx files
        use: 'babel-loader',  // Use Babel to process JavaScript files
        exclude: /node_modules/,  // Exclude node_modules folder
      },
      // Other rules for handling CSS, images, etc.
    ],
  },
  resolve: {
    extensions: ['.js', '.jsx'],  // Resolve .js and .jsx extensions automatically
  },
};
