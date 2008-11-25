From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the perfmon3 tree
Date: Tue, 25 Nov 2008 16:33:45 +0100
Message-ID: <20081125153345.GA20733@elte.hu>
References: <20081125210319.35b2d189.sfr@canb.auug.org.au> <20081125102234.GA4281@elte.hu> <7c86c4470811250640v4417fa4fs196f0d0bea136a45@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:53891 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751193AbYKYPeY (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 25 Nov 2008 10:34:24 -0500
Content-Disposition: inline
In-Reply-To: <7c86c4470811250640v4417fa4fs196f0d0bea136a45@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: eranian@gmail.com
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Alexander van Heukelum <heukelum@mailshack.com>, the arch/x86 maintainers <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Andrew Morton <akpm@linux-foundation.org>


* stephane eranian <eranian@googlemail.com> wrote:

> So I am not sure I understand your point about submitting the 
> changes to the x86 tree first.

You are modifying x86 architecture files to enable a kernel feature on 
x86. Such feature enablement, if it's pushed into linux-next, must go 
via the arch maintainers.

The x86 impact of the perfmon3 tree is substantial:

 arch/x86/Kconfig                               |    2 +
 arch/x86/Makefile                              |    3 +
 arch/x86/ia32/ia32entry.S                      |    5 +
 arch/x86/include/asm/Kbuild                    |    1 +
 arch/x86/include/asm/irq_vectors.h             |    5 +
 arch/x86/include/asm/mach-default/entry_arch.h |    4 +
 arch/x86/include/asm/perfmon.h                 |   34 ++
 arch/x86/include/asm/perfmon_kern.h            |  438 +++++++++++++++++
 arch/x86/include/asm/thread_info.h             |    8 +-
 arch/x86/include/asm/unistd_32.h               |    5 +
 arch/x86/include/asm/unistd_64.h               |   11 +-
 arch/x86/kernel/entry_32.S                     |    2 +-
 arch/x86/kernel/entry_64.S                     |    8 +-
 arch/x86/kernel/irqinit_64.c                   |    5 +
 arch/x86/kernel/process_32.c                   |   10 +
 arch/x86/kernel/process_64.c                   |   10 +
 arch/x86/kernel/signal_32.c                    |    5 +
 arch/x86/kernel/signal_64.c                    |    5 +
 arch/x86/kernel/syscall_table_32.S             |    5 +
 arch/x86/oprofile/nmi_int.c                    |   10 +-
 arch/x86/perfmon/Kconfig                       |   33 ++
 arch/x86/perfmon/Makefile                      |    7 +
 arch/x86/perfmon/perfmon.c                     |  619 +++++++++++++++++++++++
 arch/x86/perfmon/perfmon_amd64.c               |  483 ++++++++++++++++++
 arch/x86/perfmon/perfmon_intel_arch.c          |  628 ++++++++++++++++++++++++
 25 files changed, 2340 insertions(+), 6 deletions(-)

linux-next is not a development kernel - it is an integration tree 
simulating the next version of the upstream kernel and hence all trees 
that are in it must be synced up (and in this case, go via) their 
respective maintainers.

Thanks,

	Ingo
