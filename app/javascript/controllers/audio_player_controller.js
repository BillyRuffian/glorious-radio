import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="audio-player"
export default class extends Controller {
  static targets = [ "audioSource", "playHead" ]

  connect() {
    console.log("connected");
  }

  playPause() {
    if(this.audioSourceTarget.paused)
      this.audioSourceTarget.play()
    else
      this.audioSourceTarget.pause()
  }

  playPositionUpdate() {
    this.playHeadTarget.value = Math.floor(this.audioSourceTarget.currentTime)
  }

  metadata() {
    this.playHeadTarget.max = Math.floor(this.audioSourceTarget.duration)
  }

  seek() {
    this.audioSourceTarget.currentTime = this.playHeadTarget.value
  }
}
