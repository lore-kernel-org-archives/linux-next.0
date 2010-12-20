From: Samuel Ortiz <sameo@linux.intel.com>
Subject: Re: linux-next: build warnings after merge of the mfd tree
Date: Mon, 20 Dec 2010 11:31:43 +0100
Message-ID: <20101220103142.GB11095@sortiz-mobl>
References: <20101220152505.f9974119.sfr@canb.auug.org.au>
 <20101219202745.c733f7f8.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:60123 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752403Ab0LTKbp (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 20 Dec 2010 05:31:45 -0500
Content-Disposition: inline
In-Reply-To: <20101219202745.c733f7f8.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andres Salomon <dilinger@queued.net>

On Sun, Dec 19, 2010 at 08:27:45PM -0800, Randy Dunlap wrote:
> On Mon, 20 Dec 2010 15:25:05 +1100 Stephen Rothwell wrote:
> 
> > Hi Samuel,
> > 
> > After merging the mfd tree, today's linux-next build (x86_64 allmodconfig)
> > produced these warnings:
> > 
> > drivers/gpio/cs5535-gpio.c: In function 'cs5535_gpio_probe':
> > drivers/gpio/cs5535-gpio.c:269: warning: format '%x' expects type 'unsigned int', but argument 3 has type 'resource_size_t'
> > drivers/gpio/cs5535-gpio.c:269: warning: format '%x' expects type 'unsigned int', but argument 4 has type 'resource_size_t'
> > drivers/misc/cs5535-mfgpt.c: In function 'cs5535_mfgpt_probe':
> > drivers/misc/cs5535-mfgpt.c:320: warning: format '%x' expects type 'unsigned int', but argument 3 has type 'resource_size_t'
> > drivers/misc/cs5535-mfgpt.c:320: warning: format '%x' expects type 'unsigned int', but argument 4 has type 'resource_size_t'
> > 
> > Introduced by commits d8fefd6ff3a8444ab34f6eb6c7c1961f0ca0008a ("gpio:
> > Convert cs5535 from pci device to platform device") and
> > 6a85d28cfca9663c0db297a04ca43777dc5bcaa6 ("misc: Convert cs5535-mfgpt
> > from pci device to platform device").  We have %pR for printing
> > resources ...
> 
> Yes, and Joe Perches has posted a patch for that.
I never received that one. I found it on patchwork, and applied it now.
Stephen, this is fixed.

Cheers,
Samuel.

-- 
Intel Open Source Technology Centre
http://oss.intel.com/
