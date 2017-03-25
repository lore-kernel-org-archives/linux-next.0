From: Xiong Zhou <xzhou@redhat.com>
Subject: 0324 tree BUG at kernel/auditsc.c:1513!
Date: Sat, 25 Mar 2017 12:47:46 +0800
Message-ID: <20170325044746.xwani5wodyhdgdp5@XZHOUW.usersys.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:51690 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S937171AbdCYEru (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sat, 25 Mar 2017 00:47:50 -0400
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: linux-audit@redhat.com, linux-kernel@vger.kernel.org

[11230.930568] ------------[ cut here ]------------
[11230.953828] kernel BUG at kernel/auditsc.c:1513!
[11230.976157] invalid opcode: 0000 [#1] SMP
[11230.995917] Modules linked in: btrfs xor raid6_pq ext2 dm_thin_pool dm_persistent_data dm_bio_prison dm_bufio loop ext4 jbd2 mbcache xt_CHECKSUM iptable_mangle ipt_MASQUERADE nf_nat_masquerade_ipv4 iptable_nat nf_nat_ipv4 nf_nat nf_conntrack_ipv4 nf_defrag_ipv4 xt_conntrack nf_conntrack ipt_REJECT nf_reject_ipv4 tun bridge stp llc ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter dm_mirror dm_region_hash dm_log dm_mod intel_rapl sb_edac edac_core x86_pkg_temp_thermal intel_powerclamp coretemp kvm_intel kvm irqbypass crct10dif_pclmul crc32_pclmul ghash_clmulni_intel pcbc ipmi_ssif aesni_intel crypto_simd ipmi_si glue_helper iTCO_wdt ipmi_devintf iTCO_vendor_support cryptd dax_pmem sg hpilo ipmi_msghandler hpwdt lpc_ich pcc_cpufreq pcspkr dax ioatdma i2c_i801 wmi acpi_powe
 r_meter acpi_cpufreq
[11231.318010]  dca shpchp nfsd auth_rpcgss nfs_acl lockd grace sunrpc binfmt_misc ip_tables xfs libcrc32c sd_mod mgag200 i2c_algo_bit drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fops ttm drm tg3 ptp hpsa crc32c_intel nd_pmem serio_raw i2c_core pps_core scsi_transport_sas [last unloaded: scsi_debug]
[11231.440342] CPU: 24 PID: 15334 Comm: dio_truncate Not tainted 4.11.0-rc3-linux-next-65b2dc3-next-20170324 #336
[11231.488861] Hardware name: HP ProLiant DL360 Gen9, BIOS P89 05/06/2015
[11231.521003] task: ffff9eb578bc5a00 task.stack: ffffc277665d8000
[11231.547477] RIP: 0010:__audit_syscall_entry+0xf0/0x100
[11231.570495] RSP: 0018:ffffc277665dbe90 EFLAGS: 00010206
[11231.594551] RAX: 0000000000000000 RBX: ffff9ebf2896a800 RCX: 0000000000000000
[11231.626815] RDX: 0000000000004000 RSI: 00007ffe7a853c60 RDI: 0000000000000002
[11231.658965] RBP: ffffc277665dbea0 R08: 00007ffe7a853940 R09: ffff9eb578bc5a00
[11231.691211] R10: 00007ffe7a853940 R11: 00000000770b5a00 R12: 0000000000000000
[11231.723119] R13: 0000000000000002 R14: 0000000000000000 R15: 0000000000000000
[11231.755258] FS:  00007fdbdb18b740(0000) GS:ffff9ebf3fc00000(0000) knlGS:0000000000000000
[11231.791482] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[11231.817433] CR2: 00007fff02451000 CR3: 0000000760820000 CR4: 00000000001406e0
[11231.849728] Call Trace:
[11231.860748]  syscall_trace_enter+0x1d0/0x2b0
[11231.880034]  ? __audit_syscall_exit+0x209/0x290
[11231.900057]  do_syscall_64+0x155/0x180
[11231.916776]  entry_SYSCALL64_slow_path+0x25/0x25
[11231.937440] RIP: 0033:0x7fdbdad70c20
[11231.953513] RSP: 002b:00007ffe7a853c28 EFLAGS: 00000246 ORIG_RAX: 0000000000000002
[11231.989037] RAX: ffffffffffffffda RBX: 00007fdbdb18b6c0 RCX: 00007fdbdad70c20
[11232.023770] RDX: 0000000000000000 RSI: 0000000000004000 RDI: 00007ffe7a853c60
[11232.059308] RBP: 00007ffe7a853c60 R08: 0000000000000000 R09: 0000000001a68010
[11232.091419] R10: 00007ffe7a853940 R11: 0000000000000246 R12: 00000000ffffffff
[11232.123493] R13: 00007ffe7a854d50 R14: 0000000000000000 R15: 0000000000000000
[11232.155457] Code: 02 00 00 00 00 00 00 5b 41 5c 5d c3 48 c7 43 50 00 00 00 00 48 c7 c2 a0 f8 6f a6 48 89 de 4c 89 cf e8 05 f5 ff ff 41 89 c4 eb a9 <0f> 0b 0f 1f 40 00 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00
[11232.240315] RIP: __audit_syscall_entry+0xf0/0x100 RSP: ffffc277665dbe90
[11232.272441] BUG: unable to handle kernel paging request at ffff9ebf29362000
[11232.272451] ---[ end trace 7e25ab22dc4e0f7a ]---
[11232.273486] Kernel panic - not syncing: Fatal exception
[11232.347746] IP: __memmove+0x24/0x1a0
[11232.363684] PGD 7362e1067
[11232.363684] P4D 7362e1067
[11232.375799] PUD 107243f063
[11232.387851] PMD 1069361063
[11232.400372] BAD
[11232.422587] Oops: 0002 [#2] SMP
[11232.436808] Modules linked in: btrfs xor raid6_pq ext2 dm_thin_pool dm_persistent_data dm_bio_prison dm_bufio loop ext4 jbd2 mbcache xt_CHECKSUM iptable_mangle ipt_MASQUERADE nf_nat_masquerade_ipv4 iptable_nat nf_nat_ipv4 nf_nat nf_conntrack_ipv4 nf_defrag_ipv4 xt_conntrack nf_conntrack ipt_REJECT nf_reject_ipv4 tun bridge stp llc ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter dm_mirror dm_region_hash dm_log dm_mod intel_rapl sb_edac edac_core x86_pkg_temp_thermal intel_powerclamp coretemp kvm_intel kvm irqbypass crct10dif_pclmul crc32_pclmul ghash_clmulni_intel pcbc ipmi_ssif aesni_intel crypto_simd ipmi_si glue_helper iTCO_wdt ipmi_devintf iTCO_vendor_support cryptd dax_pmem sg hpilo ipmi_msghandler hpwdt lpc_ich pcc_cpufreq pcspkr dax ioatdma i2c_i801 wmi acpi_powe
 r_meter acpi_cpufreq
[11232.793787]  dca shpchp nfsd auth_rpcgss nfs_acl lockd grace sunrpc binfmt_misc ip_tables xfs libcrc32c sd_mod mgag200 i2c_algo_bit drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fops ttm drm tg3 ptp hpsa crc32c_intel nd_pmem serio_raw i2c_core pps_core scsi_transport_sas [last unloaded: scsi_debug]
[11232.920032] CPU: 19 PID: 15333 Comm: dio_truncate Tainted: G      D         4.11.0-rc3-linux-next-65b2dc3-next-20170324 #336
[11232.972689] Hardware name: HP ProLiant DL360 Gen9, BIOS P89 05/06/2015
[11233.002856] task: ffff9ebf34519680 task.stack: ffffc2776d3f4000
[11233.030440] RIP: 0010:__memmove+0x24/0x1a0
[11233.050212] RSP: 0018:ffffc2776d3f78a8 EFLAGS: 00010287
[11233.075431] RAX: ffff9ebf28944920 RBX: 0000000000000000 RCX: ffffffffff5e2040
[11233.109644] RDX: fffffffffffff720 RSI: ffff9ebf29361ff8 RDI: ffff9ebf29362000
[11233.144389] RBP: ffffc2776d3f78b0 R08: ffff9ebf28944038 R09: 0000000000000000
[11233.178504] R10: 00000001166159f0 R11: 0000000000000000 R12: ffffc2776d3f79ac
[11233.211975] R13: ffff9ebf28944000 R14: 0000000000000000 R15: ffff9ebf298733f0
[11233.245237] FS:  00007fdbdb18b740(0000) GS:ffff9eb623cc0000(0000) knlGS:0000000000000000
[11233.282453] CS:  0010 DS: 0000 ES: 000[11233.304930] Shutting down cpus with NMI
[11233.304940] Kernel Offset: 0x24a00000 from 0xffffffff81000000 (relocation range: 0xffffffff80000000-0xffffffffbfffffff)
[11233.378481] ---[ end Kernel panic - not syncing: Fatal exception
