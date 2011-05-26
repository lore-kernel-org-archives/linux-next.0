From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build warning in Linus' tree
Date: Thu, 26 May 2011 00:15:06 -0700
Message-ID: <20110526071506.GH29833@kroah.com>
References: <20110525103740.f8917fd8.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out3.smtp.messagingengine.com ([66.111.4.27]:33870 "EHLO
	out3.smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751779Ab1EZHOv (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 26 May 2011 03:14:51 -0400
Content-Disposition: inline
In-Reply-To: <20110525103740.f8917fd8.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Antony Pavlov <antony@niisi.msk.ru>

On Wed, May 25, 2011 at 10:37:40AM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> In Linus' tree, today's linux-next build (powerpc ppc64_defconfig)
> produced this warning:
> 
> drivers/tty/serial/8250_pci.c:1457: warning: initialization from incompatible pointer type
> 
> Introduced by commit d9a0fbfd7bc5 ("serial: 8250_pci: add support for
> Cronyx Omega PCI multiserial board").
> 
> Sorry that I didn't notice this earlier.

Thanks, I'll work on this.

greg k-h
