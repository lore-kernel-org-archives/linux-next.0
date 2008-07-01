From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: linux-next: manual merge of the ttydev tree
Date: Tue, 1 Jul 2008 16:29:42 +0100
Message-ID: <20080701162942.286670c7@lxorguk.ukuu.org.uk>
References: <20080701224300.cf259ebd.sfr@canb.auug.org.au>
	<20080701150953.7c349271@lxorguk.ukuu.org.uk>
	<1214924845.10393.399.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from earthlight.etchedpixels.co.uk ([81.2.110.250]:42610 "EHLO
	lxorguk.ukuu.org.uk" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1755467AbYGAPrZ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 1 Jul 2008 11:47:25 -0400
In-Reply-To: <1214924845.10393.399.camel@pmac.infradead.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

On Tue, 01 Jul 2008 16:07:25 +0100
David Woodhouse <dwmw2@infradead.org> wrote:

> On Tue, 2008-07-01 at 15:09 +0100, Alan Cox wrote:
> > David - I think this is what you need to make your firmware tree fit
> > on top of the ttydev tree
> 
> Hm. Is there anything I can usefully do with that, without just pulling
> the ttydev tree into mine? I think that's more useful for Stephen as a
> resolution to the conflict, isn't it?

Doesn't help. The ttydev tree needs to be in firmware, usb, trivial, net
and half a dozen other trees right now at once. Unfortunately people have
dumped tty and serial fixes all over other trees (even randomly deleted
drivers that are in use!) because there wasn't a tty tree to handle it.

Best bet for the moment I still think is to build ttydev on top of the
merge for the moment, and then it'll sort out. I see no other sane way to
do it unless Stephen has some good ideas ?

Alan
