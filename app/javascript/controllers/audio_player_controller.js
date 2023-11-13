import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="audio-player"
export default class extends Controller {
  static targets = [ "audioSource", "playHead", "duration", "position", "playControl" ]
  static classes = [ "play", "pause" ]

  connect() {
    console.log("connected");
  }

  playPause() {
    if(this.audioSourceTarget.paused) {
      this.audioSourceTarget.play()
      this.playControlTarget.classList.remove(this.playClass)
      this.playControlTarget.classList.add(this.pauseClass)
    }
    else {
      this.audioSourceTarget.pause()
      this.playControlTarget.classList.remove(this.pausedClass)
      this.playControlTarget.classList.add(this.playClass)
    }
  }

  playPositionUpdate() {
    this.playHeadTarget.value = Math.floor(this.audioSourceTarget.currentTime)
    this.positionTarget.textContent = this.timeFormat(this.audioSourceTarget.currentTime)
  }

  metadata() {
    this.durationTarget.textContent = this.timeFormat(this.audioSourceTarget.duration)
    this.playHeadTarget.max = Math.floor(this.audioSourceTarget.duration)
    this.playPositionUpdate()
  }

  seek() {
    this.audioSourceTarget.currentTime = this.playHeadTarget.value
  }

  playHeadTargetConnected(element) {
    if(this.audioSourceTarget.readyState > 0) 
      this.metadata()
    else
      this.playHeadTarget.value = 0
  }

  timeFormat(secs) {
    const minutes = Math.floor(secs / 60);
    const seconds = Math.floor(secs % 60);
    const returnedSeconds = seconds < 10 ? `0${seconds}` : `${seconds}`;
    return `${minutes}:${returnedSeconds}`;
  }
}
