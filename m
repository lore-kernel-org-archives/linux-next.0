From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: linux-next: bad merge of asoc-3.4
Date: Mon, 26 Mar 2012 22:19:11 -0400
Message-ID: <20120327021910.GC26825@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail1.windriver.com ([147.11.146.13]:37418 "EHLO
	mail1.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756999Ab2C0CTh (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 26 Mar 2012 22:19:37 -0400
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: arnd@arndb.de
Cc: linux-next@vger.kernel.org, broonie@opensource.wolfsonmicro.com

Hi Arnd,

Can you recheck the merge below?  I think it needs this fix,
because a bisect on this failure led to your merge.

http://kisskb.ellerman.id.au/kisskb/buildresult/5968352/

Thanks,
Paul.
---

diff --git a/arch/arm/mach-omap2/board-omap4panda.c b/arch/arm/mach-omap2/board-omap4panda.c
index 331f7cb..8bf8e99 100644
--- a/arch/arm/mach-omap2/board-omap4panda.c
+++ b/arch/arm/mach-omap2/board-omap4panda.c
@@ -114,7 +114,7 @@ static struct platform_device panda_abe_audio = {
 	.dev = {
 		.platform_data = &panda_abe_audio_data,
 	},
-}
+};
 
 static struct platform_device btwilink_device = {
 	.name	= "btwilink",

commit b9e1122c88996c20165b62e5be43cee644567ac4
Merge: 7068805 22f8d05
Author: Arnd Bergmann <arnd@arndb.de>
Date:   Sat Mar 24 11:33:59 2012 +0000

    Merge tag 'asoc-3.4' of git://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound into next/boards
    
    The asoc branch that was already merged into v3.4 contains some
    board-level changes that conflict with patches we already have
    here, so pull in that branch to resolve the conflicts.
    
    Conflicts:
        arch/arm/mach-imx/mach-imx27_visstrim_m10.c
        arch/arm/mach-omap2/board-omap4panda.c
