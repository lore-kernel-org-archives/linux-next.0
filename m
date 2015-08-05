From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: linux-next: build failure after merge of the crypto tree
Date: Wed, 5 Aug 2015 15:28:40 +0800
Message-ID: <20150805072840.GA5791@gondor.apana.org.au>
References: <20150805164931.516fb8ee@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150805164931.516fb8ee@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Wed, Aug 05, 2015 at 04:49:31PM +1000, Stephen Rothwell wrote:
> Hi Herbert,
> 
> After merging the crypto tree, today's linux-next build (sparc64
> defconfig) failed like this:
> 
> crypto/built-in.o: In function `crypto_authenc_exit_tfm':
> authenc.c:(.text+0x11d1c): undefined reference to `crypto_put_default_null_skcipher'
> crypto/built-in.o: In function `crypto_authenc_init_tfm':
> authenc.c:(.text+0x11d7c): undefined reference to `crypto_get_default_null_skcipher'
> 
> Caused by commit
> 
>   92d95ba91772 ("crypto: authenc - Convert to new AEAD interface")
> 
> Those symbols depend on CONFIG_CRYPTO_NULL which is set to 'm' for
> this build.

Thanks Stephen.  I already have a similar patch in my tree which
I will push out soon.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
