'use babel';

import { CompositeDisposable } from 'atom';
import open from 'open';

export default {

  subscriptions: null,
  configDefaults: {
    open_in_browser: 'Google Chrome'
  },

  activate(state) {
    // Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    this.subscriptions = new CompositeDisposable();

    // Register command that toggles this view
    this.subscriptions.add(atom.commands.add('atom-workspace', {
      'instacodes:upload_selection': () => this.uploadSelection()
    }));
  },

  deactivate() {
    this.subscriptions.dispose();
  },

  serialize() {
    return {};
  },

  uploadSelection() {
    let editor = atom.workspace.getActiveTextEditor();
    let selection = editor.getSelectedText();
    let grammar_name = this.mapGrammar(editor.getGrammar().name);
    open("http://InstaCod.es/?post_code="+ selection +"&post_lang=" + grammar_name, atom.config.get('instacodes-plugin.open_in_browser'));
  },

  mapGrammar(grammar) {
    if (grammar == 'HTML (Ruby - ERB)' || grammar == 'HTML (Rails)') {
      return 'RHTML';
    } else {
      return grammar;
    }
  }

};
