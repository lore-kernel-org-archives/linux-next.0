From: Peter =?iso-8859-15?q?H=FCwe?= <PeterHuewe@gmx.de>
Subject: Re: [PATCH] tpm/tpm_tis: Add missing ifdef CONFIG_ACPI for pnp_acpi_device
Date: Wed, 21 Jan 2015 23:40:04 +0100
Message-ID: <201501212340.05536.PeterHuewe@gmx.de>
References: <1421872815-16644-1-git-send-email-peterhuewe@gmx.de> <20150122082350.121301eb@canb.auug.org.au> <20150122083432.2adaaee2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.17.21]:61082 "EHLO mout.gmx.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751816AbbAUWiE (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 21 Jan 2015 17:38:04 -0500
In-Reply-To: <20150122083432.2adaaee2@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next <linux-next@vger.kernel.org>, tpmdd-devel@lists.sourceforge.net, Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, Jim Davis <jim.epost@gmail.com>

Am Mittwoch, 21. Januar 2015, 22:34:32 schrieb Stephen Rothwell:
> Hi Peter,
> 
> On Thu, 22 Jan 2015 08:23:50 +1100 Stephen Rothwell <sfr@canb.auug.org.au> 
wrote:
> > To save on the ifdef, why not
> > 
> > 	struct acpi_device *acpi;
> > 	
> > 	.
> > 	.
> > 	
> > 	acpi = pnp_acpi_device(dev);
> > 	if (acpi)
> > 	
> > 		acpi_dev_handle = acpi->handle;
> 
> I guess struct acpi_device may not be visible when CONFIG_ACPI is not
> set? That would be a pain :-(

Yeah seems like it :(
I also thought about this way but then decided against it for the obvious 
reason.

Stephen, do you pull this patch in directly or shall it go via my tpmdd-tree -
> james -> -next ?

> As an aside, the dummy pnp_acpi_device() should be returning NULL not
> 0, and could be a static inline function (as could several other things
> in that header.
Yeah, probably.
(although this function is only in exactly two places within the kernel... so 
not much is gained here:)
Maybe I'll post a patch or maybe we can get rid of this whole thing 
altogether.
Let me think about it.



Peter
