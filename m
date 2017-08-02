From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the fbdev tree
Date: Wed, 2 Aug 2017 11:32:11 +1000
Message-ID: <20170802113211.6797dda4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:54231 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751655AbdHBBcN (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 1 Aug 2017 21:32:13 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Daniel Vetter <daniel.vetter@ffwll.ch>, Sean Paul <seanpaul@chromium.org>

Hi Bartlomiej,

After merging the fbdev tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

drivers/video/fbdev/matrox/matroxfb_base.c:1583:12: warning: 'hotplug' defined but not used [-Wunused-variable]
 static int hotplug = 0;
            ^

Introduced by commit

  376b3ff54c9a ("fbdev: Nuke FBINFO_MODULE")

"hotplug" is only used when CONFIG_MODULE is not set, now.

-- 
Cheers,
Stephen Rothwell
