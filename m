From: Joerg Roedel <jroedel@suse.de>
Subject: Re: linux-next: build failure after merge of the tip tree
Date: Thu, 9 Aug 2018 11:41:54 +0200
Message-ID: <20180809094154.v6aj7fpsenkcmo47@suse.de>
References: <20180809092420.094e8722@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180809092420.094e8722@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi Stephen,

On Thu, Aug 09, 2018 at 09:24:20AM +1000, Stephen Rothwell wrote:
> Invalid absolute R_X86_64_32S relocation: __end_rodata_aligned
> /kisskb/src/arch/x86/boot/compressed/Makefile:127: recipe for target 'arch/x86/boot/compressed/vmlinux.relocs' failed
> 
> Caused by commit
> 
>   39d668e04eda ("x86/mm/pti: Make pti_clone_kernel_text() compile on 32 bit")

Thanks for the report! I only built the source with gcc-4.8 and gcc-7.3,
so I didn't catch this earlier. I have a fix now and will send it as a
separate reply in this thread.


Thanks,

	Joerg
