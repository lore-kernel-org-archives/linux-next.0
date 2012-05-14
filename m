From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: linux-next: manual merge of the tip tree with the sparc-next
	tree
Date: Mon, 14 May 2012 07:47:14 +0200
Message-ID: <20120514054714.GA20563@merkur.ravnborg.org>
References: <20120514145114.bc3e8b95da9478486ac0a13e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp.snhosting.dk ([87.238.248.203]:48454 "EHLO
	smtp.domainteam.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751060Ab2ENFrQ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 14 May 2012 01:47:16 -0400
Content-Disposition: inline
In-Reply-To: <20120514145114.bc3e8b95da9478486ac0a13e@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>

On Mon, May 14, 2012 at 02:51:14PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the tip tree got a conflict in
> arch/sparc/include/asm/thread_info_32.h between commit e7b7e0c35655
> ("sparc32: drop btfixup for alloc_thread_info_node/free_thread_info")
> from the sparc-next tree and commit f5e10287367d ("task_allocator: Use
> config switches instead of magic defines") from the tip tree.
> 
> Just context changes.  I fixed it up (see below) and can carry the fix as
> necessary.

Hi Stephen.

The right fix would be to drop the define _and_ delete the local
implementation of alloc_thread_info_node() as the generic version
can be used.

But if this builds I can always revist this after the merge window,
so no need for you to do more.

	Sam
