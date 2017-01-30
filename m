From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the gpio tree with the staging tree
Date: Mon, 30 Jan 2017 15:28:55 +1100
Message-ID: <20170130152855.7e8cb6c2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Roman Sommer <roman.sommer@fau.de>, Mika Westerberg <mika.westerberg@linux.intel.com>
List-Id: linux-next.vger.kernel.org

Hi Linus,

Today's linux-next merge of the gpio tree got a conflict in:

  drivers/staging/greybus/gpio.c

between commit:

  1d3dfbd1dd34 ("staging: greybus: fix checkpatch unsigned warnings")

from the staging tree and commit:

  2956b5d94a76 ("pinctrl / gpio: Introduce .set_config() callback for GPIO chips")

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

diff --cc drivers/staging/greybus/gpio.c
index 558550cfe687,51384bdde450..000000000000
--- a/drivers/staging/greybus/gpio.c
+++ b/drivers/staging/greybus/gpio.c
@@@ -474,17 -474,20 +474,20 @@@ static void gb_gpio_set(struct gpio_chi
  	gb_gpio_set_value_operation(ggc, (u8)offset, !!value);
  }
  
- static int gb_gpio_set_debounce(struct gpio_chip *chip, unsigned int offset,
- 				unsigned int debounce)
 -static int gb_gpio_set_config(struct gpio_chip *chip, unsigned offset,
++static int gb_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
+ 			      unsigned long config)
  {
  	struct gb_gpio_controller *ggc = gpio_chip_to_gb_gpio_controller(chip);
- 	u16 usec;
+ 	u32 debounce;
  
+ 	if (pinconf_to_config_param(config) != PIN_CONFIG_INPUT_DEBOUNCE)
+ 		return -ENOTSUPP;
+ 
+ 	debounce = pinconf_to_config_argument(config);
  	if (debounce > U16_MAX)
  		return -EINVAL;
- 	usec = (u16)debounce;
  
- 	return gb_gpio_set_debounce_operation(ggc, (u8)offset, usec);
+ 	return gb_gpio_set_debounce_operation(ggc, (u8)offset, (u16)debounce);
  }
  
  static int gb_gpio_controller_setup(struct gb_gpio_controller *ggc)
