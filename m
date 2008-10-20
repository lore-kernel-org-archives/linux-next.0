From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the driver-core.current tree
Date: Sun, 19 Oct 2008 20:47:56 -0700
Message-ID: <20081020034756.GC26650@kroah.com>
References: <20081020114842.e6cd6f90.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:56555 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751583AbYJTDvy (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 19 Oct 2008 23:51:54 -0400
Content-Disposition: inline
In-Reply-To: <20081020114842.e6cd6f90.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

On Mon, Oct 20, 2008 at 11:48:42AM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the driver-core.current tree got a conflict
> in Documentation/sysctl/kernel.txt between commit
> 061b1bd394ca8628b7c24eb4658ba3535da4249a ("Staging: add TAINT_CRAP for
> all drivers/staging code") from Linus' tree and commit
> ac7b643ad9c570efa0b5cbc9af5581db8c2faf64 ("Document kernel taint flags
> properly") from the driver-core.current tree.

That's odd, I'll check this tomorrow when I resync my tree (it still
contains a lot of stuff that is in Linus's tree right now), I haven't
had the chance to clean it out yet.

thanks,

greg k-h
