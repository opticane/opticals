import speech_recognition as sr

def listen(phrases):

    # obtain audio from the microphone
    r = sr.Recognizer()

    with sr.Microphone() as source:
        r.adjust_for_ambient_noise(source)
        print("Recording input!")
        audio = r.listen(source)

    # recognize speech using Sphinx
    try:
        recognizedInput = r.recognize_sphinx(audio, keyword_entries=phrases)
        print("Registered input: " + r.recognize_sphinx(audio, keyword_entries=phrases))
        return recognizedInput
        
    except sr.UnknownValueError:
        print("Sphinx could not understand audio")
        return ""

    except sr.RequestError as e:
        print("Sphinx error; {0}".format(e))
        return ""

def executeCommand(phrase, dictionary):

    if phrase.startswith("where is"):
        locationName = (phrase[len("where is "):]).strip()
        if locationName in dictionary.keys():
            print("\"" + locationName + "\" is at: " + str(dictionary[locationName]))
        else:
            print("Not in dictionary")

    elif phrase.startswith("save location"):
        locationName = (phrase[len("save "):]).strip()
        dictionary[locationName] = mockGPSgetCoordinates()
        print("Location of \"" + locationName + "\" saved at " + str(mockGPSgetCoordinates()))
        
    else:
        print("unrecognized command")


def mockGPSgetCoordinates():
    return (0, 1)


# main
locationNames = ["one", "two", "three"]
locationCommands = ["where is location", "save location"]
locationPhrases = [(command + " " + name, 1.0) for command in locationCommands for name in locationNames]

locationsGPS = {}
locationsGPS["location one"] = (0, 2)

executeCommand(listen(locationPhrases), locationsGPS)