From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build failure after merge of the final tree (tty
 tree related)
Date: Thu, 6 Jan 2011 10:45:17 -0800
Message-ID: <20110106184517.GA15901@kroah.com>
References: <20101217171120.295b0c0c.sfr@canb.auug.org.au>
 <20101217070431.GA25192@kroah.com>
 <alpine.LFD.2.00.1012171107310.12146@localhost6.localdomain6>
 <20110106142710.a0a04883.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20110106142710.a0a04883.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Thu, Jan 06, 2011 at 02:27:10PM +1100, Stephen Rothwell wrote:
> HI Greg,
> 
> On Fri, 17 Dec 2010 11:16:17 +0100 (CET) Thomas Gleixner <tglx@linutronix.de> wrote:
> >
> > On Thu, 16 Dec 2010, Greg KH wrote:
> > > On Fri, Dec 17, 2010 at 05:11:20PM +1100, Stephen Rothwell wrote:
> > > > Hi Greg,
> > > > 
> > > > After merging the final tree, today's linux-next build (powerpc
> > > > allyesconfig) failed like this:
> > > > 
> > > > drivers/serial/apbuart.c:596: error: conflicting types for 'grlib_apbuart_configure'
> > > > drivers/serial/apbuart.c:523: note: previous declaration of 'grlib_apbuart_configure' was here
> > > > 
> > > > Caused by commit 35c64e5d13c3d7d8c4ad061ad5e20498b9160c24 ("drivers:
> > > > serial: apbuart: Handle OF failures gracefully").  This build has
> > > > CONFIG_SERIAL_GRLIB_GAISLER_APBUART_CONSOLE set ...
> > > > 
> > > > I have reverted this commit for today.
> > > 
> > > Ugh.  Thomas, care to send me a patch?
> > 
> > Sorry, I missed the console part. Patch below.
> 
> Ping?

Ick, sorry about this, I've now applied this.

thanks for the reminder.

greg k-h
