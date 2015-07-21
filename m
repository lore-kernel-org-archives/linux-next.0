From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the gpio tree
Date: Tue, 21 Jul 2015 13:29:45 +1000
Message-ID: <20150721132945.7ffc443b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:34796 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751268AbbGUD3r (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 20 Jul 2015 23:29:47 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Zhong <zyw@rock-chips.com>, Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>

Hi Linus,

After merging the gpio tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/regulator/rk808-regulator.c: In function 'rk808_regulator_dt_parse_pdata':
drivers/regulator/rk808-regulator.c:543:24: error: too few arguments to function 'gpiod_get_index'
   pdata->dvs_gpio[i] = gpiod_get_index(client_dev, "dvs", i);
                        ^
In file included from include/asm-generic/gpio.h:13:0,
                 from include/linux/gpio.h:51,
                 from drivers/regulator/rk808-regulator.c:20:
include/linux/gpio/consumer.h:53:32: note: declared here
 struct gpio_desc *__must_check gpiod_get_index(struct device *dev,
                                ^

Caused by commit

  bad47ad2eef3 ("regulator: rk808: fixed the overshoot when adjust voltage")

from the regulator tree interactings with commit

  b17d1bf16cc7 ("gpio: make flags mandatory for gpiod_get functions")

from the gpio tree.

I added teh following merge fix patch:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 21 Jul 2015 13:23:56 +1000
Subject: [PATCH] regulator: rk808: fix up for gpiod_get_index() API change

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/regulator/rk808-regulator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/rk808-regulator.c b/drivers/regulator/rk808-regulator.c
index ca913fd15598..cfec52c1a4a2 100644
--- a/drivers/regulator/rk808-regulator.c
+++ b/drivers/regulator/rk808-regulator.c
@@ -540,7 +540,7 @@ static int rk808_regulator_dt_parse_pdata(struct device *dev,
 		goto dt_parse_end;
 
 	for (i = 0; i < ARRAY_SIZE(pdata->dvs_gpio); i++) {
-		pdata->dvs_gpio[i] = gpiod_get_index(client_dev, "dvs", i);
+		pdata->dvs_gpio[i] = gpiod_get_index(client_dev, "dvs", i, GPIOD_ASIS);
 		if (IS_ERR(pdata->dvs_gpio[i])) {
 			dev_warn(dev, "there is no dvs%d gpio\n", i);
 			continue;
-- 
2.1.4

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
