From: Changwei Ge <ge.changwei@h3c.com>
Subject: Re: linux-next: build warnings after merge of the akpm-current tree
Date: Sat, 26 Aug 2017 01:23:41 +0000
Message-ID: <63ADC13FD55D6546B7DECE290D39E373AC2CFA97@H3CMLB14-EX.srv.huawei-3com.com>
References: <20170824174159.67177da2@canb.auug.org.au>
 <63ADC13FD55D6546B7DECE290D39E373AC2CF2E2@H3CMLB14-EX.srv.huawei-3com.com>
 <20170825142348.89eb3cf90c2e054869add1d9@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp.h3c.com ([60.191.123.56]:56400 "EHLO h3cmg01-ex.h3c.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751411AbdHZB0T (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 25 Aug 2017 21:26:19 -0400
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mark Fasheh <mfasheh@versity.com>

Hi Andrew,


On 2017/8/26 5:24, Andrew Morton wrote:
> On Thu, 24 Aug 2017 08:15:30 +0000 Changwei Ge <ge.changwei@h3c.com> wrote:
>
>> Hi Andrew,
>>
>> On 2017/8/24 15:42, Stephen Rothwell wrote:
>>> Hi Andrew, After merging the akpm-current tree, today's linux-next
>>> build (x86_64 allmodconfig) produced these warnings:
>>> fs/ocfs2/dlm/dlmrecovery.c: In function 'dlm_free_dead_locks':
>>> fs/ocfs2/dlm/dlmrecovery.c:2306:6: warning: unused variable 'i'
>>> [-Wunused-variable] int i; ^ fs/ocfs2/dlm/dlmrecovery.c:2305:20:
>>> warning: unused variable 'queue' [-Wunused-variable] struct list_head
>>> *queue = NULL; ^ 
>> My patch never defines these two variables, it's strange that they are
>> defined within the patch you collected.
>> Could you please help to check if this patch comes from mail '[PATCH]
>> ocfs2: re-queue AST or BAST if sending is failed to improve the
>> reliability' sent on 7, August.
> Yes, I'm not at all sure how those lines got there.
>
> Problem is, the patch you sent was wordwrapped and had its tabs
> replaced with spaces.  So I had to do quite a lot of work on it to make
> it usable.  Evidently I somehow added those lines in the process.
>
> Please carefully check that
>
> http://www.ozlabs.org/~akpm/mmotm/broken-out/ocfs2-re-queue-ast-or-bast-if-sending-is-failed-to-improve-the-reliability.patch
>
> plus
>
> --- a/fs/ocfs2/dlm/dlmrecovery.c~ocfs2-re-queue-ast-or-bast-if-sending-is-failed-to-improve-the-reliability-fix
> +++ a/fs/ocfs2/dlm/dlmrecovery.c
> @@ -2302,8 +2302,6 @@ static void dlm_free_dead_locks(struct d
>  	struct dlm_lock *lock, *next;
>  	unsigned int freed = 0;
>  	int reserved_tmp = 0;
> -	struct list_head *queue = NULL;
> -	int i;
>  
>  	/* this node is the lockres master:
>  	 * 1) remove any stale locks for the dead node
>
> produce the correct result.
>
> And please appropriately configure your email client for next time!
Sorry for the trouble my patch made, I will check my email client
configuration.

Thanks,
Changwei
>
