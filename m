From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the drm-misc tree
Date: Tue, 22 Nov 2016 12:45:20 +1100
Message-ID: <20161122124520.43c75a49@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:40889 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754362AbcKVBpX (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 21 Nov 2016 20:45:23 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>

Hi all,

After merging the drm-misc tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

In file included from include/linux/pci.h:30:0,
                 from drivers/gpu/vga/vgaarb.c:40:
drivers/gpu/vga/vgaarb.c: In function 'vga_arb_device_init':
include/linux/device.h:1214:36: warning: 'dev' may be used uninitialized in this function [-Wmaybe-uninitialized]
 #define dev_info(dev, fmt, arg...) _dev_info(dev, fmt, ##arg)
                                    ^
drivers/gpu/vga/vgaarb.c:1410:17: note: 'dev' was declared here
  struct device *dev;
                 ^

Introduced by commit

  a75d68f62106 ("vgaarb: Use dev_printk() when possible")

-- 
Cheers,
Stephen Rothwell
