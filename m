From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with the vfs-miklos
 tree
Date: Wed, 28 Sep 2016 08:25:01 +0200
Message-ID: <20160928062501.GA19141@kroah.com>
References: <20160928150022.7e87b6e3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:57447 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752104AbcI1GY4 (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Wed, 28 Sep 2016 02:24:56 -0400
Content-Disposition: inline
In-Reply-To: <20160928150022.7e87b6e3@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Miklos Szeredi <miklos@szeredi.hu>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>, Prakash Surya <surya1@llnl.gov>, "John L. Hammond" <john.hammond@intel.com>

On Wed, Sep 28, 2016 at 03:00:22PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging tree got a conflict in:
> 
>   drivers/staging/lustre/lustre/llite/file.c
> 
> between commit:
> 
>   302d50e7203e ("switch generic_file_splice_read() to use of ->read_iter()")
> 
> from the vfs-miklos tree and commits:
> 
>   5b8a39c53a16 ("staging: lustre: llite: Replace write mutex with range lock")
>   ee5532436a7d ("staging: lustre: lov: remove LL_IOC_RECREATE_{FID, OBJ}")
> 
> from the staging tree.
> 
> I fixed it up (I think - see below) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.

Looks good to me, one of these days we will get lustre out of staging to
make this easier...

thanks,

greg k-h
