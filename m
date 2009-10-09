From: Hollis Blanchard <hollisb@us.ibm.com>
Subject: Re: linux-next: tree build failure
Date: Fri, 09 Oct 2009 12:14:08 -0700
Message-ID: <1255115648.2546.71.camel@slab.beaverton.ibm.com>
References: <4AC1E15502000078000516B5@vpn.id2.novell.com>
	<1254267572.15622.1621.camel@slab.beaverton.ibm.com>
	<4AC318450200007800017355@vpn.id2.novell.com>
	<1254498517.3839.17.camel@slab.beaverton.ibm.com>
	<4AC9B5310200007800017EA1@vpn.id2.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <4AC9B5310200007800017EA1@vpn.id2.novell.com>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org
To: Jan Beulich <JBeulich@novell.com>
Cc: sfr@canb.auug.org.au, Rusty Russell <rusty@rustcorp.com.au>, linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org, linux-next@vger.kernel.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
List-Id: linux-next.vger.kernel.org

Rusty's version of BUILD_BUG_ON() does indeed fix the build break, and
also exposes the bug in kvmppc_account_exit_stat(). So to recap:

original: built but didn't work
Jan's: doesn't build
Rusty's: builds and works

Where do you want to go from here?

-- 
Hollis Blanchard
IBM Linux Technology Center

On Mon, 2009-10-05 at 07:58 +0100, Jan Beulich wrote:
> >>> Hollis Blanchard <hollisb@us.ibm.com> 02.10.09 17:48 >>>
> >On Wed, 2009-09-30 at 07:35 +0100, Jan Beulich wrote:
> >> The one Rusty suggested the other day may help here. I don't like it
> >> as a drop-in replacement for BUILD_BUG_ON() though (due to it
> >> deferring the error generated to the linking stage), I'd rather view
> >> this as an improvement to MAYBE_BUILD_BUG_ON() (which should
> >> then be used here).
> >
> >Can you be more specific?
> >
> >I have no idea what Rusty suggested where. I can't even guess what
> 
> I'm attaching Rusty's response I was referring to.
> 
> >MAYBE_BUILD_BUG_ON() is supposed to do (sounds like a terrible name).
> 
> Agreed - but presumably better than just deleting the bogus instances
> altogether...
> 
> Jan
> email message attachment
> > -------- Forwarded Message --------
> > From: Rusty Russell <rusty@rustcorp.com.au>
> > To: Jan Beulich <JBeulich@novell.com>
> > Cc: linux-kernel@vger.kernel.org
> > Subject: Re: [PATCH] fix BUILD_BUG_ON() and a couple of bogus uses
> > of it
> > Date: Wed, 23 Sep 2009 10:27:00 +0930
> > 
> > On Wed, 19 Aug 2009 01:29:25 am Jan Beulich wrote:
> > > gcc permitting variable length arrays makes the current construct
> > > used for BUILD_BUG_ON() useless, as that doesn't produce any diagnostic
> > > if the controlling expression isn't really constant. Instead, this
> > > patch makes it so that a bit field gets used here. Consequently, those
> > > uses where the condition isn't really constant now also need fixing.
> > > 
> > > Note that in the gfp.h, kmemcheck.h, and virtio_config.h cases
> > > MAYBE_BUILD_BUG_ON() really just serves documentation purposes - even
> > > if the expression is compile time constant (__builtin_constant_p()
> > > yields true), the array is still deemed of variable length by gcc, and
> > > hence the whole expression doesn't have the intended effect.
> > > 
> > > Signed-off-by: Jan Beulich <jbeulich@novell.com>
> > 
> > We used to use an undefined symbol here; diagnostics are worse but it catches
> > more stuff.
> > 
> > Perhaps a hybrid is the way to go?
> > 
> > #ifndef __OPTIMIZE__
> > #define BUILD_BUG_ON(condition) ((void)sizeof(char[1 - 2*!!(condition)]))
> > #else
> > /* If it's a constant, catch it at compile time, otherwise at link time. */
> > extern int __build_bug_on_failed;
> > #define BUILD_BUG_ON(condition) \
> > 	do { 								\
> > 		((void)sizeof(char[1 - 2*!!(condition)]));		\
> > 		if (condition) __build_bug_on_failed = 1;		\
> > 	} while(0)
> > #endif
> > 
> > Thanks,
> > Rusty.
