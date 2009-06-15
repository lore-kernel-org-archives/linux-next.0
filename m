From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: linux-next: scsi tree build failure
Date: Mon, 15 Jun 2009 10:11:47 -0500
Message-ID: <1245078707.3858.0.camel@mulgrave.site>
References: <20090615121716.c5bc0655.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bedivere.hansenpartnership.com ([66.63.167.143]:39629 "EHLO
	bedivere.hansenpartnership.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752235AbZFOPLu (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 15 Jun 2009 11:11:50 -0400
In-Reply-To: <20090615121716.c5bc0655.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>

On Mon, 2009-06-15 at 12:17 +1000, Stephen Rothwell wrote:
> Hi James,
> 
> Today's linux-next build (powerpc ppc64_defconfig) failed like this:
> 
> drivers/scsi/ps3rom.c: In function 'ps3rom_interrupt':
> drivers/scsi/ps3rom.c:302: error: implicit declaration of function 'ps3_system_bus_get_drvdata'
> drivers/scsi/ps3rom.c:302: warning: assignment makes pointer from integer without a cast
> drivers/scsi/ps3rom.c: In function 'ps3rom_probe':
> drivers/scsi/ps3rom.c:390: error: implicit declaration of function 'ps3_system_bus_set_drvdata'
> drivers/scsi/ps3rom.c: In function 'ps3rom_remove':
> drivers/scsi/ps3rom.c:421: warning: initialization makes pointer from integer without a cast
> 
> Caused by commit 4381bd58427116cd7689831998771ddd58078af9 ("[SCSI]
> ps3rom: Use ps3_system_bus_[gs]et_drvdata() instead of direct access").
> This is number 21 in a series and depends on number 19 which is not yet
> merged.  If you instead Ack this patch, Ben will merge it through the
> powerpc tree.
> 
> For today, I have used the scsi tree from next-20090612.

OK, dumped the offending patch, so it should be safe to take scsi-misc
again.

I'm so used to merging these type of conversions, I didn't check that it
was using a ps3 specific wrapper instead of a generic device one.

James
