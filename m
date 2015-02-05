From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: linux-next: Tree for Feb 4
Date: Thu, 5 Feb 2015 18:11:41 -0500
Message-ID: <20150205181141.6f1d532a@gandalf.local.home>
References: <20150205005716.GS5370@linux.vnet.ibm.com>
	<20150205015144.GT5370@linux.vnet.ibm.com>
	<CA+icZUUHBh-voBUfYEwajL7upnj3SJC47zJN-WnRW_7tnEnQsA@mail.gmail.com>
	<54D3186F.7030500@sr71.net>
	<20150205130343.6ac0eda9@gandalf.local.home>
	<20150205130802.289a8be0@gandalf.local.home>
	<54D3B253.3050000@sr71.net>
	<20150205183412.GI5370@linux.vnet.ibm.com>
	<54D3B7F5.9070209@sr71.net>
	<20150205184537.GJ5370@linux.vnet.ibm.com>
	<CA+icZUX_fi-O3kXymLCPfJ8Sx0yG=m5=pWzJDJpu-iHTyjM78Q@mail.gmail.com>
	<20150205145816.7c38a7df@gandalf.local.home>
	<CA+icZUUC7vD_FBUWV+WLBx2M-iXvR8E90zWGxmUWQcdmbHiH2A@mail.gmail.com>
	<20150205152201.49d55905@gandalf.local.home>
	<CA+icZUV9SeWKrWN6Q8-Us-VpOgaz2sXX-RT2he4rwJmOzGQjOw@mail.gmail.com>
	<CA+icZUXkv2JV0kurGdvOPPavyrY2hb9rjTZ1yQn13gai=qobcw@mail.gmail.com>
	<20150205170952.525bdee6@gandalf.local.home>
	<CA+icZUX_f_M7EmV3OM_CeosjfqoMSkJrCgUBm0LKFFurFGRvGQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtprelay0237.hostedemail.com ([216.40.44.237]:60606 "EHLO
	smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1750971AbbBEXLo (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 5 Feb 2015 18:11:44 -0500
In-Reply-To: <CA+icZUX_f_M7EmV3OM_CeosjfqoMSkJrCgUBm0LKFFurFGRvGQ@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sedat Dilek <sedat.dilek@gmail.com>
Cc: Paul McKenney <paulmck@linux.vnet.ibm.com>, Dave Hansen <dave@sr71.net>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Kristen Carlson Accardi <kristen@linux.intel.com>, "H. Peter Anvin" <hpa@linux.intel.com>, Rik van Riel <riel@redhat.com>, Mel Gorman <mgorman@suse.de>

On Thu, 5 Feb 2015 23:16:21 +0100
Sedat Dilek <sedat.dilek@gmail.com> wrote:

> On Thu, Feb 5, 2015 at 11:09 PM, Steven Rostedt <rostedt@goodmis.org> wrote:
> > On Thu, 5 Feb 2015 22:45:59 +0100
> > Sedat Dilek <sedat.dilek@gmail.com> wrote:
> >
> >> Steve, this was a typo it's called tlb_flush not tlb_flush*ed*:
> >
> > Heh, yeah, I typed that entire line in by hand. Just be lucky that was
> > the only typo ;-)
> >
> >>
> >> # cat /sys/kernel/debug/tracing/events/tlb/tlb_flush/enable
> >> 1
> >>
> >> [  391.090381] intel_pstate CPU 1 exiting
> >> [  391.104491] smpboot: CPU 1 is now offline
> >>
> >
> > Now, if you disable that (echo 0 to that file), do you still get the
> > rcu lockdep splat if you suspend and resume?
> >
> 
> YES, I get the call-trace again!
> 

Bah! I see where the warning comes from. In include/linux/tracepoint.h
we have:

#define __DECLARE_TRACE(name, proto, args, cond, data_proto, data_args) \
	extern struct tracepoint __tracepoint_##name;			\
	static inline void trace_##name(proto)				\
	{								\
		if (static_key_false(&__tracepoint_##name.key))		\
			__DO_TRACE(&__tracepoint_##name,		\
				TP_PROTO(data_proto),			\
				TP_ARGS(data_args),			\
				TP_CONDITION(cond),,);			\
		if (IS_ENABLED(CONFIG_LOCKDEP)) {			\
			rcu_read_lock_sched_notrace();			\
			rcu_dereference_sched(__tracepoint_##name.funcs);\
			rcu_read_unlock_sched_notrace();		\
		}							\
	}								\

See that if (IS_ENABLED(CONFIG_LOCKDEP))?

I'm recalling this. Because tracepoints require RCU, and RCU lockdep
doesn't trigger if a tracepoint isn't enabled (because the rcu calls
are hidden in the __DO_TRACE() behind that static_key_false), we would
be missing lots of rcu problem tracepoints because tests were run
without them enabled.

The answer was to add this rcu check when LOCKDEP was enabled. So no,
adding that conditional isn't going to help, because lockdep will
trigger here, even if it were safe because of the conditional :-/.

That said, let's add this (on top of the old patch):

(again, not tested)

Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
-------
diff --git a/arch/x86/include/asm/mmu_context.h b/arch/x86/include/asm/mmu_context.h
index 4b75d591eb5e..401b5bfbcdbd 100644
--- a/arch/x86/include/asm/mmu_context.h
+++ b/arch/x86/include/asm/mmu_context.h
@@ -47,7 +47,12 @@ static inline void switch_mm(struct mm_struct *prev, struct mm_struct *next,
 
 		/* Re-load page tables */
 		load_cr3(next->pgd);
-		trace_tlb_flush(TLB_FLUSH_ON_TASK_SWITCH, TLB_FLUSH_ALL);
+		/*
+		 * Do not check rcu when tracing is not enabled. The
+		 * tracepoint has a condition to not trace if the CPU is
+		 * offline, and rcu check will complain if it is.
+		 */
+		trace_tlb_flush_rcu_nocheck(TLB_FLUSH_ON_TASK_SWITCH, TLB_FLUSH_ALL);
 
 		/* Stop flush ipis for the previous mm */
 		cpumask_clear_cpu(cpu, mm_cpumask(prev));
@@ -84,7 +89,13 @@ static inline void switch_mm(struct mm_struct *prev, struct mm_struct *next,
 			 * to make sure to use no freed page tables.
 			 */
 			load_cr3(next->pgd);
-			trace_tlb_flush(TLB_FLUSH_ON_TASK_SWITCH, TLB_FLUSH_ALL);
+			/*
+			 * Do not check rcu when tracing is not enabled. The
+			 * tracepoint has a condition to not trace if the CPU is
+			 * offline, and rcu check will complain if it is.
+			 */
+			trace_tlb_flush_rcu_nocheck(TLB_FLUSH_ON_TASK_SWITCH,
+						    TLB_FLUSH_ALL);
 			load_LDT_nolock(&next->context);
 		}
 	}
diff --git a/include/linux/tracepoint.h b/include/linux/tracepoint.h
index e08e21e5f601..747a05aceb60 100644
--- a/include/linux/tracepoint.h
+++ b/include/linux/tracepoint.h
@@ -179,6 +179,14 @@ extern void syscall_unregfunc(void);
 			rcu_read_unlock_sched_notrace();		\
 		}							\
 	}								\
+	static inline void trace_##name##_rcu_nocheck(proto)		\
+	{								\
+		if (static_key_false(&__tracepoint_##name.key))		\
+			__DO_TRACE(&__tracepoint_##name,		\
+				TP_PROTO(data_proto),			\
+				TP_ARGS(data_args),			\
+				TP_CONDITION(cond),,);			\
+	}								\
 	__DECLARE_TRACE_RCU(name, PARAMS(proto), PARAMS(args),		\
 		PARAMS(cond), PARAMS(data_proto), PARAMS(data_args))	\
 	static inline int						\
@@ -230,6 +238,8 @@ extern void syscall_unregfunc(void);
 #define __DECLARE_TRACE(name, proto, args, cond, data_proto, data_args) \
 	static inline void trace_##name(proto)				\
 	{ }								\
+	static inline void trace_##name##_rcu_nocheck(proto)		\
+	{ }								\
 	static inline void trace_##name##_rcuidle(proto)		\
 	{ }								\
 	static inline int						\
