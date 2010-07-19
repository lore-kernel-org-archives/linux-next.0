From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for July 9 (serial/max3107)
Date: Mon, 19 Jul 2010 09:16:04 -0700
Message-ID: <20100719091604.c513b2d5.randy.dunlap@oracle.com>
References: <20100709150117.51612026.sfr@canb.auug.org.au>
	<20100711152723.a8a3ad74.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:18235 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S936364Ab0GSQST (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 19 Jul 2010 12:18:19 -0400
In-Reply-To: <20100711152723.a8a3ad74.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>, devel@driverdev.osuosl.org
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, gregkh@suse.de, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Sun, 11 Jul 2010 15:27:23 -0700 Randy Dunlap wrote:

> On Fri, 9 Jul 2010 15:01:17 +1000 Stephen Rothwell wrote:
> 
> > Hi all,
> > 
> > Changes since 20100708:
> > 
> > The infiniband tree gained a build failure so I used the version from
> > next-20100708.
> > 
> > The wireless tree gained a conflict against the net tree.
> > 
> > The block tree gained a build failure for which I applied a patch.
> > 
> > The tty tree gained a conflict against the genesis tree.
> 
> 
> when CONFIG_GPIOLIB is not enabled:
> 
> drivers/serial/max3107.h:372: error: field 'chip' has incomplete type


This build still fails in linux-next 20100719.


---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
