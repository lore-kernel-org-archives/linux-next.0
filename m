From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: linux-next: manual merge of the crypto tree with Linus' tree
Date: Mon, 7 May 2012 14:16:54 +1000
Message-ID: <20120507041654.GA25039@gondor.apana.org.au>
References: <20120507121137.bdfc96ed31649040506d9c75@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20120507121137.bdfc96ed31649040506d9c75@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andreas Westin <andreas.westin@stericsson.com>, Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee.jones@linaro.org>, Arnd Bergmann <arnd@arndb.de>
List-Id: linux-next.vger.kernel.org

On Mon, May 07, 2012 at 12:11:37PM +1000, Stephen Rothwell wrote:
> Hi Herbert,
> 
> Today's linux-next merge of the crypto tree got conflicts in
> arch/arm/mach-ux500/board-mop500.c and arch/arm/mach-ux500/board-u5500.c
> between commit b024a0c80435 ("ARM: ux500: move top level platform devices
> in sysfs to /sys/devices/socX") from Linus' tree and commit 3ba812f4d0be
> ("mach-ux500: crypto - core support for CRYP/HASH module") from the
> crypto tree.
> 
> Just context changes.  I fixed them up (see below) and can carry the
> fixes as necessary.

I think it looks fine but I'll let Linus Walleij have the final
say on this.

Thanks!
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
