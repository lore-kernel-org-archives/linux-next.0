From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH] sysrq: include interrupt.h instead of irq.h
Date: Mon, 26 Jan 2009 16:05:18 +0100
Message-ID: <20090126150518.GD9128@elte.hu>
References: <20090121150249.a87aca09.sfr@canb.auug.org.au> <1232545758.31303.2.camel@osiris.boeblingen.de.ibm.com> <4977523B.6000507@sgi.com> <20090126131614.4ad29c15@osiris.boeblingen.de.ibm.com> <497DD00D.4030802@sgi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:34815 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751515AbZAZPHE (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 26 Jan 2009 10:07:04 -0500
Content-Disposition: inline
In-Reply-To: <497DD00D.4030802@sgi.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mike Travis <travis@sgi.com>
Cc: Heiko Carstens <heiko.carstens@de.ibm.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Martin Schwidefsky <schwidefsky@de.ibm.com>


* Mike Travis <travis@sgi.com> wrote:

> Hi Ingo,
> 
> Here's Heiko's patch in my 'urgent-for-ingo' branch. 
> 
> Thanks,
> Mike
> 
> The following changes since commit c3c467d0aabdbb53863e8722be898770d438c140:
>   Ingo Molnar (1):
>         fix: crash: IP: __bitmap_intersects+0x48/0x73
> 
> are available in the git repository at:
> 
>   ssh://master.kernel.org/pub/scm/linux/kernel/git/travis/linux-2.6-cpus4096-for-ingo.git urgent-for-ingo
> 
> Heiko Carstens (1):
>       sysrq: include interrupt.h instead of irq.h
> 
>  drivers/char/sysrq.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

Pulled into tip/cpus4096, thanks guys!

	Ingo
