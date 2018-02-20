
""" Module to deal with MQx sensor calculations """

import numpy as np
import matplotlib.pyplot as plt
from scipy.optimize import fsolve

class MQx(object):
    """ Parent class for MQ-x sensors
    
        Contains linear coefficients (m, b) for each of the following chemicals:
        h2, ch4

        The chemicals have a linear relationship in log-log form, so
        the model is:

        log y = m (log x) + b
    """
    def plot(self, ax=None):
        """ Plots the calibration curves to match the datasheets hopefully """
        if ax is None:
            fig, ax = plt.subplots()
            ax.set_xlim(100, 10000)
            ax.set_ylim(0.01, 100)
            ax.set_title(self.name)
            ax.set_xlabel("ppm")
            ax.set_ylabel("Rs / Ro")
            ax.set_xscale("log", nonposx='clip')
            ax.set_yscale("log", nonposy='clip')
            ax.grid(which="both")

        xs = np.linspace(200, 10000, 10)
        logxs = np.log10(xs)

        # H2
        [m, b] = self.h2
        logys = m * logxs + b
        ys = 10 ** logys
        ax.plot(xs, ys, label="H2", color="b")
        ax.plot(self.h2_xs, self.h2_ys, ".", color="b")

        # CH4
        [m, b] = self.ch4
        logys = m * logxs + b
        ys = 10 ** logys
        ax.plot(xs, ys, label="CH4", color="g")
        ax.plot(self.ch4_xs, self.ch4_ys, ".", color="g")

        return ax

    def get_ppm_h2(Rs):
        """ Return ppm estimate of hydrogen given resistance. """
        [m, b] = self.h2
        ppm = np.exp((np.log(Rs / self.Ro) - b) / m)
        return ppm

    def get_ppm_ch4(Rs):
        """ Return ppm estimate of methane given resistance. """
        [m, b] = self.ch4
        ppm = ((Rs / self.Ro) - b) / m
        return ppm

class MQ4(MQx):
    """ Class for MQ-4 sensors """

    Ro = 1000  # TODO update this

    def __init__(self):
        self.name = "MQ-4"

        # H2
        self.h2_xs = np.array([200, 1000, 10000])
        self.h2_ys = np.array([3.8, 2.9, 0.9])
        self.h2 = np.polyfit(np.log10(self.h2_xs), np.log10(self.h2_ys), 1)

        # CH4
        self.ch4_xs = np.array([200, 1000, 10000])
        self.ch4_ys = np.array([1.8, 1, 0.45])
        self.ch4 = np.polyfit(np.log10(self.ch4_xs), np.log10(self.ch4_ys), 1)

    def get_Ro(self, rs, ppm):
        """ Return Ro given a resistance and concentration of the  """
        [m, b] = self.ch4
        return rs / (10 ** b * ppm ** m)

class MQ8(MQx):
    """ Class for MQ-8 sensors """

    Ro = 1000  # TODO update this

    def __init__(self):
        self.name = "MQ-8"

        # H2
        self.h2_xs = np.array([200, 1000, 10000])
        self.h2_ys = np.array([8.5, 1, 0.03])
        self.h2 = np.polyfit(np.log10(self.h2_xs), np.log10(self.h2_ys), 1)

        # CH4
        self.ch4_xs = np.array([200, 1000, 10000])
        self.ch4_ys = np.array([55, 45, 28])
        self.ch4 = np.polyfit(np.log10(self.ch4_xs), np.log10(self.ch4_ys), 1)

    def get_Ro(self, rs, ppm):
        """ Return Ro given a resistance and concentration of the  """
        [m, b] = self.h2
        return rs / (10 ** b * ppm ** m)

def conductance_h2(ppm_h2, MQx_class):
    """ Return the contribution to conductance of hydrogen on MQx's reading """
    [m, b] = MQx_class().h2
    Ro = MQx_class.Ro
    return 1.0 / (Ro * (10.0 ** (m * np.log10(ppm_h2) + b)))

def conductance_ch4(ppm_ch4, MQx_class):
    """ Return the contribution to conductance of methane on MQx's reading """
    [m, b] = MQx_class().ch4
    Ro = MQx_class.Ro
    return 1.0 / (Ro * (10.0 ** (m * np.log10(ppm_ch4) + b)))

def get_ppms(r_mq4, r_mq8):
    """ Given resistor measurements from the two sensors, calculate ppms.

        This function works by enforcing the constraint:

          [ C_mq4 ] = C_h2_mq4(ppm_h2) + C_ch4_mq4(ppm_ch4)
          [ C_mq8 ] = C_h2_mq8(ppm_h2) + C_ch4_mq8(ppm_ch4)

        where "C_mq4" is the conductance of MQ4,
              "C_h2_mq4" is the conductance contribution from hydrogen,
              etc.

        This is solved by using scipy.optimize.fsolve which finds the roots
        of the function `func`, defined as the difference between the theoretical
        conductance and the observed one.

        It has the following signature:

            func :: (ppm_h2, ppm_ch4) -> [conductance error for MQ4,
                                          conductance error for MQ8]
    """
    real_cond_mq4 = 1.0 / r_mq4
    real_cond_mq8 = 1.0 / r_mq8

    def func(p):
        """ f(p) = 0 """
        ppm_h2, ppm_ch4 = p
        cond_mq4 = conductance_h2(ppm_h2, MQ4) + conductance_ch4(ppm_ch4, MQ4)
        cond_mq8 = conductance_h2(ppm_h2, MQ8) + conductance_ch4(ppm_ch4, MQ8)
        ys = np.array([cond_mq4 - real_cond_mq4,
                       cond_mq8 - real_cond_mq8])
        return ys

    est_ppm_h2, est_ppm_ch4 = fsolve(func, (1000, 1000))
    return [est_ppm_h2, est_ppm_ch4]

def test_plot_calibration_curves():
    """ Plot ppm vs Rs / Ro for both sensors """
    ax_mq4 = MQ4().plot()
    ax_mq8 = MQ8().plot()
    ax_mq4.legend(loc="best")
    ax_mq8.legend(loc="best")

def test_plot_measurements(r_mq4=800, r_mq8=600):
    """ Plot ppm vs Rs / Ro for both sensors """
    print("Running analysis for r_mq4={0}, r_mq8={1}...".format(r_mq4, r_mq8))
    print("=" * 40)

    pred_ppm_h2, pred_ppm_ch4 = get_ppms(r_mq4, r_mq8)

    print("Results:")
    print("")
    print("\tPred. H2 ppm: {0}".format(pred_ppm_h2))
    print("\tPred. CH4 ppm: {0}".format(pred_ppm_ch4))

    print("\nDetails:")
    print("")
    r_h2_mq4 = 1.0 / conductance_h2(pred_ppm_h2, MQ4)
    r_ch4_mq4 = 1.0 / conductance_ch4(pred_ppm_ch4, MQ4)
    r_h2_mq8 = 1.0 / conductance_h2(pred_ppm_h2, MQ8)
    r_ch4_mq8 = 1.0 / conductance_ch4(pred_ppm_ch4, MQ8)

    print("\tRs H2 MQ4: {0}".format(r_h2_mq4))
    print("\tRs CH4 MQ4: {0}".format(r_ch4_mq4))
    print("\tRs H2 MQ8: {0}".format(r_h2_mq8))
    print("\tRs CH4 MQ8: {0}".format(r_ch4_mq8))

    pred_r_mq4 = 1.0 / ((1.0 / r_h2_mq4) + (1.0 / r_ch4_mq4))
    pred_r_mq8 = 1.0 / ((1.0 / r_h2_mq8) + (1.0 / r_ch4_mq8))

    print("\nPredicted ppms produce these resistances according to the curve:")
    print("")
    print("\tPred. Rs MQ4: {0}".format(pred_r_mq4))
    print("\tPred. Rs MQ8: {0}".format(pred_r_mq8))

    ax_mq4 = MQ4().plot()
    ax_mq8 = MQ8().plot()

    ax_mq4.plot(pred_ppm_h2, r_h2_mq4 / MQ4.Ro, "o", label="Predicted H2 ppm: {:.03g}".format(pred_ppm_h2), color="b")
    ax_mq4.plot(pred_ppm_ch4, r_ch4_mq4 / MQ4.Ro, "o", label="Predicted CH4 ppm: {:.03g}".format(pred_ppm_ch4), color="g")
    ax_mq8.plot(pred_ppm_h2, r_h2_mq8 / MQ8.Ro, "o", label="Predicted H2 ppm: {:.03g}".format(pred_ppm_h2), color="b")
    ax_mq8.plot(pred_ppm_ch4, r_ch4_mq8 / MQ8.Ro, "o", label="Predicted CH4 ppm: {:.03g}".format(pred_ppm_ch4), color="g")

    ax_mq4.legend(loc="best")
    ax_mq8.legend(loc="best")

if __name__ == "__main__":
    test_plot_measurements()
    #test_plot_calibration_curves()

    plt.show()
