From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build failure after merge of the staging tree
Date: Wed, 28 Apr 2010 08:28:09 -0700
Message-ID: <20100428152809.GF4483@kroah.com>
References: <20100427141224.834a102a.sfr@canb.auug.org.au>
 <20100427151305.GA7653@kroah.com>
 <20100428161425.eff4c40a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20100428161425.eff4c40a.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tobias Klauser <tklauser@distanz.ch>
List-Id: linux-next.vger.kernel.org

On Wed, Apr 28, 2010 at 04:14:25PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> On Tue, 27 Apr 2010 08:13:05 -0700 Greg KH <greg@kroah.com> wrote:
> >
> > On Tue, Apr 27, 2010 at 02:12:24PM +1000, Stephen Rothwell wrote:
> > > 
> > > After merging the staging tree, today's linux-next build (x86_64
> > > allmodconfig) failed like this:
> > > 
> > > ERROR: "uart_console_device" [drivers/serial/altera_uart.ko] undefined!
> > > ERROR: "uart_console_device" [drivers/serial/altera_jtaguart.ko] undefined!
> > > 
> > > Introduced by commits 76bdbd933febe791fee114e7bb6c42bbd1a3f4f3 ("serial:
> > > Add driver for the Altera UART") and
> > > 11c59b34b299d7214b466cf799410a9a540476e3 ("serial: Add driver for the
> > > Altera JTAG UART").
> > > 
> > > I have reverted those commits for today.
> > 
> > Those came in through the tty quilt tree, not the staging tree, right?
> 
> Yeah, I just don't do a build between merging the tty and staging trees.

Ok, that makes sense.

> > Tobias, care to send me a patch to resolve this?  I already fixed one
> > Kconfig issue in these patches (forcing the driver to always be built
> > in.)  Is that what caused this symbol issue?
> 
> I have reverted those commits again today.

I think I'll go drop these patches now.  Tobias, care to resend them
when you have them working properly?

thanks,

greg k-h
