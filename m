From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for October 8 (staging/intel_sst)
Date: Sun, 10 Oct 2010 11:56:18 -0700
Message-ID: <20101010115618.b048a89e.randy.dunlap@oracle.com>
References: <20101008161552.07c9f137.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:62321 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751262Ab0JJS63 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 10 Oct 2010 14:58:29 -0400
In-Reply-To: <20101008161552.07c9f137.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, driverdevel <devel@driverdev.osuosl.org>, gregkh <greg@kroah.com>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Vinod Koul <vinod.koul@intel.com>, Harsha Priya <priya.harsha@intel.com>, Dharageswari R <dharageswari.r@intel.com>

On Fri, 8 Oct 2010 16:15:52 +1100 Stephen Rothwell wrote:

> Hi all,
> 
> Changes since 20101007:


drivers/staging/intel_sst/intel_sst_drv_interface.c:88: error: implicit declaration of function 'msleep'

needs
#include <linux/delay.h>


---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
