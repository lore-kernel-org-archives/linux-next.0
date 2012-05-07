From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: linux-next: manual merge of the crypto tree with Linus' tree
Date: Mon, 7 May 2012 19:04:27 +1000
Message-ID: <20120507090427.GA26654@gondor.apana.org.au>
References: <20120507121137.bdfc96ed31649040506d9c75@canb.auug.org.au>
 <201205070809.21709.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <201205070809.21709.arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andreas Westin <andreas.westin@stericsson.com>, Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee.jones@linaro.org>
List-Id: linux-next.vger.kernel.org

On Mon, May 07, 2012 at 08:09:21AM +0000, Arnd Bergmann wrote:
> On Monday 07 May 2012, Stephen Rothwell wrote:
> > + static void __init u8500_cryp1_hash1_init(void)
> > + {
> > +       db8500_add_cryp1(&u8500_cryp1_platform_data);
> > +       db8500_add_hash1(&u8500_hash1_platform_data);
> > + }
> 
> This is actually not correct any more because of the
> other changes: each device addition should also pass the parent
> pointer so the device is created in the right position.
> 
> Stephen, your fix is ok for linux-next and I expect everything
> to still work, but we should not merge it into v3.5 this way.
> 
> Thanks for the fixup.

OK, I'll drop the last patch

	mach-ux500: crypto - core support for CRYP/HASH module

from my tree.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
