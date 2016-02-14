From: Ming Lei <tom.leiming@gmail.com>
Subject: Re: next: sparc64 crashes due to 'blk-mq: dynamic h/w context count'
Date: Sun, 14 Feb 2016 23:14:10 +0800
Message-ID: <CACVXFVMx5o8csfpXKHuKJc65pvb95WOjqA_NuW1-6GUB-GOZyg@mail.gmail.com>
References: <20160214131704.GA19659@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-yk0-f174.google.com ([209.85.160.174]:34902 "EHLO
	mail-yk0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751399AbcBNPOL (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 14 Feb 2016 10:14:11 -0500
In-Reply-To: <20160214131704.GA19659@roeck-us.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Keith Busch <keith.busch@intel.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jens Axboe <axboe@fb.com>, linux-block@vger.kernel.org, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

On Sun, Feb 14, 2016 at 9:17 PM, Guenter Roeck <linux@roeck-us.net> wrote:
> Hi,
>
> my runtime tests of linux-next crash for sparc64 due to commit 'blk-mq: dynamic
> h/w context count'. Reverting the patch fixes the problem. Bisect log is
> attached below. Full crash log is available at http://kerneltests.org/builders,
> in the table with qemu test results.

Guenter, could you test patch in the following link to see if it can be fixed?

http://marc.info/?l=linux-kernel&m=145526562410555&w=2

Thanks,

>
> Guenter
>
> ---
> crash log:
>
> [    2.470860] Unable to handle kernel paging request at virtual address ffffffffffffe000
> [    2.471099] tsk->{mm,active_mm}->context = 0000000000000000
> [    2.471263] tsk->{mm,active_mm}->pgd = fffff80000402000
> [    2.471416]               \|/ ____ \|/
> [    2.471416]               "@'/ .. \`@"
> [    2.471416]               /_| \__/ |_\
> [    2.471416]                  \__U_/
> [    2.471848] bioset(350): Oops [#1]
> [    2.472072] CPU: 0 PID: 350 Comm: bioset Not tainted 4.5.0-rc3-next-20160212 #1
> [    2.472418] task: fffff8001f2369e0 ti: fffff8001f354000 task.ti: fffff8001f354000
> [    2.472641] TSTATE: 0000008080e01603 TPC: 0000000000470d70 TNPC: 0000000000470d74 Y: 00000016    Not tainted
> [    2.472933] TPC: <rescuer_thread+0x70/0x2c0>
> [    2.473062] g0: fffff8001f2369e0 g1: 0000000000000000 g2: 0000000004208060 g3: 0000000000000000
> [    2.473304] g4: fffff8001f2369e0 g5: 0000000000000000 g6: fffff8001f354000 g7: 0000000004000000
> [    2.473546] o0: 0000000000000000 o1: ffffffffffffffec o2: 0000000000000008 o3: 0000000000015ab9
> [    2.473788] o4: 0000000000a11800 o5: 0000000000000000 sp: fffff8001f3574e1 ret_pc: 0000000000470d4c
> [    2.474039] RPC: <rescuer_thread+0x4c/0x2c0>
> [    2.474176] l0: fffff8001f213800 l1: fffff8001f213870 l2: 0000000000a16000 l3: 0000000000000000
> [    2.474426] l4: 0000000000000001 l5: 0000000000a66000 l6: 0000000000000001 l7: 000000000096c990
> [    2.474671] i0: fffff8001f3328d0 i1: 0000000000000000 i2: 0000000000abab10 i3: 0000000000000082
> [    2.474915] i4: 0000000000a25e58 i5: fffff8001f3328a0 i6: fffff8001f3575a1 i7: 0000000000475b48
> [    2.475171] I7: <kthread+0xa8/0xe0>
> [    2.475292] Call Trace:
> [    2.475400]  [0000000000475b48] kthread+0xa8/0xe0
> [    2.475547]  [0000000000405fa4] ret_from_fork+0x1c/0x2c
> [    2.475729]  [0000000000000000]           (null)
> [    2.475879] Disabling lock debugging due to kernel taint
> [    2.476063] Caller[0000000000475b48]: kthread+0xa8/0xe0
> [    2.476228] Caller[0000000000405fa4]: ret_from_fork+0x1c/0x2c
> [    2.476392] Caller[0000000000000000]:           (null)
> [    2.476545] Instruction DUMP: 02600070  01000000  f25c2070 <f45e7f80> b6067f80  c0710000  c25e6008  c45e4000  c270a008
> [    2.477010] Unable to handle kernel paging request at virtual address ffffffffffffe000
> [    2.477233] tsk->{mm,active_mm}->context = 0000000000000000
> [    2.477388] tsk->{mm,active_mm}->pgd = fffff80000402000
> [    2.477533]               \|/ ____ \|/
> [    2.477533]               "@'/ .. \`@"
> [    2.477533]               /_| \__/ |_\
> [    2.477533]                  \__U_/
> [    2.477941] bioset(350): Oops [#2]
> [    2.478085] CPU: 0 PID: 350 Comm: bioset Tainted: G      D         4.5.0-rc3-next-20160212 #1
> [    2.478333] task: fffff8001f2369e0 ti: fffff8001f354000 task.ti: fffff8001f354000
> [    2.478550] TSTATE: 0000000011e01603 TPC: 0000000000476148 TNPC: 00000000004717b0 Y: 00000190    Tainted: G      D
> [    2.478854] TPC: <kthread_data+0x8/0x20>
> [    2.478969] g0: fffff8001f357790 g1: 0000000000000000 g2: 000000000420806c g3: 0000000000000004
> [    2.479207] g4: fffff8001f2369e0 g5: 0000000000000000 g6: fffff8001f354000 g7: ffffffffffd23940
> [    2.479449] o0: fffff8001f2369e0 o1: fffff8001f2369e0 o2: 0000000000a11800 o3: 00000000000166b9
> [    2.479687] o4: 0000000000a11800 o5: 0000000000a11a18 sp: fffff8001f356e71 ret_pc: 00000000004717a8
> [    2.479937] RPC: <wq_worker_sleeping+0x8/0xc0>
> [    2.480064] l0: 000000000000007b l1: 0000000000abceb0 l2: 0000000000000080 l3: 0000000000000005
> [    2.480305] l4: 0000000000002290 l5: 0000000000afac00 l6: 0000000000000000 l7: 0000000000000000
> [    2.480554] i0: 0000000000000000 i1: 0000000000000000 i2: 0000000000000001 i3: 000000000000015e
> [    2.480795] i4: 000000000000000e i5: 000000000000000e i6: fffff8001f356f21 i7: 00000000008b7e4c
> [    2.481039] I7: <switch_to_pc+0xa0/0x394>
> [    2.481154] Call Trace:
> [    2.481231]  [00000000008b7e4c] switch_to_pc+0xa0/0x394
> [    2.481380]  [00000000008b825c] schedule+0x1c/0xa0
> [    2.481519]  [000000000045e218] do_exit+0x578/0x9a0
> [    2.481659]  [0000000000427b78] die_if_kernel+0x198/0x320
> [    2.481813]  [00000000008bb848] unhandled_fault+0x8c/0xa4
> [    2.481968]  [00000000008bbe68] do_sparc64_fault+0x608/0x720
> [    2.482128]  [0000000000407ac4] sparc64_realfault_common+0x10/0x20
> [    2.482316]  [0000000000470d70] rescuer_thread+0x70/0x2c0
> [    2.482477]  [0000000000475b48] kthread+0xa8/0xe0
> [    2.482613]  [0000000000405fa4] ret_from_fork+0x1c/0x2c
> [    2.482759]  [0000000000000000]           (null)
> [    2.482897] Caller[00000000008b7e4c]: switch_to_pc+0xa0/0x394
> [    2.483064] Caller[00000000008b825c]: schedule+0x1c/0xa0
> [    2.483218] Caller[000000000045e218]: do_exit+0x578/0x9a0
> [    2.483374] Caller[0000000000427b78]: die_if_kernel+0x198/0x320
> [    2.483544] Caller[00000000008bb848]: unhandled_fault+0x8c/0xa4
> [    2.483714] Caller[00000000008bbe68]: do_sparc64_fault+0x608/0x720
> [    2.483891] Caller[0000000000407ac4]: sparc64_realfault_common+0x10/0x20
> [    2.484081] Caller[0000000000470d4c]: rescuer_thread+0x4c/0x2c0
> [    2.484251] Caller[0000000000475b48]: kthread+0xa8/0xe0
> [    2.484402] Caller[0000000000405fa4]: ret_from_fork+0x1c/0x2c
> [    2.484565] Caller[0000000000000000]:           (null)
>
> ---
> bisect log:
>
> # bad: [64d9a3617b3b8bc0734ba97caeb433b7019c6187] Add linux-next specific files for 20160212
> # good: [527e9316f8ec44bd53d90fb9f611fa7ffff52bb9] Linux 4.4-rc4
> git bisect start 'HEAD' 'v4.4-rc4'
> # good: [12768c1e2c83b05ea1658470045789a14b6edf4c] Merge tag 'linux-kselftest-4.5-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest
> git bisect good 12768c1e2c83b05ea1658470045789a14b6edf4c
> # good: [fbb8c963573926bceb5c59e2a7d74e5ce7669e78] staging: sm750fb, fix typos
> git bisect good fbb8c963573926bceb5c59e2a7d74e5ce7669e78
> # good: [5973e9b7adaf8719bbaf6d124102dc4d6b87aaf4] Merge remote-tracking branch 'drm-panel/drm/panel/for-next'
> git bisect good 5973e9b7adaf8719bbaf6d124102dc4d6b87aaf4
> # bad: [dfe494eecfeddbc0b88acc9e618e7942105d4885] Merge remote-tracking branch 'tty/tty-next'
> git bisect bad dfe494eecfeddbc0b88acc9e618e7942105d4885
> # bad: [c461e79ad7bad110246651b5381542b9cd3cacdb] Merge remote-tracking branch 'spi/for-next'
> git bisect bad c461e79ad7bad110246651b5381542b9cd3cacdb
> # good: [597dc9d36e8bc04941b61b26ac7aa3f8a33aba53] Merge remote-tracking branch 'sound-asoc/for-next'
> git bisect good 597dc9d36e8bc04941b61b26ac7aa3f8a33aba53
> # bad: [84d5092d655bc9532c5fc88e7b2308090889187d] Merge remote-tracking branch 'kgdb/kgdb-next'
> git bisect bad 84d5092d655bc9532c5fc88e7b2308090889187d
> # good: [48513b689dbd263a60211b06addd5dfcab2fee71] dt/bindings: mmc: Add bindings for PIC32 SDHCI host controller
> git bisect good 48513b689dbd263a60211b06addd5dfcab2fee71
> # bad: [36942f9b4e473650cc648d4e287e959f8050e053] Merge remote-tracking branch 'block/for-next'
> git bisect bad 36942f9b4e473650cc648d4e287e959f8050e053
> # bad: [9f46f4ba39e45de3623c8b38b15dceed220a8e62] Merge branch 'for-4.6/drivers' into for-next
> git bisect bad 9f46f4ba39e45de3623c8b38b15dceed220a8e62
> # bad: [cde0dbe0c98f1d95646b59561e413dad8500fae9] Merge branch 'for-4.6/core' into for-next
> git bisect bad cde0dbe0c98f1d95646b59561e413dad8500fae9
> # good: [a257ae3e482e1cbd5fc573efeef5a73bffe09757] cfq-iosched: Allow sync noidle workloads to preempt each other
> git bisect good a257ae3e482e1cbd5fc573efeef5a73bffe09757
> # good: [f42cf119bcf8c8c9a2748a3c587aa76bc5af7405] Merge branch 'for-4.6/core' into for-next
> git bisect good f42cf119bcf8c8c9a2748a3c587aa76bc5af7405
> # bad: [868f2f0b72068a097508b6e8870a8950fd8eb7ef] blk-mq: dynamic h/w context count
> git bisect bad 868f2f0b72068a097508b6e8870a8950fd8eb7ef
> # first bad commit: [868f2f0b72068a097508b6e8870a8950fd8eb7ef] blk-mq: dynamic h/w context count
> --
> To unsubscribe from this list: send the line "unsubscribe linux-block" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Ming Lei
