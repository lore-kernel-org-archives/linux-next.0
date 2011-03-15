From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for March 15 (xen/events.c)
Date: Tue, 15 Mar 2011 08:44:29 -0700
Message-ID: <20110315084429.465cea61.randy.dunlap@oracle.com>
References: <20110315194543.a5d56c0c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:58072 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756429Ab1COPol (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 15 Mar 2011 11:44:41 -0400
In-Reply-To: <20110315194543.a5d56c0c.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Jeremy Fitzhardinge <jeremy.fitzhardinge@citrix.com>

On Tue, 15 Mar 2011 19:45:43 +1100 Stephen Rothwell wrote:

> Hi all,
> 
> Changes since 20110314:
> 
> Dropped tree: xen


Hm, maybe this is already fixed in the dropped tree?

linux-next-20110315/drivers/xen/events.c:396: error: 'struct irq_data' has no member named 'affinity'

when CONFIG_SMP is not enabled.

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
