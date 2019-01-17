From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: linux-next: Fixes tag needs some work in the tip tree
Date: Fri, 18 Jan 2019 00:45:44 +0100 (CET)
Message-ID: <alpine.DEB.2.21.1901180044260.1647@nanos.tec.linutronix.de>
References: <20190118093135.39cf071e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190118093135.39cf071e@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>
List-Id: linux-next.vger.kernel.org

On Fri, 18 Jan 2019, Stephen Rothwell wrote:
> Commit
> 
>   a31e184e4f69 ("x86/pkeys: Properly copy pkey state at fork()")
> 
> Fixes tag
> 
>   Fixes: e8c24d3a23a ("x86/pkeys: Allocation/free syscalls")
> 
> has these problems:
> 
>   - SHA1 should be at least 12 digits long

Sigh. I'll add that to my sanity checks, but this one has to be as is as
it's in the middle of a series of fixes pending for linus tree.

Thanks,

	tglx
