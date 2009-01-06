From: Alexey Korolev <akorolev@infradead.org>
Subject: Re: linux-next: Tree for January 6 (MTD)
Date: Tue, 6 Jan 2009 17:36:09 +0000 (GMT)
Message-ID: <alpine.LFD.2.00.0901061632590.4300@casper.infradead.org>
References: <20090106182311.525e4b14.sfr@canb.auug.org.au> <496386DB.8090606@oracle.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:54879 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751915AbZAFRgV (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 6 Jan 2009 12:36:21 -0500
In-Reply-To: <496386DB.8090606@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, David Woodhouse <dwmw2@infradead.org>, Vasiliy Leonenko <vasiliy.leonenko@gmail.com>

Hi Randy,

> # CONFIG_MTD_LPDDR is not set
> CONFIG_MTD_QINFO_PROBE=y
> 
> There appears to be too little control/coordination between those
> two kconfig symbols.  Surely one of them (MTD_QINFO_PROBE) should
> depend on the other (MTD_LPDDR).  And why even build 2 modules
> when MTD_QINFO_PROBE is enabled?  Why not combine the code into
> one module?
Thanks a lot for good finding. Here is a fix for the problem.

About combining: it is assumed to have one QINFO probing module for several
kinds of LPDDR command set drivers. If we combine two modules into
one it would make further extension rather hard. So it is better to have
two modules.
To fix a problem I just added dependency in Kconfig file.
This temporary fix which will work until we have just one cmdset module.
In near future we will make a fix which parse command set types
 and select proper driver according to device type.

Thanks,
Alexey

Signed-off-by: Alexey Korolev <akorolev@infradead.org>
---
diff --git a/drivers/mtd/lpddr/Kconfig b/drivers/mtd/lpddr/Kconfig
index acd4ea9..5a401d8 100644
--- a/drivers/mtd/lpddr/Kconfig
+++ b/drivers/mtd/lpddr/Kconfig
@@ -12,6 +12,7 @@ config MTD_LPDDR
 	  DDR memories, intended for battery-operated systems.
 
 config MTD_QINFO_PROBE
+	depends on MTD_LPDDR
 	tristate "Detect flash chips by QINFO probe"
 	help
 	    Device Information for LPDDR chips is offered through the Overlay
