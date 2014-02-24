From: Jason Cooper <jason@lakedaemon.net>
Subject: Re: linux-next: manual merge of the sound-asoc tree with the mvebu
 tree
Date: Mon, 24 Feb 2014 10:10:18 -0500
Message-ID: <20140224151018.GE14250@titan.lakedaemon.net>
References: <20140224133752.bc1ffffa4e81edb76a76e555@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mho-02-ewr.mailhop.org ([204.13.248.72]:39942 "EHLO
	mho-02-ewr.mailhop.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752539AbaBXPK6 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 24 Feb 2014 10:10:58 -0500
Content-Disposition: inline
In-Reply-To: <20140224133752.bc1ffffa4e81edb76a76e555@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, andrew@lunn.ch, gregory.clement@free-electrons.com, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Stephen,

On Mon, Feb 24, 2014 at 01:37:52PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the sound-asoc tree got a conflict in
> sound/soc/kirkwood/Kconfig between commit cd34edc2eab2 ("drivers: Enable
> building of Kirkwood drivers for mach-mvebu") from the  tree and commit
> 9a0d5113ac0e ("ASoC: kirkwood: enable Kirkwood driver for mvebu
> platforms") from the sound-asoc tree.
> 
> I fixed it up (Probably incorrectly - see below) and can carry the fix as
> necessary (no action is required).

Yes, sorry this isn't ideal.  We're moving all DT support from
mach-kirkwood to mach-mvebu and having to keep legacy support for a
cycle.  Hence the confusing config symbols.

This resolution is correct.

thx,

Jason.

> 
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> 
> diff --cc sound/soc/kirkwood/Kconfig
> index 106e2e22fed2,2dc3ecf34801..000000000000
> --- a/sound/soc/kirkwood/Kconfig
> +++ b/sound/soc/kirkwood/Kconfig
> @@@ -1,6 -1,6 +1,6 @@@
>   config SND_KIRKWOOD_SOC
>   	tristate "SoC Audio for the Marvell Kirkwood and Dove chips"
> - 	depends on ARCH_KIRKWOOD || ARCH_DOVE || MACH_KIRKWOOD || COMPILE_TEST
>  -	depends on ARCH_KIRKWOOD || ARCH_DOVE || ARCH_MVEBU || COMPILE_TEST
> ++	depends on ARCH_KIRKWOOD || ARCH_DOVE || MACH_KIRKWOOD || ARCH_MVEBU || COMPILE_TEST
>   	help
>   	  Say Y or M if you want to add support for codecs attached to
>   	  the Kirkwood I2S interface. You will also need to select the
