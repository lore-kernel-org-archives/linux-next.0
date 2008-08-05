From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: linux-next: crypto tree build failure
Date: Tue, 5 Aug 2008 22:05:04 +0800
Message-ID: <20080805140503.GB23405@gondor.apana.org.au>
References: <20080805140257.7fad0dc0.sfr@canb.auug.org.au> <20080805053628.GA19574@gondor.apana.org.au> <20080805233300.e98f9da5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rhun.apana.org.au ([64.62.148.172]:48419 "EHLO
	arnor.apana.org.au" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1754331AbYHEOFF (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 5 Aug 2008 10:05:05 -0400
Content-Disposition: inline
In-Reply-To: <20080805233300.e98f9da5.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

On Tue, Aug 05, 2008 at 11:33:00PM +1000, Stephen Rothwell wrote:
> Hi Herbert,
> 
> On Tue, 5 Aug 2008 13:36:28 +0800 Herbert Xu <herbert@gondor.apana.org.au> wrote:
> >
> > I've fixed it with the following patch.
> > 
> > --
> > diff --git a/crypto/Kconfig b/crypto/Kconfig
> > index 4f72b30..a3f4b4f 100644
> > --- a/crypto/Kconfig
> > +++ b/crypto/Kconfig
> > @@ -40,7 +40,9 @@ config CRYPTO_HASH
> >  
> >  config CRYPTO_MANAGER
> >  	tristate "Cryptographic algorithm manager"
> > -	select CRYPTO_ALGAPI
> > +	select CRYPTO_AEAD
> > +	select CRYPTO_HASH
> > +	select CRYPTO_BLKCIPHER
> >  	help
> >  	  Create default cryptographic template instantiations such as
> >  	  cbc(aes).
> > @@ -85,9 +87,7 @@ config CRYPTO_AUTHENC
> >  config CRYPTO_TEST
> >  	tristate "Testing module"
> >  	depends on m
> > -	select CRYPTO_ALGAPI
> > -	select CRYPTO_AEAD
> > -	select CRYPTO_BLKCIPHER
> > +	select CRYPTO_MANAGER
> >  	help
> >  	  Quick & dirty crypto test module.
> 
> I am guessing that will help with these errors as well?
> 
> testmgr.c:(.text+0x6404): undefined reference to `.crypto_alloc_ablkcipher

Yes it should.

Cheers,
-- 
Visit Openswan at http://www.openswan.org/
Email: Herbert Xu ~{PmV>HI~} <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
