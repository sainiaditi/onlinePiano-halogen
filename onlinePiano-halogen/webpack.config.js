
module.exports = {
  devtool: "source-map",
  entry: ["./index.js"],
  output: {
    path: __dirname + "/dist",
    filename: "index.js",
    sourceMapFilename: "index_bundle.js.map"
  },
  module: {
    loaders: [
      {
        test: /\.js$/,
        exclude: /node_modules\//,
        loader: "babel-loader"
      },
    ]
  }
};