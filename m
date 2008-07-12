From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: linux-next: manual merge of the ttydev tree
Date: Sat, 12 Jul 2008 21:29:14 +0100
Message-ID: <20080712212914.1a25c4fc@lxorguk.ukuu.org.uk>
References: <20080701213310.3fcdeb8c.sfr@canb.auug.org.au>
	<9a8748490807121159o1153e9f4r7003f3bbfa563d@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from earthlight.etchedpixels.co.uk ([81.2.110.250]:50974 "EHLO
	lxorguk.ukuu.org.uk" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1752664AbYGLUrR (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 12 Jul 2008 16:47:17 -0400
In-Reply-To: <9a8748490807121159o1153e9f4r7003f3bbfa563d@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jesper Juhl <jesper.juhl@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Nick Andrew <nick@nick-andrew.net>

On Sat, 12 Jul 2008 20:59:58 +0200
"Jesper Juhl" <jesper.juhl@gmail.com> wrote:

> 2008/7/1 Stephen Rothwell <sfr@canb.auug.org.au>:
> > Hi Alan,
> >
> > Today's linux-next merge of the ttydev tree got a conflict in
> > drivers/usb/serial/ftdi_sio.c between commit
> > 0bb08241ce68aaa70b7b804b4d6319d8bad3ae24 ("Tighten up the use of loose")
> > from the trivial tree and commit ce8194a09dee5b7e101467aba6b7cd5617b1cd0f
> > ("23-usb-serial-api-change") from the ttydev tree.
> >
> > The conflict is just in a comment.  I have applied the spelling
> > correction from the former to the version of the file from the ttydev
> > tree.
> >
> Ok, do you want me to make any changes to the contents of Trivial or
> can I just leave thins as-is?

Can you pull the change from trivial and email it to me and I'll merge it
nicely into ttydev

Alan
