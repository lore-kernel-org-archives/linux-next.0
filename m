From: Felix Blyakher <felixb@sgi.com>
Subject: Re: [PATCH] un-static xfs_read_agf
Date: Thu, 2 Jul 2009 23:45:02 -0500
Message-ID: <E17B1878-B726-4CB6-B80A-9E454158750E@sgi.com>
References: <20090703100551.e3f21aa0.sfr@canb.auug.org.au> <4A4D6E7F.4060204@sandeen.net>
Mime-Version: 1.0 (Apple Message framework v930.3)
Content-Type: text/plain; charset=US-ASCII; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from relay1.sgi.com ([192.48.179.29]:51771 "EHLO relay.sgi.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751477AbZGCEpE (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 3 Jul 2009 00:45:04 -0400
In-Reply-To: <4A4D6E7F.4060204@sandeen.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Eric Sandeen <sandeen@sandeen.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, David Chinner <david@fromorbit.com>, xfs-masters@oss.sgi.com, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>


On Jul 2, 2009, at 9:35 PM, Eric Sandeen wrote:

> CONFIG_XFS_DEBUG builds still need xfs_read_agf to be
> non-static, oops.
>
> Signed-off-by: Eric Sandeen <sandeen@sandeen.net>

Reviewed-by: Felix Blyakher <felixb@sgi.com>

>
> ---
>
> Index: linux-2.6/fs/xfs/xfs_ag.h
> ===================================================================
> --- linux-2.6.orig/fs/xfs/xfs_ag.h
> +++ linux-2.6/fs/xfs/xfs_ag.h
> @@ -91,6 +91,9 @@ typedef struct xfs_agf {
> #define	XFS_AGF_BLOCK(mp)	XFS_HDR_BLOCK(mp, XFS_AGF_DADDR(mp))
> #define	XFS_BUF_TO_AGF(bp)	((xfs_agf_t *)XFS_BUF_PTR(bp))
>
> +extern int xfs_read_agf(struct xfs_mount *mp, struct xfs_trans *tp,
> +			xfs_agnumber_t agno, int flags, struct xfs_buf **bpp);
> +
> /*
>  * Size of the unlinked inode hash table in the agi.
>  */
> Index: linux-2.6/fs/xfs/xfs_alloc.c
> ===================================================================
> --- linux-2.6.orig/fs/xfs/xfs_alloc.c
> +++ linux-2.6/fs/xfs/xfs_alloc.c
> @@ -2248,7 +2248,7 @@ xfs_alloc_put_freelist(
> /*
>  * Read in the allocation group header (free/alloc section).
>  */
> -STATIC int				/* error */
> +int					/* error */
> xfs_read_agf(
> 	struct xfs_mount	*mp,	/* mount point structure */
> 	struct xfs_trans	*tp,	/* transaction pointer */
>
