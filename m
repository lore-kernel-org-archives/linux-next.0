From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: linux-next: manual merge of the crypto tree with the amlogic tree
Date: Wed, 5 Apr 2017 18:35:24 +0800
Message-ID: <20170405103524.GA25944@gondor.apana.org.au>
References: <20170405102138.3ac22175@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170405102138.3ac22175@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, Neil Armstrong <narmstrong@baylibre.com>
List-Id: linux-next.vger.kernel.org

On Wed, Apr 05, 2017 at 10:21:38AM +1000, Stephen Rothwell wrote:
> Hi Herbert,
> 
> Today's linux-next merge of the crypto tree got a conflict in:
> 
>   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
> 
> between commit:
> 
>   6939db7e0dbf ("ARM64: dts: meson-gx: Add support for HDMI output")
> 
> from the amlogic tree and commit:
> 
>   1b3f6d148692 ("ARM64: dts: meson-gx: add clock CLKID_RNG0 to hwrng node")
> 
> from the crypto tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Looks good to me.  Thanks Stephen.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
