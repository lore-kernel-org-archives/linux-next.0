From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: tip/perfcounters tree build warning
Date: Mon, 15 Jun 2009 16:09:16 +0200
Message-ID: <20090615140916.GA29435@elte.hu>
References: <20090615165559.66c76c58.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:46036 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752413AbZFOOJh (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 15 Jun 2009 10:09:37 -0400
Content-Disposition: inline
In-Reply-To: <20090615165559.66c76c58.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Today's linux-next build (powerpc allyesconfig) produced this warning:
> 
> arch/powerpc/kernel/perf_counter.c: In function 'record_and_restart':
> arch/powerpc/kernel/perf_counter.c:1016: warning: unused variable 'addr'
> 
> Introduced by commit df1a132bf3d3508f863336c80a27806a2ac947e0
> ("perf_counter: Introduce struct for sample data").
> 
> I checked the tip/master branch and this is not fixed there.

Thanks Stephen for reporting this!

	Ingo
