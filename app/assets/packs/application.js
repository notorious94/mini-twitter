require("@popperjs/core")
require("@rails/ujs").start()
// require("turbolinks").start()
require("@rails/activestorage").start()

import '../stylesheets/application'
const images = require.context('../images', true)

require("../src/tweets")
