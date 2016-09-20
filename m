From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with the vfs tree
Date: Tue, 20 Sep 2016 13:14:42 +0200
Message-ID: <20160920111442.GA17516@kroah.com>
References: <20160920150327.7f646dee@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:50588 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1754320AbcITLOh (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 20 Sep 2016 07:14:37 -0400
Content-Disposition: inline
In-Reply-To: <20160920150327.7f646dee@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Al Viro <viro@ZenIV.linux.org.uk>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Dmitry Eremin <dmitry.eremin@intel.com>, James Simmons <jsimmons@infradead.org>

On Tue, Sep 20, 2016 at 03:03:27PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging tree got a conflict in:
> 
>   drivers/staging/lustre/lustre/llite/file.c
> 
> between commit:
> 
>   47b34458fc93 ("lustre: use %pD")
> 
> from the vfs tree and commit:
> 
>   bb5c7f2630de ("staging: lustre: changelog: fix comparison between signed and unsigned")
> 
> from the staging tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc drivers/staging/lustre/lustre/llite/file.c
> index 23249b3e6cad,5d4d17f2de61..000000000000
> --- a/drivers/staging/lustre/lustre/llite/file.c
> +++ b/drivers/staging/lustre/lustre/llite/file.c
> @@@ -1141,8 -1123,8 +1123,8 @@@ ll_file_io_generic(const struct lu_env 
>   	struct cl_io	 *io;
>   	ssize_t	       result;
>   
> - 	CDEBUG(D_VFSTRACE, "file: %pD, type: %d ppos: %llu, count: %zd\n",
>  -	CDEBUG(D_VFSTRACE, "file: %s, type: %d ppos: %llu, count: %zu\n",
>  -	       file->f_path.dentry->d_name.name, iot, *ppos, count);
> ++	CDEBUG(D_VFSTRACE, "file: %pD, type: %d ppos: %llu, count: %zu\n",
>  +	       file, iot, *ppos, count);

Fixup looks good to me, thanks for doing this.

greg k-h
