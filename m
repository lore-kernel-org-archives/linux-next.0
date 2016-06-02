From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Subject: [linux-next: Tree for Jun 1] __khugepaged_exit
 rwsem_down_write_failed lockup
Date: Thu, 2 Jun 2016 10:48:35 +0900
Message-ID: <20160602014835.GA635@swordfish>
References: <20160601131122.7dbb0a65@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:36633 "EHLO
	mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751846AbcFBBur (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 1 Jun 2016 21:50:47 -0400
Content-Disposition: inline
In-Reply-To: <20160601131122.7dbb0a65@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Vlastimil Babka <vbabka@suse.cz>, Michal Hocko <mhocko@kernel.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-mm@kvack.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On (06/01/16 13:11), Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20160531:
> 
> My fixes tree contains:
> 
>   of: silence warnings due to max() usage
> 
> The arm tree gained a conflict against Linus' tree.
> 
> Non-merge commits (relative to Linus' tree): 1100
>  936 files changed, 38159 insertions(+), 17475 deletions(-)

Hello,

the cc1 process ended up in DN state during kernel -j4 compilation.

...
[ 2856.323052] INFO: task cc1:4582 blocked for more than 21 seconds.
[ 2856.323055]       Not tainted 4.7.0-rc1-next-20160601-dbg-00012-g52c180e-dirty #453
[ 2856.323056] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
[ 2856.323059] cc1             D ffff880057e9fd78     0  4582   4575 0x00000000
[ 2856.323062]  ffff880057e9fd78 ffff880057e08000 ffff880057e9fd90 ffff880057ea0000
[ 2856.323065]  ffff88005dc3dc68 ffffffff00000001 ffff880057e09500 ffff88005dc3dc80
[ 2856.323067]  ffff880057e9fd90 ffffffff81441e33 ffff88005dc3dc68 ffff880057e9fe00
[ 2856.323068] Call Trace:
[ 2856.323074]  [<ffffffff81441e33>] schedule+0x83/0x98
[ 2856.323077]  [<ffffffff81443d9b>] rwsem_down_write_failed+0x18e/0x1d3
[ 2856.323080]  [<ffffffff810a87cf>] ? unlock_page+0x2b/0x2d
[ 2856.323083]  [<ffffffff811bdb77>] call_rwsem_down_write_failed+0x17/0x30
[ 2856.323084]  [<ffffffff811bdb77>] ? call_rwsem_down_write_failed+0x17/0x30
[ 2856.323086]  [<ffffffff81443630>] down_write+0x1f/0x2e
[ 2856.323089]  [<ffffffff810ea4f3>] __khugepaged_exit+0x104/0x11a
[ 2856.323091]  [<ffffffff8103702a>] mmput+0x29/0xc5
[ 2856.323093]  [<ffffffff8103bbd8>] do_exit+0x34c/0x894
[ 2856.323095]  [<ffffffff8102f9e0>] ? __do_page_fault+0x2f7/0x399
[ 2856.323097]  [<ffffffff8103c188>] do_group_exit+0x3c/0x98
[ 2856.323099]  [<ffffffff8103c1f3>] SyS_exit_group+0xf/0xf
[ 2856.323101]  [<ffffffff81444cdb>] entry_SYSCALL_64_fastpath+0x13/0x8f

[ 2877.322853] INFO: task cc1:4582 blocked for more than 21 seconds.
[ 2877.322858]       Not tainted 4.7.0-rc1-next-20160601-dbg-00012-g52c180e-dirty #453
[ 2877.322858] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
[ 2877.322861] cc1             D ffff880057e9fd78     0  4582   4575 0x00000000
[ 2877.322865]  ffff880057e9fd78 ffff880057e08000 ffff880057e9fd90 ffff880057ea0000
[ 2877.322867]  ffff88005dc3dc68 ffffffff00000001 ffff880057e09500 ffff88005dc3dc80
[ 2877.322867]  ffff880057e9fd90 ffffffff81441e33 ffff88005dc3dc68 ffff880057e9fe00
[ 2877.322870] Call Trace:
[ 2877.322875]  [<ffffffff81441e33>] schedule+0x83/0x98
[ 2877.322878]  [<ffffffff81443d9b>] rwsem_down_write_failed+0x18e/0x1d3
[ 2877.322881]  [<ffffffff810a87cf>] ? unlock_page+0x2b/0x2d
[ 2877.322884]  [<ffffffff811bdb77>] call_rwsem_down_write_failed+0x17/0x30
[ 2877.322885]  [<ffffffff811bdb77>] ? call_rwsem_down_write_failed+0x17/0x30
[ 2877.322887]  [<ffffffff81443630>] down_write+0x1f/0x2e
[ 2877.322890]  [<ffffffff810ea4f3>] __khugepaged_exit+0x104/0x11a
[ 2877.322892]  [<ffffffff8103702a>] mmput+0x29/0xc5
[ 2877.322894]  [<ffffffff8103bbd8>] do_exit+0x34c/0x894
[ 2877.322896]  [<ffffffff8102f9e0>] ? __do_page_fault+0x2f7/0x399
[ 2877.322898]  [<ffffffff8103c188>] do_group_exit+0x3c/0x98
[ 2877.322900]  [<ffffffff8103c1f3>] SyS_exit_group+0xf/0xf
[ 2877.322902]  [<ffffffff81444cdb>] entry_SYSCALL_64_fastpath+0x13/0x8f
...

ps aux | grep cc1
ss        4582  0.0  0.0      0     0 pts/23   DN+  10:10   0:01 [cc1]

	-ss
