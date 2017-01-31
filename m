From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the v4l-dvb tree
Date: Tue, 31 Jan 2017 11:55:05 +1100
Message-ID: <20170131115505.3f8c769b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:45323 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754619AbdAaA4n (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 30 Jan 2017 19:56:43 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mauro Carvalho Chehab <mchehab@osg.samsung.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sean Young <sean@mess.org>

Hi Mauro,

After merging the v4l-dvb tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

In file included from arch/arm/mach-omap2/pdata-quirks.c:15:0:
arch/arm/mach-omap2/pdata-quirks.c:536:49: error: 'rx51_lirc_data' undeclared here (not in a function)
  OF_DEV_AUXDATA("nokia,n900-ir", 0, "n900-ir", &rx51_lirc_data),
                                                 ^
include/linux/of_platform.h:52:21: note: in definition of macro 'OF_DEV_AUXDATA'
    .platform_data = _pdata }
                     ^

Caused by commit

  a92def1becf3 ("[media] ir-rx51: port to rc-core")

I have used the v4l-dvb tree from next-20170130 for today.

-- 
Cheers,
Stephen Rothwell
