From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: linux-next: Fixes tag needs some work in the crypto tree
Date: Tue, 23 Apr 2019 12:08:09 +0800
Message-ID: <20190423040809.r2ry5b2ealnhbxuh@gondor.apana.org.au>
References: <20190423073036.3fe21a5f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190423073036.3fe21a5f@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Brijesh Singh <brijesh.singh@amd.com>
List-Id: linux-next.vger.kernel.org

On Tue, Apr 23, 2019 at 07:30:36AM +1000, Stephen Rothwell wrote:
> 
> In commit
> 
>   f5a2aeb8b254 ("crypto: ccp - Do not free psp_master when PLATFORM_INIT fails")
> 
> Fixes tag
> 
>   Fixes: 200664d5237f ("crypto: ccp: Add SEV support")
> 
> has these problem(s):
> 
>   - Subject does not match target commit subject
>     Just use
> 	git log -1 --format='Fixes: %h ("%s")'

Thanks for the heads up Stephen.

I have taken a look and it seems to be a rephrasing of the original
commit subject which seems to make sense.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
