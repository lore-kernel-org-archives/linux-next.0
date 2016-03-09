From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the gpio tree with the mfd tree
Date: Wed, 9 Mar 2016 14:37:25 +1100
Message-ID: <20160309143725.412f97b3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:43879 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750867AbcCIDh1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 8 Mar 2016 22:37:27 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee.jones@linaro.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>, "Andrew F. Davis" <afd@ti.com>

Hi Linus,

Today's linux-next merge of the gpio tree got a conflict in:

  drivers/gpio/gpio-tps65912.c

between commits:

  65b6555971d0 ("mfd: tps65912: Remove old driver in preparation for new driver")
  ca801a22f465 ("gpio: tps65912: Add GPIO driver for the TPS65912 PMIC")

from the mfd tree and commit:

  0964ac703edf ("gpio: tps65912: Use devm_gpiochip_add_data() for gpio registration")

from the gpio tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/gpio/gpio-tps65912.c
index 3da3840201de,e72302d2461a..000000000000
--- a/drivers/gpio/gpio-tps65912.c
+++ b/drivers/gpio/gpio-tps65912.c
@@@ -105,54 -90,54 +105,44 @@@ static struct gpio_chip template_chip 
  
  static int tps65912_gpio_probe(struct platform_device *pdev)
  {
 -	struct tps65912 *tps65912 = dev_get_drvdata(pdev->dev.parent);
 -	struct tps65912_board *pdata = dev_get_platdata(tps65912->dev);
 -	struct tps65912_gpio_data *tps65912_gpio;
 +	struct tps65912 *tps = dev_get_drvdata(pdev->dev.parent);
 +	struct tps65912_gpio *gpio;
  	int ret;
  
 -	tps65912_gpio = devm_kzalloc(&pdev->dev, sizeof(*tps65912_gpio),
 -				     GFP_KERNEL);
 -	if (tps65912_gpio == NULL)
 +	gpio = devm_kzalloc(&pdev->dev, sizeof(*gpio), GFP_KERNEL);
 +	if (!gpio)
  		return -ENOMEM;
  
 -	tps65912_gpio->tps65912 = tps65912;
 -	tps65912_gpio->gpio_chip = template_chip;
 -	tps65912_gpio->gpio_chip.parent = &pdev->dev;
 -	if (pdata && pdata->gpio_base)
 -		tps65912_gpio->gpio_chip.base = pdata->gpio_base;
 +	gpio->tps = dev_get_drvdata(pdev->dev.parent);
 +	gpio->gpio_chip = template_chip;
 +	gpio->gpio_chip.parent = tps->dev;
  
- 	ret = gpiochip_add_data(&gpio->gpio_chip, gpio);
 -	ret = devm_gpiochip_add_data(&pdev->dev, &tps65912_gpio->gpio_chip,
 -				     tps65912_gpio);
++	ret = devm_gpiochip_add_data(&pdev->dev, &gpio->gpio_chip, gpio);
  	if (ret < 0) {
 -		dev_err(&pdev->dev, "Failed to register gpiochip, %d\n", ret);
 +		dev_err(&pdev->dev, "Could not register gpiochip, %d\n", ret);
  		return ret;
  	}
  
 -	platform_set_drvdata(pdev, tps65912_gpio);
 +	platform_set_drvdata(pdev, gpio);
  
 -	return ret;
 +	return 0;
  }
  
- static int tps65912_gpio_remove(struct platform_device *pdev)
- {
- 	struct tps65912_gpio *gpio = platform_get_drvdata(pdev);
- 
- 	gpiochip_remove(&gpio->gpio_chip);
- 
- 	return 0;
- }
- 
 +static const struct platform_device_id tps65912_gpio_id_table[] = {
 +	{ "tps65912-gpio", },
 +	{ /* sentinel */ }
 +};
 +MODULE_DEVICE_TABLE(platform, tps65912_gpio_id_table);
 +
  static struct platform_driver tps65912_gpio_driver = {
  	.driver = {
  		.name = "tps65912-gpio",
  	},
  	.probe = tps65912_gpio_probe,
- 	.remove = tps65912_gpio_remove,
 +	.id_table = tps65912_gpio_id_table,
  };
 +module_platform_driver(tps65912_gpio_driver);
  
 -static int __init tps65912_gpio_init(void)
 -{
 -	return platform_driver_register(&tps65912_gpio_driver);
 -}
 -subsys_initcall(tps65912_gpio_init);
 -
 -static void __exit tps65912_gpio_exit(void)
 -{
 -	platform_driver_unregister(&tps65912_gpio_driver);
 -}
 -module_exit(tps65912_gpio_exit);
 -
 -MODULE_AUTHOR("Margarita Olaya Cabrera <magi@slimlogic.co.uk>");
 -MODULE_DESCRIPTION("GPIO interface for TPS65912 PMICs");
 +MODULE_AUTHOR("Andrew F. Davis <afd@ti.com>");
 +MODULE_DESCRIPTION("TPS65912 GPIO driver");
  MODULE_LICENSE("GPL v2");
 -MODULE_ALIAS("platform:tps65912-gpio");
