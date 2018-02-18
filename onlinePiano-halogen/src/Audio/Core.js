exports["playFrequency_"] = function (note) {
    console.log("play")
    return function (duration) {
        return function(onSuccess){
            window._pursAudioContext = window._pursAudioContext || new AudioContext()
            var ac = window._pursAudioContext
            var osc = ac.createOscillator()
            osc.connect(ac.destination)
            osc.frequency.setValueAtTime(note, ac.currentTime)
            osc.type = "sine"
            osc.start()
            osc.stop(ac.currentTime + duration)
            onSuccess(function(){})();
            return function() {
            }
        }
    }
}
