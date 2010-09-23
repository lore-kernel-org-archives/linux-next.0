From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next: build failure after merge of the tty tree
Date: Thu, 23 Sep 2010 10:13:54 -0700
Message-ID: <20100923101354.0569ec05.rdunlap@xenotime.net>
References: <20100923142018.55019d59.sfr@canb.auug.org.au>
	<20100923141433.GC31738@kroah.com>
	<20100923081350.e028c4ac.rdunlap@xenotime.net>
	<20100923181212.422e76c1@lxorguk.ukuu.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from xenotime.net ([72.52.115.56]:35040 "HELO xenotime.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S1754795Ab0IWROA (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 23 Sep 2010 13:14:00 -0400
Received: from chimera.site ([173.50.240.230]) by xenotime.net for <linux-next@vger.kernel.org>; Thu, 23 Sep 2010 10:13:54 -0700
In-Reply-To: <20100923181212.422e76c1@lxorguk.ukuu.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: Greg KH <greg@kroah.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Alan Cox <alan@linux.intel.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, 23 Sep 2010 18:12:12 +0100 Alan Cox wrote:

> On Thu, 23 Sep 2010 08:13:50 -0700
> Randy Dunlap <rdunlap@xenotime.net> wrote:
> 
> > On Thu, 23 Sep 2010 07:14:33 -0700 Greg KH wrote:
> > 
> > > On Thu, Sep 23, 2010 at 02:20:18PM +1000, Stephen Rothwell wrote:
> > > > Hi Greg,
> > > > 
> > > > After merging the tty tree, today's linux-next build (x86_64
> > > > allmodconfig) failed like this:
> > > > 
> > > > drivers/char/ip2/ip2main.c:459: error: 'ip2_get_icount' undeclared here (not in a function)
> > > > 
> > > > Caused by commit 157be28e51ed476aa357c8718aaef4832f4da66b ("tty: icount
> > > > changeover for other main devices").
> > > > 
> > > > Please build test (especially the trivial "cut and paste" changes) ...
> > > > 
> > > > I have reverted that commit for today.
> > > 
> > > Ick, sorry about that.  Alan, care to send a fixup patch for this?
> > 
> > 
> > So developers and maintainers are not doing allmodconfig builds?
> > I can understand not doing randconfig builds.
> 
> drivers/staging/ti-st/st_kim.c:34:20: error: st_kim.h: No such file or
> directory
> 
> So there isn't actually much point trying allmodconfig builds (thats not
> the only fail either).

True.  But linux-next is mostly to test the merger of lots of trees.


BTW, all{mod,yes}config sets CONFIG_STAGING=y and CONFIG_STAGING_EXCLUDE_BUILD=y,
so the above shouldn't show up in an all*config build.

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
