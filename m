From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: linux-next: Tree for July 9 (serial/max3107)
Date: Mon, 19 Jul 2010 17:31:13 +0100
Message-ID: <20100719173113.4cce1a03@lxorguk.ukuu.org.uk>
References: <20100709150117.51612026.sfr@canb.auug.org.au>
	<20100711152723.a8a3ad74.randy.dunlap@oracle.com>
	<20100719091604.c513b2d5.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from earthlight.etchedpixels.co.uk ([81.2.110.250]:39523 "EHLO
	www.etchedpixels.co.uk" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S936320Ab0GSQVj (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 19 Jul 2010 12:21:39 -0400
In-Reply-To: <20100719091604.c513b2d5.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: devel@driverdev.osuosl.org, Stephen Rothwell <sfr@canb.auug.org.au>, gregkh@suse.de, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

> > when CONFIG_GPIOLIB is not enabled:
> > 
> > drivers/serial/max3107.h:372: error: field 'chip' has incomplete type
> 
> 
> This build still fails in linux-next 20100719.

I'll put next tonight and have a detailed look at this one.

Alan
