From: ian <spyro@f2s.com>
Subject: Re: linux-next: mfd tree build failure
Date: Tue, 05 Aug 2008 16:39:54 +0100
Message-ID: <1217950794.18866.32.camel@wirenth>
References: <20080806000856.a5609577.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mk-outboundfilter-3.mail.uk.tiscali.com ([212.74.114.23]:2219
	"EHLO mk-outboundfilter-3.mail.uk.tiscali.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1757771AbYHEPj5 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 5 Aug 2008 11:39:57 -0400
In-Reply-To: <20080806000856.a5609577.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Samuel Ortiz <sameo@openedhand.com>, linux-next@vger.kernel.org, "David S. Miller" <davem@davemloft.net>

On Wed, 2008-08-06 at 00:08 +1000, Stephen Rothwell wrote:
> Hi Samuel,
> 
> Today's linux-next build (sparc allmodconfig) failed like this:
> 
> drivers/mfd/t7l66xb.c:167: error: implicit declaration of function
> `get_irq_data'

Hi.

I'd have expected the other TMIO drivers to fail too.

get_irq_data is defined in linux/irq.h only if 

CONFIG_GENERIC_HARDIRQs is set and you arent on S390 (so why doesnt S390
fail?)

I dont see this as a big problem. As far as Im concerned, all the TMIO
drivers can depend on CONFIG_ARM.

It may not be a bad idea to add CONFIG_MFD_TMIO_SUBDEVICE so that TMIO
sub device drivers can only be selected when TMIO cores are selected.
This would neatly fix the earlier problem, rather than making al lthe
subdevices CONFIG_ARM.
