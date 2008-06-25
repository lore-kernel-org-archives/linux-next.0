From: Christian Borntraeger <borntraeger@de.ibm.com>
Subject: Re: linux-next: rr tree build failure
Date: Wed, 25 Jun 2008 11:08:01 +0200
Message-ID: <200806251108.01627.borntraeger@de.ibm.com>
References: <20080625165825.60fdd9e9.sfr@canb.auug.org.au> <200806250935.55008.borntraeger@de.ibm.com> <200806251830.24421.rusty@rustcorp.com.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mtagate2.uk.ibm.com ([195.212.29.135]:19301 "EHLO
	mtagate2.uk.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754083AbYFYJIi (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 25 Jun 2008 05:08:38 -0400
Received: from d06nrmr1407.portsmouth.uk.ibm.com (d06nrmr1407.portsmouth.uk.ibm.com [9.149.38.185])
	by mtagate2.uk.ibm.com (8.13.8/8.13.8) with ESMTP id m5P98CPB029076
	for <linux-next@vger.kernel.org>; Wed, 25 Jun 2008 09:08:12 GMT
Received: from d06av02.portsmouth.uk.ibm.com (d06av02.portsmouth.uk.ibm.com [9.149.37.228])
	by d06nrmr1407.portsmouth.uk.ibm.com (8.13.8/8.13.8/NCO v9.0) with ESMTP id m5P983ZC1495146
	for <linux-next@vger.kernel.org>; Wed, 25 Jun 2008 10:08:05 +0100
Received: from d06av02.portsmouth.uk.ibm.com (loopback [127.0.0.1])
	by d06av02.portsmouth.uk.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id m5P983Mc005157
	for <linux-next@vger.kernel.org>; Wed, 25 Jun 2008 10:08:03 +0100
In-Reply-To: <200806251830.24421.rusty@rustcorp.com.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

Am Mittwoch, 25. Juni 2008 schrieb Rusty Russell:
> On Wednesday 25 June 2008 17:35:54 Christian Borntraeger wrote:
> > Am Mittwoch, 25. Juni 2008 schrieb Stephen Rothwell:
> > > Hi Rusty,
> > >
> > > Today's linux-next build (x86_64 allmodconfig (CONFIG_VIRTIO_CONSOLE=y,
> > > CONFIG_VIRTIO=m)) failed like this:
> >
> > That is interesting. VIRTIO_CONSOLE (=y) has a depends on VIRTIO(m). Seems
> > that Kconfig thinks that m is enough to fulfil a depends on.
> >
> > Rusty, what do you think about the following fixup patch? (please fold it
> > into the other one):
> 
> Hmm, prefer either tristate "Virtio console" or "depends on VIRTIO = y". 
> select has issues in that it ignores dependencies.

OK.

---
 drivers/char/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: linux-2.6/drivers/char/Kconfig
===================================================================
--- linux-2.6.orig/drivers/char/Kconfig
+++ linux-2.6/drivers/char/Kconfig
@@ -634,7 +634,7 @@ config HVC_XEN
 	  Xen virtual console device driver
 
 config VIRTIO_CONSOLE
-	bool "Virtio console"
+	tristate "Virtio console"
 	depends on VIRTIO
 	select HVC_DRIVER
 	help
