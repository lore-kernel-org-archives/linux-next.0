From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the final tree (backlight
 related)
Date: Wed, 10 Mar 2010 18:03:43 +1100
Message-ID: <20100310180343.c6305829.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Richard Purdie <rpurdie@rpsys.net>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Matthew Garrett <mjg@redhat.com>, Haojian Zhuang <haojian.zhuang@marvell.com>, Samuel Ortiz <sameo@linux.intel.com>
List-Id: linux-next.vger.kernel.org

Hi Richard,

After merging the final tree, today's linux-next build (powerpc
allyesconfig) failed like this:

drivers/video/backlight/88pm860x_bl.c: In function 'pm860x_backlight_probe':
drivers/video/backlight/88pm860x_bl.c:227: error: too few arguments to function 'backlight_device_register'
drivers/video/backlight/max8925_bl.c: In function 'max8925_backlight_probe':
drivers/video/backlight/max8925_bl.c:137: error: too few arguments to function 'backlight_device_register'

Caused by commit 85d0968607ab8c61de45a68c643b198020a1369d ("backlight:
Allow properties to be passed at registration") interacting with commits
d07e8bf83fd71567aaf9c27c3b133ab3cf8f3c4c ("backlight: Enable backlight in
88pm860x") and 4f811ef0d40048ae80b6ea77080b814725bffc58 ("backlight:
Enable max8925 backlight") which are now in Linus' tree (via the mfd tree)

I applied the following patch for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 10 Mar 2010 17:49:45 +1100
Subject: [PATCH] backlight: update for API change

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/video/backlight/88pm860x_bl.c |    6 ++++--
 drivers/video/backlight/max8925_bl.c  |    6 ++++--
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/video/backlight/88pm860x_bl.c b/drivers/video/backlight/88pm860x_bl.c
index b8f705c..93e25c7 100644
--- a/drivers/video/backlight/88pm860x_bl.c
+++ b/drivers/video/backlight/88pm860x_bl.c
@@ -187,6 +187,7 @@ static int pm860x_backlight_probe(struct platform_device *pdev)
 	struct pm860x_backlight_data *data;
 	struct backlight_device *bl;
 	struct resource *res;
+	struct backlight_properties props;
 	unsigned char value;
 	char name[MFD_NAME_SIZE];
 	int ret;
@@ -223,14 +224,15 @@ static int pm860x_backlight_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
+	memset(&props, 0, sizeof(struct backlight_properties));
+	props.max_brightness = MAX_BRIGHTNESS;
 	bl = backlight_device_register(name, &pdev->dev, data,
-					&pm860x_backlight_ops);
+					&pm860x_backlight_ops, &props);
 	if (IS_ERR(bl)) {
 		dev_err(&pdev->dev, "failed to register backlight\n");
 		kfree(data);
 		return PTR_ERR(bl);
 	}
-	bl->props.max_brightness = MAX_BRIGHTNESS;
 	bl->props.brightness = MAX_BRIGHTNESS;
 
 	platform_set_drvdata(pdev, bl);
diff --git a/drivers/video/backlight/max8925_bl.c b/drivers/video/backlight/max8925_bl.c
index c267069..c91adaf 100644
--- a/drivers/video/backlight/max8925_bl.c
+++ b/drivers/video/backlight/max8925_bl.c
@@ -104,6 +104,7 @@ static int __devinit max8925_backlight_probe(struct platform_device *pdev)
 	struct max8925_backlight_pdata *pdata = NULL;
 	struct max8925_backlight_data *data;
 	struct backlight_device *bl;
+	struct backlight_properties props;
 	struct resource *res;
 	char name[MAX8925_NAME_SIZE];
 	unsigned char value;
@@ -133,14 +134,15 @@ static int __devinit max8925_backlight_probe(struct platform_device *pdev)
 	data->chip = chip;
 	data->current_brightness = 0;
 
+	memset(&props, 0, sizeof(struct backlight_properties));
+	props.max_brightness = MAX_BRIGHTNESS;
 	bl = backlight_device_register(name, &pdev->dev, data,
-					&max8925_backlight_ops);
+					&max8925_backlight_ops, &props);
 	if (IS_ERR(bl)) {
 		dev_err(&pdev->dev, "failed to register backlight\n");
 		kfree(data);
 		return PTR_ERR(bl);
 	}
-	bl->props.max_brightness = MAX_BRIGHTNESS;
 	bl->props.brightness = MAX_BRIGHTNESS;
 
 	platform_set_drvdata(pdev, bl);
-- 
1.7.0

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/
