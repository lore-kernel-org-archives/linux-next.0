From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: linux-next: manual merge of the nvdimm tree with the tip tree
Date: Tue, 26 Jun 2018 12:21:04 +0200 (CEST)
Message-ID: <alpine.DEB.2.21.1806261217140.2204@nanos.tec.linutronix.de>
References: <20180626121853.0b4ce17c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180626121853.0b4ce17c@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Dan Williams <dan.j.williams@intel.com>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Borislav Petkov <bp@suse.de>
List-Id: linux-next.vger.kernel.org

On Tue, 26 Jun 2018, Stephen Rothwell wrote:
> Today's linux-next merge of the nvdimm tree got a conflict in:
> 
>   arch/x86/kernel/cpu/mcheck/mce.c
> 
> between commit:
> 
>   d3d6923cd1ae ("x86/mce: Carve out the crashing_cpu check")
> 
> from the tip tree and commit:
> 
>   f6785eac562b ("x86/memory_failure: Introduce {set,clear}_mce_nospec()")
> 
> from the nvdimm tree.

Dan, we have rules how to deal with that stuff and there is no excuse for
you to collect random patches and apply them as you see fit. Stop this
please.

MCE/RAS patches have a well established and working route and if something
in your tree really depends on this, which I'm not seeing at all, then
there are well documented and established procedures to do that.

Thanks,

	tglx
