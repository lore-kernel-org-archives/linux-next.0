From: Tejun Heo <tj@kernel.org>
Subject: [PATCH 08/17] davinci: update gfp/slab.h includes
Date: Tue, 30 Mar 2010 02:52:36 +0900
Message-ID: <1269885165-18617-9-git-send-email-tj@kernel.org>
References: <1269885165-18617-1-git-send-email-tj@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1269885165-18617-1-git-send-email-tj@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>, Kevin Hilman <khilman@deeprootsystems.com>
List-Id: linux-next.vger.kernel.org

Implicit slab.h inclusion via percpu.h is about to go away.  Make sure
gfp.h or slab.h is included as necessary.

Signed-off-by: Tejun Heo <tj@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Kevin Hilman <khilman@deeprootsystems.com>
---
 drivers/rtc/rtc-davinci.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/rtc/rtc-davinci.c b/drivers/rtc/rtc-davinci.c
index 92a8f6c..34647fc 100644
--- a/drivers/rtc/rtc-davinci.c
+++ b/drivers/rtc/rtc-davinci.c
@@ -29,6 +29,7 @@
 #include <linux/bcd.h>
 #include <linux/platform_device.h>
 #include <linux/io.h>
+#include <linux/slab.h>
 
 /*
  * The DaVinci RTC is a simple RTC with the following
-- 
1.6.4.2
