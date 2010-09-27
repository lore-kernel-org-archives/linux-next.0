From: Vipin Mehta <Vipin.Mehta@Atheros.com>
Subject: RE: linux-next: Tree for September 27 (staging: ath6kl, spectra, &
 vt6655)
Date: Mon, 27 Sep 2010 12:28:40 -0700
Message-ID: <35B17FE5076C7040809188FBE7913F983F23AFDDA6@SC1EXMB-MBCL.global.atheros.com>
References: <20100927162143.3a9c1efe.sfr@canb.auug.org.au>
 <20100927113829.2928636a.rdunlap@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.atheros.com ([12.19.149.2]:36661 "EHLO mail.atheros.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755703Ab0I0T2m convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 27 Sep 2010 15:28:42 -0400
Received: from mail.atheros.com ([10.10.20.105])
	by sidewinder.atheros.com
	for <linux-next@vger.kernel.org>; Mon, 27 Sep 2010 12:28:34 -0700
In-Reply-To: <20100927113829.2928636a.rdunlap@xenotime.net>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>, Stephen Rothwell <sfr@canb.auug.org.au>, driverdevel <devel@driverdev.osuosl.org>, "gregkh@suse.de" <gregkh@suse.de>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, "forest@alittletooquiet.net" <forest@alittletooquiet.net>, "yunpeng.gao@intel.com" <yunpeng.gao@intel.com>

> Hi all,
> 
> Changes since 20100924:


drivers/staging/ath6kl/os/linux/ar6000_drv.c:1370:1: warning: "CONFIG_AR600x_BT_RESET_PIN" redefined
./include/generated/autoconf.h:419:1: warning: this is the location of the previous definition
drivers/staging/ath6kl/os/linux/ioctl.c:4673: warning: the frame size of 2052 bytes is larger than 1024 bytes
drivers/staging/ath6kl/hif/sdio/linux_sdio/src/hif_scatter.c:288: error: 'struct mmc_host' has no member named 'max_hw_segs'
drivers/staging/ath6kl/hif/sdio/linux_sdio/src/hif_scatter.c:289: error: 'struct mmc_host' has no member named 'max_hw_segs'

The problem is because the mmc stack is out of sync in Greg's staging tree and Stephen's linux-next tree. Greg asked me to generate a patch which I did and emailed to Greg. 
