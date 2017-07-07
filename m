From: Jaegeuk Kim <jaegeuk@kernel.org>
Subject: Re: linux-next: manual merge of the f2fs tree with Linus' tree
Date: Thu, 6 Jul 2017 18:57:24 -0700
Message-ID: <20170707015724.GA12435@jaegeuk-macbookpro.roam.corp.google.com>
References: <20170707104353.7f9ec14e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170707104353.7f9ec14e@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Hocko <mhocko@suse.com>
List-Id: linux-next.vger.kernel.org

On 07/07, Stephen Rothwell wrote:
> Hi Jaegeuk,
> 
> Today's linux-next merge of the f2fs tree got a conflict in:
> 
>   fs/f2fs/f2fs.h
> 
> between commit:
> 
>   a7c3e901a46f ("mm: introduce kv[mz]alloc helpers")
> 
> from Linus' tree and commit:
> 
>   8e9a5c32d310 ("f2fs: support plain user/group quota")
> 
> from the f2fs tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

I've confirmed. Thank you so much.

> 
> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc fs/f2fs/f2fs.h
> index fd2e651bad6d,0ca49e60002c..000000000000
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@@ -2074,6 -2155,36 +2158,16 @@@ static inline void *f2fs_kmalloc(struc
>   	return kmalloc(size, flags);
>   }
>   
>  -static inline void *f2fs_kvmalloc(size_t size, gfp_t flags)
>  -{
>  -	void *ret;
>  -
>  -	ret = kmalloc(size, flags | __GFP_NOWARN);
>  -	if (!ret)
>  -		ret = __vmalloc(size, flags, PAGE_KERNEL);
>  -	return ret;
>  -}
>  -
>  -static inline void *f2fs_kvzalloc(size_t size, gfp_t flags)
>  -{
>  -	void *ret;
>  -
>  -	ret = kzalloc(size, flags | __GFP_NOWARN);
>  -	if (!ret)
>  -		ret = __vmalloc(size, flags | __GFP_ZERO, PAGE_KERNEL);
>  -	return ret;
>  -}
>  -
> + static inline int f2fs_filemap_write_and_wait(struct inode *inode)
> + {
> + 	int err;
> + retry:
> + 	err = filemap_write_and_wait(inode->i_mapping);
> + 	if (err && err == -EAGAIN)
> + 		goto retry;
> + 	return err;
> + }
> + 
>   #define get_inode_mode(i) \
>   	((is_inode_flag_set(i, FI_ACL_MODE)) ? \
>   	 (F2FS_I(i)->i_acl_mode) : ((i)->i_mode))
