From: Christoph Hellwig <hch@lst.de>
Subject: Re: linux-next: ubifs tree build failure
Date: Tue, 12 Aug 2008 20:24:16 +0200
Message-ID: <20080812182416.GA14420@lst.de>
References: <20080812162409.91834486.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from verein.lst.de ([213.95.11.210]:39282 "EHLO verein.lst.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750737AbYHLSY0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 12 Aug 2008 14:24:26 -0400
Content-Disposition: inline
In-Reply-To: <20080812162409.91834486.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>, linux-next@vger.kernel.org, Christoph Hellwig <hch@lst.de>

On Tue, Aug 12, 2008 at 04:24:09PM +1000, Stephen Rothwell wrote:
> For now, I have reverted the ubifs commit.  Christoph, maybe you could
> provide a better solution.

Artem, could you _please_ send ubifs patches to fsdevel for review
before putting them into -next?  Even more so for nfs exporting stuff
as it needs quite a bit of review.

> @@ -149,7 +150,7 @@ struct inode *ubifs_iget(struct super_block *sb, unsigned long inum)
>  	if (err)
>  		goto out_invalid;
>  
> -	/* Disable readahead */
> +	/* Disable read-ahead */
>  	inode->i_mapping->backing_dev_info = &c->bdi;
>  
>  	switch (inode->i_mode & S_IFMT) {
> @@ -345,7 +346,7 @@ static void ubifs_delete_inode(struct inode *inode)
>  	if (err)
>  		/*
>  		 * Worst case we have a lost orphan inode wasting space, so a
> -		 * simple error message is ok here.
> +		 * simple error message is OK here.
>  		 */

What are these comment changes doing in a patch adding export ops?

> +	switch (fh_type) {
> +	case FILEID_INO32_GEN:
> +	case FILEID_INO32_GEN_PARENT:
> +		inum = fid->i32.ino;
> +		break;
> +	default:
> +		dbg_err("unsupported file handle type %d", fh_type);
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	inode = ubifs_iget(sb, inum);
> +	if (IS_ERR(inode)) {
> +		if (PTR_ERR(inode) == -ENOENT)
> +			return ERR_PTR(-ESTALE);
> +		return ERR_CAST(inode);
> +	}
> +
> +	dent = d_alloc_anon(inode);
> +	if (!dent) {
> +		iput(inode);
> +		return ERR_PTR(-ENOMEM);
> +	}
> +	return dent;

I think you'd be better off using generic_fh_to_dentry/parent and
igoring the generation argument of the get_inode callback.  That way
the code is much smaller, and you're isolated from changes like the
d_alloc_anon to d_obtain_alias one.


> +/*
> + * Probably NFS support could be faster if other export operations were
> + * implemented, but '->fh_to_dentry()' is enough.
> + */
> +static struct export_operations ubifs_export_ops = {
> +	.fh_to_dentry = ubifs_fh_to_dentry,
> +};

No, it's not.  It seems to work with default options and when you don't
reboot the server.  You need a fh_to_parent and get_parent method, too.

> +	.fs_flags = FS_REQUIRES_DEV,

This one is wrong.

Do you have a patch in the tree somewhere to fix readdir for nfs?
Without that adding the export ops is a very bad idea.
