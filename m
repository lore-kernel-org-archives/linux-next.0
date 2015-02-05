From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: linux-next: Tree for Feb 4
Date: Thu, 5 Feb 2015 13:03:43 -0500
Message-ID: <20150205130343.6ac0eda9@gandalf.local.home>
References: <20150204193535.58f132c5@canb.auug.org.au>
	<1511573.AlfExlvQsO@vostro.rjw.lan>
	<20150204215357.GL5370@linux.vnet.ibm.com>
	<11131483.LrRNxJumiL@vostro.rjw.lan>
	<20150204235115.GP5370@linux.vnet.ibm.com>
	<20150205001019.GA12362@linux.vnet.ibm.com>
	<CA+icZUUPKNR1ua49NLVGv0i_gu9ZkVrReP_dgAWm8RPVY8Nr+w@mail.gmail.com>
	<20150205005716.GS5370@linux.vnet.ibm.com>
	<CA+icZUWvBDC0FHX-OXLpjnSBbZceam_9KRBq4tcOM1jpJk0emQ@mail.gmail.com>
	<20150205015144.GT5370@linux.vnet.ibm.com>
	<CA+icZUUHBh-voBUfYEwajL7upnj3SJC47zJN-WnRW_7tnEnQsA@mail.gmail.com>
	<54D3186F.7030500@sr71.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <54D3186F.7030500@sr71.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Dave Hansen <dave@sr71.net>
Cc: sedat.dilek@gmail.com, Paul McKenney <paulmck@linux.vnet.ibm.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Kristen Carlson Accardi <kristen@linux.intel.com>, "H. Peter Anvin" <hpa@linux.intel.com>, Rik van Riel <riel@redhat.com>, Mel Gorman <mgorman@suse.de>
List-Id: linux-next.vger.kernel.org

On Wed, 04 Feb 2015 23:14:55 -0800
Dave Hansen <dave@sr71.net> wrote:

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

Note, we can move the check into the code that enables or disables
trace points. I believe, the rcu part of a tracepoint is only the call
to the callbacks. The jump_label part should be safe outside of rcu.

In that case, instead, have this, which does exactly the same thing
without having any overhead of the branch when tracing is disabled:

(not tested)

Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
diff --git a/include/trace/events/tlb.h b/include/trace/events/tlb.h
index 13391d288107..040c1cdfe6d1 100644
--- a/include/trace/events/tlb.h
+++ b/include/trace/events/tlb.h
@@ -13,11 +13,13 @@
 	{ TLB_LOCAL_SHOOTDOWN,		"local shootdown" },		\
 	{ TLB_LOCAL_MM_SHOOTDOWN,	"local mm shootdown" }
 
-TRACE_EVENT(tlb_flush,
+TRACE_EVENT_CONDITION(tlb_flush,
 
 	TP_PROTO(int reason, unsigned long pages),
 	TP_ARGS(reason, pages),
 
+	TP_CONDITION(cpu_online(smp_processor_id()),
+
 	TP_STRUCT__entry(
 		__field(	  int, reason)
 		__field(unsigned long,  pages)
