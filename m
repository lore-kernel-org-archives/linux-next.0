From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for January 6 (MTD)
Date: Fri, 09 Jan 2009 13:48:14 -0800
Message-ID: <4967C61E.9090807@oracle.com>
References: <20090106182311.525e4b14.sfr@canb.auug.org.au> <496386DB.8090606@oracle.com> <alpine.LFD.2.00.0901061632590.4300@casper.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet11.oracle.com ([148.87.113.123]:16799 "EHLO
	rgminet11.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753759AbZAIVtj (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 9 Jan 2009 16:49:39 -0500
In-Reply-To: <alpine.LFD.2.00.0901061632590.4300@casper.infradead.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexey Korolev <akorolev@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, David Woodhouse <dwmw2@infradead.org>, Vasiliy Leonenko <vasiliy.leonenko@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>

This commit was just merged:

Gitweb:     http://git.kernel.org/git/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commit;h=60f26520e7bd4479dbebf77317c45fc2255ba2e8
Commit:     60f26520e7bd4479dbebf77317c45fc2255ba2e8
Parent:     d81408304b06a71c28417445202af9cd6673168d
Author:     Alexey Korolev <akorolev@infradead.org>
AuthorDate: Tue Dec 16 18:24:14 2008 +0000
Committer:  David Woodhouse <David.Woodhouse@intel.com>
CommitDate: Mon Jan 5 13:58:47 2009 +0100

    [MTD] LPDDR Makefile and KConfig


but the patch below is missing/still needed.



Alexey Korolev wrote:
> Hi Randy,
> 
>> # CONFIG_MTD_LPDDR is not set
>> CONFIG_MTD_QINFO_PROBE=y
>>
>> There appears to be too little control/coordination between those
>> two kconfig symbols.  Surely one of them (MTD_QINFO_PROBE) should
>> depend on the other (MTD_LPDDR).  And why even build 2 modules
>> when MTD_QINFO_PROBE is enabled?  Why not combine the code into
>> one module?
> Thanks a lot for good finding. Here is a fix for the problem.
> 
> About combining: it is assumed to have one QINFO probing module for several
> kinds of LPDDR command set drivers. If we combine two modules into
> one it would make further extension rather hard. So it is better to have
> two modules.
> To fix a problem I just added dependency in Kconfig file.
> This temporary fix which will work until we have just one cmdset module.
> In near future we will make a fix which parse command set types
>  and select proper driver according to device type.
> 
> Thanks,
> Alexey
> 
> Signed-off-by: Alexey Korolev <akorolev@infradead.org>
> ---
> diff --git a/drivers/mtd/lpddr/Kconfig b/drivers/mtd/lpddr/Kconfig
> index acd4ea9..5a401d8 100644
> --- a/drivers/mtd/lpddr/Kconfig
> +++ b/drivers/mtd/lpddr/Kconfig
> @@ -12,6 +12,7 @@ config MTD_LPDDR
>  	  DDR memories, intended for battery-operated systems.
>  
>  config MTD_QINFO_PROBE
> +	depends on MTD_LPDDR
>  	tristate "Detect flash chips by QINFO probe"
>  	help
>  	    Device Information for LPDDR chips is offered through the Overlay
> 
> 


-- 
~Randy
