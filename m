From: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH -next] pcmciamtd: fix printk format warnings
Date: Mon, 17 May 2010 19:55:28 +0100 (BST)
Message-ID: <alpine.LFD.2.00.1005171954080.8170@dwoodhou-mobl2.ger.corp.intel.com>
References: <20100517163521.649526d0.sfr@canb.auug.org.au> <20100517091632.59c2696c.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Return-path: <linux-next-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:56273 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753391Ab0EQSzu (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 17 May 2010 14:55:50 -0400
In-Reply-To: <20100517091632.59c2696c.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-mtd@lists.infradead.org, linux-pcmcia@lists.infradead.org

On Mon, 17 May 2010, Randy Dunlap wrote:

> From: Randy Dunlap <randy.dunlap@oracle.com>
>
> Fix printk format warnings in pcmciamtd debug code:
>
> drivers/mtd/maps/pcmciamtd.c:163: warning: format '%u' expects type 'unsigned int', but argument 5 has type 'ssize_t'
> drivers/mtd/maps/pcmciamtd.c:212: warning: format '%u' expects type 'unsigned int', but argument 5 has type 'ssize_t'
> drivers/mtd/maps/pcmciamtd.c:274: warning: format '%u' expects type 'unsigned int', but argument 5 has type 'ssize_t'
> drivers/mtd/maps/pcmciamtd.c:312: warning: format '%u' expects type 'unsigned int', but argument 5 has type 'ssize_t'

I pushed something identical to that earlier today, but thanks.


-- 
dwmw2
