From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for March 3 (staging/tty/specialix)
Date: Thu, 3 Mar 2011 09:29:27 -0800
Message-ID: <20110303092927.c06dbbf0.randy.dunlap@oracle.com>
References: <20110303180158.ea30ef45.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:26728 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757104Ab1CCRaa (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 3 Mar 2011 12:30:30 -0500
In-Reply-To: <20110303180158.ea30ef45.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, gregkh <greg@kroah.com>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, driverdevel <devel@driverdev.osuosl.org>

On Thu, 3 Mar 2011 18:01:58 +1100 Stephen Rothwell wrote:

> Hi all,
> 
> Changes since 20110302:


#include "cd1865.h"
=>
linux-next-20110303/drivers/staging/tty/specialix.c:99:20: error: cd1865.h: No such file or directory

This leads to 100 or so errors.


---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
