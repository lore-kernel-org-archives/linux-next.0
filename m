From: Paul Moore <paul@paul-moore.com>
Subject: Re: 0324 tree BUG at kernel/auditsc.c:1513!
Date: Sun, 26 Mar 2017 10:51:24 -0400
Message-ID: <CAHC9VhSrR63HXsQiW9XxG6fMYF1cOi9tk44e7zck9rY6=_SSZw@mail.gmail.com>
References: <20170325044746.xwani5wodyhdgdp5@XZHOUW.usersys.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170325044746.xwani5wodyhdgdp5@XZHOUW.usersys.redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Xiong Zhou <xzhou@redhat.com>
Cc: linux-next@vger.kernel.org, linux-audit@redhat.com, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Sat, Mar 25, 2017 at 12:47 AM, Xiong Zhou <xzhou@redhat.com> wrote:
> [11230.930568] ------------[ cut here ]------------
> [11230.953828] kernel BUG at kernel/auditsc.c:1513!
> [11230.976157] invalid opcode: 0000 [#1] SMP
> [11230.995917] Modules linked in: btrfs xor raid6_pq ext2 dm_thin_pool dm=
_persistent_data dm_bio_prison dm_bufio loop ext4 jbd2 mbcache xt_CHECKSUM =
iptable_mangle ipt_MASQUERADE nf_nat_masquerade_ipv4 iptable_nat nf_nat_ipv=
4 nf_nat nf_conntrack_ipv4 nf_defrag_ipv4 xt_conntrack nf_conntrack ipt_REJ=
ECT nf_reject_ipv4 tun bridge stp llc ebtable_filter ebtables ip6table_filt=
er ip6_tables iptable_filter dm_mirror dm_region_hash dm_log dm_mod intel_r=
apl sb_edac edac_core x86_pkg_temp_thermal intel_powerclamp coretemp kvm_in=
tel kvm irqbypass crct10dif_pclmul crc32_pclmul ghash_clmulni_intel pcbc ip=
mi_ssif aesni_intel crypto_simd ipmi_si glue_helper iTCO_wdt ipmi_devintf i=
TCO_vendor_support cryptd dax_pmem sg hpilo ipmi_msghandler hpwdt lpc_ich p=
cc_cpufreq pcspkr dax ioatdma i2c_i801 wmi acpi_power_meter acpi_cpufreq
> [11231.318010]  dca shpchp nfsd auth_rpcgss nfs_acl lockd grace sunrpc bi=
nfmt_misc ip_tables xfs libcrc32c sd_mod mgag200 i2c_algo_bit drm_kms_helpe=
r syscopyarea sysfillrect sysimgblt fb_sys_fops ttm drm tg3 ptp hpsa crc32c=
_intel nd_pmem serio_raw i2c_core pps_core scsi_transport_sas [last unloade=
d: scsi_debug]
> [11231.440342] CPU: 24 PID: 15334 Comm: dio_truncate Not tainted 4.11.0-r=
c3-linux-next-65b2dc3-next-20170324 #336
> [11231.488861] Hardware name: HP ProLiant DL360 Gen9, BIOS P89 05/06/2015
> [11231.521003] task: ffff9eb578bc5a00 task.stack: ffffc277665d8000
> [11231.547477] RIP: 0010:__audit_syscall_entry+0xf0/0x100
> [11231.570495] RSP: 0018:ffffc277665dbe90 EFLAGS: 00010206
> [11231.594551] RAX: 0000000000000000 RBX: ffff9ebf2896a800 RCX: 000000000=
0000000
> [11231.626815] RDX: 0000000000004000 RSI: 00007ffe7a853c60 RDI: 000000000=
0000002
> [11231.658965] RBP: ffffc277665dbea0 R08: 00007ffe7a853940 R09: ffff9eb57=
8bc5a00
> [11231.691211] R10: 00007ffe7a853940 R11: 00000000770b5a00 R12: 000000000=
0000000
> [11231.723119] R13: 0000000000000002 R14: 0000000000000000 R15: 000000000=
0000000
> [11231.755258] FS:  00007fdbdb18b740(0000) GS:ffff9ebf3fc00000(0000) knlG=
S:0000000000000000
> [11231.791482] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [11231.817433] CR2: 00007fff02451000 CR3: 0000000760820000 CR4: 000000000=
01406e0
> [11231.849728] Call Trace:
> [11231.860748]  syscall_trace_enter+0x1d0/0x2b0
> [11231.880034]  ? __audit_syscall_exit+0x209/0x290
> [11231.900057]  do_syscall_64+0x155/0x180
> [11231.916776]  entry_SYSCALL64_slow_path+0x25/0x25
> [11231.937440] RIP: 0033:0x7fdbdad70c20
> [11231.953513] RSP: 002b:00007ffe7a853c28 EFLAGS: 00000246 ORIG_RAX: 0000=
000000000002
> [11231.989037] RAX: ffffffffffffffda RBX: 00007fdbdb18b6c0 RCX: 00007fdbd=
ad70c20
> [11232.023770] RDX: 0000000000000000 RSI: 0000000000004000 RDI: 00007ffe7=
a853c60
> [11232.059308] RBP: 00007ffe7a853c60 R08: 0000000000000000 R09: 000000000=
1a68010
> [11232.091419] R10: 00007ffe7a853940 R11: 0000000000000246 R12: 00000000f=
fffffff
> [11232.123493] R13: 00007ffe7a854d50 R14: 0000000000000000 R15: 000000000=
0000000
> [11232.155457] Code: 02 00 00 00 00 00 00 5b 41 5c 5d c3 48 c7 43 50 00 0=
0 00 00 48 c7 c2 a0 f8 6f a6 48 89 de 4c 89 cf e8 05 f5 ff ff 41 89 c4 eb a=
9 <0f> 0b 0f 1f 40 00 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00
> [11232.240315] RIP: __audit_syscall_entry+0xf0/0x100 RSP: ffffc277665dbe9=
0
> [11232.272441] BUG: unable to handle kernel paging request at ffff9ebf293=
62000
> [11232.272451] ---[ end trace 7e25ab22dc4e0f7a ]---

Can you elaborate a bit more on this?  For example, what were you
doing that caused this fault?  Is it easily reproduced?

I'm assuming based on the kernel name,
4.11.0-rc3-linux-next-65b2dc3-next-20170324, that this is linux-next
from March 24th.  Looking at that code it doesn't have that last big
pull request that Linus merged on Saturday, the 25th.  We did merge
some small changes into audit/next on Wednesday, the 22nd, and
Thursday, the 23rd, but nothing that should involve the syscall entry
code.  Hmmm.

--=20
paul moore
www.paul-moore.com
