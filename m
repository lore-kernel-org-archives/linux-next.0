From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the gpio tree with the i2c tree
Date: Tue, 27 Sep 2016 15:02:12 +1000
Message-ID: <20160927150212.7fa33016@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Wolfram Sang <wsa@the-dreams.de>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Phil Reid <preid@electromag.com.au>
List-Id: linux-next.vger.kernel.org

Hi Linus,

Today's linux-next merge of the gpio tree got a conflict in:

  drivers/gpio/gpio-pca953x.c

between commit:

  6212e1d6ed40 ("gpio: pca953x: variable 'id' was used twice")

from the i2c tree and commit:

  e23efa311110 ("gpio: pca954x: Add vcc regulator and enable it")

from the gpio tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/gpio/gpio-pca953x.c
index 018f39cc19c8,5d059866d17a..000000000000
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@@ -765,29 -759,41 +759,43 @@@ static int pca953x_probe(struct i2c_cli
  
  	chip->client = client;
  
+ 	reg = devm_regulator_get(&client->dev, "vcc");
+ 	if (IS_ERR(reg)) {
+ 		ret = PTR_ERR(reg);
+ 		if (ret != -EPROBE_DEFER)
+ 			dev_err(&client->dev, "reg get err: %d\n", ret);
+ 		return ret;
+ 	}
+ 	ret = regulator_enable(reg);
+ 	if (ret) {
+ 		dev_err(&client->dev, "reg en err: %d\n", ret);
+ 		return ret;
+ 	}
+ 	chip->regulator = reg;
+ 
 -	if (id) {
 -		chip->driver_data = id->driver_data;
 +	if (i2c_id) {
 +		chip->driver_data = i2c_id->driver_data;
  	} else {
 -		const struct acpi_device_id *id;
 +		const struct acpi_device_id *acpi_id;
  		const struct of_device_id *match;
  
  		match = of_match_device(pca953x_dt_ids, &client->dev);
  		if (match) {
  			chip->driver_data = (int)(uintptr_t)match->data;
  		} else {
 -			id = acpi_match_device(pca953x_acpi_ids, &client->dev);
 -			if (!id) {
 +			acpi_id = acpi_match_device(pca953x_acpi_ids, &client->dev);
- 			if (!acpi_id)
- 				return -ENODEV;
++			if (!acpi_id) {
+ 				ret = -ENODEV;
+ 				goto err_exit;
+ 			}
  
 -			chip->driver_data = id->driver_data;
 +			chip->driver_data = acpi_id->driver_data;
  		}
  	}
  
- 	chip->chip_type = PCA_CHIP_TYPE(chip->driver_data);
- 
  	mutex_init(&chip->i2c_lock);
 +	lockdep_set_subclass(&chip->i2c_lock,
 +			     i2c_adapter_depth(client->adapter));
  
  	/* initialize cached registers from their original values.
  	 * we can't share this chip with another i2c master.
