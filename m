From: Jaegeuk Kim <jaegeuk@kernel.org>
Subject: Re: linux-next: manual merge of the f2fs tree with Linus' tree
Date: Mon, 22 Feb 2016 16:24:45 -0800
Message-ID: <20160223002445.GA20047@jaegeuk.gateway>
References: <20160223100951.4b9a7b73@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:46928 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752254AbcBWAYs (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 22 Feb 2016 19:24:48 -0500
Content-Disposition: inline
In-Reply-To: <20160223100951.4b9a7b73@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>

Hi Stephen,

On Tue, Feb 23, 2016 at 10:09:51AM +1100, Stephen Rothwell wrote:
> Hi Jaegeuk,
> 
> Today's linux-next merge of the f2fs tree got conflicts in:
> 
>   fs/ext4/crypto.c
>   fs/ext4/ext4.h
>   fs/ext4/namei.c
> 
> between commits:
> 
>   28b4c263961c ("ext4 crypto: revalidate dentry after adding or removing the key")
>   ff978b09f973 ("ext4 crypto: move context consistency check to ext4_file_open()")
> 
> from Linus' tree (presumably) bug fixes in v4.5-rc5 and commit:
> 
>   e29c55a8d406 ("ext4 crypto: migrate into vfs's crypto engine")

Thank you for the report.
Let me rebase my tree on top of v4.5-rc5 to resolve this at this moment.
And, I'll scoop the ext4 patch out of my -next tree for a while until
getting any reivew from Ted.

Thanks,

> 
> from the f2fs tree.
> 
> I do not have enough information to fix this up, so I dropped the last
> commit from the f2fs tree for today.
> 
> I *assume* that this has been passed by Ted - I can;t easily tell as
> there are no Acked-by or Reviewed-by tags in the f2fs tree commit.  If
> so, perhaps you could either merge v4.5-rc5 yourself and do the
> resolutions necessary (with nice comments in the merge commit), or give
> me some hints on how to do it.
> 
> -- 
> Cheers,
> Stephen Rothwell
