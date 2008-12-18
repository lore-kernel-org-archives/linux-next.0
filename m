From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for December 18 (irq.h documentation)
Date: Thu, 18 Dec 2008 15:57:09 -0800
Message-ID: <20081218155709.bf435d8c.randy.dunlap@oracle.com>
References: <20081218230637.c879a046.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet12.oracle.com ([148.87.113.124]:56386 "EHLO
	rgminet12.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750894AbYLRX5i (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 18 Dec 2008 18:57:38 -0500
In-Reply-To: <20081218230637.c879a046.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Yinghai Lu <yinghai@kernel.org>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@elte.hu>

Hi YH,

Whenever you update a struct in a header file that uses kernel-doc,
like struct irq_desc in include/linux/irq.h, please also update the
corresponding kernel-doc notation for the new struct members, so
that kernel-doc warnings are not caused:

from linux-next-20081218:

Warning(linux-next-20081218//include/linux/irq.h:192): No description found for parameter 'timer_rand_state'
Warning(linux-next-20081218//include/linux/irq.h:192): No description found for parameter 'kstat_irqs'
Warning(linux-next-20081218//include/linux/irq.h:192): No description found for parameter 'irq_2_iommu'


Please add kernel-doc notation for those missing struct members.

Thanks,
---
~Randy
