
""" Module to plot battery files. """

import sys
import numpy as np
import matplotlib.pyplot as plt

#FILENAMES = ["bat_out.csv", "bat_out2.csv"]
FILENAMES = None

def plot(filename="sensors.log"):
    print("Plotting {0}...".format(filename))

    _, ax = plt.subplots()
    ax2 = ax.twinx()

    ax.set_title("Sensors")
    ax.set_xlabel("Time (s)")
    ax.set_ylabel("Volts (V)")
    ax2.set_ylabel("Temp (C)")

    times = []
    temps = []
    a0s = []
    a1s = []
    a2s = []
    a3s = []
    with open(filename, "r") as f:
        lines = f.readlines()[1:]

    for line in lines:
        t, temp,  _, _, a0, a1, a2, a3  = line.split()
        t = float(t)
        temp = float(temp)
        a0 = float(a0)
        a1 = float(a1)
        a2 = float(a2)
        a3 = float(a3)

        times.append(t)
        temps.append(temp)
        a0s.append(a0)
        a1s.append(a1)
        a2s.append(a2)
        a3s.append(a3)

    ax.plot(times, a0s, label="A0")
    ax.plot(times, a1s, label="A1")
    ax.plot(times, a2s, label="A2")
    ax.plot(times, a3s, label="A3")
    ax2.plot(times, temps, label="Temp")

    ax.legend(loc="best")
    ax2.legend(loc="best")
    plt.show()

if __name__ == "__main__":
    if len(sys.argv) >= 2:
        plot(sys.argv[1])
    else:
        plot()
