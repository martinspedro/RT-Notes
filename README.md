# RT-notes
A collection of useful notes and pdfs for the [Redes e Telecomunicações course](http://www.ua.pt/deti/uc/2825) at [Aveiro University](https://www.ua.pt/).

## Published Notes
- _[version 0.1]_ [Introductory Notes](https://github.com/k3rn3l-pan1c/RT-Notes/raw/master/pdf/Introduction.pdf)
- _[version 0.2]_ [Ip Networks](https://github.com/k3rn3l-pan1c/RT-Notes/raw/master/pdf/IP_Networks.pdf)
- _[version 0.2]_ [Addressing](https://github.com/k3rn3l-pan1c/RT-Notes/raw/master/pdf/Addressing.pdf)
- _[version 0.1]_ [Media Access](https://github.com/k3rn3l-pan1c/RT-Notes/raw/master/pdf/Media_Access.pdf)

## Note taking process
1. Notes are taken using pandoc markdown extended syntax
	- Check [Adam cheatsheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet) or [Wikipedia](https://en.wikipedia.org/wiki/Markdown) for more information and useful tips
2. Using [pandoc](https://pandoc.org/), the notes are converted into a eye-candy pdf, using tex as an intermediary file type
	- The latex compiler used is xelatex
	- The [Eisvogel](https://github.com/Wandmalfarbe/pandoc-latex-template) template is used with some tweaks and small modifications
3. Using an yaml header, some metadata and rendering options are provided
4. Some of the used diagrams are generated using either [dot](https://en.wikipedia.org/wiki/DOT_(graph_description_language)) or [tikz](https://ctan.org/pkg/tikz-page). The remaining were copied from the course slides.
5. The images are taken from the course slides and other materials provided by the professors


A GIT repository with the note taking tool is available in this [repository ](https://github.com/k3rn3l-pan1c/logbook)


### DOT & Graphviz
The [dot graph description language](https://en.wikipedia.org/wiki/DOT_(graph_description_language)) is a graphic description language, enable the fast creation of reasonably neat diagrams

For interpreting the dot code, [graphviz](https://graphviz.gitlab.io/) as used.

For more information on dot and graphviz, check out [this amazing guide](https://www.google.pt/url?sa=t&rct=j&q=&esrc=s&source=web&cd=1&ved=0ahUKEwjUrryp4srYAhWBtxQKHWKzA68QFggzMAA&url=https%3A%2F%2Fgraphviz.gitlab.io%2F_pages%2Fpdf%2Fdotguide.pdf&usg=AOvVaw1NgHmOrdTb4E59oQvAx-jW)

### Tikz
The Latex vector graphic language, [Tikz](https://en.wikibooks.org/wiki/LaTeX/PGF/TikZ), that uses geometric/algebric description to create beatiful diagrams

For more information, check out [this amazing guide](https://www.google.pt/url?sa=t&rct=j&q=&esrc=s&source=web&cd=6&cad=rja&uact=8&ved=0ahUKEwic-vO3msnZAhWS6lMKHY6sD1EQFgh8MAU&url=https%3A%2F%2Fcremeronline.com%2FLaTeX%2Fminimaltikz.pdf&usg=AOvVaw0hupwalyz2Z7QtRtaqYbR0)


## Publishing
To ease the publish of an eye-candy pdf:
```bash
 # Assuming that exists a metadata file named notes.yaml in the metadata folder
./renderpdf <notes.md>

# Assuming a metadata file is going to be provided
./renderpdf <notes.md> <metadata_file.yaml>

```
## Disclaimer
Currently this work is **highly experimental and not yet scientific reviewed**.
**Do not trust this notes by themselves**. They are meant to complete other materials, **not replace them**.

## Acknowledgement
This work is a direct product of the lectures notes taked during _Redes and Telecomunicações_ classes in the academic year of 2017/18, lectured by Prof. Rui Aguiar.

This raw notes were later improved and filtered using as scientific reference the lecture slides from Prof. Rui Aguiar.

## Roadmap
- [X] Introductory Notes
- [X] IP Networks
- [X] Addressing
- [X] Media Access
- [ ] Bridging
- [ ] Flow Control
- [ ] IP Protocol
- [ ] Routing

## License
The content of this project itself is licensed under the [Creative Commons Attribution-ShareAlike 4.0 International license](https://creativecommons.org/licenses/by-sa/4.0/) and the underlying source code is under the [MIT license](https://opensource.org/licenses/mit-license.php).
