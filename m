From: "Paul E. McKenney" <paulmck@linux.ibm.com>
Subject: Re: linux-next: build failure after merge of the ipmi tree
Date: Wed, 3 Apr 2019 17:14:35 -0700
Message-ID: <20190404001435.GC14111@linux.ibm.com>
References: <20190403143323.156ac503@canb.auug.org.au>
 <20190403202728.GD2479@minyard.net>
 <20190403211212.GE2479@minyard.net>
Reply-To: paulmck@linux.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190403211212.GE2479@minyard.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Corey Minyard <cminyard@mvista.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
List-Id: linux-next.vger.kernel.org

On Wed, Apr 03, 2019 at 04:12:12PM -0500, Corey Minyard wrote:
> On Wed, Apr 03, 2019 at 03:27:29PM -0500, Corey Minyard wrote:
> > On Wed, Apr 03, 2019 at 02:33:23PM +1100, Stephen Rothwell wrote:
> > > Hi Corey,
> > > 
> > > After merging the ipmi tree, today's linux-next build (x86_64
> > > allmodconfig) failed like this:
> > 
> > Paul, any opinions on this?  Is just running this in a workqueue
> > the best idea?
> 
> Well, I just that patch using a work item and pushed it up.  Seems
> to work ok.  That was already done for other things in the driver.

Sounds good to me, apologies for the slow response.

							Thanx, Paul

> > -corey
> > 
> > > 
> > > drivers/char/ipmi/ipmi_msghandler.c: In function 'free_user':
> > > drivers/char/ipmi/ipmi_msghandler.c:1268:2: error: implicit declaration of function 'cleanup_srcu_struct_quiesced'; did you mean 'cleanup_srcu_struct'? [-Werror=implicit-function-declaration]
> > >   cleanup_srcu_struct_quiesced(&user->release_barrier);
> > >   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > >   cleanup_srcu_struct
> > > 
> > > Caused by commit
> > > 
> > >   487ecb21fa66 ("ipmi: fix sleep-in-atomic in free_user at cleanup SRCU user->release_barrier")
> > > 
> > > interacting with commit
> > > 
> > >   f5ad3991493c ("srcu: Remove cleanup_srcu_struct_quiesced()")
> > > 
> > > from the rcu tree.
> > > 
> > > Based on the comments in the rcu tree commit, I have reverted the impi
> > > tree commit for today.
> > > 
> > > -- 
> > > Cheers,
> > > Stephen Rothwell
> > 
> > 
> 
