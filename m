From: Sedat Dilek <sedat.dilek@gmail.com>
Subject: Re: linux-next: Tree for Feb 4
Date: Thu, 5 Feb 2015 23:16:21 +0100
Message-ID: <CA+icZUX_f_M7EmV3OM_CeosjfqoMSkJrCgUBm0LKFFurFGRvGQ@mail.gmail.com>
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
	<CA+icZUUC7vD_FBUWV+WLBx2M-iXvR8E90zWGxmUWQcdmbHiH2A@mail.gmail.com>
	<20150205152201.49d55905@gandalf.local.home>
	<CA+icZUV9SeWKrWN6Q8-Us-VpOgaz2sXX-RT2he4rwJmOzGQjOw@mail.gmail.com>
	<CA+icZUXkv2JV0kurGdvOPPavyrY2hb9rjTZ1yQn13gai=qobcw@mail.gmail.com>
	<20150205170952.525bdee6@gandalf.local.home>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wg0-f47.google.com ([74.125.82.47]:61724 "EHLO
	mail-wg0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752712AbbBEWQX (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 5 Feb 2015 17:16:23 -0500
In-Reply-To: <20150205170952.525bdee6@gandalf.local.home>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Paul McKenney <paulmck@linux.vnet.ibm.com>, Dave Hansen <dave@sr71.net>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Kristen Carlson Accardi <kristen@linux.intel.com>, "H. Peter Anvin" <hpa@linux.intel.com>, Rik van Riel <riel@redhat.com>, Mel Gorman <mgorman@suse.de>

On Thu, Feb 5, 2015 at 11:09 PM, Steven Rostedt <rostedt@goodmis.org> wrote:
> On Thu, 5 Feb 2015 22:45:59 +0100
> Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
>> Steve, this was a typo it's called tlb_flush not tlb_flush*ed*:
>
> Heh, yeah, I typed that entire line in by hand. Just be lucky that was
> the only typo ;-)
>
>>
>> # cat /sys/kernel/debug/tracing/events/tlb/tlb_flush/enable
>> 1
>>
>> [  391.090381] intel_pstate CPU 1 exiting
>> [  391.104491] smpboot: CPU 1 is now offline
>>
>
> Now, if you disable that (echo 0 to that file), do you still get the
> rcu lockdep splat if you suspend and resume?
>

YES, I get the call-trace again!

# cat /sys/kernel/debug/tracing/events/tlb/tlb_flush/enable
0

# cat /sys/devices/system/cpu/cpu1/online
0

[ 2470.606222] intel_pstate CPU 1 exiting
[ 2470.628153]
[ 2470.628155] ===============================
[ 2470.628156] [ INFO: suspicious RCU usage. ]
[ 2470.628159] 3.19.0-rc7-next-20150204.9-iniza-small #1 Not tainted
[ 2470.628160] -------------------------------
[ 2470.628162] include/trace/events/tlb.h:37 suspicious
rcu_dereference_check() usage!
[ 2470.628163]
[ 2470.628163] other info that might help us debug this:
[ 2470.628163]
[ 2470.628164]
[ 2470.628164] RCU used illegally from offline CPU!
[ 2470.628164] rcu_scheduler_active = 1, debug_locks = 0
[ 2470.628165] no locks held by swapper/1/0.
[ 2470.628166]
[ 2470.628166] stack backtrace:
[ 2470.628169] CPU: 1 PID: 0 Comm: swapper/1 Not tainted
3.19.0-rc7-next-20150204.9-iniza-small #1
[ 2470.628171] Hardware name: SAMSUNG ELECTRONICS CO., LTD.
530U3BI/530U4BI/530U4BH/530U3BI/530U4BI/530U4BH, BIOS 13XK 03/28/2013
[ 2470.628176]  0000000000000001 ffff88011a44fe18 ffffffff817ecf4d
0000000000000011
[ 2470.628179]  ffff88011a448290 ffff88011a44fe48 ffffffff810d6b57
ffff8800cc2660c0
[ 2470.628182]  0000000000000001 ffffffff81d35160 0000000000000002
ffff88011a44fe78
[ 2470.628183] Call Trace:
[ 2470.628192]  [<ffffffff817ecf4d>] dump_stack+0x4c/0x65
[ 2470.628198]  [<ffffffff810d6b57>] lockdep_rcu_suspicious+0xe7/0x120
[ 2470.628203]  [<ffffffff810b7459>] idle_task_exit+0x1c9/0x260
[ 2470.628208]  [<ffffffff81054c4e>] play_dead_common+0xe/0x50
[ 2470.628211]  [<ffffffff81054ca5>] native_play_dead+0x15/0x140
[ 2470.628216]  [<ffffffff8102963f>] arch_cpu_idle_dead+0xf/0x20
[ 2470.628219]  [<ffffffff810cdbae>] cpu_startup_entry+0x37e/0x580
[ 2470.628222] smpboot: CPU 1 didn't die...
[ 2470.628224]  [<ffffffff81053e20>] start_secondary+0x140/0x150

- Sedat -
