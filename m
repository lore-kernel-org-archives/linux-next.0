From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with Linus' tree
Date: Tue, 20 Sep 2011 05:53:28 -0700
Message-ID: <20110920125328.GA9736@kroah.com>
References: <20110920164649.b22e95cf65f4678da99a0a81@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out3.smtp.messagingengine.com ([66.111.4.27]:51171 "EHLO
	out3.smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750696Ab1ITNEP (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Tue, 20 Sep 2011 09:04:15 -0400
Content-Disposition: inline
In-Reply-To: <20110920164649.b22e95cf65f4678da99a0a81@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@xenotime.net>

On Tue, Sep 20, 2011 at 04:46:49PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging tree got a conflict in
> drivers/staging/comedi/drivers/ni_labpc.c between commit c19cc78efe92
> ("staging: fix comedi build when ISA_DMA_API is enabled but COMEDI_PCI is
> not enabled") from Linus' tree and commit d6aa8366dde1 ("staging: fix
> comedi build errors") from the staging tree.
> 
> I have used the version from Linus' tree.

Thank you, that should be correct.  I'll merge the two together when
kernel.org comes back.

greg k-h
