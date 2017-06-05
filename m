From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warnings after merge of the uuid tree
Date: Mon, 5 Jun 2017 16:09:28 +1000
Message-ID: <20170605160928.2930133d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:46429 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751278AbdFEGJc (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 5 Jun 2017 02:09:32 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Hi Christoph,

After merging the uuid tree, today's linux-next build (arm
multi_v7_defconfig and x86_64 allmodconfig) produced these warnings:

In file included from drivers/usb/dwc2/core.h:45:0,
                 from drivers/usb/dwc2/core_intr.c:53:
drivers/usb/dwc2/hw.h:230:0: warning: "GUID" redefined
 #define GUID    HSOTG_REG(0x003c)
 ^
In file included from include/linux/uuid.h:19:0,
                 from include/linux/fs.h:33,
                 from include/linux/seq_file.h:10,
                 from include/linux/pinctrl/consumer.h:17,
                 from include/linux/pinctrl/devinfo.h:21,
                 from include/linux/device.h:24,
                 from include/linux/dma-mapping.h:6,
                 from drivers/usb/dwc2/core_intr.c:45:
include/uapi/linux/uuid.h:27:0: note: this is the location of the previous definition
 #define GUID(a, b, c, d0, d1, d2, d3, d4, d5, d6, d7)   \
 ^
In file included from drivers/usb/dwc2/core.h:45:0,
                 from drivers/usb/dwc2/core.c:56:
drivers/usb/dwc2/hw.h:230:0: warning: "GUID" redefined
 #define GUID    HSOTG_REG(0x003c)
 ^
In file included from include/linux/uuid.h:19:0,
                 from include/linux/fs.h:33,
                 from include/linux/seq_file.h:10,
                 from include/linux/pinctrl/consumer.h:17,
                 from include/linux/pinctrl/devinfo.h:21,
                 from include/linux/device.h:24,
                 from include/linux/dma-mapping.h:6,
                 from drivers/usb/dwc2/core.c:47:
include/uapi/linux/uuid.h:27:0: note: this is the location of the previous definition
 #define GUID(a, b, c, d0, d1, d2, d3, d4, d5, d6, d7)   \
 ^
In file included from drivers/usb/dwc2/core.h:45:0,
                 from drivers/usb/dwc2/platform.c:52:
drivers/usb/dwc2/hw.h:230:0: warning: "GUID" redefined
 #define GUID    HSOTG_REG(0x003c)
 ^
In file included from include/linux/uuid.h:19:0,
                 from include/linux/fs.h:33,
                 from include/linux/seq_file.h:10,
                 from include/linux/pinctrl/consumer.h:17,
                 from include/linux/pinctrl/devinfo.h:21,
                 from include/linux/device.h:24,
                 from drivers/usb/dwc2/platform.c:41:
include/uapi/linux/uuid.h:27:0: note: this is the location of the previous definition
 #define GUID(a, b, c, d0, d1, d2, d3, d4, d5, d6, d7)   \
 ^
In file included from drivers/usb/dwc2/core.h:45:0,
                 from drivers/usb/dwc2/params.c:39:
drivers/usb/dwc2/hw.h:230:0: warning: "GUID" redefined
 #define GUID    HSOTG_REG(0x003c)
 ^
In file included from include/linux/uuid.h:19:0,
                 from include/linux/fs.h:33,
                 from include/linux/seq_file.h:10,
                 from include/linux/pinctrl/consumer.h:17,
                 from include/linux/pinctrl/devinfo.h:21,
                 from include/linux/device.h:24,
                 from include/linux/node.h:17,
                 from include/linux/cpu.h:16,
                 from include/linux/of_device.h:4,
                 from drivers/usb/dwc2/params.c:37:
include/uapi/linux/uuid.h:27:0: note: this is the location of the previous definition
 #define GUID(a, b, c, d0, d1, d2, d3, d4, d5, d6, d7)   \
 ^
In file included from drivers/usb/dwc2/core.h:45:0,
                 from drivers/usb/dwc2/hcd.c:55:
drivers/usb/dwc2/hw.h:230:0: warning: "GUID" redefined
 #define GUID    HSOTG_REG(0x003c)
 ^
In file included from include/linux/uuid.h:19:0,
                 from include/linux/fs.h:33,
                 from include/linux/seq_file.h:10,
                 from include/linux/pinctrl/consumer.h:17,
                 from include/linux/pinctrl/devinfo.h:21,
                 from include/linux/device.h:24,
                 from include/linux/platform_device.h:14,
                 from drivers/usb/dwc2/hcd.c:45:
include/uapi/linux/uuid.h:27:0: note: this is the location of the previous definition
 #define GUID(a, b, c, d0, d1, d2, d3, d4, d5, d6, d7)   \
 ^
In file included from drivers/usb/dwc2/core.h:45:0,
                 from drivers/usb/dwc2/hcd_intr.c:52:
drivers/usb/dwc2/hw.h:230:0: warning: "GUID" redefined
 #define GUID    HSOTG_REG(0x003c)
 ^
In file included from include/linux/uuid.h:19:0,
                 from include/linux/fs.h:33,
                 from include/linux/seq_file.h:10,
                 from include/linux/pinctrl/consumer.h:17,
                 from include/linux/pinctrl/devinfo.h:21,
                 from include/linux/device.h:24,
                 from include/linux/dma-mapping.h:6,
                 from drivers/usb/dwc2/hcd_intr.c:44:
include/uapi/linux/uuid.h:27:0: note: this is the location of the previous definition
 #define GUID(a, b, c, d0, d1, d2, d3, d4, d5, d6, d7)   \
 ^
In file included from drivers/usb/dwc2/core.h:45:0,
                 from drivers/usb/dwc2/hcd_queue.c:54:
drivers/usb/dwc2/hw.h:230:0: warning: "GUID" redefined
 #define GUID    HSOTG_REG(0x003c)
 ^
In file included from include/linux/uuid.h:19:0,
                 from include/linux/fs.h:33,
                 from include/linux/seq_file.h:10,
                 from include/linux/pinctrl/consumer.h:17,
                 from include/linux/pinctrl/devinfo.h:21,
                 from include/linux/device.h:24,
                 from include/linux/dma-mapping.h:6,
                 from drivers/usb/dwc2/hcd_queue.c:46:
include/uapi/linux/uuid.h:27:0: note: this is the location of the previous definition
 #define GUID(a, b, c, d0, d1, d2, d3, d4, d5, d6, d7)   \
 ^
In file included from drivers/usb/dwc2/core.h:45:0,
                 from drivers/usb/dwc2/hcd_ddma.c:52:
drivers/usb/dwc2/hw.h:230:0: warning: "GUID" redefined
 #define GUID    HSOTG_REG(0x003c)
 ^
In file included from include/linux/uuid.h:19:0,
                 from include/linux/fs.h:33,
                 from include/linux/seq_file.h:10,
                 from include/linux/pinctrl/consumer.h:17,
                 from include/linux/pinctrl/devinfo.h:21,
                 from include/linux/device.h:24,
                 from include/linux/dma-mapping.h:6,
                 from drivers/usb/dwc2/hcd_ddma.c:44:
include/uapi/linux/uuid.h:27:0: note: this is the location of the previous definition
 #define GUID(a, b, c, d0, d1, d2, d3, d4, d5, d6, d7)   \
 ^
In file included from drivers/usb/dwc2/core.h:45:0,
                 from drivers/usb/dwc2/debugfs.c:22:
drivers/usb/dwc2/hw.h:230:0: warning: "GUID" redefined
 #define GUID    HSOTG_REG(0x003c)
 ^
In file included from include/linux/uuid.h:19:0,
                 from include/linux/fs.h:33,
                 from include/linux/debugfs.h:18,
                 from drivers/usb/dwc2/debugfs.c:18:
include/uapi/linux/uuid.h:27:0: note: this is the location of the previous definition
 #define GUID(a, b, c, d0, d1, d2, d3, d4, d5, d6, d7)   \
 ^
In file included from drivers/usb/dwc2/core.h:45:0,
                 from drivers/usb/dwc2/gadget.c:34:
drivers/usb/dwc2/hw.h:230:0: warning: "GUID" redefined
 #define GUID    HSOTG_REG(0x003c)
 ^
In file included from include/linux/uuid.h:19:0,
                 from include/linux/fs.h:33,
                 from include/linux/seq_file.h:10,
                 from include/linux/pinctrl/consumer.h:17,
                 from include/linux/pinctrl/devinfo.h:21,
                 from include/linux/device.h:24,
                 from include/linux/platform_device.h:14,
                 from drivers/usb/dwc2/gadget.c:21:
include/uapi/linux/uuid.h:27:0: note: this is the location of the previous definition
 #define GUID(a, b, c, d0, d1, d2, d3, d4, d5, d6, d7)   \
 ^

Introduced by commit

  e0a74cd0a2d4 ("uuid: rename uuid types")

GUID is used in at least 2 other files as well :-(

-- 
Cheers,
Stephen Rothwell
