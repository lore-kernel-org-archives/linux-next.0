From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: linux-next: build warning after merge of the tip tree
Date: Fri, 16 Mar 2018 08:55:13 +0100 (CET)
Message-ID: <alpine.DEB.2.21.1803160854470.1598@nanos.tec.linutronix.de>
References: <20180316163716.5525294f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180316163716.5525294f@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>
List-Id: linux-next.vger.kernel.org

On Fri, 16 Mar 2018, Stephen Rothwell wrote:

> Hi all,
> 
> After merging the tip tree, yesterday's linux-next build (x86_64 allnoconfig)
> produced this warning:
> 
> kernel/cpu.c:129:13: warning: 'cpuhp_is_ap_state' defined but not used [-Wunused-function]
>  static bool cpuhp_is_ap_state(enum cpuhp_state state)
>              ^~~~~~~~~~~~~~~~~
> 
> Introduced by commit
> 
>   17a2f1ced028 ("cpu/hotplug: Merge cpuhp_bp_states and cpuhp_ap_states")

Fix is queued already. Did not make it into the branch you pull yet.

Thanks,

	tglx
