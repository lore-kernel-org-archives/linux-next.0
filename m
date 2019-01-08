From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the ubifs tree with the fscrypt
 tree
Date: Tue, 8 Jan 2019 13:39:03 +1100
Message-ID: <20190108133855.03ac5cce@canb.auug.org.au>
References: <20181211102425.7019f0a7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181211102425.7019f0a7@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Artem Bityutskiy <dedekind1@gmail.com>, Theodore Ts'o <tytso@mit.edu>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Chandan Rajendra <chandan@linux.vnet.ibm.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Richard Weinberger <richard@nod.at>
List-Id: linux-next.vger.kernel.org

Hi all,

On Tue, 11 Dec 2018 10:24:25 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Today's linux-next merge of the ubifs tree got a conflict in:
> 
>   fs/ubifs/Kconfig
> 
> between commit:
> 
>   6956097c429a ("fscrypt: remove filesystem specific build config option")
> 
> from the fscrypt tree and commit:
> 
>   1341551f1e2a ("ubifs: CONFIG_UBIFS_FS_AUTHENTICATION should depend on UBIFS_FS")
> 
> from the ubifs tree.
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
> diff --cc fs/ubifs/Kconfig
> index ff7ea6f04555,bc1e082d921d..000000000000
> --- a/fs/ubifs/Kconfig
> +++ b/fs/ubifs/Kconfig
> @@@ -65,9 -60,20 +62,9 @@@ config UBIFS_FS_XATT
>   
>   	  If unsure, say Y.
>   
>  -config UBIFS_FS_ENCRYPTION
>  -	bool "UBIFS Encryption"
>  -	depends on UBIFS_FS_XATTR && BLOCK
>  -	select FS_ENCRYPTION
>  -	default n
>  -	help
>  -	  Enable encryption of UBIFS files and directories. This
>  -	  feature is similar to ecryptfs, but it is more memory
>  -	  efficient since it avoids caching the encrypted and
>  -	  decrypted pages in the page cache.
>  -
>   config UBIFS_FS_SECURITY
>   	bool "UBIFS Security Labels"
> - 	depends on UBIFS_FS && UBIFS_FS_XATTR
> + 	depends on UBIFS_FS_XATTR
>   	default y
>   	help
>   	  Security labels provide an access control facility to support Linux

This is now a conflict between Linus' tree and the fscrypt tree.

-- 
Cheers,
Stephen Rothwell
