From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: linux-next: Tree for Aug 22
Date: Tue, 22 Aug 2017 12:36:20 -0700
Message-ID: <20170822193620.GA7752@linux.vnet.ibm.com>
References: <20170822183816.7925e0f8@canb.auug.org.au>
 <20170823041117.780097f7@canb.auug.org.au>
 <20170823041424.1dddeb2d@canb.auug.org.au>
 <20170822185923.GE11320@linux.vnet.ibm.com>
 <20170823051216.34f2c09f@canb.auug.org.au>
 <20170822193231.GF11320@linux.vnet.ibm.com>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170822193231.GF11320@linux.vnet.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ppc-dev <linuxppc-dev@lists.ozlabs.org>, Nicholas Piggin <npiggin@gmail.com>
List-Id: linux-next.vger.kernel.org

On Tue, Aug 22, 2017 at 12:32:31PM -0700, Paul E. McKenney wrote:
> On Wed, Aug 23, 2017 at 05:12:16AM +1000, Stephen Rothwell wrote:
> > Hi Paul,
> > 
> > On Tue, 22 Aug 2017 11:59:23 -0700 "Paul E. McKenney" <paulmck@linux.vnet.ibm.com> wrote:
> > >
> > > On Wed, Aug 23, 2017 at 04:14:24AM +1000, Stephen Rothwell wrote:
> > > > Hi all,
> > > > 
> > > > On Wed, 23 Aug 2017 04:11:17 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:  
> > > > >
> > > > > This tree fails to boot on my qemu test.  2 boot logs attached.
> > > > > 
> > > > > Paul, Nick, is this the same/similar to the other RCU/lockup bug you
> > > > > are chasing.  This is the first time I have seen this failure.
> > > > > 
> > > > > This qemu boot is in full emulation mode if I add --enable-kvm to the
> > > > > qemu command, it does not fail to boot.  (the test just boots and then shuts down)  
> > > > 
> > > > Boot logs attached this time.  
> > > 
> > > That does not look good!
> > > 
> > > Given that the hard lockup happened during timer lock acquisition, I
> > > have to ask if you built with lockdep...
> > 
> > $ grep LOCKDEP .config
> > CONFIG_LOCKDEP_SUPPORT=y
> > 
> > so, no.  This is just a powerpc pseries_le_defconfig build.
> 
> This is without Nick's recent patch, I am guessing?
> 
> Hmmm...  My testing of that patch omitted lockdep as well.  Rerunning
> on the full set of rcutorture scenarios...

To complete the thought, if you aren't already using it, I suggest
applying Nick's patch:

http://lkml.kernel.org/r/20170822084348.21436-1-npiggin@gmail.com

							Thanx, Paul
