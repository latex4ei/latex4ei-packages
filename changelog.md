# LaTeX4EI Template

## Changelog

### Release 1.1

* Added thesis class
* Added general transformation command
* Small Bugfixes

### Release 1.0

* new box macros
	the boxes are now implemented as environments, which allows better error tracking.
	box names stayed the same, so now it is \begin{sectionbox} ... \end{sectionbox} instead of \sectionbox{ ... }
	Note: the table environment is now much simpler. See documentation for details.

* better unicode support
	you can now directly write math symbols such as ∫, ∈, ∞, etc. and greek symbols such as α, β, γ as unicode
	characters in your tex source code. Make sure the .tex file is encoded as UTF-8 in your editor.

* language support for english and german
	The language of the document can now be choosen with the template options "english" or "german".
	It is also possible to define a different language for a part of a document. Use \selectlanguage{english}
	to switch to english and \selectlanguage{ngerman} (the "n" in "ngerman" is important) to switch to german.

* image search-paths /img and /gfx
	you can now specify image paths inside \includegraphics relative to /img or /gfx because the compiler will
	automatically search for image files in these directories. Additional the compiler will recognize file
	extensions automatically.
	Example: use \includegraphics{diagram} if you have a file ./img/diagram.pdf


© 2011-2018, LaTeX4EI
