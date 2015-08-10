From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: linux-next: build failure after merge of the gpio tree
Date: Sun, 9 Aug 2015 22:46:52 -0700
Message-ID: <20150810054652.GA26735@dtor-ws>
References: <20150810150741.5969efdb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pa0-f46.google.com ([209.85.220.46]:35788 "EHLO
	mail-pa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752437AbbHJFqz (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 10 Aug 2015 01:46:55 -0400
Content-Disposition: inline
In-Reply-To: <20150810150741.5969efdb@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>

Hi Stephen,

On Mon, Aug 10, 2015 at 03:07:41PM +1000, Stephen Rothwell wrote:
> Hi Linus,
> 
> After merging the gpio tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/input/touchscreen/elants_i2c.c: In function 'elants_i2c_probe':
> drivers/input/touchscreen/elants_i2c.c:1176:19: error: too few arguments to function 'devm_gpiod_get'
>   ts->reset_gpio = devm_gpiod_get(&client->dev, "reset");
>                    ^
> In file included from drivers/input/touchscreen/elants_i2c.c:41:0:
> include/linux/gpio/consumer.h:73:32: note: declared here
>  struct gpio_desc *__must_check devm_gpiod_get(struct device *dev,
>                                 ^
> 
> Caused by commit
> 
>   b17d1bf16cc7 ("gpio: make flags mandatory for gpiod_get functions")
> 
> Interacting with commit
> 
>   afe10358e47a ("Input: elants_i2c - wire up regulator support")
> 
> from the input tree.
> 
> I have added the following merge fix patch:

Thank you for the patch. I think we actually want GPIOD_OUT_LOW and kill
the "else" branch altogether, like below.

Thanks.

-- 
Dmitry

Input: elants_i2c - fix for devm_gpiod_get API change

From: Stephen Rothwell <sfr@canb.auug.org.au>

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/elants_i2c.c |   10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/input/touchscreen/elants_i2c.c b/drivers/input/touchscreen/elants_i2c.c
index 6f71556..ddac134 100644
--- a/drivers/input/touchscreen/elants_i2c.c
+++ b/drivers/input/touchscreen/elants_i2c.c
@@ -1173,7 +1173,7 @@ static int elants_i2c_probe(struct i2c_client *client,
 		return error;
 	}
 
-	ts->reset_gpio = devm_gpiod_get(&client->dev, "reset");
+	ts->reset_gpio = devm_gpiod_get(&client->dev, "reset", GPIOD_OUT_LOW);
 	if (IS_ERR(ts->reset_gpio)) {
 		error = PTR_ERR(ts->reset_gpio);
 
@@ -1188,14 +1188,6 @@ static int elants_i2c_probe(struct i2c_client *client,
 		}
 
 		ts->keep_power_in_suspend = true;
-	} else {
-		error = gpiod_direction_output(ts->reset_gpio, 0);
-		if (error) {
-			dev_err(&client->dev,
-				"failed to configure reset gpio as output: %d\n",
-				error);
-			return error;
-		}
 	}
 
 	error = elants_i2c_power_on(ts);
