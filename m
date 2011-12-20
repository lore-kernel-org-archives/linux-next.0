From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the tip tree with the cputime tree
Date: Tue, 20 Dec 2011 12:09:33 +0100
Message-ID: <20111220110933.GA17430@elte.hu>
References: <20111219154010.c2044c038a6174dd8fb6f477@canb.auug.org.au>
 <20111219080813.GB30432@elte.hu>
 <20111219101134.3c2c0db5@de.ibm.com>
 <20111219103513.GA17928@elte.hu>
 <20111219112547.GA32375@elte.hu>
 <20111219152409.3a2c213e@de.ibm.com>
 <20111219163009.GC10017@elte.hu>
 <20111219200603.126287ed@de.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:40848 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751819Ab1LTLLZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 20 Dec 2011 06:11:25 -0500
Content-Disposition: inline
In-Reply-To: <20111219200603.126287ed@de.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Martin Schwidefsky <schwidefsky@de.ibm.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Glauber Costa <glommer@parallels.com>


* Martin Schwidefsky <schwidefsky@de.ibm.com> wrote:

> [...] I've replaced cputime-tip with a version that survived 
> "make allmodconfig; make" on x86-32, x86-64, powerpc and s390 
> (with JUMP_LABEL=n, there is another bug lurking). ia64, the 
> third architecture with VIRT_CPU_ACCOUNTING=y, does not 
> compile due to a cyclic dependency in asm-offsets.c vs 
> sched.h. Now it only has to work ..

It's looking good so far here. Pulled, thanks Martin!

Thanks,

	Ingo
