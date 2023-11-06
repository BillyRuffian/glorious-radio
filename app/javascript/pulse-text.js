const spans = document.querySelectorAll('.pulse-text span');

const numLetters = spans.length;

spans.forEach(function(span, i) {
    const mappedIndex = i - (numLetters / 2)
    span.style.animationDelay = (mappedIndex * 0.25) + 's';
});