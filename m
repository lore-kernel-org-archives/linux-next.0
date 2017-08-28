From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the scsi tree with the staging tree
Date: Mon, 28 Aug 2017 08:49:21 +0200
Message-ID: <20170828064921.GA24696@kroah.com>
References: <20170828164127.15902025@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:49513 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1750837AbdH1GtR (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 28 Aug 2017 02:49:17 -0400
Content-Disposition: inline
In-Reply-To: <20170828164127.15902025@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Hannes Reinecke <hare@suse.de>, "Martin K. Petersen" <martin.petersen@oracle.com>, Sameer Wadgaonkar <sameer.wadgaonkar@unisys.com>

On Mon, Aug 28, 2017 at 04:41:27PM +1000, Stephen Rothwell wrote:
> Hi James,
> 
> Today's linux-next merge of the scsi tree got a conflict in:
> 
>   drivers/staging/unisys/visorhba/visorhba_main.c
> 
> between commits:
> 
>   781facd05eb9 ("staging: unisys: visorhba: visorhba_main.c: fixed comment formatting issues")
> 
> from the staging tree and commit:
> 
>   7bc4e528d9f6 ("scsi: visorhba: sanitze private device data allocation")
> 
> from the scsi tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Ick, messy merge, thanks for doing this.

greg k-h
