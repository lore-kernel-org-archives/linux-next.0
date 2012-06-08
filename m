From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next: Tree for Jun 8 (comedi/das08.c)
Date: Fri, 08 Jun 2012 10:05:49 -0700
Message-ID: <4FD230ED.5030901@xenotime.net>
References: <20120608144358.a83215ceb8212c55d37d21d0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy5-pub.bluehost.com ([67.222.38.55]:45758 "HELO
	oproxy5-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1762120Ab2FHRGB (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 8 Jun 2012 13:06:01 -0400
In-Reply-To: <20120608144358.a83215ceb8212c55d37d21d0@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ian Abbott <abbotti@mev.co.uk>, Frank Mori Hess <fmhess@users.sourceforge.net>

On 06/07/2012 09:43 PM, Stephen Rothwell wrote:

> Hi all,
> 
> Changes since 20120607:



on i386, when CONFIG_PCI is not enabled:

drivers/staging/comedi/drivers/das08.c: In function 'das08_attach':
drivers/staging/comedi/drivers/das08.c:1084:3: error: implicit declaration of function 'das08_find_pci'
drivers/staging/comedi/drivers/das08.c:1084:8: warning: assignment makes pointer from integer without a cast
drivers/staging/comedi/drivers/das08.c:1087:3: error: implicit declaration of function 'das08_pci_attach_common'

-- 
~Randy
