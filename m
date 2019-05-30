From: ebiederm@xmission.com (Eric W. Biederman)
Subject: Re: linux-next: build warning after merge of the userns tree
Date: Thu, 30 May 2019 06:34:31 -0500
Message-ID: <87lfyoxjjs.fsf@xmission.com>
References: <20190530153316.60907d8f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190530153316.60907d8f@canb.auug.org.au> (Stephen Rothwell's
        message of "Thu, 30 May 2019 15:33:16 +1000")
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi Eric,
>
> After merging the userns tree, today's linux-next build (i386 defconfig)
> produced this warning:
>
> arch/x86/mm/fault.c: In function 'do_sigbus':
> arch/x86/mm/fault.c:1017:22: warning: unused variable 'tsk' [-Wunused-variable]
>   struct task_struct *tsk = current;
>                       ^~~
>
> Introduced by commit
>
>   351b6825b3a9 ("signal: Explicitly call force_sig_fault on current")
>
> The remaining used of "tsk" are protected by CONFIG_MEMORY_FAILURE.

Yes.  Thank you.  I will add a commit to move tsk inside
CONFIG_MEMORY_FAILURE.

Eric
