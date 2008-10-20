From: Dave Chinner <david@fromorbit.com>
Subject: Re: linux-next: vfs tree build failure
Date: Mon, 20 Oct 2008 18:13:38 +1100
Message-ID: <20081020071338.GQ31761@disturbed>
References: <20081020171830.9ece287f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ipmail05.adl2.internode.on.net ([203.16.214.145]:4484 "EHLO
	ipmail05.adl2.internode.on.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750911AbYJTHNn (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 20 Oct 2008 03:13:43 -0400
Content-Disposition: inline
In-Reply-To: <20081020171830.9ece287f.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Al Viro <viro@ZenIV.linux.org.uk>, linux-next@vger.kernel.org, Christoph Hellwig <hch@infradead.org>, Lachlan McIlroy <lachlan@sgi.com>

On Mon, Oct 20, 2008 at 05:18:30PM +1100, Stephen Rothwell wrote:
> Hi Al,
> 
> Today's linux-next build (powerpc ppc64_defconfig) failed like this:
> 
> fs/xfs/linux-2.6/xfs_export.c: In function 'xfs_fs_get_parent':
> fs/xfs/linux-2.6/xfs_export.c:201: error: incompatible type for argument 1 of 'd_obtain_alias'
.....
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  fs/xfs/linux-2.6/xfs_export.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/fs/xfs/linux-2.6/xfs_export.c b/fs/xfs/linux-2.6/xfs_export.c
> index 263027f..dd71e86 100644
> --- a/fs/xfs/linux-2.6/xfs_export.c
> +++ b/fs/xfs/linux-2.6/xfs_export.c
> @@ -198,7 +198,7 @@ xfs_fs_get_parent(
>  	if (unlikely(error))
>  		return ERR_PTR(-error);
>  
> -	return d_obtain_alias(cip->i_vnode);
> +	return d_obtain_alias(&cip->i_vnode);
>  }

Hmmmm - looks like the VFS patches aren't using the correct
accessor function like the original code did. The fix should
be:

+	return d_obtain_alias(VFS_I(cip));

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com
