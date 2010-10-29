From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for October 29 (staging/ath6kl)
Date: Fri, 29 Oct 2010 16:16:10 -0700
Message-ID: <20101029161610.99e6f4ef.randy.dunlap@oracle.com>
References: <20101029121148.d27e03bc.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:52210 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750801Ab0J2XQZ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 29 Oct 2010 19:16:25 -0400
In-Reply-To: <20101029121148.d27e03bc.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, driverdevel <devel@driverdev.osuosl.org>, gregkh@suse.de
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Fri, 29 Oct 2010 12:11:48 +1100 Stephen Rothwell wrote:

> Hi all,


drivers/staging/ath6kl/hif/sdio/linux_sdio/src/hif_scatter.c:288: error: 'struct mmc_host' has no member named 'max_hw_segs'
drivers/staging/ath6kl/hif/sdio/linux_sdio/src/hif_scatter.c:289: error: 'struct mmc_host' has no member named 'max_hw_segs'


---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
