From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: linux-next: manual merge of the crypto tree with the net tree
Date: Sat, 20 Feb 2016 08:44:07 +0000
Message-ID: <20160220084407.GA8095@gondor.apana.org.au>
References: <20160219104957.0273c75a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from helcar.hengli.com.au ([209.40.204.226]:42868 "EHLO
	helcar.hengli.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1423122AbcBTIoL (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 20 Feb 2016 03:44:11 -0500
Content-Disposition: inline
In-Reply-To: <20160219104957.0273c75a@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Insu Yun <wuninsu@gmail.com>

On Fri, Feb 19, 2016 at 10:49:57AM +1100, Stephen Rothwell wrote:
> Hi Herbert,
> 
> Today's linux-next merge of the crypto tree got a conflict in:
> 
>   net/ipv4/tcp.c
> 
> between commit:
> 
>   1eea84b74cd2 ("tcp: correctly crypto_alloc_hash return check")
> 
> from the net tree and commit:
> 
>   cf80e0e47e0e ("tcp: Use ahash")
> 
> from the crypto tree.
> 
> I fixed it up (the latter removed the code fixed by the former) and can
> carry the fix as necessary (no action is required).

Thank you Stephen!
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
