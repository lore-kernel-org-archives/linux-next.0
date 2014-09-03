From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: [PATCH v2] DRBG: remove check for uninitialized DRBG handle
Date: Thu, 4 Sep 2014 07:21:29 +0800
Message-ID: <20140903232129.GA32264@gondor.apana.org.au>
References: <20140826161456.7ad100e3@canb.auug.org.au>
 <2837552.tiNKQxI8Xu@myon.chronox.de>
 <1461606.SUPpCYm782@myon.chronox.de>
 <3575659.BooajjTQie@myon.chronox.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3575659.BooajjTQie@myon.chronox.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephan Mueller <smueller@chronox.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Wed, Sep 03, 2014 at 03:33:16AM +0200, Stephan Mueller wrote:
> Am Montag, 1. September 2014, 07:11:20 schrieb Stephan Mueller:
> 
> Hi Herbert,
> 
> may I ask for consideration of this patch as this covers an oops FIPS mode?
> 
> In addition, may I ask for guidance on how to fix the 32 bit code path in 
> Linus' tree as asked on 28.8? To quote: "Thus, the fix in 
> b9347aff91ce4789619168539f08202d8d6a1177 works. However, this 
> patch is based on 05c81ccd9087d238c10b234eadb55632742e5518. So, if we want to 
> fix Linus' tree with minimal impact, either these two patches are pushed to 
> Linus or I have to port b9347aff91ce4789619168539f08202d8d6a1177 to the 
> current Linus tree."

I will take care of this.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
