From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with the crypto tree
Date: Mon, 22 Feb 2016 17:36:36 -0800
Message-ID: <20160223013636.GB761@kroah.com>
References: <20160222145525.3d32f803@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160222145525.3d32f803@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Oleg Drokin <green@linuxhacker.ru>
List-Id: linux-next.vger.kernel.org

On Mon, Feb 22, 2016 at 02:55:25PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging tree got a conflict in:
> 
>   drivers/staging/lustre/lustre/libcfs/linux/linux-crypto.c
> 
> between commit:
> 
>   6dae10001e84 ("staging: lustre: Use ahash")
> 
> from the crypto tree and commit:
> 
>   15d9f5201fc3 ("staging/lustre/libcfs: Adjust NULL comparison codestyle")
>   3e1f3db1b29b ("staging/lustre: Remove space after cast in cfs_crypto_hash_final()")
> 
> from the staging tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Looks good, thanks.

greg k-h
