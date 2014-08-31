From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: : drop kirkwood from nightly build coverage.
Date: Sat, 30 Aug 2014 23:58:43 -0400
Message-ID: <20140831035843.GA26632@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.windriver.com ([147.11.1.11]:62358 "EHLO
	mail.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750738AbaHaD6k (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 30 Aug 2014 23:58:40 -0400
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org

Hi Stephen,

When you restart build coverage after vacation, the kirkwood should be
dropped.  Log summary here:

http://kisskb.ellerman.id.au/kisskb/target/8110/

shows failures since July because it was removed from mainline.

commit ee39028df14ca3220c8af08a5230a0a910900b41
Author: Andrew Lunn <andrew@lunn.ch>
Date:   Thu Jul 10 23:36:22 2014 +0200

    ARM: Kirkwood: Remove kirkwood_defconfig
    
    This is no longer needed now that kirkwood lives inside mach-mvebu.
    
    Signed-off-by: Andrew Lunn <andrew@lunn.ch>
    Link: https://lkml.kernel.org/r/1405028192-9623-3-git-send-email-andrew@lunn.ch
    Signed-off-by: Jason Cooper <jason@lakedaemon.net>

:100644 000000 b9e480c... 0000000... D  arch/arm/configs/kirkwood_defconfig

Thanks,
Paul.
