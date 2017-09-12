From: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Subject: Re: linux-next: Tree for Sep 12
Date: Tue, 12 Sep 2017 22:18:25 +0900
Message-ID: <20170912131825.GA485@tigerII.localdomain>
References: <20170912141647.7578aec1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170912141647.7578aec1@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Lutomirski <luto@kernel.org>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi Andy,

got the following warn for each CPU


[    0.000000] ------------[ cut here ]------------
[    0.000000] WARNING: CPU: 0 PID: 0 at arch/x86/mm/tlb.c:245 initialize_tlbstate_and_flush+0x60/0xd4
[    0.000000] Modules linked in:
[    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 4.13.0-next-20170912-00021-g7df61d682d25-dirty #406
[    0.000000] task: ffffffff8180d480 task.stack: ffffffff81800000
[    0.000000] RIP: 0010:initialize_tlbstate_and_flush+0x60/0xd4
[    0.000000] RSP: 0000:ffffffff81803eb8 EFLAGS: 00010046
[    0.000000] RAX: 00000000000406b0 RBX: ffff88042fa16440 RCX: 0000000001808000
[    0.000000] RDX: ffffffff8182f3e0 RSI: 0000000001808000 RDI: 0000000000000000
[    0.000000] RBP: ffffffff81803f10 R08: 0000000000000000 R09: ffffffff0000ffff
[    0.000000] R10: ffff0000ffffffff R11: 0000ffffffffffff R12: 0000000000000000
[    0.000000] R13: 0000000000000000 R14: ffff88042fa0c3a0 R15: ffffffff8180d480
[    0.000000] FS:  0000000000000000(0000) GS:ffff88042fa00000(0000) knlGS:0000000000000000
[    0.000000] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    0.000000] CR2: ffff88042fdff000 CR3: 0000000001808000 CR4: 00000000000406b0
[    0.000000] Call Trace:
[    0.000000]  cpu_init+0x174/0x2dc
[    0.000000]  trap_init+0x3a/0x4a
[    0.000000]  start_kernel+0x1da/0x3f6
[    0.000000]  secondary_startup_64+0xa5/0xa5
[    0.000000] Code: 00 80 ff 77 00 00 48 01 f8 48 39 c6 74 02 0f ff 48 8b 05 7d b9 82 00 0f ba e0 11 73 10 65 48 8b 05 fb 92 fe 7e 0f ba e0 11 72 02 <0f> ff 48 81 e1 00 f0 ff ff 0f 22 d9 65 66 c7 05 d7 92 fe 7e 00
[    0.000000] ---[ end trace e43a322026e46189 ]---


	-ss
