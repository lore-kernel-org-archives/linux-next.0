From: Stephan Mueller <smueller@chronox.de>
Subject: Re: [PATCH] DRBG: fix bit shifting on 32 bit systems
Date: Tue, 26 Aug 2014 09:37:13 +0200
Message-ID: <1474386.ELDQfGhIun@myon.chronox.de>
References: <20140826161456.7ad100e3@canb.auug.org.au> <6371777.WdUEAKFPYo@myon.chronox.de> <20140826073219.GA3880@gondor.apana.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140826073219.GA3880@gondor.apana.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Am Dienstag, 26. August 2014, 15:32:19 schrieb Herbert Xu:

Hi Herbert,

> On Tue, Aug 26, 2014 at 09:31:02AM +0200, Stephan Mueller wrote:
> > Use ULL to mark a 64 bit value.
> > 
> > Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > Reported-by: kbuild test robot <fengguang.wu@intel.com>
> > Signed-off-by: Stephan Mueller <smueller@chronox.de>
> 
> I don't think this works as size_t is still 32-bit which means
> that you'll return zero.

Oops, yes. Thank you for catching this. I guess I need __u64 for this value. A 
patch will come shortly.
> 
> Cheers,


-- 
Ciao
Stephan
