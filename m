From: David Woodhouse <dwmw2@infradead.org>
Subject: Re: linux-next: manual merge of the ttydev tree
Date: Wed, 02 Jul 2008 10:01:34 +0100
Message-ID: <1214989294.10393.450.camel@pmac.infradead.org>
References: <20080701224300.cf259ebd.sfr@canb.auug.org.au>
	 <20080701150953.7c349271@lxorguk.ukuu.org.uk>
	 <1214924845.10393.399.camel@pmac.infradead.org>
	 <20080701162942.286670c7@lxorguk.ukuu.org.uk>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([18.85.46.34]:56080 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751718AbYGBJBm (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 2 Jul 2008 05:01:42 -0400
In-Reply-To: <20080701162942.286670c7@lxorguk.ukuu.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

On Tue, 2008-07-01 at 16:29 +0100, Alan Cox wrote:
> On Tue, 01 Jul 2008 16:07:25 +0100
> David Woodhouse <dwmw2@infradead.org> wrote:
> 
> > On Tue, 2008-07-01 at 15:09 +0100, Alan Cox wrote:
> > > David - I think this is what you need to make your firmware tree fit
> > > on top of the ttydev tree
> > 
> > Hm. Is there anything I can usefully do with that, without just pulling
> > the ttydev tree into mine? I think that's more useful for Stephen as a
> > resolution to the conflict, isn't it?
> 
> Doesn't help. The ttydev tree needs to be in firmware, usb, trivial, net
> and half a dozen other trees right now at once.

Yeah, pulling your tree into mine isn't really an option -- hence asking
if there's anything useful I can do without it.

>  Unfortunately people have dumped tty and serial fixes all over other
> trees (even randomly deleted drivers that are in use!) because there
> wasn't a tty tree to handle it.

Fun :)

> Best bet for the moment I still think is to build ttydev on top of the
> merge for the moment, and then it'll sort out. I see no other sane way to
> do it unless Stephen has some good ideas ?

One option is perhaps to split up my patches into two parts -- the part
which modifies the driver to use request_firmware() (and removes the old
version of the firmware), and the part which adds the firmware back in
the firmware/ directory. You could carry the first patch, while I carry
the second.

-- 
dwmw2
