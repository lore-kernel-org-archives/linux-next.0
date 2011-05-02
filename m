From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for May 2 (uml irqs)
Date: Mon, 2 May 2011 09:15:46 -0700
Message-ID: <20110502091546.5c04f4e6.randy.dunlap@oracle.com>
References: <20110502150150.d932642f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:33806 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752695Ab1EBQQE (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 2 May 2011 12:16:04 -0400
In-Reply-To: <20110502150150.d932642f.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Mon, 2 May 2011 15:01:50 +1000 Stephen Rothwell wrote:

> Hi all,
> 
> Changes since 20110429:


building uml on i386 or x86_64 fails with:

linux-next-20110502/kernel/irq/generic-chip.c: In function 'irq_setup_generic_chip':
linux-next-20110502/kernel/irq/generic-chip.c:232: error: implicit declaration of function 'readl'

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
