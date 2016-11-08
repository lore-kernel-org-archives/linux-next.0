From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: linux-next: manual merge of the scsi tree with the block tree
Date: Tue, 08 Nov 2016 08:17:58 -0800
Message-ID: <1478621878.2824.6.camel@HansenPartnership.com>
References: <20161108164804.0aef27e8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bedivere.hansenpartnership.com ([66.63.167.143]:53076 "EHLO
        bedivere.hansenpartnership.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752039AbcKHQSB (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 8 Nov 2016 11:18:01 -0500
In-Reply-To: <20161108164804.0aef27e8@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Jens Axboe <axboe@kernel.dk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Gilad Broner <gbroner@codeaurora.org>, "Martin K. Petersen" <martin.petersen@oracle.com>, Subhash Jadavani <subhashj@codeaurora.org>

On Tue, 2016-11-08 at 16:48 +1100, Stephen Rothwell wrote:
> Hi James,
> 
> Today's linux-next merge of the scsi tree got a conflict in:
> 
>   drivers/scsi/ufs/ufshcd.c
> 
> between commit:
> 
>   e806402130c9 ("block: split out request-only flags into a new
> namespace")
> 
> from the block tree and commit:
> 
>   2266d5678ad1 ("scsi: ufs: fix sense buffer size to 18 bytes")
> 
> from the scsi tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your 
> tree is submitted for merging.  You may also want to consider 
> cooperating with the maintainer of the conflicting tree to minimise 
> any particularly complex conflicts.

Thanks for doing this.  I think this is exactly the type of easily
resolvable conflict Linus likes to fix himself, so keeping the trees
separate seems the best options.

Regards,

James
