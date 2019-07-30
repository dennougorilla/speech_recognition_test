import 'dart:html';

void main() {
  final grammar =
      '#JSGF V1.0; grammar colors; public <color> = aqua | azure | beige | bisque | black | blue | brown | chocolate | coral | crimson | cyan | fuchsia | ghostwhite | gold | goldenrod | gray | green | indigo | ivory | khaki | lavender | lime | linen | magenta | maroon | moccasin | navy | olive | orange | orchid | peru | pink | plum | purple | red | salmon | sienna | silver | snow | tan | teal | thistle | tomato | turquoise | violet | white | yellow ;';
  final recognition = SpeechRecognition();
  final speechRecognitionList = SpeechGrammarList()
    ..addFromString(grammar, 1);
  recognition
    ..continuous = true
    ..grammars = speechRecognitionList
    ..lang = 'en-US'
    ..interimResults = false
    ..maxAlternatives = 1;

  final diagnostic = document.querySelector('.output');
  final bg = document.querySelector('html');

  document.body.onClick.listen((event) {
    recognition.start();
    print('Ready to receive a color command.');
  });

  recognition.onResult.listen((event) {
    print(event);
    print(event.resultIndex);
  });
}
