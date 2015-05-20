From: Xie XiuQi <xiexiuqi@huawei.com>
Subject: Re: linux-next: Tree for May 18 (mm/memory-failure.c)
Date: Wed, 20 May 2015 14:19:21 +0800
Message-ID: <555C2769.1000608@huawei.com>
References: <20150518185226.23154d47@canb.auug.org.au> <555A0327.9060709@infradead.org> <20150519024933.GA1614@hori1.linux.bs1.fc.nec.co.jp> <555C1EA5.3080700@huawei.com> <20150520060900.GD27005@hori1.linux.bs1.fc.nec.co.jp>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from szxga02-in.huawei.com ([119.145.14.65]:18865 "EHLO
	szxga02-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751077AbbETGTd (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 20 May 2015 02:19:33 -0400
In-Reply-To: <20150520060900.GD27005@hori1.linux.bs1.fc.nec.co.jp>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Naoya Horiguchi <n-horiguchi@ah.jp.nec.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux MM <linux-mm@kvack.org>, Steven Rostedt <rostedt@goodmis.org>, Andrew Morton <akpm@linux-foundation.org>, Jim Davis <jim.epost@gmail.com>, Chen Gong <gong.chen@linux.intel.com>

On 2015/5/20 14:09, Naoya Horiguchi wrote:
> On Wed, May 20, 2015 at 01:41:57PM +0800, Xie XiuQi wrote:
> ...
>>
>> Hi Naoya,
>>
>> This patch will introduce another build error with attched config file.
>>
>> drivers/built-in.o:(__tracepoints+0x500): multiple definition of `__tracepoint_aer_event'
>> mm/built-in.o:(__tracepoints+0x398): first defined here
>> drivers/built-in.o:(__tracepoints+0x4ec): multiple definition of `__tracepoint_memory_failure_event'
>> mm/built-in.o:(__tracepoints+0x384): first defined here
>> drivers/built-in.o:(__tracepoints+0x514): multiple definition of `__tracepoint_mc_event'
>> mm/built-in.o:(__tracepoints+0x3ac): first defined here
>> drivers/built-in.o:(__tracepoints+0x528): multiple definition of `__tracepoint_extlog_mem_event'
>> mm/built-in.o:(__tracepoints+0x3c0): first defined here
>> make: *** [vmlinux] Error 1
>>
>> Is this one better?
> 
> Yes, thank you for digging.
> I posted exactly the same patch just miniutes ago, but yours is a bit
> earlier than mine, so you take the authorship :)

Thanks ;-)

> 
>> ---
>> From 99d91a901142b17287432b00169ac6bd9d87b489 Mon Sep 17 00:00:00 2001
>> From: Xie XiuQi <xiexiuqi@huawei.com>
>> Date: Thu, 21 May 2015 13:11:38 +0800
>> Subject: [PATCH] tracing: fix build error in mm/memory-failure.c
>>
>> next-20150515 fails to build on i386 with the following error:
>>
>> mm/built-in.o: In function `action_result':
>> memory-failure.c:(.text+0x344a5): undefined reference to `__tracepoint_memory_failure_event'
>> memory-failure.c:(.text+0x344d5): undefined reference to `__tracepoint_memory_failure_event'
>> memory-failure.c:(.text+0x3450c): undefined reference to `__tracepoint_memory_failure_event'
>>
>> trace_memory_failure_event depends on CONFIG_RAS,
>> so add 'select RAS' in mm/Kconfig to avoid this error.
>>
>> Reported-by: Randy Dunlap <rdunlap@infradead.org>
>> Reported-by: Jim Davis <jim.epost@gmail.com>
>> Cc: Naoya Horiguchi <n-horiguchi@ah.jp.nec.com>
>> Cc: Steven Rostedt <rostedt@goodmis.org>
>> Cc: Chen Gong <gong.chen@linux.intel.com>
>> Signed-off-by: Xie XiuQi <xiexiuqi@huawei.com>
> 
> Acked-by: Naoya Horiguchi <n-horiguchi@ah.jp.nec.com>
> 
> Thanks,
> Naoya
> .
> 
