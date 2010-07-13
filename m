From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for July 13 (sound/oss/msnd_pinnacle)
Date: Tue, 13 Jul 2010 10:36:23 -0700
Message-ID: <20100713103623.bfb0d9b8.randy.dunlap@oracle.com>
References: <20100713144007.55d3abc9.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:47165 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752001Ab0GMRg7 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 13 Jul 2010 13:36:59 -0400
In-Reply-To: <20100713144007.55d3abc9.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Takashi Iwai <tiwai@suse.de>, Jaroslav Kysela <perex@perex.cz>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Tue, 13 Jul 2010 14:40:07 +1000 Stephen Rothwell wrote:

> Hi all,
> 
> Not unexpectedly, we got some conflicts with the arm defconfig files
> today ...


sound/oss/msnd_pinnacle.c:644:error: 'inode' undeclared (first use in this function)


---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
