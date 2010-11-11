From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for November 11 (unifdef)
Date: Thu, 11 Nov 2010 09:48:32 -0800
Message-ID: <20101111094832.827aaab3.randy.dunlap@oracle.com>
References: <20101111125655.15fa7188.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:27507 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754329Ab0KKRtH (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 11 Nov 2010 12:49:07 -0500
In-Reply-To: <20101111125655.15fa7188.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Tony Finch <dot@dotat.at>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Thu, 11 Nov 2010 12:56:55 +1100 Stephen Rothwell wrote:

> Hi all,
> 
> Changes since 20101110:


Hi Tony,
For the last week or so, linux-next tree has generated this warning:

unifdef: linux-next-20101111/X32/usr/include/xen/privcmd.h.tmp: 79: Premature EOF (#if line 33 depth 1)

linux/include/xen/privcmd.h contains:

#ifndef __user
#define __user
#endif

and linux/X32/usr/include/xen/privcmd.h contains:

#ifndef #define #endif

!!


Is this a problem with privcmd.h or unifdef or ???

thanks,
---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
