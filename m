From: Miklos Szeredi <miklos@szeredi.hu>
Subject: Re: linux-next: manual merge of the vfs tree with the  tree
Date: Tue, 09 Jun 2009 08:58:04 +0200
Message-ID: <E1MDvHY-0006N1-06@pomaz-ex.szeredi.hu>
References: <20090609110815.0abd1de0.sfr@canb.auug.org.au>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from fxip-0047f.externet.hu ([88.209.222.127]:59035 "EHLO
	pomaz-ex.szeredi.hu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753146AbZFIG6R (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 9 Jun 2009 02:58:17 -0400
In-reply-to: <20090609110815.0abd1de0.sfr@canb.auug.org.au> (message from
	Stephen Rothwell on Tue, 9 Jun 2009 11:08:15 +1000)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: viro@ZenIV.linux.org.uk, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, tj@kernel.org, miklos@szeredi.hu, vapier@gentoo.org

On Tue, 9 Jun 2009, Stephen Rothwell wrote:
> Today's linux-next merge of the vfs tree got a conflict in
> include/linux/magic.h between commit
> 81ebac1be35a2c2fe1f4d3810a8e57d315600a32 ("CUSE: implement CUSE -
> Character device in Userspace") from the fuse tree and commit
> 5b88aed76b5a1470ec9705c03cf3f0480c018513 ("linux/magic.h: move cramfs
> magic out of cramfs_fs.h") from the vfs tree.

Hmm, looks like that CUSE_SUPER_MAGIC is an unused remnant from an
earlier version of the CUSE patchset.  I'll fix that up in the fuse
tree.

Thanks,
Miklos

> 
> Just overlapping additions.  I fixed it up (see below) and can carry the
> fix as necessary.
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> 
> diff --cc include/linux/magic.h
> index 4596c9e,192f980..0000000
> --- a/include/linux/magic.h
> +++ b/include/linux/magic.h
> @@@ -3,11 -3,12 +3,13 @@@
>   
>   #define ADFS_SUPER_MAGIC	0xadf5
>   #define AFFS_SUPER_MAGIC	0xadff
>  -#define AFS_SUPER_MAGIC                0x5346414F
>  +#define AFS_SUPER_MAGIC		0x5346414F
>   #define AUTOFS_SUPER_MAGIC	0x0187
>   #define CODA_SUPER_MAGIC	0x73757245
> + #define CRAMFS_MAGIC		0x28cd3d45	/* some random number */
> + #define CRAMFS_MAGIC_WEND	0x453dcd28	/* magic number with the wrong endianess */
>  -#define DEBUGFS_MAGIC          0x64626720
>  +#define CUSE_SUPER_MAGIC	0x43555345
>  +#define DEBUGFS_MAGIC		0x64626720
>   #define SYSFS_MAGIC		0x62656572
>   #define SECURITYFS_MAGIC	0x73636673
>   #define TMPFS_MAGIC		0x01021994
> 
