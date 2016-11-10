From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: RCU: dyntick_idle warnings
Date: Thu, 10 Nov 2016 06:54:56 -0800
Message-ID: <20161110145456.GA4127@linux.vnet.ibm.com>
References: <20161110075719.GA502@swordfish>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:47191 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S933856AbcKJOzR (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Thu, 10 Nov 2016 09:55:17 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id uAAEs4TA109689
        for <linux-next@vger.kernel.org>; Thu, 10 Nov 2016 09:55:00 -0500
Received: from e37.co.us.ibm.com (e37.co.us.ibm.com [32.97.110.158])
        by mx0b-001b2d01.pphosted.com with ESMTP id 26mr1eypq9-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-next@vger.kernel.org>; Thu, 10 Nov 2016 09:55:00 -0500
Received: from localhost
        by e37.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-next@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Thu, 10 Nov 2016 07:54:59 -0700
Content-Disposition: inline
In-Reply-To: <20161110075719.GA502@swordfish>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Cc: Josh Triplett <josh@joshtriplett.org>, Steven Rostedt <rostedt@goodmis.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Andy Lutomirski <luto@amacapital.net>, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>

On Thu, Nov 10, 2016 at 04:57:19PM +0900, Sergey Senozhatsky wrote:
> Hello Paul,
> 
> x86_64, linux-next 20161110
> 
> WARN_ON_ONCE(!(special & RCU_DYNTICK_CTRL_CTR));
> 
> [    0.436242] ------------[ cut here ]------------
> [    0.436307] WARNING: CPU: 3 PID: 0 at kernel/rcu/tree.c:380 rcu_momentary_dyntick_idle+0xa7/0xb8
> [    0.436381] Modules linked in:
> [    0.436437] CPU: 3 PID: 0 Comm: swapper/3 Not tainted 4.9.0-rc4-next-20161110-dbg-00001-g0d7df5d-dirty #863
> [    0.436513] Hardware name: SAMSUNG ELECTRONICS CO.,LTD Samsung DeskTop System/Samsung DeskTop System, BIOS 05CC                   04/09/2010
> [    0.436595] Call Trace:
> [    0.436651]  dump_stack+0x4d/0x63
> [    0.436706]  __warn+0xb8/0xd3
> [    0.436760]  warn_slowpath_null+0x18/0x1a
> [    0.436815]  rcu_momentary_dyntick_idle+0xa7/0xb8
> [    0.436872]  rcu_note_context_switch+0x2c8/0x2d5
> [    0.436930]  __schedule+0x62/0x3b6
> [    0.436984]  schedule+0x84/0x95
> [    0.437038]  schedule_preempt_disabled+0x10/0x19
> [    0.437095]  cpu_startup_entry+0x18c/0x191
> [    0.437152]  start_secondary+0xef/0xf2
> [    0.437207]  start_cpu+0x5/0x14
> [    0.437263] ---[ end trace c0bbb435a1f86b8a ]---
> 
> 
> 
> WARN_ON_ONCE(!(atomic_read(&rdtp->dynticks) & 0x1));
> 
> [    0.895911] ------------[ cut here ]------------
> [    0.895966] WARNING: CPU: 0 PID: 1 at kernel/rcu/tree.c:1116 rcu_nmi_exit+0x63/0x82
> [    0.896026] Modules linked in:^Ac
> [    0.896078] CPU: 0 PID: 1 Comm: swapper/0 Tainted: G        W       4.9.0-rc4-next-20161110-dbg-00001-g0d7df5d-dirty #863
> [    0.896157] Hardware name: SAMSUNG ELECTRONICS CO.,LTD Samsung DeskTop System/Samsung DeskTop System, BIOS 05CC                   04/09/2010
> [    0.896236] Call Trace:
> [    0.896287]  <NMI>
> [    0.896338]  dump_stack+0x4d/0x63
> [    0.896390]  __warn+0xb8/0xd3
> [    0.896442]  warn_slowpath_null+0x18/0x1a
> [    0.896495]  rcu_nmi_exit+0x63/0x82
> [    0.896548]  do_nmi+0x2b4/0x31f
> [    0.896600]  end_repeat_nmi+0x1a/0x1e
> [    0.896652] RIP: 0010:ioread32+0xb/0x2f
> [    0.896705] RSP: 0000:ffffc900000176c0 EFLAGS: 00000296^Ac
> [    0.896762] RAX: 0000000000000004 RBX: ffff880132868a80 RCX: 0000000000000000
> [    0.896820] RDX: 0000000000000003 RSI: ffffc9000100e180 RDI: ffffc9000100e180
> [    0.896879] RBP: ffffc900000176c8 R08: 000000000000000a R09: 000000000000b885
> [    0.896938] R10: ffffc900000178e8 R11: ffff8801330b0080 R12: 00000000fffb6f2e
> [    0.896996] R13: 0000000000000006 R14: 000000000000005b R15: ffff88013288f848
> [    0.897055]  ? ioread32+0xb/0x2f
> [    0.897107]  ? ioread32+0xb/0x2f
> [    0.897160]  <EOE>
> [    0.897210]  ? nv50_i2c_bus_sense_scl+0x1f/0x24
> [    0.897265]  nvkm_i2c_bus_getscl+0xa/0xc
> [    0.897318]  sclhi+0x36/0x6a
> [    0.897369]  i2c_outb+0x49/0xcf
> [    0.897422]  try_address+0x30/0x6f
> [    0.897475]  bit_xfer+0x23a/0x402
> [    0.897527]  __i2c_transfer+0x156/0x18b
> [    0.897581]  i2c_transfer+0x6e/0x8c
> [    0.897634]  ? nvkm_fantog_create+0xcd/0xcd
> [    0.897688]  nvkm_i2c_bus_probe+0x141/0x200
> [    0.897741]  ? extdev_table+0xa7/0xc6
> [    0.897793]  nvkm_therm_ic_ctor+0x141/0x14f
> [    0.897847]  ? nvkm_therm_ic_ctor+0x141/0x14f
> [    0.897900]  ? nvbios_rd08+0x1a/0x30
> [    0.897953]  ? nvbios_therm_sensor_parse+0x97/0x1ca
> [    0.898008]  nvkm_therm_oneinit+0x19/0x3b
> [    0.898061]  nvkm_subdev_init+0x89/0x195
> [    0.898114]  nvkm_device_init+0x145/0x204
> [    0.898167]  nvkm_udevice_init+0x2f/0x4a
> [    0.898220]  nvkm_object_init+0x71/0x15d
> [    0.898273]  nvkm_ioctl_new+0x1aa/0x27a
> [    0.898326]  ? nvkm_client_notify+0x22/0x22
> [    0.898380]  ? nvkm_udevice_rd08+0x1f/0x1f
> [    0.898434]  nvkm_ioctl+0x174/0x1d0
> [    0.898487]  nvkm_client_ioctl+0xd/0xf
> [    0.898540]  nvif_object_ioctl+0x42/0x44
> [    0.898594]  nvif_object_init+0xc4/0x104
> [    0.898647]  nvif_device_init+0xd/0x2b
> [    0.898700]  nouveau_drm_load+0x269/0x89e
> [    0.898753]  drm_dev_register+0x7f/0xc0
> [    0.898806]  drm_get_pci_dev+0xf3/0x1bd
> [    0.898860]  nouveau_drm_probe+0x1a2/0x1c1
> [    0.898913]  pci_device_probe+0x7e/0xe6
> [    0.898966]  driver_probe_device+0x130/0x284
> [    0.899020]  __driver_attach+0x6a/0x8c
> [    0.899074]  ? driver_probe_device+0x284/0x284
> [    0.899128]  bus_for_each_dev+0x68/0x80
> [    0.899181]  driver_attach+0x19/0x1b
> [    0.899234]  bus_add_driver+0xe9/0x1d9
> [    0.899287]  driver_register+0x83/0xba
> [    0.899340]  ? ttm_init+0x5d/0x5d
> [    0.899393]  __pci_register_driver+0x47/0x49
> [    0.899446]  drm_pci_init+0x47/0xc8
> [    0.899500]  ? ttm_init+0x5d/0x5d
> [    0.899552]  ? set_debug_rodata+0x12/0x12
> [    0.899605]  nouveau_drm_init+0x1db/0x1dd
> [    0.899658]  do_one_initcall+0x8b/0x10e
> [    0.899711]  ? set_debug_rodata+0x12/0x12
> [    0.899765]  kernel_init_freeable+0x123/0x1ab
> [    0.899819]  ? rest_init+0x7d/0x7d
> [    0.899871]  kernel_init+0x9/0xeb
> [    0.899924]  ret_from_fork+0x22/0x30
> [    0.899977] ---[ end trace c0bbb435a1f86b8b ]---

Hello, Sergey,

Should be fixed by 0ea13930e9a8 ("rcu: Maintain special bits at bottom
of ->dynticks counter"), which should be in -next today.

And thank you for your testing efforts!

							Thanx, Paul
