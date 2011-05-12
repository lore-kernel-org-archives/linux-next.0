From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for May 12 (ssb)
Date: Thu, 12 May 2011 16:19:14 -0700
Message-ID: <20110512161914.e16be4d3.randy.dunlap@oracle.com>
References: <20110512142303.8117a0b6.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:25112 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757737Ab1ELXTs (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 12 May 2011 19:19:48 -0400
In-Reply-To: <20110512142303.8117a0b6.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-wireless@vger.kernel.org
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Michael Buesch <mb@bu3sch.de>

On Thu, 12 May 2011 14:23:03 +1000 Stephen Rothwell wrote:

> Hi all,
> 
> Changes since 20110511:


on i386 and x86_64 (many randconfigs fail with these errors):

drivers/ssb/main.c:1336: error: 'SSB_PCICORE_BCAST_ADDR' undeclared (first use in this function)
drivers/ssb/main.c:1337: error: 'SSB_PCICORE_BCAST_DATA' undeclared (first use in this function)
drivers/ssb/main.c:1349: error: 'struct ssb_pcicore' has no member named 'dev'

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
