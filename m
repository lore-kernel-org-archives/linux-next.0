From: Sedat Dilek <sedat.dilek@gmail.com>
Subject: Re: linux-next: Tree for Feb 4
Date: Thu, 5 Feb 2015 21:07:27 +0100
Message-ID: <CA+icZUUC7vD_FBUWV+WLBx2M-iXvR8E90zWGxmUWQcdmbHiH2A@mail.gmail.com>
References: <20150205005716.GS5370@linux.vnet.ibm.com>
	<CA+icZUWvBDC0FHX-OXLpjnSBbZceam_9KRBq4tcOM1jpJk0emQ@mail.gmail.com>
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
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150205145816.7c38a7df@gandalf.local.home>
Sender: linux-kernel-owner@vger.kernel.org
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Paul McKenney <paulmck@linux.vnet.ibm.com>, Dave Hansen <dave@sr71.net>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Kristen Carlson Accardi <kristen@linux.intel.com>, "H. Peter Anvin" <hpa@linux.intel.com>, Rik van Riel <riel@redhat.com>, Mel Gorman <mgorman@suse.de>
List-Id: linux-next.vger.kernel.org

On Thu, Feb 5, 2015 at 8:58 PM, Steven Rostedt <rostedt@goodmis.org> wrote:
> On Thu, 5 Feb 2015 20:25:21 +0100
> Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
>> On Thu, Feb 5, 2015 at 7:45 PM, Paul E. McKenney
>> <paulmck@linux.vnet.ibm.com> wrote:
>> > On Thu, Feb 05, 2015 at 10:35:33AM -0800, Dave Hansen wrote:
>> >> On 02/05/2015 10:34 AM, Paul E. McKenney wrote:
>> >> >> >                               Did I actually need to be
>> >> >> > onlining/offlining CPUs to hit the splat that Sedat was reporting?
>> >> > Yep, you do need to offline at least one CPU to hit that splat.
>> >>
>> >> Heh, do we need a debugging mode that will randomly offline/online CPUs? :)
>> >
>> > For that, kernel/rcu/rcutorture.c and kernel/locking/locktorture.c
>> > are your friends.  ;-)
>> >
>> > The problem is that I only run RCU-relevant combinations of Kconfigs,
>> > which means that I missed the ones that Sedat used to find this problem.
>> > So I guess it is a good thing that others run -next testing.
>> >
>>
>> [ Revived by a voltaren resinat pill... ]
>>
>> I reverted "x86/mm: Omit switch_mm() tracing for offline CPUs"
>> ...and...
>> applied "tlb: Don't do trace_tlb_flush() on offline CPUs"
>> ...in my build-dir.
>
> Is this Paul's version of the patch or mine? If it is just mine, do you
> know if Paul's version triggers this too?
>

This one which entered Pauls rcu-next tree.

[1] http://git.kernel.org/cgit/linux/kernel/git/paulmck/linux-rcu.git/commit/?h=rcu/next&id=2b27cf7317d8a99a50bead9faccd54b46b6f0c41

>> ( I did not build from scratch but re-invoking make "updated" the
>> files touched by Steven's patch, see attached build-log. )
>>
>> Unfortunately, the call-trace remains when doing an offlining of cpu1.
>> ( It's good to see it's reproducible. )
>
> Was the tracepoint enabled? Or was there some other rcu call that
> triggered this. Or would cpu_online(smp_processor_id()) return true at
> this point?
>

Thanks Steve for jumping into this one!

Good point.
I looked at my kernel-config (which I already sent :-)).

Do I need to enable...?

# CONFIG_RCU_TRACE is not set

...or even more?

- Sedat -

> -- Steve
>
>>
>> root# echo 0 > /sys/devices/system/cpu/cpu1/online
>>
>> [  121.652796] intel_pstate CPU 1 exiting
>> [  121.666272]
>> [  121.666274] ===============================
>> [  121.666274] [ INFO: suspicious RCU usage. ]
>> [  121.666277] 3.19.0-rc7-next-20150204.7-iniza-small #4 Not tainted
>> [  121.666278] -------------------------------
>> [  121.666280] include/trace/events/tlb.h:37 suspicious
>> rcu_dereference_check() usage!
>> [  121.666281]
>> [  121.666281] other info that might help us debug this:
>> [  121.666281]
>> [  121.666282]
>> [  121.666282] RCU used illegally from offline CPU!
>> [  121.666282] rcu_scheduler_active = 1, debug_locks = 0
>> [  121.666283] no locks held by swapper/1/0.
>> [  121.666284]
>> [  121.666284] stack backtrace:
>> [  121.666287] CPU: 1 PID: 0 Comm: swapper/1 Not tainted
>> 3.19.0-rc7-next-20150204.7-iniza-small #4
>> [  121.666288] Hardware name: SAMSUNG ELECTRONICS CO., LTD.
>> 530U3BI/530U4BI/530U4BH/530U3BI/530U4BI/530U4BH, BIOS 13XK 03/28/2013
>> [  121.666293]  0000000000000001 ffff88011a44fe18 ffffffff817e39cd
>> 0000000000000011
>> [  121.666296]  ffff88011a448290 ffff88011a44fe48 ffffffff810d6af7
>> ffff8800d3dfaac0
>> [  121.666299]  0000000000000001 ffffffff81d32ce0 0000000000000005
>> ffff88011a44fe78
>> [  121.666300] Call Trace:
>> [  121.666308]  [<ffffffff817e39cd>] dump_stack+0x4c/0x65
>> [  121.666313]  [<ffffffff810d6af7>] lockdep_rcu_suspicious+0xe7/0x120
>> [  121.666318]  [<ffffffff810b73f9>] idle_task_exit+0x1c9/0x260
>> [  121.666322]  [<ffffffff81054c4e>] play_dead_common+0xe/0x50
>> [  121.666325]  [<ffffffff81054ca5>] native_play_dead+0x15/0x140
>> [  121.666330]  [<ffffffff8102963f>] arch_cpu_idle_dead+0xf/0x20
>> [  121.666333]  [<ffffffff810cdb4e>] cpu_startup_entry+0x37e/0x580
>> [  121.666336]  [<ffffffff81053e20>] start_secondary+0x140/0x150
>> [  121.666744] smpboot: CPU 1 is now offline
>>
>> >From rcu point this is now safe?
>> But another area (linux-pm?) is still affected?
>> I will try to test "vanilla" pm-next if the problem exists with
>> intel_pstate as suggested by Rafael.
>> Hmmm, not sure how I can get the pm-next code which went into
>> next-20150204 as linux-pm.git#linux-next was feeded with new stuff.
>>
>>
>> - Sedat -
>
