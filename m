From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build failure after merge of the akpm tree
Date: Thu, 5 Jan 2012 15:19:58 -0800
Message-ID: <20120105231958.GA15643@kroah.com>
References: <20120105182937.58ec59c2fa2bc34e9e48542a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out5.smtp.messagingengine.com ([66.111.4.29]:45533 "EHLO
	out5.smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1758144Ab2AEXVs (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 5 Jan 2012 18:21:48 -0500
Received: from compute5.internal (compute5.nyi.mail.srv.osa [10.202.2.45])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id D11D020981
	for <linux-next@vger.kernel.org>; Thu,  5 Jan 2012 18:21:47 -0500 (EST)
Content-Disposition: inline
In-Reply-To: <20120105182937.58ec59c2fa2bc34e9e48542a@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Kay Sievers <kay.sievers@vrfy.org>, Michael Holzheu <holzheu@linux.vnet.ibm.com>

On Thu, Jan 05, 2012 at 06:29:37PM +1100, Stephen Rothwell wrote:
> Hi Andrew,
> 
> After merging the akpm tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> drivers/base/memory.c: In function 'memory_block_change_state':
> drivers/base/memory.c:306:22: error: 'struct memory_block' has no member named 'sysdev'
> drivers/base/memory.c:309:22: error: 'struct memory_block' has no member named 'sysdev'
> 
> Caused by commit 2691cc121386 ("kdump: add udev events for memory
> online/offline") interacting with commit 10fbcf4c6cb1 ("convert 'memory'
> sysdev_class to a regular subsystem") from the driver-core tree.

I can't recall this kdump patch coming through before, have I seen it?
creating new uevents is not something to be done lightly, has this been
tested with the existing userspace tools to make sure it doesn't cause
problems?

thanks,

greg k-h
