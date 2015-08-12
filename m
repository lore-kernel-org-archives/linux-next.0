From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the gpio tree
Date: Wed, 12 Aug 2015 18:10:45 +1000
Message-ID: <20150812181045.0d290caa@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Roger Quadros <rogerq@ti.com>, Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>
List-Id: linux-next.vger.kernel.org

Hi Linus,

After merging the gpio tree, today's linux-next build (powerpc
allyesconfig) failed like this:

drivers/extcon/extcon-palmas.c:211:25: error: too few arguments to function 'devm_gpiod_get_optional'
  palmas_usb->id_gpiod = devm_gpiod_get_optional(&pdev->dev, "id");
                         ^
In file included from /home/sfr/next/next/include/asm-generic/gpio.h:13:0,
                 from /home/sfr/next/next/include/linux/gpio.h:51,
                 from /home/sfr/next/next/include/linux/of_gpio.h:20,
                 from /home/sfr/next/next/include/linux/mfd/palmas.h:24,
                 from /home/sfr/next/next/drivers/extcon/extcon-palmas.c:28:
/home/sfr/next/next/include/linux/gpio/consumer.h:80:32: note: declared here
 struct gpio_desc *__must_check devm_gpiod_get_optional(struct device *dev,
                                ^

Caused by commit

  b17d1bf16cc7 ("gpio: make flags mandatory for gpiod_get functions")

interacting with commit

  92b7cb5dc885 ("extcon: palmas: Support GPIO based USB ID detection")

from the extcon tree.

I have applied this merge fix patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 12 Aug 2015 18:05:55 +1000
Subject: [PATCH] extcon: palmas: fix for devm_gpiod_get_optional API change

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/extcon/extcon-palmas.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/extcon/extcon-palmas.c b/drivers/extcon/extcon-palmas.c
index 662e91778cb0..4ce4106b8f4f 100644
--- a/drivers/extcon/extcon-palmas.c
+++ b/drivers/extcon/extcon-palmas.c
@@ -208,7 +208,7 @@ static int palmas_usb_probe(struct platform_device *pdev)
 			palmas_usb->wakeup = pdata->wakeup;
 	}
 
-	palmas_usb->id_gpiod = devm_gpiod_get_optional(&pdev->dev, "id");
+	palmas_usb->id_gpiod = devm_gpiod_get_optional(&pdev->dev, "id", GPIOD_ASIS);
 	if (IS_ERR(palmas_usb->id_gpiod)) {
 		dev_err(&pdev->dev, "failed to get id gpio\n");
 		return PTR_ERR(palmas_usb->id_gpiod);
-- 
2.5.0

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
