// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import css from "../css/app.css"

// webpack automatically bundles all modules in your
// entry points. Those entry points can be configured
// in "webpack.config.js".
//
// Import dependencies
//
import "phoenix_html"

// Import local files
//
// Local files can be imported directly using relative paths, for example:
// import socket from "./socket"

function countDown() {
  const el = document.body.querySelector("span#timer_before_redirect"),
        count = parseInt(el.textContent);

  if (count > 0) {
    el.textContent = count - 1;
  } else {
    window.location.href = "/";
  }
}

document.onreadystatechange = function () {
  if (document.readyState === 'complete') {
    const el = document.body.querySelector("span#timer_before_redirect");

    if (el !== null) {
      setInterval(countDown, 1000);
    }
  }
}