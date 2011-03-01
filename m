From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for March 1 (staging/winbond)
Date: Tue, 1 Mar 2011 10:49:24 -0800
Message-ID: <20110301104924.071044ef.randy.dunlap@oracle.com>
References: <20110301181119.f1c7a9c3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:51127 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752175Ab1CASun (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 1 Mar 2011 13:50:43 -0500
In-Reply-To: <20110301181119.f1c7a9c3.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Pekka Enberg <penberg@kernel.org>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, gregkh@suse.de

On Tue, 1 Mar 2011 18:11:19 +1100 Stephen Rothwell wrote:

> Hi all,
> 
> Changes since 20110228:


commit ddee7e28e7d5e4ba2b8537c6a59b035745c250bb
Author: Pekka Enberg <penberg@kernel.org>
Date:   Sun Nov 28 23:00:01 2010 +0200
    Staging: w35und: Remove empty sysdef.h header


This header should not have been empty, since in

commit 412dc7f368bf10a8049a8a4c41abbfd0108742e7
Author: Randy Dunlap <randy.dunlap@oracle.com>
Date:   Fri Nov 19 09:30:18 2010 -0800
    staging: fix winbond build, needs delay.h

I added delay.h to it.  And now we have the same build
errors that I fixed last November:

drivers/staging/winbond/phy_calibration.c:986: error: implicit declaration of function 'msleep'
drivers/staging/winbond/phy_calibration.c:1555: error: implicit declaration of function 'udelay'
drivers/staging/winbond/reg.c:893: error: implicit declaration of function 'msleep'
drivers/staging/winbond/reg.c:1169: error: implicit declaration of function 'udelay'


---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
