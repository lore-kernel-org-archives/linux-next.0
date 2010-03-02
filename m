From: Ingo Molnar <mingo@elte.hu>
Subject: [origin tree build failure] Re: [PATCH -next] scsi: RAID_ATTRS
 depends on SCSI
Date: Tue, 2 Mar 2010 12:26:03 +0100
Message-ID: <20100302112603.GA27686@elte.hu>
References: <20100219174711.5e7cc7be.sfr@canb.auug.org.au>
 <4B7EC8AE.60200@oracle.com>
 <20100221194636.ef885e5a.rdunlap@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:56432 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750885Ab0CBL0R (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 2 Mar 2010 06:26:17 -0500
Content-Disposition: inline
In-Reply-To: <20100221194636.ef885e5a.rdunlap@xenotime.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>, Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-next@vger.kernel.org, akpm <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, LKML <linux-kernel@vger.kernel.org>, scsi <linux-scsi@vger.kernel.org>, "James E.J. Bottomley" <James.Bottomley@suse.de>


* Randy Dunlap <rdunlap@xenotime.net> wrote:

> From: Randy Dunlap <randy.dunlap@oracle.com>
> 
> raid_class uses scsi interfaces, so it should depend on SCSI.
> Otherwise build errors occur when RAID_ATTRS=y and SCSI=m:
> 
> ERROR: "raid_class_release" [drivers/scsi/mpt2sas/mpt2sas.ko] undefined!
> ERROR: "raid_class_attach" [drivers/scsi/mpt2sas/mpt2sas.ko] undefined!

FYI, this build bug has been pushed upstream via the SCSI tree, without 
Randy's fix.

I have applied Randy's drivers/scsi/Kconfig fix to tip:out-of-tree and that 
solves the build bug here.

 Tested-by: Ingo Molnar <mingo@elte.hu>

Thanks,

	Ingo
