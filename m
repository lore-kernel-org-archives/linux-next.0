From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: iseries config in linux-next coverage
Date: Fri, 2 Mar 2012 15:22:55 -0500
Message-ID: <4F512C1F.5070903@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail1.windriver.com ([147.11.146.13]:63616 "EHLO
	mail1.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756986Ab2CBUXC (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 2 Mar 2012 15:23:02 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

Hi Stephen,

Is there someone to contact for getting the iSeries coverage
removed from the kisskb builds?

http://kisskb.ellerman.id.au/kisskb/target/2569/

They don't work so well after the below commit.  :)

Thanks,
Paul.
--

commit 3d066d77cf464ea1e47808f95243301fd2175a7f
Author: Stephen Rothwell <sfr@canb.auug.org.au>
Date:   Wed Feb 22 14:10:12 2012 +0000

    powerpc: remove CONFIG_PPC_ISERIES from the architecture Kconfig files
    
    After this, we can remove the legacy iSeries code more easily.
    
    Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
    Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>

:100644 100644 c713111... 613eacf... M  arch/powerpc/Kconfig
:100644 100644 4ccb2a0... 72d55db... M  arch/powerpc/Kconfig.debug
:100644 000000 27c46d6... 0000000... D  arch/powerpc/configs/iseries_defconfig
:100644 100644 0cfb46d... 236ab67... M  arch/powerpc/platforms/Kconfig
:100644 000000 b57cda3... 0000000... D  arch/powerpc/platforms/iseries/Kconfig
:100644 100644 31f22c1... 9c28847... M  arch/powerpc/platforms/pseries/Kconfig
