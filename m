From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warning after merge of the tip tree
Date: Fri, 23 Jun 2017 14:00:06 +1000
Message-ID: <20170623140006.26585989@canb.auug.org.au>
References: <20170623135834.49322610@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170623135834.49322610@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>, John Stultz <john.stultz@linaro.org>
List-Id: linux-next.vger.kernel.org

Hi all,

[Forgot to cc John]

On Fri, 23 Jun 2017 13:58:34 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
> 
> After merging the tip tree, today's linux-next build (powerpc
> ppc64_defconfig) produced this warning:
> 
> kernel/time/timekeeping.c:519:2: warning: #warning Please contact your maintainers, as GENERIC_TIME_VSYSCALL_OLD compatibity will disappear soon. [-Wcpp]
>  #warning Please contact your maintainers, as GENERIC_TIME_VSYSCALL_OLD compatibity will disappear soon.
>   ^
> kernel/time/timekeeping.c:519:2: warning: #warning Please contact your maintainers, as GENERIC_TIME_VSYSCALL_OLD compatibity will disappear soon. [-Wcpp]
>  #warning Please contact your maintainers, as GENERIC_TIME_VSYSCALL_OLD compatibity will disappear soon.
>   ^
> 
> Introduced by commit
> 
>   369adf04d80a ("time: Add warning about imminent deprecation of CONFIG_GENERIC_TIME_VSYSCALL_OLD")

-- 
Cheers,
Stephen Rothwell
