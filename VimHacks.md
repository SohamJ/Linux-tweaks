###1. Highlight/Show trailing whitespaces in vi###
   * **highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen**
   * Show trailing whitespace using **match ExtraWhitespace /\s\+$/**
   * Show trailing whitespace and spaces before a tab **match ExtraWhitespace /\s\+$\| \+\ze\t/**
   * Show tabs that are not at the start of a line **match ExtraWhitespace /[^\t]\zs\t\+/**
   * Show spaces used for indenting (so you use only tabs for indenting) **match ExtraWhitespace /^\t*\zs \+/**
   * Switch off :match highlighting **match**
   * Match trailing whitespace, except when typing at the end of a line **match ExtraWhitespace /\s\+\%#\@<!$/**

