From: "Shi, Yang" <yang.shi@linaro.org>
Subject: Re: [linux-next PATCH] sched: cgroup: enable interrupt before calling
 threadgroup_change_begin
Date: Mon, 25 Apr 2016 14:43:41 -0700
Message-ID: <571E8F8D.9040701@linaro.org>
References: <1461383788-15102-1-git-send-email-yang.shi@linaro.org>
 <20160423091447.GA3430@twins.programming.kicks-ass.net>
 <571E5571.7050106@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pa0-f45.google.com ([209.85.220.45]:33583 "EHLO
	mail-pa0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965153AbcDYVnm (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 25 Apr 2016 17:43:42 -0400
Received: by mail-pa0-f45.google.com with SMTP id zm5so70286109pac.0
        for <linux-next@vger.kernel.org>; Mon, 25 Apr 2016 14:43:42 -0700 (PDT)
In-Reply-To: <571E5571.7050106@linaro.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: tj@kernel.org, mingo@redhat.com, lizefan@huawei.com, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, linaro-kernel@lists.linaro.org

On 4/25/2016 10:35 AM, Shi, Yang wrote:
> On 4/23/2016 2:14 AM, Peter Zijlstra wrote:
>> On Fri, Apr 22, 2016 at 08:56:28PM -0700, Yang Shi wrote:
>>> When kernel oops happens in some kernel thread, i.e. kcompactd in the
>>> test,
>>> the below bug might be triggered by the oops handler:
>>
>> What are you trying to fix? You already oopsed the thing is wrecked.
>
> Actually, I ran into the below kernel BUG:
>
> BUG: unable to handle kernel NULL pointer dereference at           (null)
> IP: [<ffffffff8119d2f8>] release_freepages+0x18/0xa0
> PGD 0
> Oops: 0000 [#1] PREEMPT SMP
> Modules linked in:
> CPU: 6 PID: 110 Comm: kcompactd0 Not tainted 4.6.0-rc4-next-20160420 #4
> Hardware name: Intel Corporation S5520HC/S5520HC, BIOS
> S5500.86B.01.10.0025.030220091519 03/02/2009
> task: ffff880361732680 ti: ffff88036173c000 task.ti: ffff88036173c000
> RIP: 0010:[<ffffffff8119d2f8>]  [<ffffffff8119d2f8>]
> release_freepages+0x18/0xa0
> RSP: 0018:ffff88036173fcf8  EFLAGS: 00010282
> RAX: 0000000000000000 RBX: ffff88036ffde7c0 RCX: 0000000000000009
> RDX: 0000000000001bf1 RSI: 000000000000000f RDI: ffff88036173fdd0
> RBP: ffff88036173fd20 R08: 0000000000000007 R09: 0000160000000000
> R10: ffff88036ffde7c0 R11: 0000000000000000 R12: 0000000000000000
> R13: ffff88036173fdd0 R14: ffff88036173fdc0 R15: ffff88036173fdb0
> FS:  0000000000000000(0000) GS:ffff880363cc0000(0000)
> knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 0000000000000000 CR3: 0000000002206000 CR4: 00000000000006e0
> Stack:
>   ffff88036ffde7c0 0000000000000000 0000000000001a00 ffff88036173fdc0
>   ffff88036173fdb0 ffff88036173fda0 ffffffff8119f13d ffffffff81196239
>   0000000000000000 ffff880361732680 0000000000000001 0000000000100000
> Call Trace:
>   [<ffffffff8119f13d>] compact_zone+0x55d/0x9f0
>   [<ffffffff81196239>] ? fragmentation_index+0x19/0x70
>   [<ffffffff8119f92f>] kcompactd_do_work+0x10f/0x230
>   [<ffffffff8119fae0>] kcompactd+0x90/0x1e0
>   [<ffffffff810a3a40>] ? wait_woken+0xa0/0xa0
>   [<ffffffff8119fa50>] ? kcompactd_do_work+0x230/0x230
>   [<ffffffff810801ed>] kthread+0xdd/0x100
>   [<ffffffff81be5ee2>] ret_from_fork+0x22/0x40
>   [<ffffffff81080110>] ? kthread_create_on_node+0x180/0x180
> Code: c1 fa 06 31 f6 e8 a9 9b fd ff eb 98 0f 1f 80 00 00 00 00 66 66 66
> 66 90 55 48 89 e5 41 57 41 56 41 55 49 89 fd 41 54 53 48 8b 07 <48> 8b
> 10 48 8d 78 e0 49 39 c5 4c 8d 62 e0 74 70 49 be 00 00 00
> RIP  [<ffffffff8119d2f8>] release_freepages+0x18/0xa0
>   RSP <ffff88036173fcf8>
> CR2: 0000000000000000
> ---[ end trace 2e96d09e0ba6342f ]---
>
> Then the "schedule in atomic context" bug is triggered which cause the
> system hang. But, the system is still alive without the "schedule in
> atomic context" bug. The previous null pointer deference issue doesn't
> bring the system down other than killing the compactd kthread.

BTW, I don't have "panic on oops" set. So, the kernel doesn't panic.

Thanks,
Yang

>
> Thanks,
> Yang
>
>>
>
