From: Sachin Sant <sachinp@in.ibm.com>
Subject: Next July 29 : Hugetlb test failure (OOPS free_hugepte_range)
Date: Wed, 29 Jul 2009 20:34:36 +0530
Message-ID: <4A706504.6040704@in.ibm.com>
References: <20090729173611.b82478cd.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e28smtp06.in.ibm.com ([59.145.155.6]:59611 "EHLO
	e28smtp06.in.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751307AbZG2PEl (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 29 Jul 2009 11:04:41 -0400
Received: from d28relay01.in.ibm.com (d28relay01.in.ibm.com [9.184.220.58])
	by e28smtp06.in.ibm.com (8.14.3/8.13.1) with ESMTP id n6TF4dKC004922
	for <linux-next@vger.kernel.org>; Wed, 29 Jul 2009 20:34:39 +0530
Received: from d28av01.in.ibm.com (d28av01.in.ibm.com [9.184.220.63])
	by d28relay01.in.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id n6TF4dKe1183900
	for <linux-next@vger.kernel.org>; Wed, 29 Jul 2009 20:34:39 +0530
Received: from d28av01.in.ibm.com (loopback [127.0.0.1])
	by d28av01.in.ibm.com (8.14.3/8.13.1/NCO v10.0 AVout) with ESMTP id n6TF4dYM029687
	for <linux-next@vger.kernel.org>; Wed, 29 Jul 2009 20:34:39 +0530
In-Reply-To: <20090729173611.b82478cd.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linuxppc-dev@ozlabs.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>

While executing hugetlb tests against today's Next tree on
a Power 6 box came across following OOPS.

 ------------[ cut here ]------------
Oops: Exception in kernel mode, sig: 5 [#1]
SMP NR_CPUS=1024 NUMA pSeries
Modules linked in: ipv6 fuse loop dm_mod ehea sg sd_mod crc_t10dif ibmvscsic scsi_transport_srp scsi_tgt scsi_mod
NIP: c00000000003e794 LR: c00000000003e9ec CTR: 000000000000bba4
REGS: c00000006a72b5d0 TRAP: 0700   Not tainted  (2.6.31-rc4-autotest-next-20090729-5-ppc64)
MSR: 8000000000029032 <EE,ME,CE,IR,DR>  CR: 22044444  XER: 00000001
TASK = c000000069c00180[1115] 'readback' THREAD: c00000006a728000 CPU: 2
GPR00: 0000000000000001 c00000006a72b850 c000000000a93190 c00000006f6f04d0
GPR04: c00000006b810001 0000000000000008 0000000000000000 0000040000000000
GPR08: c00000006ece0ca8 c00000006a137ff8 c00000006ece0ca8 0000000000000018
GPR12: 0000000042000448 c000000000b72800 00000000ffffffff ffffffffffffffff
GPR16: 00000000477555d0 0000000000000000 0000000000000001 000003ffffffffff
GPR20: 0000040000000000 0000000000000000 0000010000000000 0000040000000000
GPR24: c00000006f6f04d0 000003ffffffffff 0000000000000007 c00000006cdc28d0
GPR28: 0000040000000000 000003fff0000000 c00000006a137ff8 0000040000000000
NIP [c00000000003e794] .free_hugepte_range+0x44/0x68
LR [c00000000003e9ec] .hugetlb_free_pgd_range+0x234/0x374
Call Trace:
[c00000006a72b850] [0000175c08000393] 0x175c08000393 (unreliable)
[c00000006a72b8c0] [c00000000003e9ec] .hugetlb_free_pgd_range+0x234/0x374
[c00000006a72b9b0] [c00000000013742c] .free_pgtables+0x90/0x140
[c00000006a72ba60] [c0000000001393c4] .exit_mmap+0x12c/0x1b8
[c00000006a72bb10] [c00000000008d460] .mmput+0x54/0x14c
[c00000006a72bba0] [c000000000092428] .exit_mm+0x17c/0x1a0
[c00000006a72bc50] [c00000000009481c] .do_exit+0x204/0x774
[c00000006a72bd30] [c000000000094e40] .do_group_exit+0xb4/0xe8
[c00000006a72bdc0] [c000000000094e88] .SyS_exit_group+0x14/0x28
[c00000006a72be30] [c0000000000085b4] syscall_exit+0x0/0x40
Instruction dump:
68800001 780007e0 0b000000 38a50001 38000000 7ca507b4 f8090000 38000001
2f850007 9003000c 7c101026 5400f7fe <0b000000> 78840724 7ca42378 4bff8ed5

next-20090728 worked fine. Last commit that changed
arch/powerpc/mm/hugetlbpage.c was cb7f3f2d92d1b26c13e30e639b6ee4a78e9a3afa

powerpc: Add memory management headers for new 64-bit BookE

I will try reverting that commit and check if that helps.

Thanks
-Sachin


-- 

---------------------------------
Sachin Sant
IBM Linux Technology Center
India Systems and Technology Labs
Bangalore, India
---------------------------------
