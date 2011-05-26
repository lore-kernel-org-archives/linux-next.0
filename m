From: Sedat Dilek <sedat.dilek@googlemail.com>
Subject: Re: linux-next: Tree for May 26 (RCU stalls)
Date: Thu, 26 May 2011 20:31:28 +0200
Message-ID: <BANLkTi=Y-JxoURbT7SanqeDO19RLpSUpBg@mail.gmail.com>
References: <BANLkTink15DRi6WJT2g07zd6-=MtW2hODw@mail.gmail.com>
	<20110526173128.GE2386@linux.vnet.ibm.com>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qw0-f46.google.com ([209.85.216.46]:58494 "EHLO
	mail-qw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757634Ab1EZSba convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 26 May 2011 14:31:30 -0400
In-Reply-To: <20110526173128.GE2386@linux.vnet.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: paulmck@linux.vnet.ibm.com
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Thu, May 26, 2011 at 7:31 PM, Paul E. McKenney
<paulmck@linux.vnet.ibm.com> wrote:
> On Thu, May 26, 2011 at 05:48:32PM +0200, Sedat Dilek wrote:
>> On Thu, May 26, 2011 at 8:39 AM, Stephen Rothwell <sfr@canb.auug.org=
=2Eau> wrote:
>> > Hi all,
>> >
>> > [The kernel.org mirroring is being slow today]
>> >
>> > Changes since 20110525:
>> >
>> > Linus' tree gained a build failure for which I applied a patch.
>> >
>> > The m68knommu tree lost its conflicts.
>> >
>> > The hwmon-staging lost its conflict.
>> >
>> > The wireless lost its conflict.
>> >
>> > The mmc lost its conflict.
>> >
>> > The dwmw2-iommu tree lost its conflict.
>> >
>> > The kvm tree still had its build failure so I used the version fro=
m
>> > next-20110524.
>> >
>> > The namespace lost its conflicts.
>> >
>> > ------------------------------------------------------------------=
----------
>> >
>>
>> Hi,
>>
>> I see these call-traces on x86 UP machine:
>>
>> [ =C2=A0240.268061] INFO: task rcun0:8 blocked for more than 120 sec=
onds.
>> [ =C2=A0240.268069] "echo 0 > /proc/sys/kernel/hung_task_timeout_sec=
s"
>> disables this message.
>> [ =C2=A0240.268072] rcun0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 D 00000=
000 =C2=A0 =C2=A0 0 =C2=A0 =C2=A0 8 =C2=A0 =C2=A0 =C2=A02 0x00000000
>> [ =C2=A0240.268079] =C2=A0f6473fb8 00000046 013131b6 00000000 c1461a=
c0 00000000
>> 00000000 c1461ac0
>> [ =C2=A0240.268089] =C2=A000000000 00000000 f645dc70 f645bf60 000000=
03 f6473f78
>> c102a570 f6473f9c
>> [ =C2=A0240.268097] =C2=A0c1021476 00000000 f645bf6c 00000001 000000=
00 00000286
>> f6473f9c c129b35a
>> [ =C2=A0240.268106] Call Trace:
>> [ =C2=A0240.268121] =C2=A0[<c102a570>] ? default_wake_function+0xb/0=
xd
>> [ =C2=A0240.268127] =C2=A0[<c1021476>] ? __wake_up_common+0x33/0x5b
>> [ =C2=A0240.268134] =C2=A0[<c129b35a>] ? _raw_spin_unlock_irqrestore=
+0xe/0x10
>> [ =C2=A0240.268140] =C2=A0[<c10234ed>] ? complete+0x34/0x3e
>> [ =C2=A0240.268147] =C2=A0[<c1074d23>] ? cpumask_weight+0xc/0xc
>> [ =C2=A0240.268157] =C2=A0[<c1044c97>] kthread+0x53/0x67
>> [ =C2=A0240.268162] =C2=A0[<c1044c44>] ? kthread_worker_fn+0x111/0x1=
11
>> [ =C2=A0240.268169] =C2=A0[<c12a123e>] kernel_thread_helper+0x6/0xd
>>
>> dmesg and kernel-config are attached.
>
> Hello, Sedat,
>
> Does the following patch clear things up?
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Thanx, Paul
>
> ---------------------------------------------------------------------=
---
>
> rcu: Start RCU kthreads in TASK_INTERRUPTIBLE state
>
> Upon creation, kthreads are in TASK_UNINTERRUPTIBLE state, which can
> result in softlockup warnings. =C2=A0Because some of RCU's kthreads c=
an
> legitimately be idle indefinitely, start them in TASK_INTERRUPTIBLE
> state in order to avoid those warnings.
>
> Suggested-by: Peter Zijlstra <a.p.zijlstra@chello.nl>
> Signed-off-by: Paul E. McKenney <paul.mckenney@linaro.org>
> Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> Tested-by: Yinghai Lu <yinghai@kernel.org>
>
> diff --git a/kernel/rcutree.c b/kernel/rcutree.c
> index a1a8bb6..40aab8d 100644
> --- a/kernel/rcutree.c
> +++ b/kernel/rcutree.c
> @@ -1647,6 +1647,7 @@ static int __cpuinit rcu_spawn_one_cpu_kthread(=
int cpu)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(t))
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR=
(t);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0kthread_bind(t, cpu);
> + =C2=A0 =C2=A0 =C2=A0 set_task_state(t, TASK_INTERRUPTIBLE);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0per_cpu(rcu_cpu_kthread_cpu, cpu) =3D cpu;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0WARN_ON_ONCE(per_cpu(rcu_cpu_kthread_task,=
 cpu) !=3D NULL);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0per_cpu(rcu_cpu_kthread_task, cpu) =3D t;
> @@ -1754,6 +1755,7 @@ static int __cpuinit rcu_spawn_one_node_kthread=
(struct rcu_state *rsp,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(t))
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0return PTR_ERR(t);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raw_spin_lock_=
irqsave(&rnp->lock, flags);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 set_task_state(t, =
TASK_INTERRUPTIBLE);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rnp->node_kthr=
ead_task =3D t;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raw_spin_unloc=
k_irqrestore(&rnp->lock, flags);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sp.sched_prior=
ity =3D 99;
> diff --git a/kernel/rcutree_plugin.h b/kernel/rcutree_plugin.h
> index 049f278..a767b7d 100644
> --- a/kernel/rcutree_plugin.h
> +++ b/kernel/rcutree_plugin.h
> @@ -1295,6 +1295,7 @@ static int __cpuinit rcu_spawn_one_boost_kthrea=
d(struct rcu_state *rsp,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(t))
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR=
(t);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0raw_spin_lock_irqsave(&rnp->lock, flags);
> + =C2=A0 =C2=A0 =C2=A0 set_task_state(t, TASK_INTERRUPTIBLE);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0rnp->boost_kthread_task =3D t;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0raw_spin_unlock_irqrestore(&rnp->lock, fla=
gs);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0sp.sched_priority =3D RCU_KTHREAD_PRIO;
>

Thanks for the quick reply and patch!

On 1st look at dmesg the RCU stalls are gone.
I tested against linux-next (next-20110526).

=46eel free to add:

     Tested-by: Sedat Dilek <sedat.dilek@gmail.com>

- Sedat -
