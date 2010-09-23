From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: linux-next: build failure after merge of the tty tree
Date: Thu, 23 Sep 2010 18:12:12 +0100
Message-ID: <20100923181212.422e76c1@lxorguk.ukuu.org.uk>
References: <20100923142018.55019d59.sfr@canb.auug.org.au>
	<20100923141433.GC31738@kroah.com>
	<20100923081350.e028c4ac.rdunlap@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from earthlight.etchedpixels.co.uk ([81.2.110.250]:53397 "EHLO
	www.etchedpixels.co.uk" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1755428Ab0IWQtW (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 23 Sep 2010 12:49:22 -0400
In-Reply-To: <20100923081350.e028c4ac.rdunlap@xenotime.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Greg KH <greg@kroah.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Alan Cox <alan@linux.intel.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

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
> I can understand not doing randconfig builds.

drivers/staging/ti-st/st_kim.c:34:20: error: st_kim.h: No such file or
directory

So there isn't actually much point trying allmodconfig builds (thats not
the only fail either).
