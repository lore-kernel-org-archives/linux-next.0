From: Evgeniy Polyakov <zbr@ioremap.net>
Subject: Re: linux-next: Tree for January 19 (DST)
Date: Mon, 19 Jan 2009 21:30:47 +0300
Message-ID: <20090119183046.GA28947@ioremap.net>
References: <20090119172732.e772d8ea.sfr@canb.auug.org.au> <4974C288.7030301@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from tservice.net.ru ([195.178.208.66]:59691 "EHLO tservice.net.ru"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752243AbZASSan (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 19 Jan 2009 13:30:43 -0500
Content-Disposition: inline
In-Reply-To: <4974C288.7030301@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Greg KH <gregkh@suse.de>

Hi Randy.

On Mon, Jan 19, 2009 at 10:12:24AM -0800, Randy Dunlap (randy.dunlap@oracle.com) wrote:
> > There will be no build results for today's linux-next as our build server
> > has failed.
> > 
> > Changes since 20090116:
> 
> 
> DST build fails when CONFIG_BLOCK=n:

DST should depend on block and block device, in the original patch its
kconfig entry was in the BLK_DEV menu, so this dependency was satisfied
automatically. Should attached patch be pushed into drivers/staging?

--- ./drivers/staging/dst/Kconfig~	2009-01-14 02:10:02.000000000 +0300
+++ ./drivers/staging/dst/Kconfig	2009-01-19 21:31:19.000000000 +0300
@@ -1,6 +1,6 @@
 config DST
 	tristate "Distributed storage"
-	depends on NET && CRYPTO && SYSFS
+	depends on NET && CRYPTO && SYSFS && BLK_DEV
 	select CONNECTOR
 	---help---
 	DST is a network block device storage, which can be used to organize

-- 
	Evgeniy Polyakov
