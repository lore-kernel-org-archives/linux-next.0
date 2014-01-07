From: Tang Chen <tangchen@cn.fujitsu.com>
Subject: Re: linux-next: manual merge of the akpm-current tree with the tip
 tree
Date: Tue, 07 Jan 2014 14:34:32 +0800
Message-ID: <52CB9FF8.6020809@cn.fujitsu.com>
References: <20140107170041.3a0b3ada016d250b1f9f0572@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140107170041.3a0b3ada016d250b1f9f0572@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Lans Zhang <jia.zhang@windriver.com>, Yasuaki Ishimatsu <isimatu.yasuaki@jp.fujitsu.com>, Lai Jiangshan <laijs@cn.fujitsu.com>, Jiang Liu <jiang.liu@huawei.com>, Zhang Yanfei <zhangyanfei@cn.fujitsu.com>
List-Id: linux-next.vger.kernel.org

On 01/07/2014 02:00 PM, Stephen Rothwell wrote:
> Hi Andrew,
>
> Today's linux-next merge of the akpm-current tree got a conflict in
> arch/x86/mm/numa.c between commit f3d815cb854b ("x86/mm/numa: Fix 32-bit
> kernel NUMA boot") from the tip tree and commit 1459be89954e ("x86: get
> pg_data_t's memory from other node") from the akpm-current tree.
>
> These appear to be two very similar solutions, I fixed it up (see below -
> I (arbitrarily) chose to keep the actual allocation from the tip tree, but
> the messages from the akpm-current tree) and can carry the fix as
> necessary (no action is required).
>

memblock_alloc_nid() and __memblock_alloc_base() will call
memblock_alloc_base_nid() in the end. So I think it is OK to me.

I will do some tests when they are merged.

Thanks.
