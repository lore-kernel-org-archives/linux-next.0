From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: linux-next: ttydev tree build failure
Date: Wed, 23 Jul 2008 14:39:08 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.0807231436310.1185@anakin>
References: <20080723171743.1436cf2a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from yergi.telenet-ops.be ([195.130.132.36]:39170 "EHLO
	yergi.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751543AbYGWMjm (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 23 Jul 2008 08:39:42 -0400
Received: from wilson.telenet-ops.be (unknown [195.130.132.42])
	by yergi.telenet-ops.be (Postfix) with ESMTP id 5B4235CB261
	for <linux-next@vger.kernel.org>; Wed, 23 Jul 2008 14:40:04 +0200 (CEST)
In-Reply-To: <20080723171743.1436cf2a.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>, linux-next@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

	Hi Stephen, Alan,

On Wed, 23 Jul 2008, Stephen Rothwell wrote:
> Today's linux-next build (m68k defconfig) failed like this:
> 
> drivers/char/vme_scc.c:186: error: 'struct gs_port' has no member named 'open_wait'

Not just in linux-next, also in mainline, while these problems have been
reported before.

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
