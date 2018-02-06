From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: linux-next: manual merge of the tip tree with Linus' tree
Date: Tue, 6 Feb 2018 10:14:11 +0100
Message-ID: <20180206091411.GB2269@hirez.programming.kicks-ass.net>
References: <20180206115438.7008ac91@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:44121 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752302AbeBFJOX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 6 Feb 2018 04:14:23 -0500
Content-Disposition: inline
In-Reply-To: <20180206115438.7008ac91@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>

On Tue, Feb 06, 2018 at 11:54:38AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the tip tree got a conflict in:
> 
>   include/linux/sched/mm.h
> 
> between commit:
> 
>   d70f2a14b72a ("include/linux/sched/mm.h: uninline mmdrop_async(), etc")

FWIW, akpm has a patch that re-inlines mmdrop().
