From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the pwm tree with the regulator tree
Date: Tue, 3 May 2016 18:25:09 +1000
Message-ID: <20160503182509.42658c4f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Boris Brezillon <boris.brezillon@free-electrons.com>, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: linux-next.vger.kernel.org

Hi Thierry,

Today's linux-next merge of the pwm tree got a conflict in:

  drivers/regulator/pwm-regulator.c

between commit:

  fd786fb0276a ("regulator: pwm: Try to avoid voltage error in duty cycle calculation")

from the regulator tree and commit:

  f137b90ba6cd ("regulator: pwm: Use pwm_get_args() where appropriate")

from the pwm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/regulator/pwm-regulator.c
index 8e928f23279b,ffdb895ace0a..000000000000
--- a/drivers/regulator/pwm-regulator.c
+++ b/drivers/regulator/pwm-regulator.c
@@@ -63,14 -63,14 +63,14 @@@ static int pwm_regulator_set_voltage_se
  	int dutycycle;
  	int ret;
  
- 	pwm_reg_period = pwm_get_period(drvdata->pwm);
+ 	pwm_get_args(drvdata->pwm, &pargs);
  
- 	dutycycle = (pwm_reg_period *
+ 	dutycycle = (pargs.period *
  		    drvdata->duty_cycle_table[selector].dutycycle) / 100;
  
- 	ret = pwm_config(drvdata->pwm, dutycycle, pwm_reg_period);
+ 	ret = pwm_config(drvdata->pwm, dutycycle, pargs.period);
  	if (ret) {
 -		dev_err(&rdev->dev, "Failed to configure PWM\n");
 +		dev_err(&rdev->dev, "Failed to configure PWM: %d\n", ret);
  		return ret;
  	}
  
@@@ -126,35 -138,17 +126,36 @@@ static int pwm_regulator_set_voltage(st
  {
  	struct pwm_regulator_data *drvdata = rdev_get_drvdata(rdev);
  	unsigned int ramp_delay = rdev->constraints->ramp_delay;
- 	unsigned int period = pwm_get_period(drvdata->pwm);
+ 	struct pwm_args pargs;
 -	int duty_cycle;
 +	unsigned int req_diff = min_uV - rdev->constraints->min_uV;
 +	unsigned int diff;
 +	unsigned int duty_pulse;
 +	u64 req_period;
 +	u32 rem;
  	int ret;
  
+ 	pwm_get_args(drvdata->pwm, &pargs);
 -	duty_cycle = pwm_voltage_to_duty_cycle_percentage(rdev, min_uV);
 +	diff = rdev->constraints->max_uV - rdev->constraints->min_uV;
 +
 +	/* First try to find out if we get the iduty cycle time which is
 +	 * factor of PWM period time. If (request_diff_to_min * pwm_period)
 +	 * is perfect divided by voltage_range_diff then it is possible to
 +	 * get duty cycle time which is factor of PWM period. This will help
 +	 * to get output voltage nearer to requested value as there is no
 +	 * calculation loss.
 +	 */
- 	req_period = req_diff * period;
++	req_period = req_diff * pargs.period;
 +	div_u64_rem(req_period, diff, &rem);
 +	if (!rem) {
 +		do_div(req_period, diff);
 +		duty_pulse = (unsigned int)req_period;
 +	} else {
- 		duty_pulse = (period / 100) * ((req_diff * 100) / diff);
++		duty_pulse = (pargs.period / 100) * ((req_diff * 100) / diff);
 +	}
  
- 	ret = pwm_config(drvdata->pwm, duty_pulse, period);
 -	ret = pwm_config(drvdata->pwm, (pargs.period / 100) * duty_cycle,
 -			 pargs.period);
++	ret = pwm_config(drvdata->pwm, duty_pulse, pargs.period);
  	if (ret) {
 -		dev_err(&rdev->dev, "Failed to configure PWM\n");
 +		dev_err(&rdev->dev, "Failed to configure PWM: %d\n", ret);
  		return ret;
  	}
  
@@@ -284,11 -279,16 +285,17 @@@ static int pwm_regulator_probe(struct p
  
  	drvdata->pwm = devm_pwm_get(&pdev->dev, NULL);
  	if (IS_ERR(drvdata->pwm)) {
 -		dev_err(&pdev->dev, "Failed to get PWM\n");
 -		return PTR_ERR(drvdata->pwm);
 +		ret = PTR_ERR(drvdata->pwm);
 +		dev_err(&pdev->dev, "Failed to get PWM: %d\n", ret);
 +		return ret;
  	}
  
+ 	/*
+ 	 * FIXME: pwm_apply_args() should be removed when switching to the
+ 	 * atomic PWM API.
+ 	 */
+ 	pwm_apply_args(drvdata->pwm);
+ 
  	regulator = devm_regulator_register(&pdev->dev,
  					    &drvdata->desc, &config);
  	if (IS_ERR(regulator)) {
