From: Sedat Dilek <sedat.dilek@gmail.com>
Subject: Re: linux-next: Tree for Feb 4
Date: Thu, 5 Feb 2015 00:48:35 +0100
Message-ID: <CA+icZUVFFMFFmx8tSTZ9YB=FbmjtD_ZfQa3JTOwb5K7eLW=k-w@mail.gmail.com>
References: <20150204193535.58f132c5@canb.auug.org.au>
	<1511573.AlfExlvQsO@vostro.rjw.lan>
	<CA+icZUXZz7jEN0EjHbM2vo+Vqg6iXnJrL625zuNhMNEk9FYPRQ@mail.gmail.com>
	<1777022.KaV9ILjeny@vostro.rjw.lan>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wi0-f172.google.com ([209.85.212.172]:46363 "EHLO
	mail-wi0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S966842AbbBDXsg (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 4 Feb 2015 18:48:36 -0500
In-Reply-To: <1777022.KaV9ILjeny@vostro.rjw.lan>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Paul McKenney <paulmck@linux.vnet.ibm.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Kristen Carlson Accardi <kristen@linux.intel.com>

On Thu, Feb 5, 2015 at 12:30 AM, Rafael J. Wysocki <rjw@rjwysocki.net> wrote:
> On Wednesday, February 04, 2015 11:46:32 PM Sedat Dilek wrote:
>> On Wed, Feb 4, 2015 at 10:54 PM, Rafael J. Wysocki <rjw@rjwysocki.net> wrote:
>> > On Wednesday, February 04, 2015 09:18:03 PM Sedat Dilek wrote:
>> >> On Wed, Feb 4, 2015 at 9:35 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>> >> > Hi all,
>> >> >
>> >> > The next release I will be making will be next-20150209 - which will
>> >> > probably be after the v3.19 release.
>> >> >
>> >> > Changes since 20150203:
>> >> >
>> >> > The sound-asoc tree gained a conflict against the sound tree.
>> >> >
>> >> > The scsi tree gained a build failure caused by an interaction with the
>> >> > driver-core tree.  I applied a merge fix patch.
>> >> >
>> >> > The akpm-current tree gained a build failure for which I disabled
>> >> > CONFIG_KASAN.
>> >> >
>> >> > Non-merge commits (relative to Linus' tree): 7461
>> >> >  7314 files changed, 309736 insertions(+), 172363 deletions(-)
>> >> >
>> >> > ----------------------------------------------------------------------------
>> >> >
>> >>
>> >> [ CC linux-rcu | linux-pm | intel_pstate maintainers ]
>> >
>> > Dirk is not the maintainer of intel_pstate any more, CC: Kristen.
>> >
>> >> Hi,
>> >>
>> >> after suspend-and-resume I see the following call-trace:
>> >
>> > Do you see that after CPU1 offline too?
>> >
>>
>> NO.
>>
>> After...
>>
>> root# echo 0 > /sys/devices/system/cpu/cpu1/online
>>
>> ...I see this:
>>
>> +[  707.936668] PM: Saving platform NVS memory
>> +[  707.936674] Disabling non-boot CPUs ...
>> +[  707.936712] intel_pstate CPU 2 exiting
>> +[  707.938024] smpboot: CPU 2 didn't die...
>> +[  707.949128] intel_pstate CPU 3 exiting
>> +[  707.950369] smpboot: CPU 3 didn't die...
>> +[  707.966248] ACPI: Low-level resume complete
>> +[  707.966302] PM: Restoring platform NVS memory
>>
>> Full dmesg attached.
>
> The dmesg doesn't match what you said above.
>
> Anyway, that's not what I meant.  Does the CPU1 offlining alone:
>
> # echo 0 > /sys/devices/system/cpu/cpu1/online
>
> trigger the trace?  It should.
>

YES, I see this...
...
[   84.668616] PPP BSD Compression module registered
[   84.678072] PPP Deflate Compression module registered
[  101.143582] intel_pstate CPU 1 exiting
[  101.157134]
[  101.157135] ===============================
[  101.157136] [ INFO: suspicious RCU usage. ]
[  101.157139] 3.19.0-rc7-next-20150204.3-iniza-small #1 Not tainted
[  101.157140] -------------------------------
[  101.157142] include/trace/events/tlb.h:35 suspicious
rcu_dereference_check() usage!
[  101.157142]
[  101.157142] other info that might help us debug this:
[  101.157142]
[  101.157143]
[  101.157143] RCU used illegally from offline CPU!
[  101.157143] rcu_scheduler_active = 1, debug_locks = 0
[  101.157144] no locks held by swapper/1/0.
[  101.157144]
[  101.157144] stack backtrace:
[  101.157146] CPU: 1 PID: 0 Comm: swapper/1 Not tainted
3.19.0-rc7-next-20150204.3-iniza-small #1
[  101.157147] Hardware name: SAMSUNG ELECTRONICS CO., LTD.
530U3BI/530U4BI/530U4BH/530U3BI/530U4BI/530U4BH, BIOS 13XK 03/28/2013
[  101.157151]  0000000000000001 ffff88011a44fe18 ffffffff817e35fd
0000000000000011
[  101.157153]  ffff88011a448290 ffff88011a44fe48 ffffffff810d6847
ffff8800d3b96100
[  101.157155]  0000000000000001 ffff88011a44c000 0000000000000005
ffff88011a44fe78
[  101.157156] Call Trace:
[  101.157162]  [<ffffffff817e35fd>] dump_stack+0x4c/0x65
[  101.157166]  [<ffffffff810d6847>] lockdep_rcu_suspicious+0xe7/0x120
[  101.157170]  [<ffffffff810b71a5>] idle_task_exit+0x205/0x2c0
[  101.157173]  [<ffffffff81054c4e>] play_dead_common+0xe/0x50
[  101.157175]  [<ffffffff81054ca5>] native_play_dead+0x15/0x140
[  101.157179]  [<ffffffff8102963f>] arch_cpu_idle_dead+0xf/0x20
[  101.157181]  [<ffffffff810cd89e>] cpu_startup_entry+0x37e/0x580
[  101.157183]  [<ffffffff81053e20>] start_secondary+0x140/0x150
[  101.157228] smpboot: CPU 1 is now offline

- Sedat -
