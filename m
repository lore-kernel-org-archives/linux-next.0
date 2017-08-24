From: Changwei Ge <ge.changwei@h3c.com>
Subject: Re: linux-next: build warnings after merge of the akpm-current tree
Date: Thu, 24 Aug 2017 08:15:30 +0000
Message-ID: <63ADC13FD55D6546B7DECE290D39E373AC2CF2E2@H3CMLB14-EX.srv.huawei-3com.com>
References: <20170824174159.67177da2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mark Fasheh <mfasheh@versity.com>
List-Id: linux-next.vger.kernel.org

Hi Andrew,

On 2017/8/24 15:42, Stephen Rothwell wrote:
> Hi Andrew, After merging the akpm-current tree, today's linux-next
> build (x86_64 allmodconfig) produced these warnings:
> fs/ocfs2/dlm/dlmrecovery.c: In function 'dlm_free_dead_locks':
> fs/ocfs2/dlm/dlmrecovery.c:2306:6: warning: unused variable 'i'
> [-Wunused-variable] int i; ^ fs/ocfs2/dlm/dlmrecovery.c:2305:20:
> warning: unused variable 'queue' [-Wunused-variable] struct list_head
> *queue = NULL; ^ 
My patch never defines these two variables, it's strange that they are
defined within the patch you collected.
Could you please help to check if this patch comes from mail '[PATCH]
ocfs2: re-queue AST or BAST if sending is failed to improve the
reliability' sent on 7, August.

Thanks,
Changwei
> Caused by commit
>
>   d09f2c6cf3b8 ("ocfs2: re-queue AST or BAST if sending is failed to improve the reliability")
>
