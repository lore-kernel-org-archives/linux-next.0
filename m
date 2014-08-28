From: Stephan Mueller <smueller@chronox.de>
Subject: Re: [PATCH v2] DRBG: fix maximum value checks on 32 bit systems
Date: Thu, 28 Aug 2014 09:13:36 +0200
Message-ID: <2035043.6AURNB1mku@myon.chronox.de>
References: <20140826161456.7ad100e3@canb.auug.org.au> <1471416.zGlxQVbHUr@myon.chronox.de> <20140827133528.GA15871@gondor.apana.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140827133528.GA15871@gondor.apana.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Am Mittwoch, 27. August 2014, 21:35:28 schrieb Herbert Xu:

Hi Herbert,

> On Tue, Aug 26, 2014 at 11:36:54AM +0200, Stephan Mueller wrote:
> > The max_addtllen and max_req are defined in drbg_cores[] in crypto/drbg.c
> > for each DRBG type. As size_t on a 32 bit system is 32 bit the bit shifts
> > would not work either.
> > 
> > Thus, I am wondering whether the just applied patch would need to go to
> > Linus
> > tree too? I would think that the following patch would be in order:
> Have you actually tested this on a 32-bit box? If so and it
> actually works then I'd be happy to push it.

I tested the current cryptodev-2.6:

- on x86_64 and on i386

- in FIPS mode and without FIPS mode on both arches

- executing the CAVS testing in FIPS mode and non-FIPS mode on both arches

- executing stress tests (obtain random values at a size randomly selected 
between 1 through 1 million bytes) in both modes on both arches

- adding some debug printks to check for the drbg_max_addtl() on both arches

- adding some debug printks to check for the drbg_max_requests() on both 
arches

I found a bug that was introduced with 
bc034ef5573ef4d81daa666c02a3df1ad28e24a7 when booting in FIPS mode, i.e. it is 
not in Linus' tree. The patch will be on your desk shortly.

Thus, the fix in b9347aff91ce4789619168539f08202d8d6a1177 works. However, this 
patch is based on 05c81ccd9087d238c10b234eadb55632742e5518. So, if we want to 
fix Linus' tree with minimal impact, either these two patches are pushed to 
Linus or I have to port b9347aff91ce4789619168539f08202d8d6a1177 to the 
current Linus tree.
> 
> Cheers,


-- 
Ciao
Stephan
