From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build failure after merge of the tty tree
Date: Mon, 18 Dec 2017 10:33:48 +0100
Message-ID: <20171218093348.GA31320@kroah.com>
References: <20171218142826.63e7a0c0@canb.auug.org.au>
 <CAMuHMdVp7fv7m0cedzRoDtG_k6OW9GEGOoWiTfc87nJxpp4o3g@mail.gmail.com>
 <20171218090208.GA9748@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:36285 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1758285AbdLRJdo (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 18 Dec 2017 04:33:44 -0500
Content-Disposition: inline
In-Reply-To: <20171218090208.GA9748@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>

On Mon, Dec 18, 2017 at 10:02:08AM +0100, Greg KH wrote:
> On Mon, Dec 18, 2017 at 09:52:50AM +0100, Geert Uytterhoeven wrote:
> > Hi Stephen,
> > 
> > On Mon, Dec 18, 2017 at 4:28 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > > After merging the tty tree, today's linux-next build (x86_64 allmodconfig)
> > > failed like this:
> > >
> > > .config:4300:warning: symbol value '' invalid for SERIAL_SH_SCI_NR_UARTS
> > > *
> > > * Restart config...
> > > *
> > > *
> > > * Serial drivers
> > > *
> > > 8250/16550 and compatible serial support (SERIAL_8250) [M/y/?] m
> > >         .
> > >         .
> > >         .
> > > SuperH SCI(F) serial port support (SERIAL_SH_SCI) [M/n/y] m
> > >   Maximum number of SCI(F) serial ports (SERIAL_SH_SCI_NR_UARTS) [] (NEW) aborted!
> > >
> > > Console input/output is redirected. Run 'make oldconfig' to update configuration.
> > >
> > >
> > > Caused by commit
> > >
> > >   f6731485a519 ("tty: serial: sh-sci: Hide number of ports config question")
> > >
> > > I have used the tty tree from next-20171215 for today.
> > 
> > Sorry, silly misunderstanding of Kconfig behavior on my side.
> > Patch sent.
> 
> Really?  I don't see the patch anywhere, can you resend it please?

Got it now, thanks!

greg k-h
