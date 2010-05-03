From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: [PATCH -next] staging: fix cxt1e1 module names
Date: Mon, 3 May 2010 11:06:57 -0700
Message-ID: <20100503110657.00b4e140.randy.dunlap@oracle.com>
References: <20100503151619.f75e3a80.sfr@canb.auug.org.au>
	<20100503100902.517c146f.randy.dunlap@oracle.com>
	<1272909764.30040.92.camel@Joe-Laptop.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:39268 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755712Ab0ECSLL (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 3 May 2010 14:11:11 -0400
In-Reply-To: <1272909764.30040.92.camel@Joe-Laptop.home>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Joe Perches <joe@perches.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, gregkh@suse.de, devel@driverdev.osuosl.org, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, support@sbei.com, support@onestopsystems.com

On Mon, 03 May 2010 11:02:44 -0700 Joe Perches wrote:

> On Mon, 2010-05-03 at 10:09 -0700, Randy Dunlap wrote:
> > From: Randy Dunlap <randy.dunlap@oracle.com>
> > 
> > Lots of cxt1e1 source code uses THIS_MODULE->name, which won't build
> > when CONFIG_MODULES is not enabled, so use KBUILD_MODNAME instead.
> 
> Perhaps a conversion to pr_<level> is better?

Sure, fine with me.  Thanks.

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
