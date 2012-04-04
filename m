From: Stephen Warren <swarren@wwwdotorg.org>
Subject: [PATCH] pinctrl: fix build when CONFIG_OF && !CONFIG_PINCTRL
Date: Tue,  3 Apr 2012 21:53:56 -0600
Message-ID: <1333511636-9987-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org
Cc: sfr@canb.auug.org.au, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Stephen Warren <swarren@nvidia.com>
List-Id: linux-next.vger.kernel.org

From: Stephen Warren <swarren@nvidia.com>

pinctrl/devicetree.c won't compile when !CONFIG_PINCTRL, since the
pinctrl headers don't declare some types when !PINCTRL. Make sure
pinctrl/Makefile only attempts to compile devicetree.c when OF &&
PINCTRL.

Signed-off-by: Stephen Warren <swarren@nvidia.com>
---
 drivers/pinctrl/Makefile |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index 049c9fb..8e3c95a 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -5,7 +5,9 @@ ccflags-$(CONFIG_DEBUG_PINCTRL)	+= -DDEBUG
 obj-$(CONFIG_PINCTRL)		+= core.o
 obj-$(CONFIG_PINMUX)		+= pinmux.o
 obj-$(CONFIG_PINCONF)		+= pinconf.o
-obj-$(CONFIG_OF)		+= devicetree.o
+ifeq ($(CONFIG_OF),y)
+obj-$(CONFIG_PINCTRL)		+= devicetree.o
+endif
 obj-$(CONFIG_GENERIC_PINCONF)	+= pinconf-generic.o
 obj-$(CONFIG_PINCTRL_PXA3xx)	+= pinctrl-pxa3xx.o
 obj-$(CONFIG_PINCTRL_MMP2)	+= pinctrl-mmp2.o
-- 
1.7.5.4
