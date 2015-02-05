From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: linux-next: Tree for Feb 4
Date: Thu, 5 Feb 2015 06:37:07 -0800
Message-ID: <20150205143707.GX5370@linux.vnet.ibm.com>
References: <20150204215357.GL5370@linux.vnet.ibm.com>
 <11131483.LrRNxJumiL@vostro.rjw.lan>
 <20150204235115.GP5370@linux.vnet.ibm.com>
 <20150205001019.GA12362@linux.vnet.ibm.com>
 <CA+icZUUPKNR1ua49NLVGv0i_gu9ZkVrReP_dgAWm8RPVY8Nr+w@mail.gmail.com>
 <20150205005716.GS5370@linux.vnet.ibm.com>
 <CA+icZUWvBDC0FHX-OXLpjnSBbZceam_9KRBq4tcOM1jpJk0emQ@mail.gmail.com>
 <20150205015144.GT5370@linux.vnet.ibm.com>
 <CA+icZUUHBh-voBUfYEwajL7upnj3SJC47zJN-WnRW_7tnEnQsA@mail.gmail.com>
 <54D3186F.7030500@sr71.net>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <54D3186F.7030500@sr71.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Dave Hansen <dave@sr71.net>
Cc: sedat.dilek@gmail.com, "Rafael J. Wysocki" <rjw@rjwysocki.net>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Kristen Carlson Accardi <kristen@linux.intel.com>, "H. Peter Anvin" <hpa@linux.intel.com>, Rik van Riel <riel@redhat.com>, Mel Gorman <mgorman@suse.de>, Steven Rostedt <rostedt@goodmis.org>
List-Id: linux-next.vger.kernel.org

On Wed, Feb 04, 2015 at 11:14:55PM -0800, Dave Hansen wrote:
> On 02/04/2015 05:53 PM, Sedat Dilek wrote:
> > The architecture-specific switch_mm() function can be called by offline
> > CPUs, but includes event tracing, which cannot be legally carried out
> > on offline CPUs.  This results in a lockdep-RCU splat.  This commit fixes
> > this splat by omitting the tracing when the CPU is offline.
> ...
> >>> >> >                 load_cr3(next->pgd);
> >>> >> > -               trace_tlb_flush(TLB_FLUSH_ON_TASK_SWITCH, TLB_FLUSH_ALL);
> >>> >> > +               if (cpu_online(smp_processor_id()))
> >>> >> > +                       trace_tlb_flush(TLB_FLUSH_ON_TASK_SWITCH, TLB_FLUSH_ALL);
> 
> Is this, perhaps, something that we should be doing in the generic trace
> code so that all of the trace users don't have to worry about it?  Also,
> this patch will add overhead to the code when tracing is off.  It would
> be best if we could manage to make the cpu_online() check only in the
> cases where the tracepoint is on.

I considered doing this in the _rcuidle piece of the trace code, but
unlike the RCU idle exit/entry in the _rcuidle stuff, the work required
to get through the RCU online/offline code is pretty heavyweight.
You end up having 16 CPUs contending for an rcu_node lock, for example.

But maybe you are instead suggesting pushing only the cpu_online() check
into the trace infrastructure.  If so, fair point, and I will take a
look at this.

							Thanx, Paul
