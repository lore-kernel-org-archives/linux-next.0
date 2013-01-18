From: Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH v2] gpio: devm_gpio_* support should not depend on GPIOLIB
Date: Fri, 18 Jan 2013 15:57:46 +0800
Message-ID: <1358495866-9329-1-git-send-email-shawn.guo@linaro.org>
References: <20130118140346.3f9b182aa7daa175b4f136bf@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-next-owner@vger.kernel.org>
Received: from am1ehsobe005.messaging.microsoft.com ([213.199.154.208]:21125
	"EHLO am1outboundpool.messaging.microsoft.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750755Ab3ARH5k (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Fri, 18 Jan 2013 02:57:40 -0500
In-Reply-To: <20130118140346.3f9b182aa7daa175b4f136bf@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>

Some architectures (e.g. blackfin) provide gpio API without requiring
GPIOLIB support (ARCH_WANT_OPTIONAL_GPIOLIB).  devm_gpio_* functions
should also work for these architectures, since they do not really
depend on GPIOLIB.

Add a new option GPIO_DEVRES (enabled by default) to control the build
of devres.c.  It also removes the empty version of devm_gpio_*
functions for !GENERIC_GPIO build from linux/gpio.h, and moves the
function declarations from asm-generic/gpio.h into linux/gpio.h.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 drivers/gpio/Kconfig       |    3 +++
 drivers/gpio/Makefile      |    3 ++-
 include/asm-generic/gpio.h |    6 ------
 include/linux/gpio.h       |   28 ++++++++--------------------
 4 files changed, 13 insertions(+), 27 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 682de75..d972932 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -30,6 +30,9 @@ config ARCH_REQUIRE_GPIOLIB
 	  Selecting this from the architecture code will cause the gpiolib
 	  code to always get built in.
 
+config GPIO_DEVRES
+	def_bool y
+	depends on HAS_IOMEM
 
 
 menuconfig GPIOLIB
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index c5aebd0..36ca605 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -2,7 +2,8 @@
 
 ccflags-$(CONFIG_DEBUG_GPIO)	+= -DDEBUG
 
-obj-$(CONFIG_GPIOLIB)		+= gpiolib.o devres.o
+obj-$(CONFIG_GPIO_DEVRES)	+= devres.o
+obj-$(CONFIG_GPIOLIB)		+= gpiolib.o
 obj-$(CONFIG_OF_GPIO)		+= gpiolib-of.o
 obj-$(CONFIG_GPIO_ACPI)		+= gpiolib-acpi.o
 
diff --git a/include/asm-generic/gpio.h b/include/asm-generic/gpio.h
index 2341014..45b8916 100644
--- a/include/asm-generic/gpio.h
+++ b/include/asm-generic/gpio.h
@@ -192,12 +192,6 @@ extern int gpio_request_one(unsigned gpio, unsigned long flags, const char *labe
 extern int gpio_request_array(const struct gpio *array, size_t num);
 extern void gpio_free_array(const struct gpio *array, size_t num);
 
-/* bindings for managed devices that want to request gpios */
-int devm_gpio_request(struct device *dev, unsigned gpio, const char *label);
-int devm_gpio_request_one(struct device *dev, unsigned gpio,
-			  unsigned long flags, const char *label);
-void devm_gpio_free(struct device *dev, unsigned int gpio);
-
 #ifdef CONFIG_GPIO_SYSFS
 
 /*
diff --git a/include/linux/gpio.h b/include/linux/gpio.h
index bfe6656..f6c7ae3 100644
--- a/include/linux/gpio.h
+++ b/include/linux/gpio.h
@@ -94,24 +94,12 @@ static inline int gpio_request(unsigned gpio, const char *label)
 	return -ENOSYS;
 }
 
-static inline int devm_gpio_request(struct device *dev, unsigned gpio,
-				    const char *label)
-{
-	return -ENOSYS;
-}
-
 static inline int gpio_request_one(unsigned gpio,
 					unsigned long flags, const char *label)
 {
 	return -ENOSYS;
 }
 
-static inline int devm_gpio_request_one(struct device *dev, unsigned gpio,
-					unsigned long flags, const char *label)
-{
-	return -ENOSYS;
-}
-
 static inline int gpio_request_array(const struct gpio *array, size_t num)
 {
 	return -ENOSYS;
@@ -125,14 +113,6 @@ static inline void gpio_free(unsigned gpio)
 	WARN_ON(1);
 }
 
-static inline void devm_gpio_free(struct device *dev, unsigned gpio)
-{
-	might_sleep();
-
-	/* GPIO can never have been requested */
-	WARN_ON(1);
-}
-
 static inline void gpio_free_array(const struct gpio *array, size_t num)
 {
 	might_sleep();
@@ -248,4 +228,12 @@ gpiochip_remove_pin_ranges(struct gpio_chip *chip)
 
 #endif /* ! CONFIG_GENERIC_GPIO */
 
+struct device;
+
+/* bindings for managed devices that want to request gpios */
+int devm_gpio_request(struct device *dev, unsigned gpio, const char *label);
+int devm_gpio_request_one(struct device *dev, unsigned gpio,
+			  unsigned long flags, const char *label);
+void devm_gpio_free(struct device *dev, unsigned int gpio);
+
 #endif /* __LINUX_GPIO_H */
-- 
1.7.9.5
