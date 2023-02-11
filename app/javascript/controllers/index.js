// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import AutoUpdateController from "./auto_update_controller"
application.register("auto-update", AutoUpdateController)

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import IncrementsController from "./increments_controller"
application.register("increments", IncrementsController)

import RevealController from "./reveal_controller"
application.register("reveal", RevealController)
