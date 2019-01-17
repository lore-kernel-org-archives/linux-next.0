From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: linux-next: Fixes tag needs some work in the tip tree
Date: Fri, 18 Jan 2019 00:19:44 +0100 (CET)
Message-ID: <alpine.DEB.2.21.1901180019050.1647@nanos.tec.linutronix.de>
References: <20190118093515.4bee6eb3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190118093515.4bee6eb3@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>
List-Id: linux-next.vger.kernel.org

Steven,

On Fri, 18 Jan 2019, Stephen Rothwell wrote:
> Commit
> 
>   f0ca26ca4f36 ("genirq: Fix the kerneldoc comment for struct irq_affinity_desc")
> 
> Fixes tag
> 
>   Fixes: Commit c410abbbacb9 ("genirq/affinity: Add is_managed to struct irq_affinity_desc")
> 
> has these problems:
> 
>   - No SHA1 recognised
> 
> The word "Commit" is unexpected in the Fixes tag line.

Ooops. Missed that one. Fixed now.

Thanks,

	tglx
