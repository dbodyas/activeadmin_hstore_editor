#= require jsoneditor.js

((window, $) ->
  $ ->

    ###*
    # Adds a JSON editor to all :hstore input elements in the DOM that were not already styled.
    ###

    styleHStoreComponents = ->
      $('div.jsoneditor-wrap:not(:has(.jsoneditor))').each (i, wrap) ->
        container = $(wrap)[0]
        textarea = $($(wrap).find('textarea'))
        editor = undefined
        options = $.extend {
          enableSort: false
          enableTransform: false
          mode: 'tree'
          onChange: (ev) ->
            textarea.text JSON.stringify(editor.get())
        }, textarea.data('hstore-input-options')

        editor = new JSONEditor(container, options, JSON.parse(textarea.val()))

    ###*
    # Style :hstore inputs when DOM is ready.
    ###

    styleHStoreComponents()

    ###*
    # When a has_many association includes a :hstore input type, this will
    #  style that input to show the correct JSON component.
    ###

    $(document).on('has_many_add:after', styleHStoreComponents)

) window, jQuery
