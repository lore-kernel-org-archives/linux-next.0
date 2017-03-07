From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the staging tree
Date: Tue, 7 Mar 2017 12:25:42 +1100
Message-ID: <20170307122542.49126980@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:53811 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751574AbdCGBs6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 6 Mar 2017 20:48:58 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alan Cox <alan@linux.intel.com>

Hi Greg,

After merging the staging tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/staging/media/atomisp/i2c/mt9m114.c:38:41: fatal error: linux/atomisp_gmin_platform.h: No such file or directory
drivers/staging/media/atomisp/i2c/gc2235.c:32:41: fatal error: linux/atomisp_gmin_platform.h: No such file or directory
drivers/staging/media/atomisp/i2c/ov2722.c:32:41: fatal error: linux/atomisp_gmin_platform.h: No such file or directory
drivers/staging/media/atomisp/platform/clock/vlv2_plat_clock.c:25:35: fatal error: linux/vlv2_plat_clock.h: No such file or directory
drivers/staging/media/atomisp/platform/intel-mid/intel_mid_pcihelpers.c:28:38: fatal error: asm/intel_mid_pcihelpers.h: No such file or directory
drivers/staging/media/atomisp/platform/intel-mid/atomisp_gmin_platform.c:10:35: fatal error: linux/vlv2_plat_clock.h: No such file or directory
In file included from drivers/staging/media/atomisp/pci/atomisp2/./atomisp_drvfs.c:26:0:
drivers/staging/media/atomisp/pci/atomisp2/./atomisp_compat.h:27:27: fatal error: linux/atomisp.h: No such file or directory

Caused by commit

  a49d25364dfb ("staging/atomisp: Add support for the Intel IPU v2")

or maybe some of the followups?

I have used the staging tree from next-20170306 for today.

-- 
Cheers,
Stephen Rothwell
