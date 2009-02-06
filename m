From: James Morris <jmorris@namei.org>
Subject: Re: linux-next: manual merge of the security-testing tree with Linus'
 tree
Date: Fri, 6 Feb 2009 19:12:09 +1100 (EST)
Message-ID: <alpine.LRH.1.10.0902061911370.16725@tundra.namei.org>
References: <20090206182337.6673aabc.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from tundra.namei.org ([65.99.196.166]:1581 "EHLO tundra.namei.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752553AbZBFIMZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 6 Feb 2009 03:12:25 -0500
In-Reply-To: <20090206182337.6673aabc.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Al Viro <viro@zeniv.linux.org.uk>, Mimi Zohar <zohar@linux.vnet.ibm.com>

On Fri, 6 Feb 2009, Stephen Rothwell wrote:

> Hi James,
> 
> Today's linux-next merge of the security-testing tree got a conflict in
> fs/namei.c between commit cb23beb55100171646e69e248fb45f10db6e99a4 ("kill
> vfs_permission") from Linus' tree and commit
> 6146f0d5e47ca4047ffded0fb79b6c25359b386c ("integrity: IMA hooks") from
> the security-testing tree.
> 
> Just a context change.  I fixed it up (see below) and can carry the fix
> for a while.

It was already fixed in my tree earlier today.

> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> http://www.canb.auug.org.au/~sfr/
> 
> diff --cc fs/namei.c
> index bbc15c2,734f2b5..0000000
> --- a/fs/namei.c
> +++ b/fs/namei.c
> @@@ -848,8 -860,9 +849,10 @@@ static int __link_path_walk(const char 
>   		nd->flags |= LOOKUP_CONTINUE;
>   		err = exec_permission_lite(inode);
>   		if (err == -EAGAIN)
>  -			err = vfs_permission(nd, MAY_EXEC);
>  +			err = inode_permission(nd->path.dentry->d_inode,
>  +					       MAY_EXEC);
> + 		if (!err)
> + 			err = ima_path_check(&nd->path, MAY_EXEC);
>    		if (err)
>   			break;
>   
> @@@ -1506,9 -1525,14 +1509,14 @@@ int may_open(struct path *path, int acc
>   		flag &= ~O_TRUNC;
>   	}
>   
>  -	error = vfs_permission(nd, acc_mode);
>  +	error = inode_permission(inode, acc_mode);
>   	if (error)
>   		return error;
> + 
> + 	error = ima_path_check(&nd->path,
> + 			       acc_mode & (MAY_READ | MAY_WRITE | MAY_EXEC));
> + 	if (error)
> + 		return error;
>   	/*
>   	 * An append-only file must be opened in append mode for writing.
>   	 */
> --
> To unsubscribe from this list: send the line "unsubscribe linux-next" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

-- 
James Morris
<jmorris@namei.org>
