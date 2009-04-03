From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: vfs tree build failure
Date: Fri, 3 Apr 2009 15:44:44 +1100
Message-ID: <20090403154444.576902c0.sfr@canb.auug.org.au>
References: <20090402125206.69a0cba0.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:34276 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751590AbZDCEou (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 3 Apr 2009 00:44:50 -0400
In-Reply-To: <20090402125206.69a0cba0.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Trond Myklebust <Trond.Myklebust@netapp.com>
Cc: linux-next@vger.kernel.org, Al Viro <viro@ZenIV.linux.org.uk>

Hi Trond,

The vfs patch has now gone into Linus' tree ...

On Thu, 2 Apr 2009 12:52:06 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Today's linux-next build (powerpc ppc64_defconfig) failed like this:
> 
> fs/namei.c: In function 'vfs_remote_path_lookup':
> fs/namei.c:1192: error: implicit declaration of function 'put_fs_struct'
> 
> Caused by commit 498052bba55ecaff58db6a1436b0e25bfd75a7ff ("New
> locking/refcounting for fs_struct") (from the vfs tree) interacting with
> commit afc83ab4217a4b31cabdadd174bc3ea10b9fcb9d ("VFS: Add a VFS helper
> function vfs_remote_path_lookup()") (from the nfs tree).
> 
> I applied the patch below as a merge fixup.  Please check it.
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> http://www.canb.auug.org.au/~sfr/
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Thu, 2 Apr 2009 12:48:24 +1100
> Subject: [PATCH] vfs: merge fix for put_fs_struct/free_fs_struct change
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  fs/namei.c |    6 +++---
>  1 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/namei.c b/fs/namei.c
> index f9656be..09680d8 100644
> --- a/fs/namei.c
> +++ b/fs/namei.c
> @@ -1153,7 +1153,7 @@ int vfs_remote_path_lookup(struct dentry *dentry,
>  
>  	new_mnt_ns = create_private_mnt_ns(mnt, new_fs);
>  	if (new_mnt_ns == NULL)
> -		goto out_put_fs_struct;
> +		goto out_free_fs_struct;
>  
>  	/* Create a private copy of current->nsproxy */
>  	new_nsproxy = unshare_current_nsproxy();
> @@ -1188,8 +1188,8 @@ int vfs_remote_path_lookup(struct dentry *dentry,
>  out_put_mnt_ns:
>  	put_mnt_ns(new_mnt_ns);
>  
> -out_put_fs_struct:
> -	put_fs_struct(new_fs);
> +out_free_fs_struct:
> +	free_fs_struct(new_fs);
>  out_err:
>  	return error;
>  }
> -- 
> 1.6.2.1
> 


-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/
