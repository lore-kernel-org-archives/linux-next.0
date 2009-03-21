From: Alexander Clouter <alex@digriz.org.uk>
Subject: Re: linux-next: Tree for March 20 - timeriomem build break on s390
Date: Sat, 21 Mar 2009 10:38:17 +0000
Message-ID: <20090321103817.GL22563@woodchuck>
References: <20090320162800.24b0ad93.sfr@canb.auug.org.au> <20090320100901.45ce2e6f@osiris.boeblingen.de.ibm.com> <20090321061922.GA13990@gondor.apana.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1753890AbZCUKie@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20090321061922.GA13990@gondor.apana.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Heiko Carstens <heiko.carstens@de.ibm.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Martin Schwidefsky <schwidefsky@de.ibm.com>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi,

* Herbert Xu <herbert@gondor.apana.org.au> [2009-03-21 14:19:22+0800]:
> 
> On Fri, Mar 20, 2009 at 10:09:01AM +0100, Heiko Carstens wrote:
> > 'hwrng: timeriomem' breaks an allyesconfig build on s390:
> > 
> >   CC      drivers/char/hw_random/timeriomem-rng.o
> > drivers/char/hw_random/timeriomem-rng.c: In function 'timeriomem_rng_data_read':
> > drivers/char/hw_random/timeriomem-rng.c:60: error: implicit declaration of function 'readl'
> > 
> > Signed-off-by: Heiko Carstens <heiko.carstens@de.ibm.com>
> 
> Patch applied.  Thanks Heiko!
>
Yes, thanks for catching this.

Cheers

-- 
Alexander Clouter
.sigmonster says: Don't kiss an elephant on the lips today.
