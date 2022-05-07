import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import '../stylesheets/application'
const images = require.context('../images', true)

Rails.start()
Turbolinks.start()
ActiveStorage.start()
require("@popperjs/core")
require("turbolinks").start()
require("@rails/activestorage").start()

// Custom JS Files

require("../src/tweets")