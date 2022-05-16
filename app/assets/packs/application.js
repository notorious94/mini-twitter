import Rails from "@rails/ujs"
import * as ActiveStorage from "@rails/activestorage"
import '../stylesheets/application'
const images = require.context('../images', true)

Rails.start()
ActiveStorage.start()
require("jquery")
require("jquery-ui")
require("bootstrap")
require("@popperjs/core")
require("@rails/activestorage").start()

// Custom JS Files

require("../src/tweets")
require("../src/user_session")
require("../src/comments")
// require("../src/likes")
