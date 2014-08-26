From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: linux-next: build warnings after merge of the crypto tree
Date: Tue, 26 Aug 2014 14:38:12 +0800
Message-ID: <20140826063812.GA3555@gondor.apana.org.au>
References: <20140826161456.7ad100e3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from helcar.apana.org.au ([209.40.204.226]:51491 "EHLO
	helcar.apana.org.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752889AbaHZGiS (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 26 Aug 2014 02:38:18 -0400
Content-Disposition: inline
In-Reply-To: <20140826161456.7ad100e3@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Stephan Mueller <smueller@chronox.de>

On Tue, Aug 26, 2014 at 04:14:56PM +1000, Stephen Rothwell wrote:
> Hi Herbert,
> 
> After merging the crypto tree, today's linux-next build (powerpc
> ppc44x_defconfig, i386 defconfig and sparc defconfig) produced these
> warnings:
> 
> In file included from crypto/testmgr.c:30:0:
> include/crypto/drbg.h: In function 'drbg_max_addtl':
> include/crypto/drbg.h:157:2: warning: left shift count >= width of type
>   return (1UL<<35);
>   ^
> include/crypto/drbg.h: In function 'drbg_max_requests':
> include/crypto/drbg.h:163:2: warning: left shift count >= width of type
>   return (1UL<<48);
>   ^
> 
> Introduced by commit 05c81ccd9087 ("crypto: drbg - remove configuration
> of fixed values").  These are all 32 bit builds.

Stephan, could you take a look at this?

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
