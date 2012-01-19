From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next: Tree for Jan 19 (uml)
Date: Wed, 18 Jan 2012 19:07:24 -0800
Message-ID: <4F1788EC.4040901@xenotime.net>
References: <20120119125932.a4c67005cf6a0938558e8b36@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy4-pub.bluehost.com ([69.89.21.11]:42730 "HELO
	oproxy4-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1755896Ab2ASCI6 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 18 Jan 2012 21:08:58 -0500
In-Reply-To: <20120119125932.a4c67005cf6a0938558e8b36@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, "user-mode-linux-devel@lists.sourceforge.net" <user-mode-linux-devel@lists.sourceforge.net>, Richard Weinberger <richard@nod.at>

On 01/18/2012 05:59 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20120118:
> 
> Linus' tree gained a build failure for which I applied a patch.


Building uml on x86_64 gives:

  CC      arch/um/kernel/asm-offsets.s
In file included from /next/linux-next-20120119/arch/um/include/shared/registers.h:9:0,
                 from /next/linux-next-20120119/arch/um/include/asm/processor-generic.h:14,
                 from /next/linux-next-20120119/arch/x86/um/asm/processor.h:20,
                 from /next/linux-next-20120119/arch/um/include/asm/uaccess.h:16,
                 from /next/linux-next-20120119/arch/um/include/asm/thread_info.h:13,
                 from /next/linux-next-20120119/include/linux/thread_info.h:53,
                 from /next/linux-next-20120119/include/linux/preempt.h:9,
                 from /next/linux-next-20120119/include/linux/spinlock.h:50,
                 from /next/linux-next-20120119/include/linux/seqlock.h:29,
                 from /next/linux-next-20120119/include/linux/time.h:8,
                 from /next/linux-next-20120119/include/linux/timex.h:56,
                 from /next/linux-next-20120119/include/linux/sched.h:57,
                 from /next/linux-next-20120119/arch/x86/um/shared/sysdep/kernel-offsets.h:2,
                 from /next/linux-next-20120119/arch/um/kernel/asm-offsets.c:1:
/next/linux-next-20120119/arch/x86/um/shared/sysdep/ptrace.h:7:20: error: redefinition of 'regs_return_value'
/next/linux-next-20120119/arch/x86/um/shared/sysdep/ptrace.h:7:20: note: previous definition of 'regs_return_value' was here



-- 
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
