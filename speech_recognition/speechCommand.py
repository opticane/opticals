import speech_recognition as sr

def listen(phrases):

    # obtain audio from the microphone
    r = sr.Recognizer()

    with sr.Microphone() as source:
        r.adjust_for_ambient_noise(source)
        print("Recording input!")
        audio = r.listen(source, timeout=1, phrase_time_limit=2)

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

def executeCommand(phrase, locations, faces):

    if phrase.startswith("where is"):
        locationName = (phrase[len("where is "):]).strip()
        if locationName in locations.keys():
            print("\"" + locationName + "\" is at: " + str(locations[locationName]))
        else:
            print("Not in dictionary")

    elif phrase.startswith("save location"):
        locationName = (phrase[len("save "):]).strip()
        locations[locationName] = mockGPSgetCoordinates()
        print("Location of \"" + locationName + "\" saved at " + str(mockGPSgetCoordinates()))

    elif phrase.startswith("remember face"):
        faces.append(mockGPSgetCoordinates())
        print("Face saved")

    elif phrase.startswith("check the battery"):
        batteryLevel = mockBatteryGetLevel()
        print("The battery has " + str(batteryLevel) + "%" + " left")
        
    else:
        print("Unrecognized command")

def mockBatteryGetLevel():
    return 75

def mockGPSgetCoordinates():
    return (0, 1)

def mockCameraTakePicture():
    return "imaginary picture"


# main
locationNames = ["one", "two", "three"]
locationCommands = ["where is location", "save location"]
locationPhrases = [(command + " " + name, 1.0) for command in locationCommands for name in locationNames]
faceCommands = ["remember face"]
facePhrases = [(command, 1.0) for command in faceCommands]
batteryPhrases = [("check the battery", 1.0)]

locationsGPS = {}
locationsGPS["location one"] = (0, 2)

familiarFaces = []

executeCommand(listen(locationPhrases + facePhrases + batteryPhrases), locationsGPS, familiarFaces)
