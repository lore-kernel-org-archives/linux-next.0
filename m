From: Sedat Dilek <sedat.dilek@googlemail.com>
Subject: Re: linux-next: Tree for April 14 (Call-traces: RCU/ACPI/WQ related?)
Date: Thu, 21 Apr 2011 16:47:31 +0200
Message-ID: <BANLkTineNYTXffcNT59STsk5nkLhi=o-kA@mail.gmail.com>
References: <BANLkTikd2MpRPF37R+vCwnb7Lzzd6EiS7A@mail.gmail.com>
	<BANLkTinq=mC9rs5R3U8FPLCp-GgCJris_g@mail.gmail.com>
	<BANLkTimT9OhHLL5NaPOP30MdiMfmmmEcyQ@mail.gmail.com>
	<BANLkTikVW9Z=WxD7=w9c=Z6kHO-Za2ru8A@mail.gmail.com>
	<20110414224411.GF2141@linux.vnet.ibm.com>
	<20110421050823.GA4487@linux.vnet.ibm.com>
	<BANLkTinFmG5GVq6D8+wq_89OPF8snsQ=Jw@mail.gmail.com>
	<BANLkTi=c=+JnU9dQsVhgjZbOtArhHQz+EQ@mail.gmail.com>
	<BANLkTimEWqBVdq8MWbjAAfXCLPQdiHkuNg@mail.gmail.com>
	<20110421142853.GA2235@linux.vnet.ibm.com>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qy0-f174.google.com ([209.85.216.174]:38933 "EHLO
	mail-qy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753726Ab1DUOrd convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 21 Apr 2011 10:47:33 -0400
In-Reply-To: <20110421142853.GA2235@linux.vnet.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: paulmck@linux.vnet.ibm.com
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Thu, Apr 21, 2011 at 4:28 PM, Paul E. McKenney
<paulmck@linux.vnet.ibm.com> wrote:
> On Thu, Apr 21, 2011 at 02:49:37PM +0200, Sedat Dilek wrote:
>> On Thu, Apr 21, 2011 at 12:24 PM, Sedat Dilek
>> <sedat.dilek@googlemail.com> wrote:
>> > On Thu, Apr 21, 2011 at 11:07 AM, Sedat Dilek
>> > <sedat.dilek@googlemail.com> wrote:
>> >> On Thu, Apr 21, 2011 at 7:08 AM, Paul E. McKenney
>> >> <paulmck@linux.vnet.ibm.com> wrote:
>> >>> On Thu, Apr 14, 2011 at 03:44:11PM -0700, Paul E. McKenney wrote=
:
>> >>>> On Fri, Apr 15, 2011 at 12:19:34AM +0200, Sedat Dilek wrote:
>> >>>> > On Thu, Apr 14, 2011 at 12:19 PM, Sedat Dilek
>> >>>> > <sedat.dilek@googlemail.com> wrote:
>> >>>> > > On Thu, Apr 14, 2011 at 11:16 AM, Sedat Dilek
>> >>>> > > <sedat.dilek@googlemail.com> wrote:
>> >>>> > >> [ Adding CC to RCU maintainer (Hi Paul :-)) ]
>> >>>> > >>
>> >>>> > >> Helping me for now with (see also Documentation/RCU/stallw=
arn.txt):
>> >>>> > >>
>> >>>> > >> # cat /sys/module/rcutree/parameters/rcu_cpu_stall_suppres=
s
>> >>>> > >> 0
>> >>>> > >>
>> >>>> > >> # echo "1" > /sys/module/rcutree/parameters/rcu_cpu_stall_=
suppress
>> >>>> > >>
>> >>>> > >> # cat /sys/module/rcutree/parameters/rcu_cpu_stall_suppres=
s
>> >>>> > >> 1
>> >>>> > >>
>> >>>> > >> - Sedat -
>> >>>> > >>
>> >>>> > >
>> >>>> > > That workaround helped till a system-freeze when generating=
 a tarball
>> >>>> > > from my current kernel-tree.
>> >>>> > > I switched back to my yesterday's linux-next kernel.
>> >>>> > >
>> >>>> > > - Sedat -
>> >>>> > >
>> >>>> >
>> >>>> > I isolated the culprit so far:
>> >>>> >
>> >>>> > commit 900507fc62d5ba0164c07878dbc36ac97866a858
>> >>>> > "rcu: move TREE_RCU from softirq to kthread"
>> >>>> >
>> >>>> > With this revert my system does not show the symptoms I have =
reported.
>> >>>>
>> >>>> Hmmm... =C2=A0I never was able to reproduce this, but did find =
a workload
>> >>>> that slowed up the grace periods. =C2=A0I fixed that (which tur=
ned out to
>> >>>> be a wakeup problem), but my hopes that it would also fix your =
problem
>> >>>> were clearly unfounded. =C2=A0I have once again stopped exporti=
ng this commit
>> >>>> to -next.
>> >>>
>> >>> I have added some debug tracing, which are available at branch
>> >>> "sedat.2011.04.19a" in the git repository at:
>> >>>
>> >>> git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-2.6-=
rcu.git
>> >>>
>> >>> Alternatively, if it is easier, the shown below can be used. =C2=
=A0FWIW,
>> >>> this patch is against 2.6.39-rc3.
>> >>>
>> >>> Either way, if you get a chance to run your tests on this, could=
 you
>> >>> please run the attached script (collectdebugfs.sh) and capture i=
ts output?
>> >>> Sample output is attached as well (collectdebugfs.sh.out): =C2=A0=
the script
>> >>> should output something vaguely like the sample output every 15 =
seconds
>> >>> or so.
>> >>>
>> >>> The script assumes that debugfs is enabled (along with CONFIG_RC=
U_TRACE=3Dy)
>> >>> and mounted as follows:
>> >>>
>> >>> =C2=A0 =C2=A0 =C2=A0 =C2=A0mount -t debugfs none /sys/kernel/deb=
ug/
>> >>>
>> >>> Or if you mount debugfs somewhere else, please set the script's =
DEBUGFS_MP
>> >>> variable accordingly.
>> >>>
>> >>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Thanx, Paul
>> >>>
>> >>> ----------------------------------------------------------------=
--------
>> >>>
>> >>
>> >> Welcome to operation "Kill that RCU brainbug" (Starship troopers =
part X)!
>
> Actually, only Part III thus far, but point taken... =C2=A0;-)
>
>> >> Of course I can help with testing.
>
> Thank you very much!
>
>> >> Paul, did you see recent RCU-related fixes to fs between rc3 and =
rc4?
>> >>
>> >> commit c1530019e311c91d14b24d8e74d233152d806e45
>> >> vfs: Fix absolute RCU path walk failures due to uninitialized seq=
 number
>> >>
>> >> fff3e5ade4455a4b42a19c95dd7a167a3cb7956a
>> >> fs: synchronize_rcu when unregister_filesystem success not failur=
e
>> >>
>> >> IIRC, Jens has pending block/plugging patches in his for-linus tr=
ee.
>> >> Especially this one (CONFIG_PREEMPT):
>> >>
>> >> 5f45c69589b7d2953584e6cd0b31e35dbe960ad0
>> >> cfq-iosched: read_lock() does not always imply rcu_read_lock()
>
> Thank you for pointing them out, but the diagnostics clearly show
> that one of the kthreads isn't getting awakened when it should be...
>
> More below.
>
>> >> Some questions to test-scenario:
>> >>
>> >> Shall I test from linux-2.6-rcu.git#sedat.2011.04.19a GIT tree?
>> >> I think that's the ideal solution.
>
> Agreed.
>
>> >> Or shall I pull sedat.2011.04.19a GIT branch into "BROKEN" linux-=
next
>> >> (next-20110414)?
>
> Unnecessarily increasing the number of bugs in the system under test
> doesn't seem wise to me. =C2=A0;-)
>

Yepp, I tested from your RCU tree and the given GIT branch only.

>> >> Again, with which RCU/HZ/PREEMPT kernel-config options shall I te=
st?
>> >> This is from my yesterday's linux-next:
>> >>
>> >> # egrep 'RCU|_HZ |PREEMPT' /boot/config-2.6.39-rc4-next20110420.4=
-686-small
>> >> # RCU Subsystem
>> >> CONFIG_TREE_RCU=3Dy
>> >> # CONFIG_PREEMPT_RCU is not set
>> >> CONFIG_RCU_TRACE=3Dy
>> >> CONFIG_RCU_FANOUT=3D32
>> >> # CONFIG_RCU_FANOUT_EXACT is not set
>> >> CONFIG_RCU_FAST_NO_HZ=3Dy
>> >> CONFIG_TREE_RCU_TRACE=3Dy
>> >> # CONFIG_PREEMPT_NONE is not set
>> >> CONFIG_PREEMPT_VOLUNTARY=3Dy
>> >> # CONFIG_PREEMPT is not set
>> >> # CONFIG_SPARSE_RCU_POINTER is not set
>> >> CONFIG_RCU_TORTURE_TEST=3Dm
>> >> CONFIG_RCU_CPU_STALL_TIMEOUT=3D60
>
> The options that were causing you trouble before, but with
> both CONFIG_TREE_RCU (the one that failed quickly) and with
> CONFIG_TREE_PREEMPT_RCU (which failed slowly).
>
>> >> Regards,
>> >> - Sedat -
>> >>
>> >
>> > Looks like you want me to test with RCU_BOOST and RCU_TORTURE_TEST=
 :-).
>
> No, it is just that my diagnostics don't apply cleanly before the
> commit that enabled RCU_BOOST.
>
> Ah! =C2=A0I see. =C2=A0No, I just made my script dump all the RCU deb=
ugfs
> information, I wasn't trying to provide guidance. =C2=A0;-)
>
>> > Attached is collectdebugfs-dileks.log, my current kernel-config an=
d a
>> > build-script to generate Debian packages.
>
> Hmmmm... =C2=A0The system died within 30 seconds? =C2=A0The usual way=
 that RCU
> hangs the system is by memory exhaustion: grace periods stop advancin=
g,
> RCU callbacks therefore never get invoked, and RCU-protected memory
> therefore never gets freed. =C2=A0But I guess if your workload freed
> RCU-protected data fast enough, the system could hang quickly.
>

The first log might be incomplete, I stopped it by Ctrl+C.
In the 2nd-run I have seen too late, that the script continues collecti=
ng data.
So, my fault.

>> > $ LANG=3DC ./collectdebugfs.sh 2>&1 | tee collectdebugfs-dileks.lo=
g
>> >
>> > I will do a 2nd run with PREEMPT_RCU enabled.
>> >
>> > - Sedat -
>> >
>>
>> Here the results from the 2nd-run (PREEMPT_RCU enabled).
>
> OK, and the grace periods clearly stopped advancing early on.
>
> Beyond that point, the per-CPU kthread is blocked, but RCU has some
> work for it to do. =C2=A0So someone has called invoke_rcu_cpu_kthread=
(),
> but rcu_cpu_kthread() is still blocked. =C2=A0I don't see a bug right
> off-hand, but it is early in the morning for me, so I might easily
> be missing something.
>
> Hmmm...
>
> The synchronization between these two assumes that the per-CPU
> kthread is always bound to the respective CPU, so if was somehow
> being migrated off, that might explain these results.
>
> I will add some more diagnostics, test them locally, then push
> out an update. =C2=A0Seem reasonable?
>
> And thank you again for the testing!!!
>

Ping me when you have new stuff for testing.
Tomorrow (friday), here is public holiday and monday, too.
So a looong weekend.

> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0Thanx, Paul
>
>> - Sedat -
>
>> Thu Apr 21 14:37:27 CEST 2011
>> rcu_preempt_state: completed=3D13022 =C2=A0gpnum=3D13023 =C2=A0age=3D=
0 =C2=A0max=3D54
>> rcu_sched_state: completed=3D-300 =C2=A0gpnum=3D4294966996 =C2=A0age=
=3D0 =C2=A0max=3D0
>> rcu_bh_state: completed=3D-298 =C2=A0gpnum=3D4294966998 =C2=A0age=3D=
0 =C2=A0max=3D1
>> rcu_preempt:
>> c=3D13023 g=3D13024 s=3D2 jfq=3D3 j=3D4d18 nfqs=3D731/nfqsng=3D0(731=
) fqlh=3D0
>> 1/1 ..>. 0:31 ^0
>> 1/1 ..>. 0:15 ^0 =C2=A0 =C2=A00/0 ..>. 16:31 ^1
>> rcu_sched:
>> c=3D4294966996 g=3D4294966996 s=3D0 jfq=3D45800 j=3D4d18 nfqs=3D0/nf=
qsng=3D0(0) fqlh=3D0
>> 0/1 ..>. 0:31 ^0
>> 0/1 ..>. 0:15 ^0 =C2=A0 =C2=A00/0 ..>. 16:31 ^1
>> rcu_bh:
>> c=3D4294966998 g=3D4294966998 s=3D0 jfq=3D-24703 j=3D4d18 nfqs=3D0/n=
fqsng=3D0(0) fqlh=3D0
>> 0/1 ..>. 0:31 ^0
>> 0/1 ..>. 0:15 ^0 =C2=A0 =C2=A00/0 ..>. 16:31 ^1
>> rcu_preempt:
>> =C2=A0 0 c=3D13026 g=3D13027 pq=3D1 pqc=3D13026 qp=3D1 dt=3D40499/1/=
0 df=3D0 of=3D0 ri=3D0 ql=3D81 qs=3DN.WD kt=3D0/W b=3D10 ci=3D242547 co=
=3D0 ca=3D0
>> rcu_sched:
>> =C2=A0 0 c=3D0 g=3D0 pq=3D1 pqc=3D4294967295 qp=3D1 dt=3D40499/1/0 d=
f=3D0 of=3D0 ri=3D0 ql=3D0 qs=3D.... kt=3D0/W b=3D10 ci=3D0 co=3D0 ca=3D=
0
>> rcu_bh:
>> =C2=A0 0 c=3D4294966998 g=3D4294966998 pq=3D1 pqc=3D4294966997 qp=3D=
0 dt=3D40499/1/0 df=3D0 of=3D0 ri=3D0 ql=3D0 qs=3D.... kt=3D0/W b=3D10 =
ci=3D6 co=3D0 ca=3D0
>> rcu_preempt:
>> =C2=A0 0 np=3D0 qsp=3D0 rpq=3D0 cbr=3D0 cng=3D0 gpc=3D0 gps=3D0 nf=3D=
0 nn=3D0
>> rcu_sched:
>> =C2=A0 0 np=3D19291 qsp=3D4 rpq=3D19287 cbr=3D0 cng=3D0 gpc=3D0 gps=3D=
0 nf=3D0 nn=3D4
>> rcu_bh:
>> =C2=A0 0 np=3D4 qsp=3D0 rpq=3D4 cbr=3D0 cng=3D0 gpc=3D0 gps=3D0 nf=3D=
0 nn=3D0
>> rcutorture test sequence: 0 (test in progress)
>> rcutorture update version number: 3012
>> cat: /sys/kernel/debug/rcu/rcuboost: No such file or directory
>> no rcuboost
>>
>> Thu Apr 21 14:37:42 CEST 2011
>> rcu_preempt_state: completed=3D14707 =C2=A0gpnum=3D14708 =C2=A0age=3D=
0 =C2=A0max=3D54
>> rcu_sched_state: completed=3D-300 =C2=A0gpnum=3D4294966996 =C2=A0age=
=3D0 =C2=A0max=3D0
>> rcu_bh_state: completed=3D-298 =C2=A0gpnum=3D4294966998 =C2=A0age=3D=
0 =C2=A0max=3D1
>> rcu_preempt:
>> c=3D14708 g=3D14709 s=3D2 jfq=3D3 j=3D5bd3 nfqs=3D830/nfqsng=3D0(830=
) fqlh=3D0
>> 1/1 ..>. 0:31 ^0
>> 1/1 ..>. 0:15 ^0 =C2=A0 =C2=A00/0 ..>. 16:31 ^1
>> rcu_sched:
>> c=3D4294966996 g=3D4294966996 s=3D0 jfq=3D42029 j=3D5bd3 nfqs=3D0/nf=
qsng=3D0(0) fqlh=3D0
>> 0/1 ..>. 0:31 ^0
>> 0/1 ..>. 0:15 ^0 =C2=A0 =C2=A00/0 ..>. 16:31 ^1
>> rcu_bh:
>> c=3D4294966998 g=3D4294966998 s=3D0 jfq=3D-28474 j=3D5bd3 nfqs=3D0/n=
fqsng=3D0(0) fqlh=3D0
>> 0/1 ..>. 0:31 ^0
>> 0/1 ..>. 0:15 ^0 =C2=A0 =C2=A00/0 ..>. 16:31 ^1
>> rcu_preempt:
>> =C2=A0 0 c=3D14709 g=3D14710 pq=3D1 pqc=3D14709 qp=3D1 dt=3D40499/1/=
0 df=3D0 of=3D0 ri=3D0 ql=3D31 qs=3DN.W. kt=3D0/W b=3D10 ci=3D263538 co=
=3D0 ca=3D0
>> rcu_sched:
>> =C2=A0 0 c=3D0 g=3D0 pq=3D1 pqc=3D4294967295 qp=3D1 dt=3D40499/1/0 d=
f=3D0 of=3D0 ri=3D0 ql=3D0 qs=3D.... kt=3D0/W b=3D10 ci=3D0 co=3D0 ca=3D=
0
>> rcu_bh:
>> =C2=A0 0 c=3D4294966998 g=3D4294966998 pq=3D1 pqc=3D4294966997 qp=3D=
0 dt=3D40499/1/0 df=3D0 of=3D0 ri=3D0 ql=3D0 qs=3D.... kt=3D0/W b=3D10 =
ci=3D6 co=3D0 ca=3D0
>> rcu_preempt:
>> =C2=A0 0 np=3D0 qsp=3D0 rpq=3D0 cbr=3D0 cng=3D0 gpc=3D0 gps=3D0 nf=3D=
0 nn=3D0
>> rcu_sched:
>> =C2=A0 0 np=3D23057 qsp=3D4 rpq=3D23053 cbr=3D0 cng=3D0 gpc=3D0 gps=3D=
0 nf=3D0 nn=3D4
>> rcu_bh:
>> =C2=A0 0 np=3D4 qsp=3D0 rpq=3D4 cbr=3D0 cng=3D0 gpc=3D0 gps=3D0 nf=3D=
0 nn=3D0
>> rcutorture test sequence: 0 (test in progress)
>> rcutorture update version number: 4691
>> cat: /sys/kernel/debug/rcu/rcuboost: No such file or directory
>> no rcuboost
>>
>> Thu Apr 21 14:37:57 CEST 2011
>> rcu_preempt_state: completed=3D16459 =C2=A0gpnum=3D16460 =C2=A0age=3D=
0 =C2=A0max=3D221
>> rcu_sched_state: completed=3D-300 =C2=A0gpnum=3D4294966996 =C2=A0age=
=3D0 =C2=A0max=3D0
>> rcu_bh_state: completed=3D-298 =C2=A0gpnum=3D4294966998 =C2=A0age=3D=
0 =C2=A0max=3D1
>> rcu_preempt:
>> c=3D16459 g=3D16460 s=3D2 jfq=3D3 j=3D6a82 nfqs=3D990/nfqsng=3D0(990=
) fqlh=3D0
>> 1/1 ..>. 0:31 ^0
>> 1/1 ..>. 0:15 ^0 =C2=A0 =C2=A00/0 ..>. 16:31 ^1
>> rcu_sched:
>> c=3D4294966996 g=3D4294966996 s=3D0 jfq=3D38270 j=3D6a82 nfqs=3D0/nf=
qsng=3D0(0) fqlh=3D0
>> 0/1 ..>. 0:31 ^0
>> 0/1 ..>. 0:15 ^0 =C2=A0 =C2=A00/0 ..>. 16:31 ^1
>> rcu_bh:
>> c=3D4294966998 g=3D4294966998 s=3D0 jfq=3D-32233 j=3D6a82 nfqs=3D0/n=
fqsng=3D0(0) fqlh=3D0
>> 0/1 ..>. 0:31 ^0
>> 0/1 ..>. 0:15 ^0 =C2=A0 =C2=A00/0 ..>. 16:31 ^1
>> rcu_preempt:
>> =C2=A0 0 c=3D16460 g=3D16461 pq=3D1 pqc=3D16460 qp=3D1 dt=3D40499/1/=
0 df=3D0 of=3D0 ri=3D0 ql=3D120 qs=3DN.W. kt=3D0/W b=3D10 ci=3D291395 c=
o=3D0 ca=3D0
>> rcu_sched:
>> =C2=A0 0 c=3D0 g=3D0 pq=3D1 pqc=3D4294967295 qp=3D1 dt=3D40499/1/0 d=
f=3D0 of=3D0 ri=3D0 ql=3D0 qs=3D.... kt=3D0/W b=3D10 ci=3D0 co=3D0 ca=3D=
0
>> rcu_bh:
>> =C2=A0 0 c=3D4294966998 g=3D4294966998 pq=3D1 pqc=3D4294966997 qp=3D=
0 dt=3D40499/1/0 df=3D0 of=3D0 ri=3D0 ql=3D0 qs=3D.... kt=3D0/W b=3D10 =
ci=3D6 co=3D0 ca=3D0
>> rcu_preempt:
>> =C2=A0 0 np=3D0 qsp=3D0 rpq=3D0 cbr=3D0 cng=3D0 gpc=3D0 gps=3D0 nf=3D=
0 nn=3D0
>> rcu_sched:
>> =C2=A0 0 np=3D26818 qsp=3D4 rpq=3D26814 cbr=3D0 cng=3D0 gpc=3D0 gps=3D=
0 nf=3D0 nn=3D4
>> rcu_bh:
>> =C2=A0 0 np=3D4 qsp=3D0 rpq=3D4 cbr=3D0 cng=3D0 gpc=3D0 gps=3D0 nf=3D=
0 nn=3D0
>> rcutorture test sequence: 0 (test in progress)
>> rcutorture update version number: 6227
>> cat: /sys/kernel/debug/rcu/rcuboost: No such file or directory
>> no rcuboost
>>
>> Thu Apr 21 14:38:12 CEST 2011
>> rcu_preempt_state: completed=3D17263 =C2=A0gpnum=3D17264 =C2=A0age=3D=
1644 =C2=A0max=3D221
>> rcu_sched_state: completed=3D-300 =C2=A0gpnum=3D4294966996 =C2=A0age=
=3D0 =C2=A0max=3D0
>> rcu_bh_state: completed=3D-298 =C2=A0gpnum=3D4294966998 =C2=A0age=3D=
0 =C2=A0max=3D1
>> rcu_preempt:
>> c=3D17263 g=3D17264 s=3D3 jfq=3D2 j=3D7931 nfqs=3D1146/nfqsng=3D0(11=
46) fqlh=3D0
>> 1/1 ..>. 0:31 ^0
>> 1/1 ..>. 0:15 ^0 =C2=A0 =C2=A00/0 ..>. 16:31 ^1
>> rcu_sched:
>> c=3D4294966996 g=3D4294966996 s=3D0 jfq=3D34511 j=3D7931 nfqs=3D0/nf=
qsng=3D0(0) fqlh=3D0
>> 0/1 ..>. 0:31 ^0
>> 0/1 ..>. 0:15 ^0 =C2=A0 =C2=A00/0 ..>. 16:31 ^1
>> rcu_bh:
>> c=3D4294966998 g=3D4294966998 s=3D0 jfq=3D-35992 j=3D7931 nfqs=3D0/n=
fqsng=3D0(0) fqlh=3D0
>> 0/1 ..>. 0:31 ^0
>> 0/1 ..>. 0:15 ^0 =C2=A0 =C2=A00/0 ..>. 16:31 ^1
>> rcu_preempt:
>> =C2=A0 0 c=3D17263 g=3D17264 pq=3D1 pqc=3D17263 qp=3D1 dt=3D40499/1/=
0 df=3D0 of=3D0 ri=3D0 ql=3D7209 qs=3DN.W. kt=3D1/W b=3D10 ci=3D299175 =
co=3D0 ca=3D0
>> rcu_sched:
>> =C2=A0 0 c=3D0 g=3D0 pq=3D1 pqc=3D4294967295 qp=3D1 dt=3D40499/1/0 d=
f=3D0 of=3D0 ri=3D0 ql=3D0 qs=3D.... kt=3D1/W b=3D10 ci=3D0 co=3D0 ca=3D=
0
>> rcu_bh:
>> =C2=A0 0 c=3D4294966998 g=3D4294966998 pq=3D1 pqc=3D4294966997 qp=3D=
0 dt=3D40499/1/0 df=3D0 of=3D0 ri=3D0 ql=3D0 qs=3D.... kt=3D1/W b=3D10 =
ci=3D6 co=3D0 ca=3D0
>> rcu_preempt:
>> =C2=A0 0 np=3D0 qsp=3D0 rpq=3D0 cbr=3D0 cng=3D0 gpc=3D0 gps=3D0 nf=3D=
0 nn=3D0
>> rcu_sched:
>> =C2=A0 0 np=3D30576 qsp=3D4 rpq=3D30572 cbr=3D0 cng=3D0 gpc=3D0 gps=3D=
0 nf=3D0 nn=3D4
>> rcu_bh:
>> =C2=A0 0 np=3D4 qsp=3D0 rpq=3D4 cbr=3D0 cng=3D0 gpc=3D0 gps=3D0 nf=3D=
0 nn=3D0
>> rcutorture test sequence: 0 (test in progress)
>> rcutorture update version number: 7004
>> cat: /sys/kernel/debug/rcu/rcuboost: No such file or directory
>> no rcuboost
>>
>> Thu Apr 21 14:38:27 CEST 2011
>> rcu_preempt_state: completed=3D17263 =C2=A0gpnum=3D17264 =C2=A0age=3D=
5400 =C2=A0max=3D221
>> rcu_sched_state: completed=3D-300 =C2=A0gpnum=3D4294966996 =C2=A0age=
=3D0 =C2=A0max=3D0
>> rcu_bh_state: completed=3D-298 =C2=A0gpnum=3D4294966998 =C2=A0age=3D=
0 =C2=A0max=3D1
>> rcu_preempt:
>> c=3D17263 g=3D17264 s=3D3 jfq=3D2 j=3D87dc nfqs=3D1267/nfqsng=3D0(12=
67) fqlh=3D0
>> 1/1 ..>. 0:31 ^0
>> 1/1 ..>. 0:15 ^0 =C2=A0 =C2=A00/0 ..>. 16:31 ^1
>> rcu_sched:
>> c=3D4294966996 g=3D4294966996 s=3D0 jfq=3D30756 j=3D87dc nfqs=3D0/nf=
qsng=3D0(0) fqlh=3D0
>> 0/1 ..>. 0:31 ^0
>> 0/1 ..>. 0:15 ^0 =C2=A0 =C2=A00/0 ..>. 16:31 ^1
>> rcu_bh:
>> c=3D4294966998 g=3D4294966998 s=3D0 jfq=3D-39747 j=3D87dc nfqs=3D0/n=
fqsng=3D0(0) fqlh=3D0
>> 0/1 ..>. 0:31 ^0
>> 0/1 ..>. 0:15 ^0 =C2=A0 =C2=A00/0 ..>. 16:31 ^1
>> rcu_preempt:
>> =C2=A0 0 c=3D17263 g=3D17264 pq=3D1 pqc=3D17263 qp=3D1 dt=3D40499/1/=
0 df=3D0 of=3D0 ri=3D0 ql=3D14248 qs=3DN.W. kt=3D1/W b=3D2147483647 ci=3D=
299175 co=3D0 ca=3D0
>> rcu_sched:
>> =C2=A0 0 c=3D0 g=3D0 pq=3D1 pqc=3D4294967295 qp=3D1 dt=3D40499/1/0 d=
f=3D0 of=3D0 ri=3D0 ql=3D0 qs=3D.... kt=3D1/W b=3D10 ci=3D0 co=3D0 ca=3D=
0
>> rcu_bh:
>> =C2=A0 0 c=3D4294966998 g=3D4294966998 pq=3D1 pqc=3D4294966997 qp=3D=
0 dt=3D40499/1/0 df=3D0 of=3D0 ri=3D0 ql=3D0 qs=3D.... kt=3D1/W b=3D10 =
ci=3D6 co=3D0 ca=3D0
>> rcu_preempt:
>> =C2=A0 0 np=3D0 qsp=3D0 rpq=3D0 cbr=3D0 cng=3D0 gpc=3D0 gps=3D0 nf=3D=
0 nn=3D0
>> rcu_sched:
>> =C2=A0 0 np=3D34330 qsp=3D4 rpq=3D34326 cbr=3D0 cng=3D0 gpc=3D0 gps=3D=
0 nf=3D0 nn=3D4
>> rcu_bh:
>> =C2=A0 0 np=3D4 qsp=3D0 rpq=3D4 cbr=3D0 cng=3D0 gpc=3D0 gps=3D0 nf=3D=
0 nn=3D0
>> rcutorture test sequence: 0 (test in progress)
>> rcutorture update version number: 7004
>> cat: /sys/kernel/debug/rcu/rcuboost: No such file or directory
>> no rcuboost
>>
>> Thu Apr 21 14:38:42 CEST 2011
>> rcu_preempt_state: completed=3D17263 =C2=A0gpnum=3D17264 =C2=A0age=3D=
9156 =C2=A0max=3D221
>> rcu_sched_state: completed=3D-300 =C2=A0gpnum=3D4294966996 =C2=A0age=
=3D0 =C2=A0max=3D0
>> rcu_bh_state: completed=3D-298 =C2=A0gpnum=3D4294966998 =C2=A0age=3D=
0 =C2=A0max=3D1
>> rcu_preempt:
>> c=3D17263 g=3D17264 s=3D3 jfq=3D0 j=3D9689 nfqs=3D1544/nfqsng=3D0(15=
44) fqlh=3D0
>> 1/1 ..>. 0:31 ^0
>> 1/1 ..>. 0:15 ^0 =C2=A0 =C2=A00/0 ..>. 16:31 ^1
>> rcu_sched:
>> c=3D4294966996 g=3D4294966996 s=3D0 jfq=3D26999 j=3D9689 nfqs=3D0/nf=
qsng=3D0(0) fqlh=3D0
>> 0/1 ..>. 0:31 ^0
>> 0/1 ..>. 0:15 ^0 =C2=A0 =C2=A00/0 ..>. 16:31 ^1
>> rcu_bh:
>> c=3D4294966998 g=3D4294966998 s=3D0 jfq=3D-43504 j=3D9689 nfqs=3D0/n=
fqsng=3D0(0) fqlh=3D0
>> 0/1 ..>. 0:31 ^0
>> 0/1 ..>. 0:15 ^0 =C2=A0 =C2=A00/0 ..>. 16:31 ^1
>> rcu_preempt:
>> =C2=A0 0 c=3D17263 g=3D17264 pq=3D1 pqc=3D17263 qp=3D1 dt=3D40499/1/=
0 df=3D0 of=3D0 ri=3D0 ql=3D27472 qs=3DN.W. kt=3D1/W b=3D2147483647 ci=3D=
299175 co=3D0 ca=3D0
>> rcu_sched:
>> =C2=A0 0 c=3D0 g=3D0 pq=3D1 pqc=3D4294967295 qp=3D1 dt=3D40499/1/0 d=
f=3D0 of=3D0 ri=3D0 ql=3D0 qs=3D.... kt=3D1/W b=3D10 ci=3D0 co=3D0 ca=3D=
0
>> rcu_bh:
>> =C2=A0 0 c=3D4294966998 g=3D4294966998 pq=3D1 pqc=3D4294966997 qp=3D=
0 dt=3D40499/1/0 df=3D0 of=3D0 ri=3D0 ql=3D0 qs=3D.... kt=3D1/W b=3D10 =
ci=3D6 co=3D0 ca=3D0
>> rcu_preempt:
>> =C2=A0 0 np=3D0 qsp=3D0 rpq=3D0 cbr=3D0 cng=3D0 gpc=3D0 gps=3D0 nf=3D=
0 nn=3D0
>> rcu_sched:
>> =C2=A0 0 np=3D38089 qsp=3D4 rpq=3D38085 cbr=3D0 cng=3D0 gpc=3D0 gps=3D=
0 nf=3D0 nn=3D4
>> rcu_bh:
>> =C2=A0 0 np=3D4 qsp=3D0 rpq=3D4 cbr=3D0 cng=3D0 gpc=3D0 gps=3D0 nf=3D=
0 nn=3D0
>> rcutorture test sequence: 0 (test in progress)
>> rcutorture update version number: 7004
>> cat: /sys/kernel/debug/rcu/rcuboost: No such file or directory
>> no rcuboost
>>
>> Thu Apr 21 14:38:57 CEST 2011
>> rcu_preempt_state: completed=3D17263 =C2=A0gpnum=3D17264 =C2=A0age=3D=
12918 =C2=A0max=3D221
>> rcu_sched_state: completed=3D-300 =C2=A0gpnum=3D4294966996 =C2=A0age=
=3D0 =C2=A0max=3D0
>> rcu_bh_state: completed=3D-298 =C2=A0gpnum=3D4294966998 =C2=A0age=3D=
0 =C2=A0max=3D1
>> rcu_preempt:
>> c=3D17263 g=3D17264 s=3D3 jfq=3D3 j=3Da53b nfqs=3D2120/nfqsng=3D0(21=
20) fqlh=3D0
>> 1/1 ..>. 0:31 ^0
>> 1/1 ..>. 0:15 ^0 =C2=A0 =C2=A00/0 ..>. 16:31 ^1
>> rcu_sched:
>> c=3D4294966996 g=3D4294966996 s=3D0 jfq=3D23237 j=3Da53b nfqs=3D0/nf=
qsng=3D0(0) fqlh=3D0
>> 0/1 ..>. 0:31 ^0
>> 0/1 ..>. 0:15 ^0 =C2=A0 =C2=A00/0 ..>. 16:31 ^1
>> rcu_bh:
>> c=3D4294966998 g=3D4294966998 s=3D0 jfq=3D-47266 j=3Da53b nfqs=3D0/n=
fqsng=3D0(0) fqlh=3D0
>> 0/1 ..>. 0:31 ^0
>> 0/1 ..>. 0:15 ^0 =C2=A0 =C2=A00/0 ..>. 16:31 ^1
>> rcu_preempt:
>> =C2=A0 0 c=3D17263 g=3D17264 pq=3D1 pqc=3D17263 qp=3D1 dt=3D40499/1/=
0 df=3D0 of=3D0 ri=3D0 ql=3D51443 qs=3DN.W. kt=3D1/W b=3D2147483647 ci=3D=
299175 co=3D0 ca=3D0
>> rcu_sched:
>> =C2=A0 0 c=3D0 g=3D0 pq=3D1 pqc=3D4294967295 qp=3D1 dt=3D40499/1/0 d=
f=3D0 of=3D0 ri=3D0 ql=3D0 qs=3D.... kt=3D1/W b=3D10 ci=3D0 co=3D0 ca=3D=
0
>> rcu_bh:
>> =C2=A0 0 c=3D4294966998 g=3D4294966998 pq=3D1 pqc=3D4294966997 qp=3D=
0 dt=3D40499/1/0 df=3D0 of=3D0 ri=3D0 ql=3D0 qs=3D.... kt=3D1/W b=3D10 =
ci=3D6 co=3D0 ca=3D0
>> rcu_preempt:
>> =C2=A0 0 np=3D0 qsp=3D0 rpq=3D0 cbr=3D0 cng=3D0 gpc=3D0 gps=3D0 nf=3D=
0 nn=3D0
>> rcu_sched:
>> =C2=A0 0 np=3D41848 qsp=3D4 rpq=3D41844 cbr=3D0 cng=3D0 gpc=3D0 gps=3D=
0 nf=3D0 nn=3D4
>> rcu_bh:
>> =C2=A0 0 np=3D4 qsp=3D0 rpq=3D4 cbr=3D0 cng=3D0 gpc=3D0 gps=3D0 nf=3D=
0 nn=3D0
>> rcutorture test sequence: 0 (test in progress)
>> rcutorture update version number: 7004
>> cat: /sys/kernel/debug/rcu/rcuboost: No such file or directory
>> no rcuboost
>>
>> Thu Apr 21 14:39:12 CEST 2011
>> rcu_preempt_state: completed=3D17263 =C2=A0gpnum=3D17264 =C2=A0age=3D=
16673 =C2=A0max=3D221
>> rcu_sched_state: completed=3D-300 =C2=A0gpnum=3D4294966996 =C2=A0age=
=3D0 =C2=A0max=3D0
>> rcu_bh_state: completed=3D-298 =C2=A0gpnum=3D4294966998 =C2=A0age=3D=
0 =C2=A0max=3D1
>> rcu_preempt:
>> c=3D17263 g=3D17264 s=3D3 jfq=3D3 j=3Db3e7 nfqs=3D2799/nfqsng=3D0(27=
99) fqlh=3D0
>> 1/1 ..>. 0:31 ^0
>> 1/1 ..>. 0:15 ^0 =C2=A0 =C2=A00/0 ..>. 16:31 ^1
>> rcu_sched:
>> c=3D4294966996 g=3D4294966996 s=3D0 jfq=3D19481 j=3Db3e7 nfqs=3D0/nf=
qsng=3D0(0) fqlh=3D0
>> 0/1 ..>. 0:31 ^0
>> 0/1 ..>. 0:15 ^0 =C2=A0 =C2=A00/0 ..>. 16:31 ^1
>> rcu_bh:
>> c=3D4294966998 g=3D4294966998 s=3D0 jfq=3D-51022 j=3Db3e7 nfqs=3D0/n=
fqsng=3D0(0) fqlh=3D0
>> 0/1 ..>. 0:31 ^0
>> 0/1 ..>. 0:15 ^0 =C2=A0 =C2=A00/0 ..>. 16:31 ^1
>> rcu_preempt:
>> =C2=A0 0 c=3D17263 g=3D17264 pq=3D1 pqc=3D17263 qp=3D1 dt=3D40499/1/=
0 df=3D0 of=3D0 ri=3D0 ql=3D94614 qs=3DN.W. kt=3D1/W b=3D2147483647 ci=3D=
299175 co=3D0 ca=3D0
>> rcu_sched:
>> =C2=A0 0 c=3D0 g=3D0 pq=3D1 pqc=3D4294967295 qp=3D1 dt=3D40499/1/0 d=
f=3D0 of=3D0 ri=3D0 ql=3D0 qs=3D.... kt=3D1/W b=3D10 ci=3D0 co=3D0 ca=3D=
0
>> rcu_bh:
>> =C2=A0 0 c=3D4294966998 g=3D4294966998 pq=3D1 pqc=3D4294966997 qp=3D=
0 dt=3D40499/1/0 df=3D0 of=3D0 ri=3D0 ql=3D0 qs=3D.... kt=3D1/W b=3D10 =
ci=3D6 co=3D0 ca=3D0
>> rcu_preempt:
>> =C2=A0 0 np=3D0 qsp=3D0 rpq=3D0 cbr=3D0 cng=3D0 gpc=3D0 gps=3D0 nf=3D=
0 nn=3D0
>> rcu_sched:
>> =C2=A0 0 np=3D45606 qsp=3D4 rpq=3D45602 cbr=3D0 cng=3D0 gpc=3D0 gps=3D=
0 nf=3D0 nn=3D4
>> rcu_bh:
>> =C2=A0 0 np=3D4 qsp=3D0 rpq=3D4 cbr=3D0 cng=3D0 gpc=3D0 gps=3D0 nf=3D=
0 nn=3D0
>> rcutorture test sequence: 0 (test in progress)
>> rcutorture update version number: 7004
>> cat: /sys/kernel/debug/rcu/rcuboost: No such file or directory
>> no rcuboost
>>
>> Thu Apr 21 14:39:27 CEST 2011
>> rcu_preempt_state: completed=3D17263 =C2=A0gpnum=3D17264 =C2=A0age=3D=
20432 =C2=A0max=3D221
>> rcu_sched_state: completed=3D-300 =C2=A0gpnum=3D4294966996 =C2=A0age=
=3D0 =C2=A0max=3D0
>> rcu_bh_state: completed=3D-298 =C2=A0gpnum=3D4294966998 =C2=A0age=3D=
0 =C2=A0max=3D1
>> rcu_preempt:
>> c=3D17263 g=3D17264 s=3D3 jfq=3D3 j=3Dc297 nfqs=3D3471/nfqsng=3D0(34=
71) fqlh=3D0
>> 1/1 ..>. 0:31 ^0
>> 1/1 ..>. 0:15 ^0 =C2=A0 =C2=A00/0 ..>. 16:31 ^1
>> rcu_sched:
>> c=3D4294966996 g=3D4294966996 s=3D0 jfq=3D15721 j=3Dc297 nfqs=3D0/nf=
qsng=3D0(0) fqlh=3D0
>> 0/1 ..>. 0:31 ^0
>> 0/1 ..>. 0:15 ^0 =C2=A0 =C2=A00/0 ..>. 16:31 ^1
>> rcu_bh:
>> c=3D4294966998 g=3D4294966998 s=3D0 jfq=3D-54782 j=3Dc297 nfqs=3D0/n=
fqsng=3D0(0) fqlh=3D0
>> 0/1 ..>. 0:31 ^0
>> 0/1 ..>. 0:15 ^0 =C2=A0 =C2=A00/0 ..>. 16:31 ^1
>> rcu_preempt:
>> =C2=A0 0 c=3D17263 g=3D17264 pq=3D1 pqc=3D17263 qp=3D1 dt=3D40499/1/=
0 df=3D0 of=3D0 ri=3D0 ql=3D137507 qs=3DN.W. kt=3D1/W b=3D2147483647 ci=
=3D299175 co=3D0 ca=3D0
>> rcu_sched:
>> =C2=A0 0 c=3D0 g=3D0 pq=3D1 pqc=3D4294967295 qp=3D1 dt=3D40499/1/0 d=
f=3D0 of=3D0 ri=3D0 ql=3D0 qs=3D.... kt=3D1/W b=3D10 ci=3D0 co=3D0 ca=3D=
0
>> rcu_bh:
>> =C2=A0 0 c=3D4294966998 g=3D4294966998 pq=3D1 pqc=3D4294966997 qp=3D=
0 dt=3D40499/1/0 df=3D0 of=3D0 ri=3D0 ql=3D0 qs=3D.... kt=3D1/W b=3D10 =
ci=3D6 co=3D0 ca=3D0
>> rcu_preempt:
>> =C2=A0 0 np=3D0 qsp=3D0 rpq=3D0 cbr=3D0 cng=3D0 gpc=3D0 gps=3D0 nf=3D=
0 nn=3D0
>> rcu_sched:
>> =C2=A0 0 np=3D49367 qsp=3D4 rpq=3D49363 cbr=3D0 cng=3D0 gpc=3D0 gps=3D=
0 nf=3D0 nn=3D4
>> rcu_bh:
>> =C2=A0 0 np=3D4 qsp=3D0 rpq=3D4 cbr=3D0 cng=3D0 gpc=3D0 gps=3D0 nf=3D=
0 nn=3D0
>> rcutorture test sequence: 0 (test in progress)
>> rcutorture update version number: 7004
>> cat: /sys/kernel/debug/rcu/rcuboost: No such file or directory
>> no rcuboost
>>
>> Thu Apr 21 14:39:42 CEST 2011
>> rcu_preempt_state: completed=3D17263 =C2=A0gpnum=3D17264 =C2=A0age=3D=
24197 =C2=A0max=3D221
>> rcu_sched_state: completed=3D-300 =C2=A0gpnum=3D4294966996 =C2=A0age=
=3D0 =C2=A0max=3D0
>> rcu_bh_state: completed=3D-298 =C2=A0gpnum=3D4294966998 =C2=A0age=3D=
0 =C2=A0max=3D1
>> rcu_preempt:
>> c=3D17263 g=3D17264 s=3D3 jfq=3D2 j=3Dd14a nfqs=3D4116/nfqsng=3D0(41=
16) fqlh=3D0
>> 1/1 ..>. 0:31 ^0
>> 1/1 ..>. 0:15 ^0 =C2=A0 =C2=A00/0 ..>. 16:31 ^1
>> rcu_sched:
>> c=3D4294966996 g=3D4294966996 s=3D0 jfq=3D11958 j=3Dd14a nfqs=3D0/nf=
qsng=3D0(0) fqlh=3D0
>> 0/1 ..>. 0:31 ^0
>> 0/1 ..>. 0:15 ^0 =C2=A0 =C2=A00/0 ..>. 16:31 ^1
>> rcu_bh:
>> c=3D4294966998 g=3D4294966998 s=3D0 jfq=3D-58545 j=3Dd14a nfqs=3D0/n=
fqsng=3D0(0) fqlh=3D0
>> 0/1 ..>. 0:31 ^0
>> 0/1 ..>. 0:15 ^0 =C2=A0 =C2=A00/0 ..>. 16:31 ^1
>> rcu_preempt:
>> =C2=A0 0 c=3D17263 g=3D17264 pq=3D1 pqc=3D17263 qp=3D1 dt=3D40499/1/=
0 df=3D0 of=3D0 ri=3D0 ql=3D188499 qs=3DN.W. kt=3D1/W b=3D2147483647 ci=
=3D299175 co=3D0 ca=3D0
>> rcu_sched:
>> =C2=A0 0 c=3D0 g=3D0 pq=3D1 pqc=3D4294967295 qp=3D1 dt=3D40499/1/0 d=
f=3D0 of=3D0 ri=3D0 ql=3D0 qs=3D.... kt=3D1/W b=3D10 ci=3D0 co=3D0 ca=3D=
0
>> rcu_bh:
>> =C2=A0 0 c=3D4294966998 g=3D4294966998 pq=3D1 pqc=3D4294966997 qp=3D=
0 dt=3D40499/1/0 df=3D0 of=3D0 ri=3D0 ql=3D0 qs=3D.... kt=3D1/W b=3D10 =
ci=3D6 co=3D0 ca=3D0
>> rcu_preempt:
>> =C2=A0 0 np=3D0 qsp=3D0 rpq=3D0 cbr=3D0 cng=3D0 gpc=3D0 gps=3D0 nf=3D=
0 nn=3D0
>> rcu_sched:
>> =C2=A0 0 np=3D53130 qsp=3D4 rpq=3D53126 cbr=3D0 cng=3D0 gpc=3D0 gps=3D=
0 nf=3D0 nn=3D4
>> rcu_bh:
>> =C2=A0 0 np=3D4 qsp=3D0 rpq=3D4 cbr=3D0 cng=3D0 gpc=3D0 gps=3D0 nf=3D=
0 nn=3D0
>> rcutorture test sequence: 0 (test in progress)
>> rcutorture update version number: 7004
>> cat: /sys/kernel/debug/rcu/rcuboost: No such file or directory
>> no rcuboost
>>
>> Thu Apr 21 14:39:57 CEST 2011
>> rcu_preempt_state: completed=3D17263 =C2=A0gpnum=3D17264 =C2=A0age=3D=
27964 =C2=A0max=3D221
>> rcu_sched_state: completed=3D-300 =C2=A0gpnum=3D4294966996 =C2=A0age=
=3D0 =C2=A0max=3D0
>> rcu_bh_state: completed=3D-298 =C2=A0gpnum=3D4294966998 =C2=A0age=3D=
0 =C2=A0max=3D1
>> rcu_preempt:
>> c=3D17263 g=3D17264 s=3D3 jfq=3D1 j=3De001 nfqs=3D4810/nfqsng=3D0(48=
10) fqlh=3D0
>> 1/1 ..>. 0:31 ^0
>> 1/1 G.>T 0:15 ^0 =C2=A0 =C2=A00/0 ..>. 16:31 ^1
>> rcu_sched:
>> c=3D4294966996 g=3D4294966996 s=3D0 jfq=3D8191 j=3De001 nfqs=3D0/nfq=
sng=3D0(0) fqlh=3D0
>> 0/1 ..>. 0:31 ^0
>> 0/1 ..>. 0:15 ^0 =C2=A0 =C2=A00/0 ..>. 16:31 ^1
>> rcu_bh:
>> c=3D4294966998 g=3D4294966998 s=3D0 jfq=3D-62312 j=3De001 nfqs=3D0/n=
fqsng=3D0(0) fqlh=3D0
>> 0/1 ..>. 0:31 ^0
>> 0/1 ..>. 0:15 ^0 =C2=A0 =C2=A00/0 ..>. 16:31 ^1
>> rcu_preempt:
>> =C2=A0 0 c=3D17263 g=3D17264 pq=3D1 pqc=3D17263 qp=3D1 dt=3D40499/1/=
0 df=3D0 of=3D0 ri=3D0 ql=3D235065 qs=3DN.W. kt=3D1/W b=3D2147483647 ci=
=3D299175 co=3D0 ca=3D0
>> rcu_sched:
>> =C2=A0 0 c=3D0 g=3D0 pq=3D1 pqc=3D4294967295 qp=3D1 dt=3D40499/1/0 d=
f=3D0 of=3D0 ri=3D0 ql=3D0 qs=3D.... kt=3D1/W b=3D10 ci=3D0 co=3D0 ca=3D=
0
>> rcu_bh:
>> =C2=A0 0 c=3D4294966998 g=3D4294966998 pq=3D1 pqc=3D4294966997 qp=3D=
0 dt=3D40499/1/0 df=3D0 of=3D0 ri=3D0 ql=3D0 qs=3D.... kt=3D1/W b=3D10 =
ci=3D6 co=3D0 ca=3D0
>> rcu_preempt:
>> =C2=A0 0 np=3D0 qsp=3D0 rpq=3D0 cbr=3D0 cng=3D0 gpc=3D0 gps=3D0 nf=3D=
0 nn=3D0
>> rcu_sched:
>> =C2=A0 0 np=3D56897 qsp=3D4 rpq=3D56893 cbr=3D0 cng=3D0 gpc=3D0 gps=3D=
0 nf=3D0 nn=3D4
>> rcu_bh:
>> =C2=A0 0 np=3D4 qsp=3D0 rpq=3D4 cbr=3D0 cng=3D0 gpc=3D0 gps=3D0 nf=3D=
0 nn=3D0
>> rcutorture test sequence: 0 (test in progress)
>> rcutorture update version number: 7004
>> cat: /sys/kernel/debug/rcu/rcuboost: No such file or directory
>> no rcuboost
>>
>> Thu Apr 21 14:40:12 CEST 2011
>> rcu_preempt_state: completed=3D17263 =C2=A0gpnum=3D17264 =C2=A0age=3D=
31722 =C2=A0max=3D221
>> rcu_sched_state: completed=3D-300 =C2=A0gpnum=3D4294966996 =C2=A0age=
=3D0 =C2=A0max=3D0
>> rcu_bh_state: completed=3D-298 =C2=A0gpnum=3D4294966998 =C2=A0age=3D=
0 =C2=A0max=3D1
>> rcu_preempt:
>> c=3D17263 g=3D17264 s=3D3 jfq=3D2 j=3Deeaf nfqs=3D5478/nfqsng=3D0(54=
78) fqlh=3D0
>> 1/1 ..>. 0:31 ^0
>> 1/1 ..>. 0:15 ^0 =C2=A0 =C2=A00/0 ..>. 16:31 ^1
>> rcu_sched:
>> c=3D4294966996 g=3D4294966996 s=3D0 jfq=3D4433 j=3Deeaf nfqs=3D0/nfq=
sng=3D0(0) fqlh=3D0
>> 0/1 ..>. 0:31 ^0
>> 0/1 ..>. 0:15 ^0 =C2=A0 =C2=A00/0 ..>. 16:31 ^1
>> rcu_bh:
>> c=3D4294966998 g=3D4294966998 s=3D0 jfq=3D-66070 j=3Deeaf nfqs=3D0/n=
fqsng=3D0(0) fqlh=3D0
>> 0/1 ..>. 0:31 ^0
>> 0/1 ..>. 0:15 ^0 =C2=A0 =C2=A00/0 ..>. 16:31 ^1
>> rcu_preempt:
>> =C2=A0 0 c=3D17263 g=3D17264 pq=3D1 pqc=3D17263 qp=3D1 dt=3D40499/1/=
0 df=3D0 of=3D0 ri=3D0 ql=3D276793 qs=3DN.W. kt=3D1/W b=3D2147483647 ci=
=3D299175 co=3D0 ca=3D0
>> rcu_sched:
>> =C2=A0 0 c=3D0 g=3D0 pq=3D1 pqc=3D4294967295 qp=3D1 dt=3D40499/1/0 d=
f=3D0 of=3D0 ri=3D0 ql=3D0 qs=3D.... kt=3D1/W b=3D10 ci=3D0 co=3D0 ca=3D=
0
>> rcu_bh:
>> =C2=A0 0 c=3D4294966998 g=3D4294966998 pq=3D1 pqc=3D4294966997 qp=3D=
0 dt=3D40499/1/0 df=3D0 of=3D0 ri=3D0 ql=3D0 qs=3D.... kt=3D1/W b=3D10 =
ci=3D6 co=3D0 ca=3D0
>> rcu_preempt:
>> =C2=A0 0 np=3D0 qsp=3D0 rpq=3D0 cbr=3D0 cng=3D0 gpc=3D0 gps=3D0 nf=3D=
0 nn=3D0
>> rcu_sched:
>> =C2=A0 0 np=3D60655 qsp=3D4 rpq=3D60651 cbr=3D0 cng=3D0 gpc=3D0 gps=3D=
0 nf=3D0 nn=3D4
>> rcu_bh:
>> =C2=A0 0 np=3D4 qsp=3D0 rpq=3D4 cbr=3D0 cng=3D0 gpc=3D0 gps=3D0 nf=3D=
0 nn=3D0
>> rcutorture test sequence: 0 (test in progress)
>> rcutorture update version number: 7004
>> cat: /sys/kernel/debug/rcu/rcuboost: No such file or directory
>> no rcuboost
>>
>> Thu Apr 21 14:40:28 CEST 2011
>> rcu_preempt_state: completed=3D17263 =C2=A0gpnum=3D17264 =C2=A0age=3D=
35486 =C2=A0max=3D221
>> rcu_sched_state: completed=3D-300 =C2=A0gpnum=3D4294966996 =C2=A0age=
=3D0 =C2=A0max=3D0
>> rcu_bh_state: completed=3D-298 =C2=A0gpnum=3D4294966998 =C2=A0age=3D=
0 =C2=A0max=3D1
>> rcu_preempt:
>> c=3D17263 g=3D17264 s=3D3 jfq=3D3 j=3Dfd63 nfqs=3D6179/nfqsng=3D0(61=
79) fqlh=3D0
>> 1/1 ..>. 0:31 ^0
>> 1/1 ..>. 0:15 ^0 =C2=A0 =C2=A00/0 ..>. 16:31 ^1
>> rcu_sched:
>> c=3D4294966996 g=3D4294966996 s=3D0 jfq=3D669 j=3Dfd63 nfqs=3D0/nfqs=
ng=3D0(0) fqlh=3D0
>> 0/1 ..>. 0:31 ^0
>> 0/1 ..>. 0:15 ^0 =C2=A0 =C2=A00/0 ..>. 16:31 ^1
>> rcu_bh:
>> c=3D4294966998 g=3D4294966998 s=3D0 jfq=3D-69834 j=3Dfd63 nfqs=3D0/n=
fqsng=3D0(0) fqlh=3D0
>> 0/1 ..>. 0:31 ^0
>> 0/1 ..>. 0:15 ^0 =C2=A0 =C2=A00/0 ..>. 16:31 ^1
>> rcu_preempt:
>> =C2=A0 0 c=3D17263 g=3D17264 pq=3D1 pqc=3D17263 qp=3D1 dt=3D40499/1/=
0 df=3D0 of=3D0 ri=3D0 ql=3D319929 qs=3DN.W. kt=3D1/W b=3D2147483647 ci=
=3D299175 co=3D0 ca=3D0
>> rcu_sched:
>> =C2=A0 0 c=3D0 g=3D0 pq=3D1 pqc=3D4294967295 qp=3D1 dt=3D40499/1/0 d=
f=3D0 of=3D0 ri=3D0 ql=3D0 qs=3D.... kt=3D1/W b=3D10 ci=3D0 co=3D0 ca=3D=
0
>> rcu_bh:
>> =C2=A0 0 c=3D4294966998 g=3D4294966998 pq=3D1 pqc=3D4294966997 qp=3D=
0 dt=3D40499/1/0 df=3D0 of=3D0 ri=3D0 ql=3D0 qs=3D.... kt=3D1/W b=3D10 =
ci=3D6 co=3D0 ca=3D0
>> rcu_preempt:
>> =C2=A0 0 np=3D0 qsp=3D0 rpq=3D0 cbr=3D0 cng=3D0 gpc=3D0 gps=3D0 nf=3D=
0 nn=3D0
>> rcu_sched:
>> =C2=A0 0 np=3D64416 qsp=3D4 rpq=3D64412 cbr=3D0 cng=3D0 gpc=3D0 gps=3D=
0 nf=3D0 nn=3D4
>> rcu_bh:
>> =C2=A0 0 np=3D4 qsp=3D0 rpq=3D4 cbr=3D0 cng=3D0 gpc=3D0 gps=3D0 nf=3D=
0 nn=3D0
>> rcutorture test sequence: 0 (test in progress)
>> rcutorture update version number: 7004
>> cat: /sys/kernel/debug/rcu/rcuboost: No such file or directory
>> no rcuboost
>>
>> Thu Apr 21 14:40:43 CEST 2011
>> rcu_preempt_state: completed=3D17263 =C2=A0gpnum=3D17264 =C2=A0age=3D=
39246 =C2=A0max=3D221
>> rcu_sched_state: completed=3D-300 =C2=A0gpnum=3D4294966996 =C2=A0age=
=3D0 =C2=A0max=3D0
>> rcu_bh_state: completed=3D-298 =C2=A0gpnum=3D4294966998 =C2=A0age=3D=
0 =C2=A0max=3D1
>> rcu_preempt:
>> c=3D17263 g=3D17264 s=3D3 jfq=3D3 j=3Dc13 nfqs=3D6856/nfqsng=3D0(685=
6) fqlh=3D0
>> 1/1 ..>. 0:31 ^0
>> 1/1 ..>. 0:15 ^0 =C2=A0 =C2=A00/0 ..>. 16:31 ^1
>> rcu_sched:
>> c=3D4294966996 g=3D4294966996 s=3D0 jfq=3D-3091 j=3Dc13 nfqs=3D0/nfq=
sng=3D0(0) fqlh=3D0
>> 0/1 ..>. 0:31 ^0
>> 0/1 ..>. 0:15 ^0 =C2=A0 =C2=A00/0 ..>. 16:31 ^1
>> rcu_bh:
>> c=3D4294966998 g=3D4294966998 s=3D0 jfq=3D-73594 j=3Dc13 nfqs=3D0/nf=
qsng=3D0(0) fqlh=3D0
>> 0/1 ..>. 0:31 ^0
>> 0/1 ..>. 0:15 ^0 =C2=A0 =C2=A00/0 ..>. 16:31 ^1
>> rcu_preempt:
>> =C2=A0 0 c=3D17263 g=3D17264 pq=3D1 pqc=3D17263 qp=3D1 dt=3D40499/1/=
0 df=3D0 of=3D0 ri=3D0 ql=3D358327 qs=3DN.W. kt=3D1/W b=3D2147483647 ci=
=3D299175 co=3D0 ca=3D0
>> rcu_sched:
>> =C2=A0 0 c=3D0 g=3D0 pq=3D1 pqc=3D4294967295 qp=3D1 dt=3D40499/1/0 d=
f=3D0 of=3D0 ri=3D0 ql=3D0 qs=3D.... kt=3D1/W b=3D10 ci=3D0 co=3D0 ca=3D=
0
>> rcu_bh:
>> =C2=A0 0 c=3D4294966998 g=3D4294966998 pq=3D1 pqc=3D4294966997 qp=3D=
0 dt=3D40499/1/0 df=3D0 of=3D0 ri=3D0 ql=3D0 qs=3D.... kt=3D1/W b=3D10 =
ci=3D6 co=3D0 ca=3D0
>> rcu_preempt:
>> =C2=A0 0 np=3D0 qsp=3D0 rpq=3D0 cbr=3D0 cng=3D0 gpc=3D0 gps=3D0 nf=3D=
0 nn=3D0
>> rcu_sched:
>> =C2=A0 0 np=3D68179 qsp=3D4 rpq=3D68175 cbr=3D0 cng=3D0 gpc=3D0 gps=3D=
0 nf=3D0 nn=3D4
>> rcu_bh:
>> =C2=A0 0 np=3D4 qsp=3D0 rpq=3D4 cbr=3D0 cng=3D0 gpc=3D0 gps=3D0 nf=3D=
0 nn=3D0
>> rcutorture test sequence: 0 (test in progress)
>> rcutorture update version number: 7004
>> cat: /sys/kernel/debug/rcu/rcuboost: No such file or directory
>> no rcuboost
>>
>> Thu Apr 21 14:40:58 CEST 2011
>> rcu_preempt_state: completed=3D17263 =C2=A0gpnum=3D17264 =C2=A0age=3D=
43011 =C2=A0max=3D221
>> rcu_sched_state: completed=3D-300 =C2=A0gpnum=3D4294966996 =C2=A0age=
=3D0 =C2=A0max=3D0
>> rcu_bh_state: completed=3D-298 =C2=A0gpnum=3D4294966998 =C2=A0age=3D=
0 =C2=A0max=3D1
>> rcu_preempt:
>> c=3D17263 g=3D17264 s=3D3 jfq=3D2 j=3D1ac7 nfqs=3D7535/nfqsng=3D0(75=
35) fqlh=3D0
>> 1/1 ..>. 0:31 ^0
>> 1/1 G.>T 0:15 ^0 =C2=A0 =C2=A00/0 ..>. 16:31 ^1
>> rcu_sched:
>> c=3D4294966996 g=3D4294966996 s=3D0 jfq=3D-6855 j=3D1ac7 nfqs=3D0/nf=
qsng=3D0(0) fqlh=3D0
>> 0/1 ..>. 0:31 ^0
>> 0/1 ..>. 0:15 ^0 =C2=A0 =C2=A00/0 ..>. 16:31 ^1
>> rcu_bh:
>> c=3D4294966998 g=3D4294966998 s=3D0 jfq=3D-77358 j=3D1ac7 nfqs=3D0/n=
fqsng=3D0(0) fqlh=3D0
>> 0/1 ..>. 0:31 ^0
>> 0/1 ..>. 0:15 ^0 =C2=A0 =C2=A00/0 ..>. 16:31 ^1
>> rcu_preempt:
>> =C2=A0 0 c=3D17263 g=3D17264 pq=3D1 pqc=3D17263 qp=3D1 dt=3D40499/1/=
0 df=3D0 of=3D0 ri=3D0 ql=3D413879 qs=3DN.W. kt=3D1/W b=3D2147483647 ci=
=3D299175 co=3D0 ca=3D0
>> rcu_sched:
>> =C2=A0 0 c=3D0 g=3D0 pq=3D1 pqc=3D4294967295 qp=3D1 dt=3D40499/1/0 d=
f=3D0 of=3D0 ri=3D0 ql=3D0 qs=3D.... kt=3D1/W b=3D10 ci=3D0 co=3D0 ca=3D=
0
>> rcu_bh:
>> =C2=A0 0 c=3D4294966998 g=3D4294966998 pq=3D1 pqc=3D4294966997 qp=3D=
0 dt=3D40499/1/0 df=3D0 of=3D0 ri=3D0 ql=3D0 qs=3D.... kt=3D1/W b=3D10 =
ci=3D6 co=3D0 ca=3D0
>> rcu_preempt:
>> =C2=A0 0 np=3D0 qsp=3D0 rpq=3D0 cbr=3D0 cng=3D0 gpc=3D0 gps=3D0 nf=3D=
0 nn=3D0
>> rcu_sched:
>> =C2=A0 0 np=3D71941 qsp=3D4 rpq=3D71937 cbr=3D0 cng=3D0 gpc=3D0 gps=3D=
0 nf=3D0 nn=3D4
>> rcu_bh:
>> =C2=A0 0 np=3D4 qsp=3D0 rpq=3D4 cbr=3D0 cng=3D0 gpc=3D0 gps=3D0 nf=3D=
0 nn=3D0
>> rcutorture test sequence: 0 (test in progress)
>> rcutorture update version number: 7004
>> cat: /sys/kernel/debug/rcu/rcuboost: No such file or directory
>> no rcuboost
>>
>> Thu Apr 21 14:41:13 CEST 2011
>> rcu_preempt_state: completed=3D17263 =C2=A0gpnum=3D17264 =C2=A0age=3D=
46764 =C2=A0max=3D221
>> rcu_sched_state: completed=3D-300 =C2=A0gpnum=3D4294966996 =C2=A0age=
=3D0 =C2=A0max=3D0
>> rcu_bh_state: completed=3D-298 =C2=A0gpnum=3D4294966998 =C2=A0age=3D=
0 =C2=A0max=3D1
>> rcu_preempt:
>> c=3D17263 g=3D17264 s=3D3 jfq=3D0 j=3D2970 nfqs=3D7888/nfqsng=3D0(78=
88) fqlh=3D0
>> 1/1 ..>. 0:31 ^0
>> 1/1 ..>. 0:15 ^0 =C2=A0 =C2=A00/0 ..>. 16:31 ^1
>> rcu_sched:
>> c=3D4294966996 g=3D4294966996 s=3D0 jfq=3D-10608 j=3D2970 nfqs=3D0/n=
fqsng=3D0(0) fqlh=3D0
>> 0/1 ..>. 0:31 ^0
>> 0/1 ..>. 0:15 ^0 =C2=A0 =C2=A00/0 ..>. 16:31 ^1
>> rcu_bh:
>> c=3D4294966998 g=3D4294966998 s=3D0 jfq=3D-81111 j=3D2970 nfqs=3D0/n=
fqsng=3D0(0) fqlh=3D0
>> 0/1 ..>. 0:31 ^0
>> 0/1 ..>. 0:15 ^0 =C2=A0 =C2=A00/0 ..>. 16:31 ^1
>> rcu_preempt:
>> =C2=A0 0 c=3D17263 g=3D17264 pq=3D1 pqc=3D17263 qp=3D1 dt=3D40499/1/=
0 df=3D0 of=3D0 ri=3D0 ql=3D420128 qs=3DN.W. kt=3D1/W b=3D2147483647 ci=
=3D299175 co=3D0 ca=3D0
>> rcu_sched:
>> =C2=A0 0 c=3D0 g=3D0 pq=3D1 pqc=3D4294967295 qp=3D1 dt=3D40499/1/0 d=
f=3D0 of=3D0 ri=3D0 ql=3D0 qs=3D.... kt=3D1/W b=3D10 ci=3D0 co=3D0 ca=3D=
0
>> rcu_bh:
>> =C2=A0 0 c=3D4294966998 g=3D4294966998 pq=3D1 pqc=3D4294966997 qp=3D=
0 dt=3D40499/1/0 df=3D0 of=3D0 ri=3D0 ql=3D0 qs=3D.... kt=3D1/W b=3D10 =
ci=3D6 co=3D0 ca=3D0
>> rcu_preempt:
>> =C2=A0 0 np=3D0 qsp=3D0 rpq=3D0 cbr=3D0 cng=3D0 gpc=3D0 gps=3D0 nf=3D=
0 nn=3D0
>> rcu_sched:
>> =C2=A0 0 np=3D75695 qsp=3D4 rpq=3D75691 cbr=3D0 cng=3D0 gpc=3D0 gps=3D=
0 nf=3D0 nn=3D4
>> rcu_bh:
>> =C2=A0 0 np=3D4 qsp=3D0 rpq=3D4 cbr=3D0 cng=3D0 gpc=3D0 gps=3D0 nf=3D=
0 nn=3D0
>> rcutorture test sequence: 0 (test in progress)
>> rcutorture update version number: 7004
>> cat: /sys/kernel/debug/rcu/rcuboost: No such file or directory
>> no rcuboost
>>
>> Thu Apr 21 14:41:28 CEST 2011
>> rcu_preempt_state: completed=3D17263 =C2=A0gpnum=3D17264 =C2=A0age=3D=
50519 =C2=A0max=3D221
>> rcu_sched_state: completed=3D-300 =C2=A0gpnum=3D4294966996 =C2=A0age=
=3D0 =C2=A0max=3D0
>> rcu_bh_state: completed=3D-298 =C2=A0gpnum=3D4294966998 =C2=A0age=3D=
0 =C2=A0max=3D1
>> rcu_preempt:
>> c=3D17263 g=3D17264 s=3D3 jfq=3D2 j=3D381b nfqs=3D8327/nfqsng=3D0(83=
27) fqlh=3D0
>> 1/1 ..>. 0:31 ^0
>> 1/1 ..>. 0:15 ^0 =C2=A0 =C2=A00/0 ..>. 16:31 ^1
>> rcu_sched:
>> c=3D4294966996 g=3D4294966996 s=3D0 jfq=3D-14363 j=3D381b nfqs=3D0/n=
fqsng=3D0(0) fqlh=3D0
>> 0/1 ..>. 0:31 ^0
>> 0/1 ..>. 0:15 ^0 =C2=A0 =C2=A00/0 ..>. 16:31 ^1
>> rcu_bh:
>> c=3D4294966998 g=3D4294966998 s=3D0 jfq=3D-84866 j=3D381b nfqs=3D0/n=
fqsng=3D0(0) fqlh=3D0
>> 0/1 ..>. 0:31 ^0
>> 0/1 ..>. 0:15 ^0 =C2=A0 =C2=A00/0 ..>. 16:31 ^1
>> rcu_preempt:
>> =C2=A0 0 c=3D17263 g=3D17264 pq=3D1 pqc=3D17263 qp=3D1 dt=3D40499/1/=
0 df=3D0 of=3D0 ri=3D0 ql=3D446254 qs=3DN.W. kt=3D1/W b=3D2147483647 ci=
=3D299175 co=3D0 ca=3D0
>> rcu_sched:
>> =C2=A0 0 c=3D0 g=3D0 pq=3D1 pqc=3D4294967295 qp=3D1 dt=3D40499/1/0 d=
f=3D0 of=3D0 ri=3D0 ql=3D0 qs=3D.... kt=3D1/W b=3D10 ci=3D0 co=3D0 ca=3D=
0
>> rcu_bh:
>> =C2=A0 0 c=3D4294966998 g=3D4294966998 pq=3D1 pqc=3D4294966997 qp=3D=
0 dt=3D40499/1/0 df=3D0 of=3D0 ri=3D0 ql=3D0 qs=3D.... kt=3D1/W b=3D10 =
ci=3D6 co=3D0 ca=3D0
>> rcu_preempt:
>> =C2=A0 0 np=3D0 qsp=3D0 rpq=3D0 cbr=3D0 cng=3D0 gpc=3D0 gps=3D0 nf=3D=
0 nn=3D0
>> rcu_sched:
>> =C2=A0 0 np=3D79454 qsp=3D4 rpq=3D79450 cbr=3D0 cng=3D0 gpc=3D0 gps=3D=
0 nf=3D0 nn=3D4
>> rcu_bh:
>> =C2=A0 0 np=3D4 qsp=3D0 rpq=3D4 cbr=3D0 cng=3D0 gpc=3D0 gps=3D0 nf=3D=
0 nn=3D0
>> rcutorture test sequence: 0 (test in progress)
>> rcutorture update version number: 7004
>> cat: /sys/kernel/debug/rcu/rcuboost: No such file or directory
>> no rcuboost
>>
>> Thu Apr 21 14:41:43 CEST 2011
>> rcu_preempt_state: completed=3D17263 =C2=A0gpnum=3D17264 =C2=A0age=3D=
54286 =C2=A0max=3D221
>> rcu_sched_state: completed=3D-300 =C2=A0gpnum=3D4294966996 =C2=A0age=
=3D0 =C2=A0max=3D0
>> rcu_bh_state: completed=3D-298 =C2=A0gpnum=3D4294966998 =C2=A0age=3D=
0 =C2=A0max=3D1
>> rcu_preempt:
>> c=3D17263 g=3D17264 s=3D3 jfq=3D2 j=3D46d2 nfqs=3D8659/nfqsng=3D0(86=
59) fqlh=3D0
>> 1/1 ..>. 0:31 ^0
>> 1/1 ..>. 0:15 ^0 =C2=A0 =C2=A00/0 ..>. 16:31 ^1
>> rcu_sched:
>> c=3D4294966996 g=3D4294966996 s=3D0 jfq=3D-18130 j=3D46d2 nfqs=3D0/n=
fqsng=3D0(0) fqlh=3D0
>> 0/1 ..>. 0:31 ^0
>> 0/1 ..>. 0:15 ^0 =C2=A0 =C2=A00/0 ..>. 16:31 ^1
>> rcu_bh:
>> c=3D4294966998 g=3D4294966998 s=3D0 jfq=3D-88633 j=3D46d2 nfqs=3D0/n=
fqsng=3D0(0) fqlh=3D0
>> 0/1 ..>. 0:31 ^0
>> 0/1 ..>. 0:15 ^0 =C2=A0 =C2=A00/0 ..>. 16:31 ^1
>> rcu_preempt:
>> =C2=A0 0 c=3D17263 g=3D17264 pq=3D1 pqc=3D17263 qp=3D1 dt=3D40499/1/=
0 df=3D0 of=3D0 ri=3D0 ql=3D474722 qs=3DN.W. kt=3D1/W b=3D2147483647 ci=
=3D299175 co=3D0 ca=3D0
>> rcu_sched:
>> =C2=A0 0 c=3D0 g=3D0 pq=3D1 pqc=3D4294967295 qp=3D1 dt=3D40499/1/0 d=
f=3D0 of=3D0 ri=3D0 ql=3D0 qs=3D.... kt=3D1/W b=3D10 ci=3D0 co=3D0 ca=3D=
0
>> rcu_bh:
>> =C2=A0 0 c=3D4294966998 g=3D4294966998 pq=3D1 pqc=3D4294966997 qp=3D=
0 dt=3D40499/1/0 df=3D0 of=3D0 ri=3D0 ql=3D0 qs=3D.... kt=3D1/W b=3D10 =
ci=3D6 co=3D0 ca=3D0
>> rcu_preempt:
>> =C2=A0 0 np=3D0 qsp=3D0 rpq=3D0 cbr=3D0 cng=3D0 gpc=3D0 gps=3D0 nf=3D=
0 nn=3D0
>> rcu_sched:
>> =C2=A0 0 np=3D83216 qsp=3D4 rpq=3D83212 cbr=3D0 cng=3D0 gpc=3D0 gps=3D=
0 nf=3D0 nn=3D4
>> rcu_bh:
>> =C2=A0 0 np=3D4 qsp=3D0 rpq=3D4 cbr=3D0 cng=3D0 gpc=3D0 gps=3D0 nf=3D=
0 nn=3D0
>> rcutorture test sequence: 0 (test in progress)
>> rcutorture update version number: 7004
>> cat: /sys/kernel/debug/rcu/rcuboost: No such file or directory
>> no rcuboost
>>
>> Thu Apr 21 14:41:58 CEST 2011
>> rcu_preempt_state: completed=3D17263 =C2=A0gpnum=3D17264 =C2=A0age=3D=
58041 =C2=A0max=3D221
>> rcu_sched_state: completed=3D-300 =C2=A0gpnum=3D4294966996 =C2=A0age=
=3D0 =C2=A0max=3D0
>> rcu_bh_state: completed=3D-298 =C2=A0gpnum=3D4294966998 =C2=A0age=3D=
0 =C2=A0max=3D1
>> rcu_preempt:
>> c=3D17263 g=3D17264 s=3D3 jfq=3D2 j=3D557d nfqs=3D8733/nfqsng=3D0(87=
33) fqlh=3D0
>> 1/1 ..>. 0:31 ^0
>> 1/1 ..>. 0:15 ^0 =C2=A0 =C2=A00/0 ..>. 16:31 ^1
>> rcu_sched:
>> c=3D4294966996 g=3D4294966996 s=3D0 jfq=3D-21885 j=3D557d nfqs=3D0/n=
fqsng=3D0(0) fqlh=3D0
>> 0/1 ..>. 0:31 ^0
>> 0/1 ..>. 0:15 ^0 =C2=A0 =C2=A00/0 ..>. 16:31 ^1
>> rcu_bh:
>> c=3D4294966998 g=3D4294966998 s=3D0 jfq=3D-92388 j=3D557d nfqs=3D0/n=
fqsng=3D0(0) fqlh=3D0
>> 0/1 ..>. 0:31 ^0
>> 0/1 ..>. 0:15 ^0 =C2=A0 =C2=A00/0 ..>. 16:31 ^1
>> rcu_preempt:
>> =C2=A0 0 c=3D17263 g=3D17264 pq=3D1 pqc=3D17263 qp=3D1 dt=3D40499/1/=
0 df=3D0 of=3D0 ri=3D0 ql=3D477483 qs=3DN.W. kt=3D1/W b=3D2147483647 ci=
=3D299175 co=3D0 ca=3D0
>> rcu_sched:
>> =C2=A0 0 c=3D0 g=3D0 pq=3D1 pqc=3D4294967295 qp=3D1 dt=3D40499/1/0 d=
f=3D0 of=3D0 ri=3D0 ql=3D0 qs=3D.... kt=3D1/W b=3D10 ci=3D0 co=3D0 ca=3D=
0
>> rcu_bh:
>> =C2=A0 0 c=3D4294966998 g=3D4294966998 pq=3D1 pqc=3D4294966997 qp=3D=
0 dt=3D40499/1/0 df=3D0 of=3D0 ri=3D0 ql=3D0 qs=3D.... kt=3D1/W b=3D10 =
ci=3D6 co=3D0 ca=3D0
>> rcu_preempt:
>> =C2=A0 0 np=3D0 qsp=3D0 rpq=3D0 cbr=3D0 cng=3D0 gpc=3D0 gps=3D0 nf=3D=
0 nn=3D0
>> rcu_sched:
>> =C2=A0 0 np=3D86971 qsp=3D4 rpq=3D86967 cbr=3D0 cng=3D0 gpc=3D0 gps=3D=
0 nf=3D0 nn=3D4
>> rcu_bh:
>> =C2=A0 0 np=3D4 qsp=3D0 rpq=3D4 cbr=3D0 cng=3D0 gpc=3D0 gps=3D0 nf=3D=
0 nn=3D0
>> rcutorture test sequence: 0 (test in progress)
>> rcutorture update version number: 7004
>> cat: /sys/kernel/debug/rcu/rcuboost: No such file or directory
>> no rcuboost
>>
>> Thu Apr 21 14:42:13 CEST 2011
>> rcu_preempt_state: completed=3D17263 =C2=A0gpnum=3D17264 =C2=A0age=3D=
61798 =C2=A0max=3D221
>> rcu_sched_state: completed=3D-300 =C2=A0gpnum=3D4294966996 =C2=A0age=
=3D0 =C2=A0max=3D0
>> rcu_bh_state: completed=3D-298 =C2=A0gpnum=3D4294966998 =C2=A0age=3D=
0 =C2=A0max=3D1
>> rcu_preempt:
>> c=3D17263 g=3D17264 s=3D3 jfq=3D1 j=3D642b nfqs=3D8892/nfqsng=3D0(88=
92) fqlh=3D0
>> 1/1 ..>. 0:31 ^0
>> 1/1 ..>. 0:15 ^0 =C2=A0 =C2=A00/0 ..>. 16:31 ^1
>> rcu_sched:
>> c=3D4294966996 g=3D4294966996 s=3D0 jfq=3D-25643 j=3D642b nfqs=3D0/n=
fqsng=3D0(0) fqlh=3D0
>> 0/1 ..>. 0:31 ^0
>> 0/1 ..>. 0:15 ^0 =C2=A0 =C2=A00/0 ..>. 16:31 ^1
>> rcu_bh:
>> c=3D4294966998 g=3D4294966998 s=3D0 jfq=3D-96146 j=3D642b nfqs=3D0/n=
fqsng=3D0(0) fqlh=3D0
>> 0/1 ..>. 0:31 ^0
>> 0/1 ..>. 0:15 ^0 =C2=A0 =C2=A00/0 ..>. 16:31 ^1
>> rcu_preempt:
>> =C2=A0 0 c=3D17263 g=3D17264 pq=3D1 pqc=3D17263 qp=3D1 dt=3D40499/1/=
0 df=3D0 of=3D0 ri=3D0 ql=3D495375 qs=3DN.W. kt=3D1/W b=3D2147483647 ci=
=3D299175 co=3D0 ca=3D0
>> rcu_sched:
>> =C2=A0 0 c=3D0 g=3D0 pq=3D1 pqc=3D4294967295 qp=3D1 dt=3D40499/1/0 d=
f=3D0 of=3D0 ri=3D0 ql=3D0 qs=3D.... kt=3D1/W b=3D10 ci=3D0 co=3D0 ca=3D=
0
>> rcu_bh:
>> =C2=A0 0 c=3D4294966998 g=3D4294966998 pq=3D1 pqc=3D4294966997 qp=3D=
0 dt=3D40499/1/0 df=3D0 of=3D0 ri=3D0 ql=3D0 qs=3D.... kt=3D1/W b=3D10 =
ci=3D6 co=3D0 ca=3D0
>> rcu_preempt:
>> =C2=A0 0 np=3D0 qsp=3D0 rpq=3D0 cbr=3D0 cng=3D0 gpc=3D0 gps=3D0 nf=3D=
0 nn=3D0
>> rcu_sched:
>> =C2=A0 0 np=3D90731 qsp=3D4 rpq=3D90727 cbr=3D0 cng=3D0 gpc=3D0 gps=3D=
0 nf=3D0 nn=3D4
>> rcu_bh:
>> =C2=A0 0 np=3D4 qsp=3D0 rpq=3D4 cbr=3D0 cng=3D0 gpc=3D0 gps=3D0 nf=3D=
0 nn=3D0
>> rcutorture test sequence: 0 (test in progress)
>> rcutorture update version number: 7004
>> cat: /sys/kernel/debug/rcu/rcuboost: No such file or directory
>> no rcuboost
>>
>> Thu Apr 21 14:42:28 CEST 2011
>> rcu_preempt_state: completed=3D17263 =C2=A0gpnum=3D17264 =C2=A0age=3D=
65556 =C2=A0max=3D221
>> rcu_sched_state: completed=3D-300 =C2=A0gpnum=3D4294966996 =C2=A0age=
=3D0 =C2=A0max=3D0
>> rcu_bh_state: completed=3D-298 =C2=A0gpnum=3D4294966998 =C2=A0age=3D=
0 =C2=A0max=3D1
>> rcu_preempt:
>> c=3D17263 g=3D17264 s=3D3 jfq=3D2 j=3D72d8 nfqs=3D8973/nfqsng=3D0(89=
73) fqlh=3D0
>> 1/1 ..>. 0:31 ^0
>> 1/1 ..>. 0:15 ^0 =C2=A0 =C2=A00/0 ..>. 16:31 ^1
>> rcu_sched:
>> c=3D4294966996 g=3D4294966996 s=3D0 jfq=3D-29400 j=3D72d8 nfqs=3D0/n=
fqsng=3D0(0) fqlh=3D0
>> 0/1 ..>. 0:31 ^0
>> 0/1 ..>. 0:15 ^0 =C2=A0 =C2=A00/0 ..>. 16:31 ^1
>> rcu_bh:
>> c=3D4294966998 g=3D4294966998 s=3D0 jfq=3D-99903 j=3D72d8 nfqs=3D0/n=
fqsng=3D0(0) fqlh=3D0
>> 0/1 ..>. 0:31 ^0
>> 0/1 ..>. 0:15 ^0 =C2=A0 =C2=A00/0 ..>. 16:31 ^1
>> rcu_preempt:
>> =C2=A0 0 c=3D17263 g=3D17264 pq=3D1 pqc=3D17263 qp=3D1 dt=3D40499/1/=
0 df=3D0 of=3D0 ri=3D0 ql=3D500171 qs=3DN.W. kt=3D1/W b=3D2147483647 ci=
=3D299175 co=3D0 ca=3D0
>> rcu_sched:
>> =C2=A0 0 c=3D0 g=3D0 pq=3D1 pqc=3D4294967295 qp=3D1 dt=3D40499/1/0 d=
f=3D0 of=3D0 ri=3D0 ql=3D0 qs=3D.... kt=3D1/W b=3D10 ci=3D0 co=3D0 ca=3D=
0
>> rcu_bh:
>> =C2=A0 0 c=3D4294966998 g=3D4294966998 pq=3D1 pqc=3D4294966997 qp=3D=
0 dt=3D40499/1/0 df=3D0 of=3D0 ri=3D0 ql=3D0 qs=3D.... kt=3D1/W b=3D10 =
ci=3D6 co=3D0 ca=3D0
>> rcu_preempt:
>> =C2=A0 0 np=3D0 qsp=3D0 rpq=3D0 cbr=3D0 cng=3D0 gpc=3D0 gps=3D0 nf=3D=
0 nn=3D0
>> rcu_sched:
>> =C2=A0 0 np=3D94486 qsp=3D4 rpq=3D94482 cbr=3D0 cng=3D0 gpc=3D0 gps=3D=
0 nf=3D0 nn=3D4
>> rcu_bh:
>> =C2=A0 0 np=3D4 qsp=3D0 rpq=3D4 cbr=3D0 cng=3D0 gpc=3D0 gps=3D0 nf=3D=
0 nn=3D0
>> rcutorture test sequence: 0 (test in progress)
>> rcutorture update version number: 7004
>> cat: /sys/kernel/debug/rcu/rcuboost: No such file or directory
>> no rcuboost
>>
>> Thu Apr 21 14:42:43 CEST 2011
>> rcu_preempt_state: completed=3D17263 =C2=A0gpnum=3D17264 =C2=A0age=3D=
69310 =C2=A0max=3D221
>> rcu_sched_state: completed=3D-300 =C2=A0gpnum=3D4294966996 =C2=A0age=
=3D0 =C2=A0max=3D0
>> rcu_bh_state: completed=3D-298 =C2=A0gpnum=3D4294966998 =C2=A0age=3D=
0 =C2=A0max=3D1
>> rcu_preempt:
>> c=3D17263 g=3D17264 s=3D3 jfq=3D1 j=3D8182 nfqs=3D9071/nfqsng=3D0(90=
71) fqlh=3D0
>> 1/1 ..>. 0:31 ^0
>> 1/1 ..>. 0:15 ^0 =C2=A0 =C2=A00/0 ..>. 16:31 ^1
>> rcu_sched:
>> c=3D4294966996 g=3D4294966996 s=3D0 jfq=3D-33154 j=3D8182 nfqs=3D0/n=
fqsng=3D0(0) fqlh=3D0
>> 0/1 ..>. 0:31 ^0
>> 0/1 ..>. 0:15 ^0 =C2=A0 =C2=A00/0 ..>. 16:31 ^1
>> rcu_bh:
>> c=3D4294966998 g=3D4294966998 s=3D0 jfq=3D-103657 j=3D8182 nfqs=3D0/=
nfqsng=3D0(0) fqlh=3D0
>> 0/1 ..>. 0:31 ^0
>> 0/1 ..>. 0:15 ^0 =C2=A0 =C2=A00/0 ..>. 16:31 ^1
>> rcu_preempt:
>> =C2=A0 0 c=3D17263 g=3D17264 pq=3D1 pqc=3D17263 qp=3D1 dt=3D40499/1/=
0 df=3D0 of=3D0 ri=3D0 ql=3D505394 qs=3DN.W. kt=3D1/W b=3D2147483647 ci=
=3D299175 co=3D0 ca=3D0
>> rcu_sched:
>> =C2=A0 0 c=3D0 g=3D0 pq=3D1 pqc=3D4294967295 qp=3D1 dt=3D40499/1/0 d=
f=3D0 of=3D0 ri=3D0 ql=3D0 qs=3D.... kt=3D1/W b=3D10 ci=3D0 co=3D0 ca=3D=
0
>> rcu_bh:
>> =C2=A0 0 c=3D4294966998 g=3D4294966998 pq=3D1 pqc=3D4294966997 qp=3D=
0 dt=3D40499/1/0 df=3D0 of=3D0 ri=3D0 ql=3D0 qs=3D.... kt=3D1/W b=3D10 =
ci=3D6 co=3D0 ca=3D0
>> rcu_preempt:
>> =C2=A0 0 np=3D0 qsp=3D0 rpq=3D0 cbr=3D0 cng=3D0 gpc=3D0 gps=3D0 nf=3D=
0 nn=3D0
>> rcu_sched:
>> =C2=A0 0 np=3D98241 qsp=3D4 rpq=3D98237 cbr=3D0 cng=3D0 gpc=3D0 gps=3D=
0 nf=3D0 nn=3D4
>> rcu_bh:
>> =C2=A0 0 np=3D4 qsp=3D0 rpq=3D4 cbr=3D0 cng=3D0 gpc=3D0 gps=3D0 nf=3D=
0 nn=3D0
>> rcutorture test sequence: 0 (test in progress)
>> rcutorture update version number: 7004
>> cat: /sys/kernel/debug/rcu/rcuboost: No such file or directory
>> no rcuboost
>>
>> Thu Apr 21 14:42:58 CEST 2011
>> rcu_preempt_state: completed=3D17263 =C2=A0gpnum=3D17264 =C2=A0age=3D=
73066 =C2=A0max=3D221
>> rcu_sched_state: completed=3D-300 =C2=A0gpnum=3D4294966996 =C2=A0age=
=3D0 =C2=A0max=3D0
>> rcu_bh_state: completed=3D-298 =C2=A0gpnum=3D4294966998 =C2=A0age=3D=
0 =C2=A0max=3D1
>> rcu_preempt:
>> c=3D17263 g=3D17264 s=3D3 jfq=3D2 j=3D902e nfqs=3D9232/nfqsng=3D0(92=
32) fqlh=3D0
>> 1/1 ..>. 0:31 ^0
>> 1/1 G.>T 0:15 ^0 =C2=A0 =C2=A00/0 ..>. 16:31 ^1
>> rcu_sched:
>> c=3D4294966996 g=3D4294966996 s=3D0 jfq=3D-36910 j=3D902e nfqs=3D0/n=
fqsng=3D0(0) fqlh=3D0
>> 0/1 ..>. 0:31 ^0
>> 0/1 ..>. 0:15 ^0 =C2=A0 =C2=A00/0 ..>. 16:31 ^1
>> rcu_bh:
>> c=3D4294966998 g=3D4294966998 s=3D0 jfq=3D-107413 j=3D902e nfqs=3D0/=
nfqsng=3D0(0) fqlh=3D0
>> 0/1 ..>. 0:31 ^0
>> 0/1 ..>. 0:15 ^0 =C2=A0 =C2=A00/0 ..>. 16:31 ^1
>> rcu_preempt:
>> =C2=A0 0 c=3D17263 g=3D17264 pq=3D1 pqc=3D17263 qp=3D1 dt=3D40499/1/=
0 df=3D0 of=3D0 ri=3D0 ql=3D516914 qs=3DN.W. kt=3D1/W b=3D2147483647 ci=
=3D299175 co=3D0 ca=3D0
>> rcu_sched:
>> =C2=A0 0 c=3D0 g=3D0 pq=3D1 pqc=3D4294967295 qp=3D1 dt=3D40499/1/0 d=
f=3D0 of=3D0 ri=3D0 ql=3D0 qs=3D.... kt=3D1/W b=3D10 ci=3D0 co=3D0 ca=3D=
0
>> rcu_bh:
>> =C2=A0 0 c=3D4294966998 g=3D4294966998 pq=3D1 pqc=3D4294966997 qp=3D=
0 dt=3D40499/1/0 df=3D0 of=3D0 ri=3D0 ql=3D0 qs=3D.... kt=3D1/W b=3D10 =
ci=3D6 co=3D0 ca=3D0
>> rcu_preempt:
>> =C2=A0 0 np=3D0 qsp=3D0 rpq=3D0 cbr=3D0 cng=3D0 gpc=3D0 gps=3D0 nf=3D=
0 nn=3D0
>> rcu_sched:
>> =C2=A0 0 np=3D101996 qsp=3D4 rpq=3D101992 cbr=3D0 cng=3D0 gpc=3D0 gp=
s=3D0 nf=3D0 nn=3D4
>> rcu_bh:
>> =C2=A0 0 np=3D4 qsp=3D0 rpq=3D4 cbr=3D0 cng=3D0 gpc=3D0 gps=3D0 nf=3D=
0 nn=3D0
>> rcutorture test sequence: 0 (test in progress)
>> rcutorture update version number: 7004
>> cat: /sys/kernel/debug/rcu/rcuboost: No such file or directory
>> no rcuboost
>>
>> Thu Apr 21 14:43:13 CEST 2011
>> rcu_preempt_state: completed=3D17263 =C2=A0gpnum=3D17264 =C2=A0age=3D=
76820 =C2=A0max=3D221
>> rcu_sched_state: completed=3D-300 =C2=A0gpnum=3D4294966996 =C2=A0age=
=3D0 =C2=A0max=3D0
>> rcu_bh_state: completed=3D-298 =C2=A0gpnum=3D4294966998 =C2=A0age=3D=
0 =C2=A0max=3D1
>> rcu_preempt:
>> c=3D17263 g=3D17264 s=3D3 jfq=3D0 j=3D9ed9 nfqs=3D9298/nfqsng=3D0(92=
98) fqlh=3D0
>> 1/1 ..>. 0:31 ^0
>> 1/1 ..>. 0:15 ^0 =C2=A0 =C2=A00/0 ..>. 16:31 ^1
>> rcu_sched:
>> c=3D4294966996 g=3D4294966996 s=3D0 jfq=3D-40665 j=3D9ed9 nfqs=3D0/n=
fqsng=3D0(0) fqlh=3D0
>> 0/1 ..>. 0:31 ^0
>> 0/1 ..>. 0:15 ^0 =C2=A0 =C2=A00/0 ..>. 16:31 ^1
>> rcu_bh:
>> c=3D4294966998 g=3D4294966998 s=3D0 jfq=3D-111168 j=3D9ed9 nfqs=3D0/=
nfqsng=3D0(0) fqlh=3D0
>> 0/1 ..>. 0:31 ^0
>> 0/1 ..>. 0:15 ^0 =C2=A0 =C2=A00/0 ..>. 16:31 ^1
>> rcu_preempt:
>> =C2=A0 0 c=3D17263 g=3D17264 pq=3D1 pqc=3D17263 qp=3D1 dt=3D40499/1/=
0 df=3D0 of=3D0 ri=3D0 ql=3D517861 qs=3DN.W. kt=3D1/W b=3D2147483647 ci=
=3D299175 co=3D0 ca=3D0
>> rcu_sched:
>> =C2=A0 0 c=3D0 g=3D0 pq=3D1 pqc=3D4294967295 qp=3D1 dt=3D40499/1/0 d=
f=3D0 of=3D0 ri=3D0 ql=3D0 qs=3D.... kt=3D1/W b=3D10 ci=3D0 co=3D0 ca=3D=
0
>> rcu_bh:
>> =C2=A0 0 c=3D4294966998 g=3D4294966998 pq=3D1 pqc=3D4294966997 qp=3D=
0 dt=3D40499/1/0 df=3D0 of=3D0 ri=3D0 ql=3D0 qs=3D.... kt=3D1/W b=3D10 =
ci=3D6 co=3D0 ca=3D0
>> rcu_preempt:
>> =C2=A0 0 np=3D0 qsp=3D0 rpq=3D0 cbr=3D0 cng=3D0 gpc=3D0 gps=3D0 nf=3D=
0 nn=3D0
>> rcu_sched:
>> =C2=A0 0 np=3D105752 qsp=3D4 rpq=3D105748 cbr=3D0 cng=3D0 gpc=3D0 gp=
s=3D0 nf=3D0 nn=3D4
>> rcu_bh:
>> =C2=A0 0 np=3D4 qsp=3D0 rpq=3D4 cbr=3D0 cng=3D0 gpc=3D0 gps=3D0 nf=3D=
0 nn=3D0
>> rcutorture test sequence: 0 (test in progress)
>> rcutorture update version number: 7004
>> cat: /sys/kernel/debug/rcu/rcuboost: No such file or directory
>> no rcuboost
>>
>
>
>
>
