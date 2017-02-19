From: Sachin Sant <sachinp@linux.vnet.ibm.com>
Subject: [next-20170217] WARN @/arch/powerpc/include/asm/xics.h:124
 .icp_hv_eoi+0x40/0x140
Date: Sun, 19 Feb 2017 20:39:34 +0530
Message-ID: <E96217CD-2ADD-430D-86BD-27FF87752D7F@linux.vnet.ibm.com>
Mime-Version: 1.0 (Mac OS X Mail 10.2 \(3259\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:46206 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1750832AbdBSPLT (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Sun, 19 Feb 2017 10:11:19 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v1JF3X1I023154
        for <linux-next@vger.kernel.org>; Sun, 19 Feb 2017 10:11:18 -0500
Received: from e23smtp02.au.ibm.com (e23smtp02.au.ibm.com [202.81.31.144])
        by mx0a-001b2d01.pphosted.com with ESMTP id 28ppuhp0qk-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-next@vger.kernel.org>; Sun, 19 Feb 2017 10:11:18 -0500
Received: from localhost
        by e23smtp02.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-next@vger.kernel.org> from <sachinp@linux.vnet.ibm.com>;
        Mon, 20 Feb 2017 01:11:15 +1000
Received: from d23relay09.au.ibm.com (d23relay09.au.ibm.com [9.185.63.181])
        by d23dlp01.au.ibm.com (Postfix) with ESMTP id AFA192CE8046
        for <linux-next@vger.kernel.org>; Mon, 20 Feb 2017 02:11:11 +1100 (EST)
Received: from d23av05.au.ibm.com (d23av05.au.ibm.com [9.190.234.119])
        by d23relay09.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id v1JFB3nX33423360
        for <linux-next@vger.kernel.org>; Mon, 20 Feb 2017 02:11:11 +1100
Received: from d23av05.au.ibm.com (localhost [127.0.0.1])
        by d23av05.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id v1JFAdad002425
        for <linux-next@vger.kernel.org>; Mon, 20 Feb 2017 02:10:39 +1100
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: linuxppc-dev@ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>

While booting next-20170217 on a POWER6 box, I ran into following
warning. This is a full system lpar. Previous next tree was good.
I will try a bisect tomorrow.

ipr: IBM Power RAID SCSI Device Driver version: 2.6.3 (October 17, 2015)
ipr 0200:00:01.0: Found IOA with IRQ: 305
------------[ cut here ]------------
WARNING: CPU: 12 PID: 1 at ./arch/powerpc/include/asm/xics.h:124 .icp_hv_eoi+0x40/0x140
Modules linked in:
CPU: 12 PID: 1 Comm: swapper/14 Not tainted 4.10.0-rc8-next-20170217-autotest #1
task: c0000002b2a4a580 task.stack: c0000002b2a5c000
NIP: c0000000000731b0 LR: c0000000001389f8 CTR: c000000000073170
REGS: c0000002b2a5f050 TRAP: 0700   Not tainted  (4.10.0-rc8-next-20170217-autotest)
MSR: 8000000000029032 <SF,EE,ME,IR,DR,RI>
  CR: 28004082  XER: 20000004
CFAR: c0000000001389e0 SOFTE: 0 
GPR00: c0000000001389f8 c0000002b2a5f2d0 c000000001025800 c0000002b203f498 
GPR04: 0000000000000000 0000000000000000 0000000000000064 0000000000000131 
GPR08: 0000000000000001 c0000000d3104cb8 ffffffffffffffff 000000000009b1f8 
GPR12: 0000000048004082 c00000000edc2400 c00000000000dad0 0000000000000000 
GPR16: 0000000000000000 00003c007efc0000 c000000000a9e848 0000000000000000 
GPR20: d000080080080000 c0000002af4d47f0 c0000000011efda8 c000000000a9ea10 
GPR24: c000000000a9e848 0000000000000000 c0000002af4d4fb8 0000000000000000 
GPR28: 0000000000000000 c0000002b203f498 c000000000ef8928 c0000002b203f400 
NIP [c0000000000731b0] .icp_hv_eoi+0x40/0x140
LR [c0000000001389f8] .handle_fasteoi_irq+0x1e8/0x270
Call Trace:
[c0000002b2a5f2d0] [c0000002b2a5f360] 0xc0000002b2a5f360 (unreliable)
[c0000002b2a5f360] [c0000000001389f8] .handle_fasteoi_irq+0x1e8/0x270
[c0000002b2a5f3e0] [c000000000136a08] .request_threaded_irq+0x298/0x370
[c0000002b2a5f490] [c0000000005895c0] .ipr_probe_ioa+0x1110/0x1390
[c0000002b2a5f5c0] [c00000000058d030] .ipr_probe+0x30/0x3e0
[c0000002b2a5f670] [c000000000466860] .local_pci_probe+0x60/0x130
[c0000002b2a5f710] [c000000000467658] .pci_device_probe+0x148/0x1e0
[c0000002b2a5f7c0] [c000000000527524] .driver_probe_device+0x2d4/0x5b0
[c0000002b2a5f860] [c00000000052796c] .__driver_attach+0x16c/0x190
[c0000002b2a5f8f0] [c0000000005242c4] .bus_for_each_dev+0x84/0xf0
[c0000002b2a5f990] [c000000000526af4] .driver_attach+0x24/0x40
[c0000002b2a5fa00] [c000000000526318] .bus_add_driver+0x2a8/0x370
[c0000002b2a5faa0] [c000000000528a5c] .driver_register+0x8c/0x170
[c0000002b2a5fb20] [c000000000465a54] .__pci_register_driver+0x44/0x60
[c0000002b2a5fb90] [c000000000b8efc8] .ipr_init+0x58/0x70
[c0000002b2a5fc10] [c00000000000d20c] .do_one_initcall+0x5c/0x1c0
[c0000002b2a5fce0] [c000000000b44738] .kernel_init_freeable+0x280/0x360
[c0000002b2a5fdb0] [c00000000000daec] .kernel_init+0x1c/0x130
[c0000002b2a5fe30] [c00000000000baa0] .ret_from_kernel_thread+0x58/0xb8
Instruction dump:
f8010010 f821ff71 80e3000c 7c0004ac e94d0030 3d02ffbc 3928f4b8 7d295214 
81090004 3948ffff 7d484378 79080fe2 <0b080000> 2fa80000 40de0050 91490004 
---[ end trace 5e18ae409f46392c ]---
ipr 0200:00:01.0: Initializing IOA.

Thanks
-Sachin
