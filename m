From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: linux-next: build failure after merge of the tty tree
Date: Thu, 23 Sep 2010 16:46:44 +0100
Message-ID: <20100923164644.2b82746f@lxorguk.ukuu.org.uk>
References: <20100923142018.55019d59.sfr@canb.auug.org.au>
	<20100923141433.GC31738@kroah.com>
	<20100923081350.e028c4ac.rdunlap@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20100923081350.e028c4ac.rdunlap@xenotime.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Greg KH <greg@kroah.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Alan Cox <alan@linux.intel.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Thu, 23 Sep 2010 08:13:50 -0700
Randy Dunlap <rdunlap@xenotime.net> wrote:

> On Thu, 23 Sep 2010 07:14:33 -0700 Greg KH wrote:
> 
> > On Thu, Sep 23, 2010 at 02:20:18PM +1000, Stephen Rothwell wrote:
> > > Hi Greg,
> > > 
> > > After merging the tty tree, today's linux-next build (x86_64
> > > allmodconfig) failed like this:
> > > 
> > > drivers/char/ip2/ip2main.c:459: error: 'ip2_get_icount' undeclared here (not in a function)
> > > 
> > > Caused by commit 157be28e51ed476aa357c8718aaef4832f4da66b ("tty: icount
> > > changeover for other main devices").
> > > 
> > > Please build test (especially the trivial "cut and paste" changes) ...
> > > 
> > > I have reverted that commit for today.
> > 
> > Ick, sorry about that.  Alan, care to send a fixup patch for this?
> 
> 
> So developers and maintainers are not doing allmodconfig builds?

I try to make sure I build all the drivers I touch - I screwed that one
up. Lots of -next trees build for allmodconfig and not other configs so
all doing the same build isn't neccessarily good.

Alan
