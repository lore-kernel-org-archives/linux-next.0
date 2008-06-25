From: Christian Borntraeger <borntraeger@de.ibm.com>
Subject: Re: linux-next: rr tree build failure
Date: Wed, 25 Jun 2008 09:35:54 +0200
Message-ID: <200806250935.55008.borntraeger@de.ibm.com>
References: <20080625165825.60fdd9e9.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mtagate5.de.ibm.com ([195.212.29.154]:15043 "EHLO
	mtagate5.de.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752612AbYFYHgz (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 25 Jun 2008 03:36:55 -0400
Received: from d12nrmr1607.megacenter.de.ibm.com (d12nrmr1607.megacenter.de.ibm.com [9.149.167.49])
	by mtagate5.de.ibm.com (8.13.8/8.13.8) with ESMTP id m5P7Zu6R216436
	for <linux-next@vger.kernel.org>; Wed, 25 Jun 2008 07:35:56 GMT
Received: from d12av04.megacenter.de.ibm.com (d12av04.megacenter.de.ibm.com [9.149.165.229])
	by d12nrmr1607.megacenter.de.ibm.com (8.13.8/8.13.8/NCO v9.0) with ESMTP id m5P7ZuV62928866
	for <linux-next@vger.kernel.org>; Wed, 25 Jun 2008 09:35:56 +0200
Received: from d12av04.megacenter.de.ibm.com (loopback [127.0.0.1])
	by d12av04.megacenter.de.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id m5P7Ztdf020518
	for <linux-next@vger.kernel.org>; Wed, 25 Jun 2008 09:35:56 +0200
In-Reply-To: <20080625165825.60fdd9e9.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Rusty Russell <rusty@rustcorp.com.au>, linux-next@vger.kernel.org

Am Mittwoch, 25. Juni 2008 schrieb Stephen Rothwell:
> Hi Rusty,
> 
> Today's linux-next build (x86_64 allmodconfig (CONFIG_VIRTIO_CONSOLE=y,
> CONFIG_VIRTIO=m)) failed like this:

That is interesting. VIRTIO_CONSOLE (=y) has a depends on VIRTIO(m). Seems 
that Kconfig thinks that m is enough to fulfil a depends on.

Rusty, what do you think about the following fixup patch? (please fold it into 
the other one):

---
 drivers/char/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: linux-2.6/drivers/char/Kconfig
===================================================================
--- linux-2.6.orig/drivers/char/Kconfig
+++ linux-2.6/drivers/char/Kconfig
@@ -635,7 +635,7 @@ config HVC_XEN
 
 config VIRTIO_CONSOLE
 	bool "Virtio console"
-	depends on VIRTIO
+	select VIRTIO
 	select HVC_DRIVER
 	help
 	  Virtio console for use with lguest and other hypervisors.
