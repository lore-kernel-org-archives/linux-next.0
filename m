From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next: Tree for September 27 (staging: ath6kl, spectra, &
 vt6655)
Date: Mon, 27 Sep 2010 11:38:29 -0700
Message-ID: <20100927113829.2928636a.rdunlap@xenotime.net>
References: <20100927162143.3a9c1efe.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from xenotime.net ([72.52.115.56]:56829 "HELO xenotime.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S1757124Ab0I0Sib (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 27 Sep 2010 14:38:31 -0400
Received: from chimera.site ([173.50.240.230]) by xenotime.net for <linux-next@vger.kernel.org>; Mon, 27 Sep 2010 11:38:30 -0700
In-Reply-To: <20100927162143.3a9c1efe.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, driverdevel <devel@driverdev.osuosl.org>, gregkh@suse.de
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, forest@alittletooquiet.net, yunpeng.gao@intel.com, vmehta@atheros.com

On Mon, 27 Sep 2010 16:21:43 +1000 Stephen Rothwell wrote:

> Hi all,
> 
> Changes since 20100924:


drivers/staging/ath6kl/os/linux/ar6000_drv.c:1370:1: warning: "CONFIG_AR600x_BT_RESET_PIN" redefined
./include/generated/autoconf.h:419:1: warning: this is the location of the previous definition
drivers/staging/ath6kl/os/linux/ioctl.c:4673: warning: the frame size of 2052 bytes is larger than 1024 bytes
drivers/staging/ath6kl/hif/sdio/linux_sdio/src/hif_scatter.c:288: error: 'struct mmc_host' has no member named 'max_hw_segs'
drivers/staging/ath6kl/hif/sdio/linux_sdio/src/hif_scatter.c:289: error: 'struct mmc_host' has no member named 'max_hw_segs'

drivers/staging/spectra/ffsport.c:659: error: implicit declaration of function 'blk_queue_ordered'
drivers/staging/spectra/ffsport.c:659: error: 'QUEUE_ORDERED_DRAIN_FLUSH' undeclared (first use in this function)

drivers/staging/vt6655/device_main.c:3579: warning: the frame size of 1868 bytes is larger than 1024 bytes


---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
