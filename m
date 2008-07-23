From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: linux-next: ttydev tree build failure
Date: Wed, 23 Jul 2008 16:47:31 +0100
Message-ID: <20080723164731.00c163f1@lxorguk.ukuu.org.uk>
References: <20080723171743.1436cf2a.sfr@canb.auug.org.au>
	<Pine.LNX.4.64.0807231436310.1185@anakin>
	<20080723154610.348ffc07@lxorguk.ukuu.org.uk>
	<Pine.LNX.4.64.0807231748250.20868@anakin>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from earthlight.etchedpixels.co.uk ([81.2.110.250]:38392 "EHLO
	lxorguk.ukuu.org.uk" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1752232AbYGWQFD (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 23 Jul 2008 12:05:03 -0400
In-Reply-To: <Pine.LNX.4.64.0807231748250.20868@anakin>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Linux/m68k <linux-m68k@vger.kernel.org>

On Wed, 23 Jul 2008 17:49:13 +0200 (CEST)
Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> 	Hi Alan,
> 
> On Wed, 23 Jul 2008, Alan Cox wrote:
> > On Wed, 23 Jul 2008 14:39:08 +0200 (CEST)
> > Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > On Wed, 23 Jul 2008, Stephen Rothwell wrote:
> > > > Today's linux-next build (m68k defconfig) failed like this:
> > > > 
> > > > drivers/char/vme_scc.c:186: error: 'struct gs_port' has no member named 'open_wait'
> > > 
> > > Not just in linux-next, also in mainline, while these problems have been
> > > reported before.
> > 
> > And at the time I asked if anyone was using this hardware and if so would
> > they send patches. Shall I send Linus patches to delete them or is anyone
> > actually using this stuff ?
> 
> Sorry, I did not see that question.

No problem - what do you want me to do however ?

Alan
