From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the gpio tree
Date: Tue, 18 Aug 2015 16:57:19 +1000
Message-ID: <20150818165719.5ac6f687@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:35045 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751898AbbHRG5V (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 18 Aug 2015 02:57:21 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>, Hans Verkuil <hans.verkuil@cisco.com>, Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>

Hi Linus,

After merging the gpio tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/media/i2c/tc358743.c: In function 'tc358743_probe_of':
drivers/media/i2c/tc358743.c:1786:22: error: too few arguments to function 'devm_gpiod_get'
  state->reset_gpio = devm_gpiod_get(dev, "reset");
                      ^
In file included from drivers/media/i2c/tc358743.c:34:0:
include/linux/gpio/consumer.h:73:32: note: declared here
 struct gpio_desc *__must_check devm_gpiod_get(struct device *dev,
                                ^

Caused by commit

  b17d1bf16cc7 ("gpio: make flags mandatory for gpiod_get functions")

interacting with commit

  256148246852 ("[media] tc358743: support probe from device tree")

from the v4l-dvb tree.

I have added the following fix patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 18 Aug 2015 16:53:21 +1000
Subject: [PATCH] [media] tc358743: fix for devm_gpiod_get API change

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/media/i2c/tc358743.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/tc358743.c b/drivers/media/i2c/tc358743.c
index fe42c9a1cb78..8f7641164d9d 100644
--- a/drivers/media/i2c/tc358743.c
+++ b/drivers/media/i2c/tc358743.c
@@ -1783,7 +1783,7 @@ static int tc358743_probe_of(struct tc358743_state *state)
 	state->pdata.ths_trailcnt = 0x2;
 	state->pdata.hstxvregcnt = 0;
 
-	state->reset_gpio = devm_gpiod_get(dev, "reset");
+	state->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_ASIS);
 	if (IS_ERR(state->reset_gpio)) {
 		dev_err(dev, "failed to get reset gpio\n");
 		ret = PTR_ERR(state->reset_gpio);
-- 
2.5.0

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
