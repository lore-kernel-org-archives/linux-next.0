From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the gpio tree
Date: Wed, 12 Aug 2015 16:59:49 +1000
Message-ID: <20150812165949.0d66f2be@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Gustavo Padovan <gustavo@padovan.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>, Frederic Danis <frederic.danis@linux.intel.com>, Marcel Holtmann <marcel@holtmann.org>
List-Id: linux-next.vger.kernel.org

Hi Linus,

After merging the gpio tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/bluetooth/hci_bcm.c: In function 'bcm_acpi_probe':
drivers/bluetooth/hci_bcm.c:429:9: error: too few arguments to function 'devm_gpiod_get'
  gpio = devm_gpiod_get(&pdev->dev, "device-wakeup");
         ^
In file included from drivers/bluetooth/hci_bcm.c:32:0:
include/linux/gpio/consumer.h:73:32: note: declared here
 struct gpio_desc *__must_check devm_gpiod_get(struct device *dev,
                                ^
drivers/bluetooth/hci_bcm.c:437:9: error: too few arguments to function 'devm_gpiod_get'
  gpio = devm_gpiod_get(&pdev->dev, "shutdown");
         ^
In file included from drivers/bluetooth/hci_bcm.c:32:0:
include/linux/gpio/consumer.h:73:32: note: declared here
 struct gpio_desc *__must_check devm_gpiod_get(struct device *dev,
                                ^

Caused by commit

  b17d1bf16cc7 ("gpio: make flags mandatory for gpiod_get functions")

Interacting with commit

  0395ffc1ee05 ("Bluetooth: hci_bcm: Add PM for BCM devices")

from the bluetooth tree.

I added the following merge fix patch:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 12 Aug 2015 16:55:58 +1000
Subject: [PATCH] Bluetooth: hci_bcm: fix for devm_gpiod_get API change

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/bluetooth/hci_bcm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/bluetooth/hci_bcm.c b/drivers/bluetooth/hci_bcm.c
index cb7fe837f7d9..c3291a4ab2e8 100644
--- a/drivers/bluetooth/hci_bcm.c
+++ b/drivers/bluetooth/hci_bcm.c
@@ -426,7 +426,7 @@ static int bcm_acpi_probe(struct bcm_device *dev)
 
 	dev->clk = devm_clk_get(&pdev->dev, NULL);
 
-	gpio = devm_gpiod_get(&pdev->dev, "device-wakeup");
+	gpio = devm_gpiod_get(&pdev->dev, "device-wakeup", GPIOD_ASIS);
 	if (!IS_ERR(gpio)) {
 		ret = gpiod_direction_output(gpio, 0);
 		if (ret)
@@ -434,7 +434,7 @@ static int bcm_acpi_probe(struct bcm_device *dev)
 		dev->device_wakeup = gpio;
 	}
 
-	gpio = devm_gpiod_get(&pdev->dev, "shutdown");
+	gpio = devm_gpiod_get(&pdev->dev, "shutdown", GPIOD_ASIS);
 	if (!IS_ERR(gpio)) {
 		ret = gpiod_direction_output(gpio, 0);
 		if (ret)
-- 
2.5.0

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
