template = require 'views/templates/challengesLayout'
ChallengeForm = require 'views/ChallengeFormView'
Challenges = require 'collections/Challenges'
ChallengeTable = require 'views/ChallengeTableView'
ChallengeToolbar = require 'views/ChallengeToolbarView'
App = require 'application'

class ChallengesLayout extends Backbone.Marionette.Layout
	id: 'challenges-layout'
	template: template

	ui:
		toolbar: '#toolbar-container'

	regions:
		sideBar: '#challenges-sidebar'
		table: '#challenges-container'
		toolBar: '#toolbar-container'

	initialize: ->
		@listenTo App.vent, 'challengeTable:initialized', @setupToolbar

	onRender: ->
		@sideBar.show new ChallengeForm
			collection: App.challenges
		@table.show new ChallengeTable
			collection: App.challenges
		@toolBar.show new ChallengeToolbar

module.exports = ChallengesLayout

