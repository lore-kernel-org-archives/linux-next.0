From: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: linux-next: manual merge of the userns tree with the arm64 tree
Date: Fri, 28 Sep 2018 09:22:15 +0100
Message-ID: <20180928082215.GA193149@arrakis.emea.arm.com>
References: <20180928134929.73598ec6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180928134929.73598ec6@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Eric W. Biederman" <ebiederm@xmission.com>, Will Deacon <will.deacon@arm.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Fri, Sep 28, 2018 at 01:49:29PM +1000, Stephen Rothwell wrote:
> diff --cc arch/arm64/kernel/traps.c
> index 21689c6a985f,856b32aa03d8..000000000000
> --- a/arch/arm64/kernel/traps.c
> +++ b/arch/arm64/kernel/traps.c
> @@@ -353,12 -366,6 +368,9 @@@ void force_signal_inject(int signal, in
>   	const char *desc;
>   	struct pt_regs *regs = current_pt_regs();
>   
>  +	if (WARN_ON(!user_mode(regs)))
>  +		return;
>  +
> - 	clear_siginfo(&info);
> - 
>   	switch (signal) {
>   	case SIGILL:
>   		desc = "undefined instruction";

It looks fine. Thanks Stephen.

-- 
Catalin
