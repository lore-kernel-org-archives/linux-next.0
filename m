From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: linux-next: build warnings after merge of the uuid tree
Date: Mon, 05 Jun 2017 17:40:10 +0300
Message-ID: <1496673610.22624.7.camel@linux.intel.com>
References: <20170605160928.2930133d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga04.intel.com ([192.55.52.120]:43262 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751112AbdFEOkO (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 5 Jun 2017 10:40:14 -0400
In-Reply-To: <20170605160928.2930133d@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Christoph Hellwig <hch@lst.de>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Mon, 2017-06-05 at 16:09 +1000, Stephen Rothwell wrote:
> Hi Christoph,
> 
> After merging the uuid tree, today's linux-next build (arm
> multi_v7_defconfig and x86_64 allmodconfig) produced these warnings:
> 

Briefly looking to the conflict it looks like we first need to rename
register description(s) in dwc2 in the way how it's done in dwc3.

diff --git a/drivers/usb/dwc2/core.c b/drivers/usb/dwc2/core.c
index 1b6612c2cdda..82f92443f26f 100644
--- a/drivers/usb/dwc2/core.c
+++ b/drivers/usb/dwc2/core.c
@@ -636,7 +636,7 @@ void dwc2_dump_global_registers(struct dwc2_hsotg
*hsotg)
 	addr = hsotg->regs + GGPIO;
 	dev_dbg(hsotg->dev, "GGPIO	 @0x%08lX : 0x%08X\n",
 		(unsigned long)addr, dwc2_readl(addr));
-	addr = hsotg->regs + GUID;
+	addr = hsotg->regs + DWC2_GUID;
 	dev_dbg(hsotg->dev, "GUID	 @0x%08lX : 0x%08X\n",
 		(unsigned long)addr, dwc2_readl(addr));
 	addr = hsotg->regs + GSNPSID;
diff --git a/drivers/usb/dwc2/debugfs.c b/drivers/usb/dwc2/debugfs.c
index 794b959a7c8c..c51ee70904e6 100644
--- a/drivers/usb/dwc2/debugfs.c
+++ b/drivers/usb/dwc2/debugfs.c
@@ -419,7 +419,7 @@ static const struct debugfs_reg32 dwc2_regs[] = {
 	dump_register(GI2CCTL),
 	dump_register(GPVNDCTL),
 	dump_register(GGPIO),
-	dump_register(GUID),
+	dump_register(DWC2_GUID),
 	dump_register(GSNPSID),
 	dump_register(GHWCFG1),
 	dump_register(GHWCFG2),
diff --git a/drivers/usb/dwc2/hw.h b/drivers/usb/dwc2/hw.h
index 4592012c4743..ccfb6a55616b 100644
--- a/drivers/usb/dwc2/hw.h
+++ b/drivers/usb/dwc2/hw.h
@@ -227,7 +227,7 @@
 #define GGPIO				HSOTG_REG(0x0038)
 #define GGPIO_STM32_OTG_GCCFG_PWRDWN	BIT(16)
 
-#define GUID				HSOTG_REG(0x003c)
+#define DWC2_GUID			HSOTG_REG(0x003c)
 #define GSNPSID				HSOTG_REG(0x0040)
 #define GHWCFG1				HSOTG_REG(0x0044)
 

> In file included from drivers/usb/dwc2/core.h:45:0,
>                  from drivers/usb/dwc2/core_intr.c:53:
> drivers/usb/dwc2/hw.h:230:0: warning: "GUID" redefined
>  #define GUID    HSOTG_REG(0x003c)
>  ^
> In file included from include/linux/uuid.h:19:0,
>                  from include/linux/fs.h:33,
>                  from include/linux/seq_file.h:10,
>                  from include/linux/pinctrl/consumer.h:17,
>                  from include/linux/pinctrl/devinfo.h:21,
>                  from include/linux/device.h:24,
>                  from include/linux/dma-mapping.h:6,
>                  from drivers/usb/dwc2/core_intr.c:45:
> include/uapi/linux/uuid.h:27:0: note: this is the location of the
> previous definition
>  #define GUID(a, b, c, d0, d1, d2, d3, d4, d5, d6, d7)   \
>  ^
> In file included from drivers/usb/dwc2/core.h:45:0,
>                  from drivers/usb/dwc2/core.c:56:
> drivers/usb/dwc2/hw.h:230:0: warning: "GUID" redefined
>  #define GUID    HSOTG_REG(0x003c)
>  ^
> In file included from include/linux/uuid.h:19:0,
>                  from include/linux/fs.h:33,
>                  from include/linux/seq_file.h:10,
>                  from include/linux/pinctrl/consumer.h:17,
>                  from include/linux/pinctrl/devinfo.h:21,
>                  from include/linux/device.h:24,
>                  from include/linux/dma-mapping.h:6,
>                  from drivers/usb/dwc2/core.c:47:
> include/uapi/linux/uuid.h:27:0: note: this is the location of the
> previous definition
>  #define GUID(a, b, c, d0, d1, d2, d3, d4, d5, d6, d7)   \
>  ^
> In file included from drivers/usb/dwc2/core.h:45:0,
>                  from drivers/usb/dwc2/platform.c:52:
> drivers/usb/dwc2/hw.h:230:0: warning: "GUID" redefined
>  #define GUID    HSOTG_REG(0x003c)
>  ^
> In file included from include/linux/uuid.h:19:0,
>                  from include/linux/fs.h:33,
>                  from include/linux/seq_file.h:10,
>                  from include/linux/pinctrl/consumer.h:17,
>                  from include/linux/pinctrl/devinfo.h:21,
>                  from include/linux/device.h:24,
>                  from drivers/usb/dwc2/platform.c:41:
> include/uapi/linux/uuid.h:27:0: note: this is the location of the
> previous definition
>  #define GUID(a, b, c, d0, d1, d2, d3, d4, d5, d6, d7)   \
>  ^
> In file included from drivers/usb/dwc2/core.h:45:0,
>                  from drivers/usb/dwc2/params.c:39:
> drivers/usb/dwc2/hw.h:230:0: warning: "GUID" redefined
>  #define GUID    HSOTG_REG(0x003c)
>  ^
> In file included from include/linux/uuid.h:19:0,
>                  from include/linux/fs.h:33,
>                  from include/linux/seq_file.h:10,
>                  from include/linux/pinctrl/consumer.h:17,
>                  from include/linux/pinctrl/devinfo.h:21,
>                  from include/linux/device.h:24,
>                  from include/linux/node.h:17,
>                  from include/linux/cpu.h:16,
>                  from include/linux/of_device.h:4,
>                  from drivers/usb/dwc2/params.c:37:
> include/uapi/linux/uuid.h:27:0: note: this is the location of the
> previous definition
>  #define GUID(a, b, c, d0, d1, d2, d3, d4, d5, d6, d7)   \
>  ^
> In file included from drivers/usb/dwc2/core.h:45:0,
>                  from drivers/usb/dwc2/hcd.c:55:
> drivers/usb/dwc2/hw.h:230:0: warning: "GUID" redefined
>  #define GUID    HSOTG_REG(0x003c)
>  ^
> In file included from include/linux/uuid.h:19:0,
>                  from include/linux/fs.h:33,
>                  from include/linux/seq_file.h:10,
>                  from include/linux/pinctrl/consumer.h:17,
>                  from include/linux/pinctrl/devinfo.h:21,
>                  from include/linux/device.h:24,
>                  from include/linux/platform_device.h:14,
>                  from drivers/usb/dwc2/hcd.c:45:
> include/uapi/linux/uuid.h:27:0: note: this is the location of the
> previous definition
>  #define GUID(a, b, c, d0, d1, d2, d3, d4, d5, d6, d7)   \
>  ^
> In file included from drivers/usb/dwc2/core.h:45:0,
>                  from drivers/usb/dwc2/hcd_intr.c:52:
> drivers/usb/dwc2/hw.h:230:0: warning: "GUID" redefined
>  #define GUID    HSOTG_REG(0x003c)
>  ^
> In file included from include/linux/uuid.h:19:0,
>                  from include/linux/fs.h:33,
>                  from include/linux/seq_file.h:10,
>                  from include/linux/pinctrl/consumer.h:17,
>                  from include/linux/pinctrl/devinfo.h:21,
>                  from include/linux/device.h:24,
>                  from include/linux/dma-mapping.h:6,
>                  from drivers/usb/dwc2/hcd_intr.c:44:
> include/uapi/linux/uuid.h:27:0: note: this is the location of the
> previous definition
>  #define GUID(a, b, c, d0, d1, d2, d3, d4, d5, d6, d7)   \
>  ^
> In file included from drivers/usb/dwc2/core.h:45:0,
>                  from drivers/usb/dwc2/hcd_queue.c:54:
> drivers/usb/dwc2/hw.h:230:0: warning: "GUID" redefined
>  #define GUID    HSOTG_REG(0x003c)
>  ^
> In file included from include/linux/uuid.h:19:0,
>                  from include/linux/fs.h:33,
>                  from include/linux/seq_file.h:10,
>                  from include/linux/pinctrl/consumer.h:17,
>                  from include/linux/pinctrl/devinfo.h:21,
>                  from include/linux/device.h:24,
>                  from include/linux/dma-mapping.h:6,
>                  from drivers/usb/dwc2/hcd_queue.c:46:
> include/uapi/linux/uuid.h:27:0: note: this is the location of the
> previous definition
>  #define GUID(a, b, c, d0, d1, d2, d3, d4, d5, d6, d7)   \
>  ^
> In file included from drivers/usb/dwc2/core.h:45:0,
>                  from drivers/usb/dwc2/hcd_ddma.c:52:
> drivers/usb/dwc2/hw.h:230:0: warning: "GUID" redefined
>  #define GUID    HSOTG_REG(0x003c)
>  ^
> In file included from include/linux/uuid.h:19:0,
>                  from include/linux/fs.h:33,
>                  from include/linux/seq_file.h:10,
>                  from include/linux/pinctrl/consumer.h:17,
>                  from include/linux/pinctrl/devinfo.h:21,
>                  from include/linux/device.h:24,
>                  from include/linux/dma-mapping.h:6,
>                  from drivers/usb/dwc2/hcd_ddma.c:44:
> include/uapi/linux/uuid.h:27:0: note: this is the location of the
> previous definition
>  #define GUID(a, b, c, d0, d1, d2, d3, d4, d5, d6, d7)   \
>  ^
> In file included from drivers/usb/dwc2/core.h:45:0,
>                  from drivers/usb/dwc2/debugfs.c:22:
> drivers/usb/dwc2/hw.h:230:0: warning: "GUID" redefined
>  #define GUID    HSOTG_REG(0x003c)
>  ^
> In file included from include/linux/uuid.h:19:0,
>                  from include/linux/fs.h:33,
>                  from include/linux/debugfs.h:18,
>                  from drivers/usb/dwc2/debugfs.c:18:
> include/uapi/linux/uuid.h:27:0: note: this is the location of the
> previous definition
>  #define GUID(a, b, c, d0, d1, d2, d3, d4, d5, d6, d7)   \
>  ^
> In file included from drivers/usb/dwc2/core.h:45:0,
>                  from drivers/usb/dwc2/gadget.c:34:
> drivers/usb/dwc2/hw.h:230:0: warning: "GUID" redefined
>  #define GUID    HSOTG_REG(0x003c)
>  ^
> In file included from include/linux/uuid.h:19:0,
>                  from include/linux/fs.h:33,
>                  from include/linux/seq_file.h:10,
>                  from include/linux/pinctrl/consumer.h:17,
>                  from include/linux/pinctrl/devinfo.h:21,
>                  from include/linux/device.h:24,
>                  from include/linux/platform_device.h:14,
>                  from drivers/usb/dwc2/gadget.c:21:
> include/uapi/linux/uuid.h:27:0: note: this is the location of the
> previous definition
>  #define GUID(a, b, c, d0, d1, d2, d3, d4, d5, d6, d7)   \
>  ^
> 
> Introduced by commit
> 
>   e0a74cd0a2d4 ("uuid: rename uuid types")
> 
> GUID is used in at least 2 other files as well :-(
> 

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
