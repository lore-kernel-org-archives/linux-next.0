From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for November 23 (sep_driver)
Date: Tue, 23 Nov 2010 16:18:19 -0800
Message-ID: <4CEC59CB.1010105@oracle.com>
References: <20101123140609.2b6503ff.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:39204 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754533Ab0KXAUS (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 23 Nov 2010 19:20:18 -0500
In-Reply-To: <20101123140609.2b6503ff.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Tue, 23 Nov 2010 14:06:09 +1100 Stephen Rothwell wrote:

> Hi all,
> 
> Changes since 20101122:


sep_driver build on x86_64 gets lots of printk format warnings.
There are 2 categories of these warnings.
(a) using %x for a size_t, when it should be %zx
(b) using %x for some _IOW() constant: no warning on i386, but
	x86_64 says:

drivers/staging/sep/sep_driver.c:3415: warning: format '%x' expects type 'unsigned int', but argument 4 has type 'long unsigned int'

where lines 3415-3416 are:

	dev_dbg(&sep->pdev->dev,
		"SEP_IOCPREPAREDCB is %x\n", SEP_IOCPREPAREDCB);

Changing that to:

	dev_dbg(&sep->pdev->dev,
		"SEP_IOCPREPAREDCB is %lx\n", (unsigned long)SEP_IOCPREPAREDCB);

obviously fixes the printk format warning, but is there a better solution?


thanks,
---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
