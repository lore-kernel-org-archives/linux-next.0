From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: linux-next: Tree for Feb 4
Date: Thu, 5 Feb 2015 08:58:20 -0800
Message-ID: <20150205165819.GY5370@linux.vnet.ibm.com>
References: <11131483.LrRNxJumiL@vostro.rjw.lan>
 <20150204235115.GP5370@linux.vnet.ibm.com>
 <20150205001019.GA12362@linux.vnet.ibm.com>
 <CA+icZUUPKNR1ua49NLVGv0i_gu9ZkVrReP_dgAWm8RPVY8Nr+w@mail.gmail.com>
 <20150205005716.GS5370@linux.vnet.ibm.com>
 <CA+icZUWvBDC0FHX-OXLpjnSBbZceam_9KRBq4tcOM1jpJk0emQ@mail.gmail.com>
 <20150205015144.GT5370@linux.vnet.ibm.com>
 <CA+icZUUHBh-voBUfYEwajL7upnj3SJC47zJN-WnRW_7tnEnQsA@mail.gmail.com>
 <54D3186F.7030500@sr71.net>
 <CA+icZUX0iVY-Ng0xk6+4Du=2g5D1CudT54Y_ynmJkFA7dhWLHQ@mail.gmail.com>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CA+icZUX0iVY-Ng0xk6+4Du=2g5D1CudT54Y_ynmJkFA7dhWLHQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sedat Dilek <sedat.dilek@gmail.com>
Cc: Dave Hansen <dave@sr71.net>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Kristen Carlson Accardi <kristen@linux.intel.com>, "H. Peter Anvin" <hpa@linux.intel.com>, Rik van Riel <riel@redhat.com>, Mel Gorman <mgorman@suse.de>, Steven Rostedt <rostedt@goodmis.org>
List-Id: linux-next.vger.kernel.org

On Thu, Feb 05, 2015 at 03:57:12PM +0100, Sedat Dilek wrote:
> On Thu, Feb 5, 2015 at 8:14 AM, Dave Hansen <dave@sr71.net> wrote:
> > On 02/04/2015 05:53 PM, Sedat Dilek wrote:
> >> The architecture-specific switch_mm() function can be called by offline
> >> CPUs, but includes event tracing, which cannot be legally carried out
> >> on offline CPUs.  This results in a lockdep-RCU splat.  This commit fixes
> >> this splat by omitting the tracing when the CPU is offline.
> > ...
> >>>> >> >                 load_cr3(next->pgd);
> >>>> >> > -               trace_tlb_flush(TLB_FLUSH_ON_TASK_SWITCH, TLB_FLUSH_ALL);
> >>>> >> > +               if (cpu_online(smp_processor_id()))
> >>>> >> > +                       trace_tlb_flush(TLB_FLUSH_ON_TASK_SWITCH, TLB_FLUSH_ALL);
> >
> > Is this, perhaps, something that we should be doing in the generic trace
> > code so that all of the trace users don't have to worry about it?  Also,
> > this patch will add overhead to the code when tracing is off.  It would
> > be best if we could manage to make the cpu_online() check only in the
> > cases where the tracepoint is on.
> 
> Hi Dave,
> 
> thanks for your feedback.
> 
> I have just seen that I again see the call-trace.

When you get well, could you please send that call trace?

> Maybe you can discuss with Paul and others or offer a proposal patch.

The other possibility is to have a CONFIG_ARCH_DYING_IDLE or some such
that allows this particular flavor of x86 to invoke the CPU_DYING_IDLE
from after the call to switch_mm().  Dave, does that make sense?

My guess would be that there should be a cpu_dying_idle_generic() invoked
from cpu_idle_loop(), and a cpu_dying_idle_native() invoked at the end
of idle_task_exit().  Or can I get away with just moving the current
rcu_notify_cpu() call from cpu_idle_loop() to the end of idle_task_exit()?

A quick look at the calls to idle_task_exit() makes this look plausible.
There are a number of calls to printk() and to complete() that need help,
but that is a pre-existing issue in any case, as both these code paths
have RCU readers that are having no effect on offline CPUs.

Dave, thoughts?

> I should really do something for my recovery (influenza).
> Instead of laying lazy in my bed I thought to update my Linux kernels
> and graphics driver stack which made me happy.

Get well, being sick is bad for your health!  ;-)

							Thanx, Paul

> Regards,
> - Sedat -
> 
