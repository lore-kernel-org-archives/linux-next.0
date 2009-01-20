From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: linux-next: crypto tree build failure
Date: Tue, 20 Jan 2009 16:21:41 +1100
Message-ID: <20090120052141.GA19696@gondor.apana.org.au>
References: <20090120133043.29efee3f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rhun.apana.org.au ([64.62.148.172]:42078 "EHLO
	arnor.apana.org.au" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1750902AbZATFVq (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 20 Jan 2009 00:21:46 -0500
Content-Disposition: inline
In-Reply-To: <20090120133043.29efee3f.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Huang Ying <ying.huang@intel.com>

On Tue, Jan 20, 2009 at 01:30:43PM +1100, Stephen Rothwell wrote:
> 
> Today's linux-next build (x86_64 allmodconfig) failed like this:
> 
> arch/x86/crypto/aesni-intel_glue.c:22:21: error: asm/aes.h: No such file or directory
> arch/x86/crypto/aesni-intel_glue.c: In function 'aes_encrypt':
> arch/x86/crypto/aesni-intel_glue.c:98: error: implicit declaration of function 'crypto_aes_encrypt_x86'
> arch/x86/crypto/aesni-intel_glue.c: In function 'aes_decrypt':
> arch/x86/crypto/aesni-intel_glue.c:111: error: implicit declaration of function 'crypto_aes_decrypt_x86'
> 
> Immediate cause is commit 9afc33f2f32204a779ef6c96728a034bcf4df29f
> ("crypto: aes-ni - Add support to Intel AES-NI instructions for x86_64
> platform").
> 
> I have dropped the crypto tree for today.

Sorry for the screw up.  It shold be fixed now.

Thanks,
-- 
Visit Openswan at http://www.openswan.org/
Email: Herbert Xu ~{PmV>HI~} <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
