From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for October 21 (xen)
Date: Thu, 21 Oct 2010 09:13:16 -0700
Message-ID: <20101021091316.0587c1a8.randy.dunlap@oracle.com>
References: <20101021151529.392fecea.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:49290 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751469Ab0JUQNb (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 21 Oct 2010 12:13:31 -0400
In-Reply-To: <20101021151529.392fecea.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, xen-devel@lists.xensource.com, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Thu, 21 Oct 2010 15:15:29 +1100 Stephen Rothwell wrote:

> Hi all,
> 
> Reminder: do not add 2.6.38 destined stuff to linux-next until after
> 2.6.37-rc1 is released.
> 
> Changes since 20101020:


When CONFIG_SMP is not enabled:

arch/x86/pci/xen.c:401: error: 'nr_ioapics' undeclared (first use in this function)

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
