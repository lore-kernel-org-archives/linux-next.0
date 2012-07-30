From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: linux-next: Tree for July 2 (crypto/hifn_795x)
Date: Mon, 30 Jul 2012 15:49:18 +0800
Message-ID: <20120730074918.GA5515@gondor.apana.org.au>
References: <20120702172334.2618cae84cc57b4ec5a63ed7@canb.auug.org.au>
 <4FF1CBF2.8060303@xenotime.net>
 <20120709205441.11422bntesq3cdno@www.81.fi>
 <4FFB4FC6.7020509@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-crypto-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4FFB4FC6.7020509@xenotime.net>
Sender: linux-crypto-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Jussi Kivilinna <jussi.kivilinna@mbnet.fi>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-crypto@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
List-Id: linux-next.vger.kernel.org

On Mon, Jul 09, 2012 at 09:40:22PM +0000, Randy Dunlap wrote:
> On 07/09/2012 10:54 AM, Jussi Kivilinna wrote:
> 
> > Quoting Randy Dunlap <rdunlap@xenotime.net>:
> > 
> >> On 07/02/2012 12:23 AM, Stephen Rothwell wrote:
> >>
> >>> Hi all,
> >>>
> >>> Changes since 20120629:
> >>>
> >>
> >>
> >> on i386:
> >>
> >>
> >> ERROR: "__divdi3" [drivers/crypto/hifn_795x.ko] undefined!
> >>
> > 
> > This is caused by commit feb7b7ab928afa97a79a9c424e4e0691f49d63be. hifn_795x has "DIV_ROUND_UP(NSEC_PER_SEC, dev->pk_clk_freq)", which should be changed to DIV_ROUND_UP_ULL now that NSEC_PER_SEC is 64bit on 32bit archs. Patch to fix hifn_795x is attached (only compile tested).
> 
> 
> 
> Acked-by: Randy Dunlap <rdunlap@xenotime.net>

Patch applied.  Thanks!
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
