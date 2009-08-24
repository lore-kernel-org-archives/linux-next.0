From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: tip tree build failure
Date: Mon, 24 Aug 2009 09:32:15 +0200
Message-ID: <20090824073215.GA30040@elte.hu>
References: <20090824165449.559d1597.sfr@canb.auug.org.au> <1251097136.7538.124.camel@twins>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:42538 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751850AbZHXHcc (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 24 Aug 2009 03:32:32 -0400
Content-Disposition: inline
In-Reply-To: <1251097136.7538.124.camel@twins>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org


* Peter Zijlstra <peterz@infradead.org> wrote:

> On Mon, 2009-08-24 at 16:54 +1000, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Today's linux-next build (powerpc ppc64_defconfig) failed like this:
> > 
> > arch/powerpc/kernel/perf_callchain.c: In function 'perf_callchain_kernel':
> > arch/powerpc/kernel/perf_callchain.c:73: error: implicit declaration of function 'perf_paranoid_anon_ip'
> > 
> > Caused by commit 512cec5d6f2a71e04464bf4fd76a50571bd0dea1 ("perf_counter:
> > powerpc: Support the anonimized kernel callchain bits") which I have
> > reverted for today.
> 
> Yes, that needs to be gone, it relied on another change which 
> never went in. Ingo could you make that commit disappear?

Correct - it's still near the tail of the tree so i zapped it.

	Ingo
