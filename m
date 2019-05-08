From: Sachin Sant <sachinp@linux.vnet.ibm.com>
Subject: [next-20190507][powerpc] WARN kernel/cgroup/cgroup.c:6008 with LTP
 ptrace01 test case
Date: Wed, 8 May 2019 15:06:30 +0530
Message-ID: <A8995C41-9A8F-468C-89B2-AB6E44C7EADC@linux.vnet.ibm.com>
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.8\))
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
To: linuxppc-dev@lists.ozlabs.org, linux-next@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>, Roman Gushchin <guro@fb.com>, Oleg Nesterov <oleg@redhat.com>
List-Id: linux-next.vger.kernel.org

While running LTP tests(specifically ptrace01) following WARNING is =
observed
on POWER8 LPAR running next-20190507 built using 4K page size.

[ 3969.979492] msgrcv04 (433) used greatest stack depth: 9328 bytes left
[ 3981.452911] madvise06 (515): drop_caches: 3
[ 4004.575752] WARNING: CPU: 5 PID: 721 at kernel/cgroup/cgroup.c:6008 =
cgroup_exit+0x2ac/0x2c0
[ 4004.575781] Modules linked in: overlay rpadlpar_io rpaphp =
iptable_mangle xt_MASQUERADE iptable_nat nf_nat xt_conntrack =
nf_conntrack nf_defrag_ipv4 ipt_REJECT nf_reject_ipv4 xt_tcpudp tun =
bridge stp llc kvm iptable_filter pseries_rng rng_core vmx_crypto =
ip_tables x_tables autofs4 [last unloaded: dummy_del_mod]
[ 4004.575837] CPU: 5 PID: 721 Comm: ptrace01 Tainted: G           O     =
 5.1.0-next-20190507-autotest #1
[ 4004.575846] NIP:  c000000001b3026c LR: c000000001b30054 CTR: =
c000000001c9f020
[ 4004.575855] REGS: c000000171fff840 TRAP: 0700   Tainted: G           =
O       (5.1.0-next-20190507-autotest)
[ 4004.575863] MSR:  800000010282b033 =
<SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE,TM[E]>  CR: 44004824  XER: 20000000
[ 4004.575885] CFAR: c000000001b30078 IRQMASK: 1=20
[ 4004.575885] GPR00: c000000001b30054 c000000171fffad0 c000000003938700 =
c00000027b02fa18=20
[ 4004.575885] GPR04: c00000027b02fa00 0000000000000000 c000000003ae8700 =
00000000001c180a=20
[ 4004.575885] GPR08: 0000000000000001 0000000000000001 c000000003ae8700 =
0000000000000001=20
[ 4004.575885] GPR12: 0000000000004400 c00000001ec7ea80 c000000003a4d670 =
0000000000000009=20
[ 4004.575885] GPR16: 0000000000000000 0000000000040100 00000000418004fc =
0000000008430000=20
[ 4004.575885] GPR20: 0000000000000009 0000000000000001 c0000001715e9200 =
c00000016d8f4d00=20
[ 4004.575885] GPR24: c000000171fffd90 0000000000000100 c000000168692478 =
c000000171fffb98=20
[ 4004.575885] GPR28: c000000168692400 c00000016d8f4d00 c0000000036420d0 =
c00000027b02fa00=20
[ 4004.575958] NIP [c000000001b3026c] cgroup_exit+0x2ac/0x2c0
[ 4004.575966] LR [c000000001b30054] cgroup_exit+0x94/0x2c0
[ 4004.575972] Call Trace:
[ 4004.575979] [c000000171fffad0] [c000000001b30054] =
cgroup_exit+0x94/0x2c0 (unreliable)
[ 4004.575990] [c000000171fffb30] [c0000000019cea98] =
do_exit+0x878/0x1ae0
[ 4004.575999] [c000000171fffc00] [c0000000019cfe4c] =
do_group_exit+0xac/0x1d0
[ 4004.576009] [c000000171fffc40] [c0000000019ed00c] =
get_signal+0x2bc/0x11c0
[ 4004.576019] [c000000171fffd30] [c000000001867b14] =
do_notify_resume+0x384/0x900
[ 4004.576029] [c000000171fffe20] [c00000000183e844] =
ret_from_except_lite+0x70/0x74
[ 4004.576037] Instruction dump:
[ 4004.576043] 314a0001 7d40492d 40c2fff4 3d42001b e92a7288 39290001 =
f92a7288 4bfffe5c=20
[ 4004.576056] 3d42001b e92a7258 39290001 f92a7258 <0fe00000> 4bfffe0c =
4be91e45 60000000=20
[ 4004.576071] ---[ end trace 82a1a7c19005ebd6 ]=E2=80=94

The WARN_ONCE was added by following commit=20
96b9c592def5 ("cgroup: get rid of cgroup_freezer_frozen_exit()=E2=80=9D).=20=


Reverting the patch helps avoid the warning.

Thanks
-Sachin=
