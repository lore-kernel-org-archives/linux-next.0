From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the kmemcheck tree
Date: Tue, 22 Jul 2008 08:52:11 +0200
Message-ID: <20080722065211.GA9639@elte.hu>
References: <20080722161619.5b8bd082.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:48899 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751061AbYGVGw1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 22 Jul 2008 02:52:27 -0400
Content-Disposition: inline
In-Reply-To: <20080722161619.5b8bd082.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Vegard Nossum <vegard.nossum@gmail.com>, Pekka Enberg <penberg@cs.helsinki.fi>, linux-next@vger.kernel.org, Jaswinder Singh <jaswinder@infradead.org>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Today's linux-next merge of the kmemcheck tree got a trivial conflict in
> arch/x86/kernel/traps_32.c between commit
> 6ac8d51f01d345af5ea4209004a9ea29b2f20891 ("x86: introducing
> asm-x86/traps.h") from Linus' tree and commit
> 787ecfaa503dc63ff1831ddc74b15dad49bace1d ("x86: add hooks for kmemcheck")
> from the kmemcheck tree.
> 
> Just overlapping additions of includes.  I can carry it.

thanks Stephen - i had this conflict fixup too in tip/master but not yet 
in auto-kmemcheck-next. I've now propagated it so the conflict should go 
away on your next integration run.

	Ingo
