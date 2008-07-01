From: David Brownell <david-b@pacbell.net>
Subject: Re: linux-next: manual merge of the ttydev tree
Date: Tue, 1 Jul 2008 09:18:09 -0700
Message-ID: <200807010918.09669.david-b@pacbell.net>
References: <20080701211003.8ecd7d3b.sfr@canb.auug.org.au> <20080701125631.3deab583@lxorguk.ukuu.org.uk>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp121.sbc.mail.sp1.yahoo.com ([69.147.64.94]:44312 "HELO
	smtp121.sbc.mail.sp1.yahoo.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1750979AbYGAQYv (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 1 Jul 2008 12:24:51 -0400
In-Reply-To: <20080701125631.3deab583@lxorguk.ukuu.org.uk>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Greg KH <greg@kroah.com>

On Tuesday 01 July 2008, Alan Cox wrote:
> On Tue, 1 Jul 2008 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
> > Today's linux-next merge of the ttydev tree got a conflict in
> > drivers/usb/gadget/serial.c between commit
> > d4013f65e6b7be39e93845c280482e3f1d7894f0 ("usb gadget: use new serial
> > core") from the usb tree and commit
> > e806c01e6c8cacf955620105398902698ec3d933 ("79-tty-break-errorhandler")
> > from the ttydev tree.
> > 
> > The former patch removes the code modified by the latter.  I have used
> > the version from the usb tree.
> 
> Patch updated to drop that change from the diff

A quick search doesn't turn up a ttydev tree, or that patch.

Is that the right long-term fix, so I can consider this resolved?

- Dave
