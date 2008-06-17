From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: x86 tree build failure
Date: Tue, 17 Jun 2008 08:08:35 +0200
Message-ID: <20080617060835.GA16162@elte.hu>
References: <20080617134615.d70be9f6.sfr@canb.auug.org.au> <20080617055816.GA13556@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:39608 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751789AbYFQGIv (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 17 Jun 2008 02:08:51 -0400
Content-Disposition: inline
In-Reply-To: <20080617055816.GA13556@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org


* Ingo Molnar <mingo@elte.hu> wrote:

> > NR_NODE_MEMBLKS is defined in linux/acpi.h if 
> > CONFIG_HAVE_ARCH_PARSE_SRAT is defined and in asm-x86/acpi.h if 
> > CONFIG_ACPI_NUMA and CONFIG_X86_64 are defined ...
> 
> that's not really the x86 tree's fault, i've been carrying the fix for 
> that problem in tip/out-of-tree for 1.5 months:
> 
> | commit d94325315f241f86bd07a2ce113cbf28dc98de72
> | Author: Ingo Molnar <mingo@elte.hu>
> | Date:   Thu May 1 09:51:47 2008 +0000
> |
> |     acpi-acpi_numa_init-build-fix
> |
> |     x86.git testing found the following build error on latest -git:
> |
> |     drivers/acpi/numa.c: In function 'acpi_numa_init':
> |     drivers/acpi/numa.c:226: error: 'NR_NODE_MEMBLKS' undeclared (first use in
> |     drivers/acpi/numa.c:226: error: (Each undeclared identifier is reported onl
> |     drivers/acpi/numa.c:226: error: for each function it appears in.)

note, if you cherry-pick that, you'll also need:

| commit aca9de453911d095a9701ee6ebbae7fd3d6c7c1e
| Author: Russ Anderson <rja@sgi.com>
| Date:   Fri May 16 10:02:06 2008 -0500
|
|     acpi: fix boot breakage on Altix

	Ingo
