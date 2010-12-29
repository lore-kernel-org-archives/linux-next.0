From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: linux-next: Tree for December 29
Date: Wed, 29 Dec 2010 13:08:03 +0000
Message-ID: <20101229130802.GA20306@sirena.org.uk>
References: <20101229130700.0ef93735.sfr@canb.auug.org.au> <AANLkTikq50KLGwS1_=uA=TXz2b=LNzr_TKUSiZu-an1m@mail.gmail.com> <AANLkTin1pizZM5LttTpYQOo0gPEeV7Jd5uD5RXwnj37Z@mail.gmail.com> <20101229204641.ead941fc.sfr@canb.auug.org.au> <AANLkTikPbkM4ccO-2=+TSJN6dR64ibTReSsYYdhLYrUt@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:48771 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752165Ab0L2NIF (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 29 Dec 2010 08:08:05 -0500
Content-Disposition: inline
In-Reply-To: <AANLkTikPbkM4ccO-2=+TSJN6dR64ibTReSsYYdhLYrUt@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Anca Emanuel <anca.emanuel@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Liam Girdwood <lrg@slimlogic.co.uk>

On Wed, Dec 29, 2010 at 12:45:35PM +0200, Anca Emanuel wrote:

> >> ? MODPOST 2808 modules
> >> ERROR: "__tracepoint_snd_soc_jack_irq"
> >> [sound/soc/codecs/snd-soc-wm8994.ko] undefined!
> >> ERROR: "__tracepoint_snd_soc_jack_irq"
> >> [sound/soc/codecs/snd-soc-wm8350.ko] undefined!
> >> ERROR: "__tracepoint_snd_soc_jack_irq"
> >> [sound/soc/codecs/snd-soc-88pm860x.ko] undefined!
> >> WARNING: modpost: Found 59 section mismatch(es).
> >> To see full details build your kernel with:
> >> 'make CONFIG_DEBUG_SECTION_MISMATCH=y'
> >> make[2]: *** [__modpost] Error 1
> >> make[1]: *** [modules] Error 2

> > It would be good if you could publish your config files with these
> > reports. ?I have cc'd this to those who may be able to fix this.

*Please* do always CC maintainers on reports and always include the
config like Stephen requested, build errors without reproduction
information are typically no use.

I've probably fixed this; I've not fully explored this as even a noop
build of the config you provided on my laptop is taking many minutes.
