From: "J. Bruce Fields" <bfields@fieldses.org>
Subject: Re: linux-next: manual merge of the nfsd tree with the nfs tree
Date: Tue, 10 Feb 2015 10:34:37 -0500
Message-ID: <20150210153437.GE28949@fieldses.org>
References: <20150210115549.6067ffc1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from fieldses.org ([173.255.197.46]:41463 "EHLO fieldses.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751196AbbBJPld (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 10 Feb 2015 10:41:33 -0500
Content-Disposition: inline
In-Reply-To: <20150210115549.6067ffc1@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Trond Myklebust <trond.myklebust@fys.uio.no>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tom Haynes <loghyr@primarydata.com>, Christoph Hellwig <hch@lst.de>

On Tue, Feb 10, 2015 at 11:55:49AM +1100, Stephen Rothwell wrote:
> Hi,
> 
> Today's linux-next merge of the nfsd tree got a conflict in
> include/linux/nfs4.h between commit d67ae825a59d ("pnfs/flexfiles: Add
> the FlexFile Layout Driver") from the nfs tree and commit 6cae0a4648c0
> ("nfs: add LAYOUT_TYPE_MAX enum value") from the nfsd tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Thanks!--b.

> 
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> 
> diff --cc include/linux/nfs4.h
> index de7c91ca427e,bc10d687f2ce..000000000000
> --- a/include/linux/nfs4.h
> +++ b/include/linux/nfs4.h
> @@@ -516,7 -517,7 +517,8 @@@ enum pnfs_layouttype 
>   	LAYOUT_NFSV4_1_FILES  = 1,
>   	LAYOUT_OSD2_OBJECTS = 2,
>   	LAYOUT_BLOCK_VOLUME = 3,
>  +	LAYOUT_FLEX_FILES = 4,
> + 	LAYOUT_TYPE_MAX
>   };
>   
>   /* used for both layout return and recall */
