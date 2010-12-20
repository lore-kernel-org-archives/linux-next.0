From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: build warnings after merge of the mfd tree
Date: Sun, 19 Dec 2010 20:27:45 -0800
Message-ID: <20101219202745.c733f7f8.randy.dunlap@oracle.com>
References: <20101220152505.f9974119.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:25894 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752650Ab0LTE3I (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 19 Dec 2010 23:29:08 -0500
In-Reply-To: <20101220152505.f9974119.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Samuel Ortiz <sameo@linux.intel.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andres Salomon <dilinger@queued.net>

On Mon, 20 Dec 2010 15:25:05 +1100 Stephen Rothwell wrote:

> Hi Samuel,
> 
> After merging the mfd tree, today's linux-next build (x86_64 allmodconfig)
> produced these warnings:
> 
> drivers/gpio/cs5535-gpio.c: In function 'cs5535_gpio_probe':
> drivers/gpio/cs5535-gpio.c:269: warning: format '%x' expects type 'unsigned int', but argument 3 has type 'resource_size_t'
> drivers/gpio/cs5535-gpio.c:269: warning: format '%x' expects type 'unsigned int', but argument 4 has type 'resource_size_t'
> drivers/misc/cs5535-mfgpt.c: In function 'cs5535_mfgpt_probe':
> drivers/misc/cs5535-mfgpt.c:320: warning: format '%x' expects type 'unsigned int', but argument 3 has type 'resource_size_t'
> drivers/misc/cs5535-mfgpt.c:320: warning: format '%x' expects type 'unsigned int', but argument 4 has type 'resource_size_t'
> 
> Introduced by commits d8fefd6ff3a8444ab34f6eb6c7c1961f0ca0008a ("gpio:
> Convert cs5535 from pci device to platform device") and
> 6a85d28cfca9663c0db297a04ca43777dc5bcaa6 ("misc: Convert cs5535-mfgpt
> from pci device to platform device").  We have %pR for printing
> resources ...

Yes, and Joe Perches has posted a patch for that.
It just needs to be merged....

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
desserts:  http://www.xenotime.net/linux/recipes/
