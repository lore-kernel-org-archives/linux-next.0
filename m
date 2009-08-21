From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH 00/14] kconfig: streamline distro configs for testers
Date: Fri, 21 Aug 2009 11:08:18 -0400 (EDT)
Message-ID: <alpine.DEB.2.00.0908211106560.16405@gandalf.stny.rr.com>
References: <20090819025634.987354707@goodmis.org> <20090820143025.7134930f.akpm@linux-foundation.org> <alpine.DEB.2.00.0908201741370.16405@gandalf.stny.rr.com> <20090820151326.b43038ce.akpm@linux-foundation.org> <20090821135249.GB30346@elte.hu>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S932426AbZHUPIU@vger.kernel.org>
In-Reply-To: <20090821135249.GB30346@elte.hu>
Sender: linux-kernel-owner@vger.kernel.org
To: Ingo Molnar <mingo@elte.hu>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, tglx@linutronix.de, peterz@infradead.org, torvalds@linux-foundation.org, tytso@mit.edu, arjan@infradead.org, greg@kroah.com, mcgrof@gmail.com, zippel@linux-m68k.org, linux-kbuild@vger.kernel.org, sam@ravnborg.org, corbet@lwn.net, sourcejedi.lkml@googlemail.com, andi@firstfloor.org, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org


On Fri, 21 Aug 2009, Ingo Molnar wrote:

> 
> * Andrew Morton <akpm@linux-foundation.org> wrote:
> 
> > On Thu, 20 Aug 2009 17:43:38 -0400 (EDT)
> > Steven Rostedt <rostedt@goodmis.org> wrote:
> > 
> > > > 
> > > > > The following patches are in:
> > > > > 
> > > > >   git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-2.6-trace.git
> > > > > 
> > > > >     branch: kconfig
> > > > 
> > > > Sam's been quiet lately.  I suggest that you add this to linux-next
> > > > now so people get a chance to poke at it.
> > > 
> > > I have no means of pushing into next. Would someone like to do a pull for 
> > > me?
> > 
> > If suitably bribed, Stephen will add you tree directly to the 
> > linux-nxt lineup.
> 
> Yep, we always needed another kconfig maintainer (Sam's being mostly 
> busy with kbuild), and it's nice to see that Steve volunteered for 
> that job now! ;-)

Sure why not?

I've created a new repo:

git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-2.6-kconfig.git

and the same changes are in the branch: for-next

I still need to do the testing.

-- Steve
