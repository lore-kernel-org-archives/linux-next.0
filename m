From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: linux-next: manual merge of the akpm tree with the tip tree
Date: Tue, 09 Jan 2018 12:36:52 +0200
Message-ID: <1515494212.7000.811.camel@linux.intel.com>
References: <20180109160244.1f3811eb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180109160244.1f3811eb@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andi Kleen <ak@linux.intel.com>, "Darren Hart (VMware)" <dvhart@infradead.org>
List-Id: linux-next.vger.kernel.org

On Tue, 2018-01-09 at 16:02 +1100, Stephen Rothwell wrote:
> Hi Andrew,
> 
> Today's linux-next merge of the akpm tree got a conflict in:
> 
>   arch/x86/platform/intel-mid/device_libs/platform_bt.c
> 
> between commit:
> 
>   9d0513d82f1a ("x86/platform/intel-mid: Revert "Make 'bt_sfi_data'
> const"")
> 
> from the tip tree and patch:
> 
>   "arch/x86/platform/intel-mid/device_libs/platform_bt.c: fix const
> confusion"
> 
> from the akpm tree.
> 
> I fixed it up (I dropped the akpm tree patch)

Yes, that is exactly what needs to be done.
Thanks!

Andrew, can you drop that patch from your quilt?

>  and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but
> any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to
> consider
> cooperating with the maintainer of the conflicting tree to minimise
> any
> particularly complex conflicts.
> 

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
