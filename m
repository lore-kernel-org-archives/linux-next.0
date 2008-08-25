From: Jeremy Fitzhardinge <jeremy@goop.org>
Subject: Re: linux-next: manual merge of the sparseirq tree
Date: Mon, 25 Aug 2008 12:37:27 -0700
Message-ID: <48B309F7.20606@goop.org>
References: <20080825193243.fdf24fcc.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from gw.goop.org ([64.81.55.164]:49627 "EHLO mail.goop.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753562AbYHYTha (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 25 Aug 2008 15:37:30 -0400
In-Reply-To: <20080825193243.fdf24fcc.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Ingo Molnar <mingo@elte.hu>, linux-next@vger.kernel.org, Yinghai Lu <yhlu.kernel@gmail.com>

Stephen Rothwell wrote:
> [Ingo, thanks for the heads up about this ...]
>
> Hi Ingo,
>
> Today's linux-next merge of the sparseirq tree got a conflict in
> arch/x86/xen/spinlock.c between commit
> 168d2f464ab9860f0d1e66cf1f9684973222f1c6 ("xen: save previous spinlock
> when blocking") from the x86 tree and commit
> fb6dc57946f9ebfeac546dd0698d9f065c191668 ("x86: move kstat_irqs from
> kstat to irq_desc") from the sparseirq tree.
>
> I fixed it up (see below) and can carry it.
>   

This is a diff-diff?  The change:

- 	kstat_this_cpu.irqs[irq]++;
 -	/* block until irq becomes pending */
 -	xen_poll_irq(irq);
+ 	kstat_irqs_this_cpu(irq_to_desc(irq))++;


looks fine.
