From: Jeff Garzik <jgarzik@pobox.com>
Subject: Re: [PATCH -next] 3c515: fix using pnp_get_resource when CONFIG_ISAPNP=n
Date: Thu, 22 May 2008 07:09:42 -0400
Message-ID: <48355476.2070006@pobox.com>
References: <20080516103524.0b00ffb6.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from srv5.dvmed.net ([207.36.208.214]:48283 "EHLO mail.dvmed.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1762291AbYEVLJo (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 22 May 2008 07:09:44 -0400
In-Reply-To: <20080516103524.0b00ffb6.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: netdev <netdev@vger.kernel.org>, linux-next@vger.kernel.org, bjorn.helgaas@hp.com, akpm <akpm@linux-foundation.org>

Randy Dunlap wrote:
> From: Randy Dunlap <randy.dunlap@oracle.com>
> 
> 3c515.c uses pnp_irq(), which calls pnp_get_resource(),
> which is not defined when CONFIG_PNP=n, so in that case,
> get the IRQ from a hardware register.
> 
> 3c515.c:(.text+0x3adc0): undefined reference to `pnp_get_resource'
> 
> Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
> ---
>  drivers/net/3c515.c |    4 ++++

applied


