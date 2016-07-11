From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the pwm tree with the regulator tree
Date: Mon, 11 Jul 2016 16:56:48 +1000
Message-ID: <20160711165648.029cb6f7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:47111 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S933514AbcGKG4v (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 11 Jul 2016 02:56:51 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Boris Brezillon <boris.brezillon@free-electrons.com>, Alexandre Courbot <acourbot@nvidia.com>, Douglas Anderson <dianders@chromium.org>

Hi Thierry,

Today's linux-next merge of the pwm tree got a conflict in:

  drivers/regulator/pwm-regulator.c

between commit:

  830583004e61 ("regulator: pwm: Drop unneeded pwm_enable() call")
  27bfa8893b15 ("regulator: pwm: Support for enable GPIO")
  c2588393e631 ("regulator: pwm: Fix regulator ramp delay for continuous mode")

from the regulator tree and commit:

  b0303deaa480 ("regulator: pwm: Adjust PWM config at probe time")
  8bd57ca236d0 ("regulator: pwm: Switch to the atomic PWM API")
  25d16595935b ("regulator: pwm: Retrieve correct voltage")
  53f239af4c14 ("regulator: pwm: Support extra continuous mode cases")

from the pwm tree.

I fixed it up (I think, please check - see below) and can carry the fix
as necessary. This is now fixed as far as linux-next is concerned, but
any non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/regulator/pwm-regulator.c
index 666bc3bb52ef,a8e9147dd8db..000000000000
--- a/drivers/regulator/pwm-regulator.c
+++ b/drivers/regulator/pwm-regulator.c
@@@ -20,8 -20,13 +20,14 @@@
  #include <linux/of.h>
  #include <linux/of_device.h>
  #include <linux/pwm.h>
 +#include <linux/gpio/consumer.h>
  
+ struct pwm_continuous_reg_data {
+ 	unsigned int min_uV_dutycycle;
+ 	unsigned int max_uV_dutycycle;
+ 	unsigned int dutycycle_unit;
+ };
+ 
  struct pwm_regulator_data {
  	/*  Shared */
  	struct pwm_device *pwm;
@@@ -36,12 -44,6 +45,9 @@@
  	struct regulator_ops ops;
  
  	int state;
 +
- 	/* Continuous voltage */
- 	int volt_uV;
- 
 +	/* Enable GPIO */
 +	struct gpio_desc *enb_gpio;
  };
  
  struct pwm_voltages {
@@@ -134,53 -174,59 +187,58 @@@ static int pwm_regulator_get_voltage(st
  }
  
  static int pwm_regulator_set_voltage(struct regulator_dev *rdev,
- 					int min_uV, int max_uV,
- 					unsigned *selector)
+ 				     int req_min_uV, int req_max_uV,
+ 				     unsigned int *selector)
  {
  	struct pwm_regulator_data *drvdata = rdev_get_drvdata(rdev);
+ 	unsigned int min_uV_duty = drvdata->continuous.min_uV_dutycycle;
+ 	unsigned int max_uV_duty = drvdata->continuous.max_uV_dutycycle;
+ 	unsigned int duty_unit = drvdata->continuous.dutycycle_unit;
  	unsigned int ramp_delay = rdev->constraints->ramp_delay;
- 	struct pwm_args pargs;
- 	unsigned int req_diff = min_uV - rdev->constraints->min_uV;
- 	unsigned int diff;
- 	unsigned int duty_pulse;
- 	u64 req_period;
- 	u32 rem;
+ 	int min_uV = rdev->constraints->min_uV;
+ 	int max_uV = rdev->constraints->max_uV;
+ 	int diff_uV = max_uV - min_uV;
+ 	struct pwm_state pstate;
+ 	unsigned int diff_duty;
+ 	unsigned int dutycycle;
 +	int old_uV = pwm_regulator_get_voltage(rdev);
  	int ret;
  
- 	pwm_get_args(drvdata->pwm, &pargs);
- 	diff = rdev->constraints->max_uV - rdev->constraints->min_uV;
+ 	pwm_init_state(drvdata->pwm, &pstate);
  
- 	/* First try to find out if we get the iduty cycle time which is
- 	 * factor of PWM period time. If (request_diff_to_min * pwm_period)
- 	 * is perfect divided by voltage_range_diff then it is possible to
- 	 * get duty cycle time which is factor of PWM period. This will help
- 	 * to get output voltage nearer to requested value as there is no
- 	 * calculation loss.
+ 	/*
+ 	 * The dutycycle for min_uV might be greater than the one for max_uV.
+ 	 * This is happening when the user needs an inversed polarity, but the
+ 	 * PWM device does not support inversing it in hardware.
  	 */
- 	req_period = req_diff * pargs.period;
- 	div_u64_rem(req_period, diff, &rem);
- 	if (!rem) {
- 		do_div(req_period, diff);
- 		duty_pulse = (unsigned int)req_period;
- 	} else {
- 		duty_pulse = (pargs.period / 100) * ((req_diff * 100) / diff);
- 	}
+ 	if (max_uV_duty < min_uV_duty)
+ 		diff_duty = min_uV_duty - max_uV_duty;
+ 	else
+ 		diff_duty = max_uV_duty - min_uV_duty;
+ 
+ 	dutycycle = DIV_ROUND_CLOSEST_ULL((u64)(req_min_uV - min_uV) *
+ 					  diff_duty,
+ 					  diff_uV);
+ 
+ 	if (max_uV_duty < min_uV_duty)
+ 		dutycycle = min_uV_duty - dutycycle;
+ 	else
+ 		dutycycle = min_uV_duty + dutycycle;
+ 
+ 	pwm_set_relative_duty_cycle(&pstate, dutycycle, duty_unit);
  
- 	ret = pwm_config(drvdata->pwm, duty_pulse, pargs.period);
+ 	ret = pwm_apply_state(drvdata->pwm, &pstate);
  	if (ret) {
  		dev_err(&rdev->dev, "Failed to configure PWM: %d\n", ret);
  		return ret;
  	}
  
- 	drvdata->volt_uV = min_uV;
- 
 -	ret = pwm_enable(drvdata->pwm);
 -	if (ret) {
 -		dev_err(&rdev->dev, "Failed to enable PWM: %d\n", ret);
 -		return ret;
 -	}
 +	if ((ramp_delay == 0) || !pwm_regulator_is_enabled(rdev))
 +		return 0;
  
 -	/* Delay required by PWM regulator to settle to the new voltage */
 -	usleep_range(ramp_delay, ramp_delay + 1000);
 +	/* Ramp delay is in uV/uS. Adjust to uS and delay */
 +	ramp_delay = DIV_ROUND_UP(abs(min_uV - old_uV), ramp_delay);
 +	usleep_range(ramp_delay, ramp_delay + DIV_ROUND_UP(ramp_delay, 10));
  
  	return 0;
  }
@@@ -304,23 -367,9 +380,21 @@@ static int pwm_regulator_probe(struct p
  		return ret;
  	}
  
 +	if (init_data->constraints.boot_on || init_data->constraints.always_on)
 +		gpio_flags = GPIOD_OUT_HIGH;
 +	else
 +		gpio_flags = GPIOD_OUT_LOW;
 +	drvdata->enb_gpio = devm_gpiod_get_optional(&pdev->dev, "enable",
 +						    gpio_flags);
 +	if (IS_ERR(drvdata->enb_gpio)) {
 +		ret = PTR_ERR(drvdata->enb_gpio);
 +		dev_err(&pdev->dev, "Failed to get enable GPIO: %d\n", ret);
 +		return ret;
 +	}
 +
- 	/*
- 	 * FIXME: pwm_apply_args() should be removed when switching to the
- 	 * atomic PWM API.
- 	 */
- 	pwm_apply_args(drvdata->pwm);
+ 	ret = pwm_adjust_config(drvdata->pwm);
+ 	if (ret)
+ 		return ret;
  
  	regulator = devm_regulator_register(&pdev->dev,
  					    &drvdata->desc, &config);
