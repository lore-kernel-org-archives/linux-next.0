From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: linux-next: Tree for May 2 (uml irqs)
Date: Mon, 2 May 2011 18:34:39 +0200 (CEST)
Message-ID: <alpine.LFD.2.02.1105021834240.3005@ionos>
References: <20110502150150.d932642f.sfr@canb.auug.org.au> <20110502091546.5c04f4e6.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from www.linutronix.de ([62.245.132.108]:57349 "EHLO
	Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750805Ab1EBQex (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 2 May 2011 12:34:53 -0400
In-Reply-To: <20110502091546.5c04f4e6.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Mon, 2 May 2011, Randy Dunlap wrote:

> On Mon, 2 May 2011 15:01:50 +1000 Stephen Rothwell wrote:
> 
> > Hi all,
> > 
> > Changes since 20110429:
> 
> 
> building uml on i386 or x86_64 fails with:
> 
> linux-next-20110502/kernel/irq/generic-chip.c: In function 'irq_setup_generic_chip':
> linux-next-20110502/kernel/irq/generic-chip.c:232: error: implicit declaration of function 'readl'

Fix is on the way.
