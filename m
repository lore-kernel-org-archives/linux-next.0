From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: linux-next: build warning after merge of the tip tree
Date: Wed, 12 Sep 2018 21:35:20 +0200 (CEST)
Message-ID: <alpine.DEB.2.21.1809122134290.1473@nanos.tec.linutronix.de>
References: <20180911135347.0af423f0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180911135347.0af423f0@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andy Lutomirski <luto@kernel.org>
List-Id: linux-next.vger.kernel.org

On Tue, 11 Sep 2018, Stephen Rothwell wrote:
> After merging the tip tree, today's linux-next build (x86_64 allnoconfig)
> produced this warning:
> 
> arch/x86/kernel/cpu/common.c: In function 'syscall_init':
> arch/x86/kernel/cpu/common.c:1534:6: warning: unused variable 'cpu' [-Wunused-variable]
>   int cpu = smp_processor_id();
>       ^~~
> 
> Introduced by commit
> 
>   86635715ee42 ("x86/pti/64: Remove the SYSCALL64 entry trampoline")

Hrmpf. My randconfigs seem not to be random enough. Fixed.

Thanks,

	tglx
