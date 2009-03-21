From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: linux-next: Tree for March 20 - crypto crash on s390
Date: Sat, 21 Mar 2009 21:13:26 +0800
Message-ID: <20090321131326.GA15991@gondor.apana.org.au>
References: <20090320162800.24b0ad93.sfr@canb.auug.org.au> <20090320135912.53147d76@osiris.boeblingen.de.ibm.com> <20090321062605.GA14046@gondor.apana.org.au> <20090321115629.6e911679@osiris.boeblingen.de.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rhun.apana.org.au ([64.62.148.172]:58842 "EHLO
	arnor.apana.org.au" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1752914AbZCUNNh (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 21 Mar 2009 09:13:37 -0400
Content-Disposition: inline
In-Reply-To: <20090321115629.6e911679@osiris.boeblingen.de.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Jan Glauber <jang@linux.vnet.ibm.com>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Martin Schwidefsky <schwidefsky@de.ibm.com>

On Sat, Mar 21, 2009 at 11:56:29AM +0100, Heiko Carstens wrote:
>
> > diff --git a/arch/s390/crypto/sha512_s390.c b/arch/s390/crypto/sha512_s390.c
> > index 420acf4..37b4236 100644
> > --- a/arch/s390/crypto/sha512_s390.c
> > +++ b/arch/s390/crypto/sha512_s390.c
> > @@ -84,6 +84,7 @@ static struct shash_alg sha384_alg = {
> >  		.cra_driver_name=	"sha384-s390",
> >  		.cra_priority	=	CRYPT_S390_PRIORITY,
> >  		.cra_flags	=	CRYPTO_ALG_TYPE_SHASH,
> > +		.cra_blocksize	=	SHA512_BLOCK_SIZE,
> 
> Yes, it does fix it. Thanks!
> 
> Tested-by: Heiko Carstens <heiko.carstens@de.ibm.com>

Thanks.  I've now changed it to say SHA384_BLOCK_SIZE (which is
identical but makes a little more sense).

Cheers,
-- 
Visit Openswan at http://www.openswan.org/
Email: Herbert Xu ~{PmV>HI~} <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
