From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the perfmon3 tree
Date: Tue, 25 Nov 2008 11:22:34 +0100
Message-ID: <20081125102234.GA4281@elte.hu>
References: <20081125210319.35b2d189.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:43643 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752076AbYKYKXJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 25 Nov 2008 05:23:09 -0500
Content-Disposition: inline
In-Reply-To: <20081125210319.35b2d189.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: stephane eranian <eranian@googlemail.com>, linux-next@vger.kernel.org, Alexander van Heukelum <heukelum@mailshack.com>, the arch/x86 maintainers <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Andrew Morton <akpm@linux-foundation.org>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Stephane,
> 
> Today's linux-next merge of the perfmon3 tree got a conflict in 
> arch/x86/kernel/entry_64.S between commit 
> 322648d1ba75280d62f114d47048beb0b35f5047 ("x86: include ENTRY/END in 
> entry handlers in entry_64.S") from the x86 tree and commit 
> 3511a04973eaac18ee386f0db8c109e589019511 ("perfmon: x86-64 hooks") 
> from the perfmon3 tree.

very emphatic NAK on carrying such x86 changes in the perfmon tree, 
and putting that into linux-next!

Those perfmon changes should be submitted to the x86 tree. The code it 
touches is sensitive and the design questions matter a lot as well.

	Ingo
