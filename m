From: Stephan Mueller <smueller@chronox.de>
Subject: Re: [PATCH v2] DRBG: fix maximum value checks on 32 bit systems
Date: Tue, 26 Aug 2014 10:52:45 +0200
Message-ID: <2049245.HpByroTSUp@myon.chronox.de>
References: <20140826161456.7ad100e3@canb.auug.org.au> <2984929.nIbTCa5fhe@myon.chronox.de> <20140826084343.GA4417@gondor.apana.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140826084343.GA4417@gondor.apana.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Am Dienstag, 26. August 2014, 16:43:43 schrieb Herbert Xu:

Hi Herbert,

> On Tue, Aug 26, 2014 at 10:29:45AM +0200, Stephan Mueller wrote:
> > The maximum values for additional input string or generated blocks is
> > larger than 1<<32. To ensure a sensible value on 32 bit systems, return
> > SIZE_MAX on 32 bit systems. This value is lower than the maximum
> > allowed values defined in SP800-90A. The standard allow lower maximum
> > values, but not larger values.
> > 
> > SIZE_MAX - 1 is used for drbg_max_addtl to allow
> > drbg_healthcheck_sanity to check the enforcement of the variable
> > without wrapping.
> 
> This is really ugly but OK.  However, I'm not sure how the sanity
> check ever worked.  It would appear that the drbg_generate call in
> drbg_healthcheck_sanity should always fail because you explicitly
> set addtl->len to drbg_max_addtl + 1, which should trigger the
> "DRBG: additional information string too long" error, no?

That is exactly what the test shall do: the test is intended to check whether 
the maximum values are enforced. And it does that by checking whether an error 
is returned.

	/* get the maximum value */
        max_addtllen = drbg_max_addtl(drbg);
	/* add one to definitely overflow the maximum value */
        drbg_string_fill(&addtl, buf, max_addtllen + 1);
        /* overflow addtllen with additonal info string */
        len = drbg_generate(drbg, buf, OUTBUFLEN, &addtl);
	/*
	 * check that the drbg_generate does not return a positive
	 * value, i.e. check that drbg_generate does not generate anything
	 */
        BUG_ON(0 < len);
> 
> Obviously it's working for you but I'd like to understand why
> it's working and whether it'll continue to work.
> 
> Thanks,


-- 
Ciao
Stephan
