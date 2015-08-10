From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the gpio tree
Date: Mon, 10 Aug 2015 15:07:41 +1000
Message-ID: <20150810150741.5969efdb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:59512 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751573AbbHJFHn (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 10 Aug 2015 01:07:43 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>

Hi Linus,

After merging the gpio tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/input/touchscreen/elants_i2c.c: In function 'elants_i2c_probe':
drivers/input/touchscreen/elants_i2c.c:1176:19: error: too few arguments to function 'devm_gpiod_get'
  ts->reset_gpio = devm_gpiod_get(&client->dev, "reset");
                   ^
In file included from drivers/input/touchscreen/elants_i2c.c:41:0:
include/linux/gpio/consumer.h:73:32: note: declared here
 struct gpio_desc *__must_check devm_gpiod_get(struct device *dev,
                                ^

Caused by commit

  b17d1bf16cc7 ("gpio: make flags mandatory for gpiod_get functions")

Interacting with commit

  afe10358e47a ("Input: elants_i2c - wire up regulator support")

from the input tree.

I have added the following merge fix patch:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 10 Aug 2015 15:01:19 +1000
Subject: [PATCH] Input: elants_i2c: fix for devm_gpiod_get API change

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/input/touchscreen/elants_i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/elants_i2c.c b/drivers/input/touchscreen/elants_i2c.c
index 6f7155641591..1e7b931d6112 100644
--- a/drivers/input/touchscreen/elants_i2c.c
+++ b/drivers/input/touchscreen/elants_i2c.c
@@ -1173,7 +1173,7 @@ static int elants_i2c_probe(struct i2c_client *client,
 		return error;
 	}
 
-	ts->reset_gpio = devm_gpiod_get(&client->dev, "reset");
+	ts->reset_gpio = devm_gpiod_get(&client->dev, "reset", GPIOD_ASIS);
 	if (IS_ERR(ts->reset_gpio)) {
 		error = PTR_ERR(ts->reset_gpio);
 
-- 
2.5.0

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
