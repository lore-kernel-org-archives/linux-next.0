From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: linux-next: build failure after merge of the crypto tree
Date: Mon, 8 Oct 2018 13:54:22 +0800
Message-ID: <20181008055422.tgicnxelm7sjj6iv@gondor.apana.org.au>
References: <20181008120330.5d63f54b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181008120330.5d63f54b@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>
List-Id: linux-next.vger.kernel.org

On Mon, Oct 08, 2018 at 12:03:30PM +1100, Stephen Rothwell wrote:
> Hi Herbert,
> 
> After merging the crypto tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> ERROR: "crypto_fpu_exit" [arch/x86/crypto/aesni-intel.ko] undefined!
> ERROR: "crypto_fpu_init" [arch/x86/crypto/aesni-intel.ko] undefined!
> 
> Caused by commit
> 
>   944585a64f5e ("crypto: x86/aes-ni - remove special handling of AES in PCBC mode")
> 
> I have used the version of the crypto tree from next-20181005 for today.

Thanks Stephen.  It should be fixed in cryptodev now by:

	https://patchwork.kernel.org/patch/10628511/

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
