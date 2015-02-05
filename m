From: Sedat Dilek <sedat.dilek@gmail.com>
Subject: Re: linux-next: Tree for Feb 4
Date: Thu, 5 Feb 2015 22:45:59 +0100
Message-ID: <CA+icZUXkv2JV0kurGdvOPPavyrY2hb9rjTZ1yQn13gai=qobcw@mail.gmail.com>
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
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wi0-f177.google.com ([209.85.212.177]:55065 "EHLO
	mail-wi0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751739AbbBEVqB (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 5 Feb 2015 16:46:01 -0500
In-Reply-To: <CA+icZUV9SeWKrWN6Q8-Us-VpOgaz2sXX-RT2he4rwJmOzGQjOw@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Paul McKenney <paulmck@linux.vnet.ibm.com>, Dave Hansen <dave@sr71.net>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Kristen Carlson Accardi <kristen@linux.intel.com>, "H. Peter Anvin" <hpa@linux.intel.com>, Rik van Riel <riel@redhat.com>, Mel Gorman <mgorman@suse.de>

[...]
>>> >> Unfortunately, the call-trace remains when doing an offlining of cpu1.
>>> >> ( It's good to see it's reproducible. )
>>> >
>>> > Was the tracepoint enabled? Or was there some other rcu call that
>>> > triggered this. Or would cpu_online(smp_processor_id()) return true at
>>> > this point?
>>> >
>>>
>>> Thanks Steve for jumping into this one!
>>>
>>> Good point.
>>> I looked at my kernel-config (which I already sent :-)).
>>>
>>> Do I need to enable...?
>>>
>>> # CONFIG_RCU_TRACE is not set
>>>
>>> ...or even more?
>>>
>>
>> What I meant by the tracepoint being enabled, was not that it was
>> configured in (I'm assuming it was), but that you started tracing?
>>
>>  echo 1 > /sys/kernel/debug/tracing/events/enable
>>
>> or
>>
>>  echo 1 > /sys/kernel/debug/tracing/events/tlb/tlb_flushed/enable
>>
>
> NO, I did not start any tracing before doing my testing.
>
> # cat /sys/kernel/debug/tracing/events/enable
> 0
>
> # echo 1 > /sys/kernel/debug/tracing/events/enable
>
> # cat /sys/kernel/debug/tracing/events/enable
> X
>
> # LC_ALL=C cat /sys/kernel/debug/tracing/events/tlb/tlb_flushed/enable
> cat: /sys/kernel/debug/tracing/events/tlb/tlb_flushed/enable: No such
> file or directory
>
> Looks like I need to enable...?
>
> # CONFIG_DEBUG_TLBFLUSH is not set
>

Here my new kernel-config (not sure if I really need them to be enabled):

$ ./scripts/diffconfig
/boot/config-3.19.0-rc7-next-20150204.7-iniza-small
/boot/config-3.19.0-rc7-next-20150204.9-iniza-small
 DEBUG_TLBFLUSH n -> y
 RCU_TRACE n -> y
 TREE_RCU_TRACE n -> y

Steve, this was a typo it's called tlb_flush not tlb_flush*ed*:

# cat /sys/kernel/debug/tracing/events/tlb/tlb_flush/enable
1

[  391.090381] intel_pstate CPU 1 exiting
[  391.104491] smpboot: CPU 1 is now offline

- Sedat -
