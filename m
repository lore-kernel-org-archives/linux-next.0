From: Vinod Koul <vkoul@infradead.org>
Subject: Re: [slave-dma:topic/dmaengine_dt 19/23]
 include/linux/of_dma.h:50: warning: 'of_dma_controller_register' defined
 but not used
Date: Fri, 30 Nov 2012 05:17:11 +0530
Message-ID: <1354232831.7077.73.camel@vkoul-udesk3>
References: <50b654c2.iWq7vrrJ3J/NZyR/%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:35437 "EHLO
	merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754996Ab2K3AGR (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 29 Nov 2012 19:06:17 -0500
In-Reply-To: <50b654c2.iWq7vrrJ3J/NZyR/%fengguang.wu@intel.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: fengguang.wu@intel.com
Cc: vinod.koul@intel.com, sfr <sfr@canb.auug.org.au>, Jon Hunter <jon-hunter@ti.com>, linux-next <linux-next@vger.kernel.org>

On Thu, 2012-11-29 at 02:15 +0800, kbuild test robot wrote:
> tree:   git://git.infradead.org/users/vkoul/slave-dma.git topic/dmaengine_dt
> head:   d4397a4acc3b8c9c96a0be6faa5fb0db9259e4d1
> commit: 7a74a3a0e055d28357c317947258bd005105bb10 [19/23] of: dma- fix build break for !CONFIG_OF
> config: make ARCH=avr32 atngw100_defconfig
> 
> All warnings:
> 
> include/linux/of_dma.h:50: warning: 'of_dma_controller_register' defined but not used
> include/linux/of_dma.h:55: warning: 'of_dma_controller_free' defined but not used
> include/linux/of_dma.h:66: warning: 'of_dma_simple_xlate' defined but not used
Thanks Feng, Stephan for reporting this.
I committed below fix to tree last night.

>From 858e3fc0606123b9c959988c5c3fe56e8f680bfa Mon Sep 17 00:00:00 2001
From: Vinod Koul <vinod.koul@linux.intel.com>
Date: Thu, 29 Nov 2012 12:17:22 +0530
Subject: [PATCH] dmaengine: fix !of_dma compilation warning

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Reported-by: Fengguang Wu <fengguang.wu@intel.com>
Signed-off-by: Vinod Koul <vinod.koul@linux.intel.com>
---
 include/linux/of_dma.h |    9 +++++----
 1 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/include/linux/of_dma.h b/include/linux/of_dma.h
index 84b64f8..d15073e 100644
--- a/include/linux/of_dma.h
+++ b/include/linux/of_dma.h
@@ -44,7 +44,7 @@ extern struct dma_chan
*of_dma_request_slave_channel(struct device_node *np,
 extern struct dma_chan *of_dma_simple_xlate(struct of_phandle_args
*dma_spec,
 		struct of_dma *ofdma);
 #else
-static int of_dma_controller_register(struct device_node *np,
+static inline int of_dma_controller_register(struct device_node *np,
 		struct dma_chan *(*of_dma_xlate)
 		(struct of_phandle_args *, struct of_dma *),
 		void *data)
@@ -52,17 +52,18 @@ static int of_dma_controller_register(struct
device_node *np,
 	return -ENODEV;
 }
 
-static int of_dma_controller_free(struct device_node *np)
+static inline int of_dma_controller_free(struct device_node *np)
 {
+	return -ENODEV;
 }
 
-static struct dma_chan *of_dma_request_slave_channel(struct device_node
*np,
+static inline struct dma_chan *of_dma_request_slave_channel(struct
device_node *np,
 						     char *name)
 {
 	return NULL;
 }
 
-static struct dma_chan *of_dma_simple_xlate(struct of_phandle_args
*dma_spec,
+static inline struct dma_chan *of_dma_simple_xlate(struct
of_phandle_args *dma_spec,
 		struct of_dma *ofdma)
 {
 	return NULL;
-- 
1.7.0.4


-- 
Vinod Koul
Intel Corp.
