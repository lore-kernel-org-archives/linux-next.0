From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: linux-next: ttydev tree build failure
Date: Wed, 23 Jul 2008 15:46:10 +0100
Message-ID: <20080723154610.348ffc07@lxorguk.ukuu.org.uk>
References: <20080723171743.1436cf2a.sfr@canb.auug.org.au>
	<Pine.LNX.4.64.0807231436310.1185@anakin>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from earthlight.etchedpixels.co.uk ([81.2.110.250]:44685 "EHLO
	lxorguk.ukuu.org.uk" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1750877AbYGWPDg (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 23 Jul 2008 11:03:36 -0400
In-Reply-To: <Pine.LNX.4.64.0807231436310.1185@anakin>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

On Wed, 23 Jul 2008 14:39:08 +0200 (CEST)
Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> 	Hi Stephen, Alan,
> 
> On Wed, 23 Jul 2008, Stephen Rothwell wrote:
> > Today's linux-next build (m68k defconfig) failed like this:
> > 
> > drivers/char/vme_scc.c:186: error: 'struct gs_port' has no member named 'open_wait'
> 
> Not just in linux-next, also in mainline, while these problems have been
> reported before.

And at the time I asked if anyone was using this hardware and if so would
they send patches. Shall I send Linus patches to delete them or is anyone
actually using this stuff ?

Alan
