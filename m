From: Sedat Dilek <sedat.dilek@gmail.com>
Subject: Re: linux-next: Tree for Feb 4
Date: Thu, 5 Feb 2015 21:50:55 +0100
Message-ID: <CA+icZUV9SeWKrWN6Q8-Us-VpOgaz2sXX-RT2he4rwJmOzGQjOw@mail.gmail.com>
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
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150205152201.49d55905@gandalf.local.home>
Sender: linux-kernel-owner@vger.kernel.org
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Paul McKenney <paulmck@linux.vnet.ibm.com>, Dave Hansen <dave@sr71.net>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Kristen Carlson Accardi <kristen@linux.intel.com>, "H. Peter Anvin" <hpa@linux.intel.com>, Rik van Riel <riel@redhat.com>, Mel Gorman <mgorman@suse.de>
List-Id: linux-next.vger.kernel.org

On Thu, Feb 5, 2015 at 9:22 PM, Steven Rostedt <rostedt@goodmis.org> wrote:
> On Thu, 5 Feb 2015 21:07:27 +0100
> Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
>> > Is this Paul's version of the patch or mine? If it is just mine, do you
>> > know if Paul's version triggers this too?
>> >
>>
>> This one which entered Pauls rcu-next tree.
>>
>> [1] http://git.kernel.org/cgit/linux/kernel/git/paulmck/linux-rcu.git/commit/?h=rcu/next&id=2b27cf7317d8a99a50bead9faccd54b46b6f0c41
>
> That's mine.
>
> It looks like the condition will be tested before it calls and rcu
> code. Which is why I was confused that it still gave a splat. Paul
> posted a patch before this that did the check outside the trace point.
>
> This one:
>
>  http://marc.info/?l=linux-kernel&m=142310961217650&w=2
>
>>
>> >> ( I did not build from scratch but re-invoking make "updated" the
>> >> files touched by Steven's patch, see attached build-log. )
>> >>
>> >> Unfortunately, the call-trace remains when doing an offlining of cpu1.
>> >> ( It's good to see it's reproducible. )
>> >
>> > Was the tracepoint enabled? Or was there some other rcu call that
>> > triggered this. Or would cpu_online(smp_processor_id()) return true at
>> > this point?
>> >
>>
>> Thanks Steve for jumping into this one!
>>
>> Good point.
>> I looked at my kernel-config (which I already sent :-)).
>>
>> Do I need to enable...?
>>
>> # CONFIG_RCU_TRACE is not set
>>
>> ...or even more?
>>
>
> What I meant by the tracepoint being enabled, was not that it was
> configured in (I'm assuming it was), but that you started tracing?
>
>  echo 1 > /sys/kernel/debug/tracing/events/enable
>
> or
>
>  echo 1 > /sys/kernel/debug/tracing/events/tlb/tlb_flushed/enable
>

NO, I did not start any tracing before doing my testing.

# cat /sys/kernel/debug/tracing/events/enable
0

# echo 1 > /sys/kernel/debug/tracing/events/enable

# cat /sys/kernel/debug/tracing/events/enable
X

# LC_ALL=C cat /sys/kernel/debug/tracing/events/tlb/tlb_flushed/enable
cat: /sys/kernel/debug/tracing/events/tlb/tlb_flushed/enable: No such
file or directory

Looks like I need to enable...?

# CONFIG_DEBUG_TLBFLUSH is not set

To answer your question...

# cat /sys/devices/system/cpu/cpu1/online
1

# echo 0 > /sys/devices/system/cpu/cpu1/online

# cat /sys/devices/system/cpu/cpu1/online
0

[  375.337050] intel_pstate CPU 1 exiting
[  375.351069] smpboot: CPU 1 is now offline

So, this did not happen this time.

- Sedat -
