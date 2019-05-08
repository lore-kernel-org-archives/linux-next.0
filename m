From: Sachin Sant <sachinp@linux.vnet.ibm.com>
Subject: Kernel OOPS followed by a panic on next20190507 with 4K page size
Date: Wed, 8 May 2019 16:30:30 +0530
Message-ID: <A4247410-7C78-4E52-AB56-1C33A6C27FF3@linux.vnet.ibm.com>
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.8\))
Content-Type: text/plain;
	charset=us-ascii
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
To: linuxppc-dev@lists.ozlabs.org
Cc: linux-next@vger.kernel.org, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
List-Id: linux-next.vger.kernel.org

While running LTP tests (specifically futex_wake04) against =
next-20199597
build with 4K page size on a POWER8 LPAR following crash is observed.

[ 4233.214876] BUG: Kernel NULL pointer dereference at 0x0000001c
[ 4233.214898] Faulting instruction address: 0xc000000001d1e58c
[ 4233.214905] Oops: Kernel access of bad area, sig: 11 [#1]
[ 4233.214911] LE PAGE_SIZE=3D4K MMU=3DHash SMP NR_CPUS=3D2048 NUMA =
pSeries
[ 4233.214920] Dumping ftrace buffer:
[ 4233.214928]    (ftrace buffer empty)
[ 4233.214933] Modules linked in: overlay rpadlpar_io rpaphp =
iptable_mangle xt_MASQUERADE iptable_nat nf_nat xt_conntrack =
nf_conntrack nf_defrag_ipv4 ipt_REJECT nf_reject_ipv4 xt_tcpudp tun =
bridge stp llc kvm iptable_filter pseries_rng rng_core vmx_crypto =
ip_tables x_tables autofs4 [last unloaded: dummy_del_mod]
[ 4233.214973] CPU: 3 PID: 4635 Comm: futex_wake04 Tainted: G        W  =
O      5.1.0-next-20190507-autotest #1
[ 4233.214980] NIP:  c000000001d1e58c LR: c000000001d1e54c CTR: =
0000000000000000
[ 4233.214987] REGS: c000000004937890 TRAP: 0300   Tainted: G        W  =
O       (5.1.0-next-20190507-autotest)
[ 4233.214993] MSR:  8000000000009033 <SF,EE,ME,IR,DR,RI,LE>  CR: =
22424822  XER: 00000000
[ 4233.215005] CFAR: c00000000183e9e0 DAR: 000000000000001c DSISR: =
40000000 IRQMASK: 0=20
[ 4233.215005] GPR00: c000000001901a80 c000000004937b20 c000000003938700 =
0000000000000000=20
[ 4233.215005] GPR04: 0000000000400cc0 000000000003efff 000000027966e000 =
c000000003ba8700=20
[ 4233.215005] GPR08: c000000003ba8700 000000000d601125 c000000003ba8700 =
0000000080000000=20
[ 4233.215005] GPR12: 0000000022424822 c00000001ecae280 0000000000000000 =
0000000000000000=20
[ 4233.215005] GPR16: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000=20
[ 4233.215005] GPR20: 0000000000000018 c0000000039e2d30 c0000000039e2d28 =
c0000002762da460=20
[ 4233.215005] GPR24: 000000000000001c 0000000000000000 0000000000000001 =
c000000001901a80=20
[ 4233.215005] GPR28: 0000000000400cc0 0000000000000000 0000000000000000 =
0000000000400cc0=20
[ 4233.215065] NIP [c000000001d1e58c] kmem_cache_alloc+0xbc/0x5a0
[ 4233.215071] LR [c000000001d1e54c] kmem_cache_alloc+0x7c/0x5a0
[ 4233.215075] Call Trace:
[ 4233.215081] [c000000004937b20] [c000000001c91150] =
__pud_alloc+0x160/0x200 (unreliable)
[ 4233.215090] [c000000004937b80] [c000000001901a80] =
huge_pte_alloc+0x580/0x950
[ 4233.215098] [c000000004937c00] [c000000001cf7910] =
hugetlb_fault+0x9a0/0x1250
[ 4233.215106] [c000000004937ce0] [c000000001c94a80] =
handle_mm_fault+0x490/0x4a0
[ 4233.215114] [c000000004937d20] [c0000000018d529c] =
__do_page_fault+0x77c/0x1f00
[ 4233.215121] [c000000004937e00] [c0000000018d6a48] =
do_page_fault+0x28/0x50
[ 4233.215129] [c000000004937e20] [c00000000183b0d4] =
handle_page_fault+0x18/0x38
[ 4233.215135] Instruction dump:
[ 4233.215139] 39290001 f92ac1b0 419e009c 3ce20027 3ba00000 e927c1f0 =
39290001 f927c1f0=20
[ 4233.215149] 3d420027 e92ac290 39290001 f92ac290 <8359001c> 83390018 =
60000000 3ce20027=20
[ 4233.215160] ---[ end trace 82a1a7c19005ebd7 ]---
[ 4233.218041]=20
[ 4234.218052] Kernel panic - not syncing: Fatal exception
[ 4234.218095] Dumping ftrace buffer:
[ 4234.218126]    (ftrace buffer empty)
[ 4234.235298] WARNING: CPU: 3 PID: 4635 at drivers/tty/vt/vt.c:4227 =
do_unblank_screen+0x68/0x3c0
[ 4234.235336] Modules linked in: overlay rpadlpar_io rpaphp =
iptable_mangle xt_MASQUERADE iptable_nat nf_nat xt_conntrack =
nf_conntrack nf_defrag_ipv4 ipt_REJECT nf_reject_ipv4 xt_tcpudp tun =
bridge stp llc kvm iptable_filter pseries_rng rng_core vmx_crypto =
ip_tables x_tables autofs4 [last unloaded: dummy_del_mod]
[ 4234.235513] CPU: 3 PID: 4635 Comm: futex_wake04 Tainted: G      D W  =
O      5.1.0-next-20190507-autotest #1
[ 4234.235548] NIP:  c0000000023d8c38 LR: c0000000023d8ea4 CTR: =
c000000002a9e690
[ 4234.235581] REGS: c000000004937320 TRAP: 0700   Tainted: G      D W  =
O       (5.1.0-next-20190507-autotest)
[ 4234.235613] MSR:  8000000000021033 <SF,ME,IR,DR,RI,LE>  CR: 28422882  =
XER: 20000009
[ 4234.235672] CFAR: c0000000023d8ee0 IRQMASK: 3=20
[ 4234.235672] GPR00: c0000000023d8fbc c0000000049375b0 c000000003938700 =
0000000000000000=20
[ 4234.235672] GPR04: 0000000000000003 c000000277aa400e 0000000000001dd7 =
0000000000000000=20
[ 4234.235672] GPR08: c000000003d68700 0000000000000003 c000000003d68700 =
0000000000000020=20
[ 4234.235672] GPR12: 0000000088422828 c00000001ecae280 0000000000000000 =
0000000000000000=20
[ 4234.235672] GPR16: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000=20
[ 4234.235672] GPR20: 0000000000000018 c0000000039e2d30 c0000000039e2d28 =
c0000002762da460=20
[ 4234.235672] GPR24: 000000000000001c 0000000000000000 c00000000360aff0 =
c000000003a44e80=20
[ 4234.235672] GPR28: c000000002e21388 0000000000000000 0000000000000001 =
c000000003d6c538=20
[ 4234.235947] NIP [c0000000023d8c38] do_unblank_screen+0x68/0x3c0
[ 4234.235978] LR [c0000000023d8ea4] do_unblank_screen+0x2d4/0x3c0
[ 4234.236006] Call Trace:
[ 4234.236026] [c0000000049375b0] [0000000000000001] 0x1 (unreliable)
[ 4234.236063] [c000000004937630] [c0000000023d8fbc] =
unblank_screen+0x2c/0x50
[ 4234.236099] [c000000004937650] [c0000000019c2aec] panic+0x360/0x774
[ 4234.236133] [c0000000049376e0] [c000000001874e28] =
oops_end+0x348/0x350
[ 4234.236166] [c000000004937760] [c00000000187514c] die+0xdc/0x180
[ 4234.236203] [c0000000049377a0] [c0000000018d6bd0] =
bad_page_fault+0x160/0x2b4
[ 4234.236243] [c000000004937820] [c00000000183b0f0] =
handle_page_fault+0x34/0x38
[ 4234.236284] --- interrupt: 300 at kmem_cache_alloc+0xbc/0x5a0
[ 4234.236284]     LR =3D kmem_cache_alloc+0x7c/0x5a0
[ 4234.236326] [c000000004937b20] [c000000001c91150] =
__pud_alloc+0x160/0x200 (unreliable)
[ 4234.236368] [c000000004937b80] [c000000001901a80] =
huge_pte_alloc+0x580/0x950
[ 4234.236407] [c000000004937c00] [c000000001cf7910] =
hugetlb_fault+0x9a0/0x1250
[ 4234.236445] [c000000004937ce0] [c000000001c94a80] =
handle_mm_fault+0x490/0x4a0
[ 4234.236484] [c000000004937d20] [c0000000018d529c] =
__do_page_fault+0x77c/0x1f00
[ 4234.236523] [c000000004937e00] [c0000000018d6a48] =
do_page_fault+0x28/0x50
[ 4234.236559] [c000000004937e20] [c00000000183b0d4] =
handle_page_fault+0x18/0x38
[ 4234.236590] Instruction dump:
[ 4234.236613] 39290001 f8010010 f9286310 f821ff81 812a0000 2f890000 =
3bc00000 419e026c=20
[ 4234.236665] 3d420043 e92a6340 39290001 f92a6340 <0b1e0000> 3d420043 =
814a3f88 3d220043=20
[ 4234.236721] ---[ end trace 82a1a7c19005ebd8 ]---
[ 4234.236756] Rebooting in 10 seconds..

Thanks
-Sachin=
