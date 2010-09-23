From: Sage Weil <sage@newdream.net>
Subject: Re: linux-next: manual merge of the ceph tree with Linus' tree
Date: Wed, 22 Sep 2010 20:36:52 -0700 (PDT)
Message-ID: <Pine.LNX.4.64.1009222036210.14012@cobra.newdream.net>
References: <20100923102924.25db6970.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20100923102924.25db6970.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Thanks, Stephen.

I've rebased my for-next on the latest upstream (now that lock_flocks() is 
in place), so these should all go away the next time around.

sage


On Thu, 23 Sep 2010, Stephen Rothwell wrote:

> Hi Sage,
> 
> Today's linux-next merge of the ceph tree got a conflict in
> fs/ceph/Kconfig between commit be4f104dfd3b5e3ae262bff607965cfc38027dec
> ("ceph: select CRYPTO") from Linus' tree and commit
> 49dde0c8bee346a349862c4a3eddcd58e0d0ae90 ("ceph: factor out libceph from
> Ceph file system") from the ceph tree.
> 
> Just overlapping additions.  I fixed it up (see below) and can carry the
> fix for a while.  (though the adding of "default n" is, I think,
> redundant as that is the default anyway).
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> 
> diff --cc fs/ceph/Kconfig
> index 0fcd264,73a7b31..0000000
> --- a/fs/ceph/Kconfig
> +++ b/fs/ceph/Kconfig
> @@@ -1,9 -1,10 +1,11 @@@
>   config CEPH_FS
>           tristate "Ceph distributed file system (EXPERIMENTAL)"
>   	depends on INET && EXPERIMENTAL
> + 	select CEPH_LIB
>   	select LIBCRC32C
>   	select CRYPTO_AES
>  +	select CRYPTO
> + 	default n
>   	help
>   	  Choose Y or M here to include support for mounting the
>   	  experimental Ceph distributed file system.  Ceph is an extremely
> 
> 
