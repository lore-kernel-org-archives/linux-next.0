From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: [PATCH] DRBG: fix maximum value checks on 32 bit systems
Date: Tue, 26 Aug 2014 16:08:58 +0800
Message-ID: <20140826080858.GA4161@gondor.apana.org.au>
References: <20140826161456.7ad100e3@canb.auug.org.au>
 <6371777.WdUEAKFPYo@myon.chronox.de>
 <20140826073219.GA3880@gondor.apana.org.au>
 <1998203.8HHRdZPLvI@myon.chronox.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1998203.8HHRdZPLvI@myon.chronox.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephan Mueller <smueller@chronox.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Tue, Aug 26, 2014 at 10:06:52AM +0200, Stephan Mueller wrote:
> The maximum values for additional input string or generated blocks is
> larger than 1<<32. To ensure a sensible value on 32 bit systems, return
> SIZE_MAX on 32 bit systems. This value is lower than the maximum allowed
> values defined in SP800-90A. The standard allow lower maximum values,
> but not larger values.
> 
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Reported-by: kbuild test robot <fengguang.wu@intel.com>
> Signed-off-by: Stephan Mueller <smueller@chronox.de>

Unfortunately there's a place in drbg where you add one to
drbg_max_addtl which will cause it to overflow back to zero.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
