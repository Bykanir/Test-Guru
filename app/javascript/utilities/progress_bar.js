export default class ProgressBar {

  constructor(progress) {
    this.progress = progress

    this.calulateProgress(progress)
  }

  calulateProgress(progress) {
    const percent = progress.dataset.current  * 100 / progress.dataset.count
  
    this.outputPercent(percent)
  }
  
  outputPercent(percent) {
    const progressBar = document.querySelector('.progress-bar')
    progressBar.setAttribute('style', 'width: ' + percent + '%')
  }
}



