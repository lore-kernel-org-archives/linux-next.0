From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for January 19 (DST)
Date: Mon, 19 Jan 2009 10:47:46 -0800
Message-ID: <4974CAD2.8050500@oracle.com>
References: <20090119172732.e772d8ea.sfr@canb.auug.org.au> <4974C288.7030301@oracle.com> <20090119183046.GA28947@ioremap.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet11.oracle.com ([148.87.113.123]:17152 "EHLO
	rgminet11.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752869AbZASSsE (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 19 Jan 2009 13:48:04 -0500
In-Reply-To: <20090119183046.GA28947@ioremap.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Evgeniy Polyakov <zbr@ioremap.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Greg KH <gregkh@suse.de>

Evgeniy Polyakov wrote:
> Hi Randy.
> 
> On Mon, Jan 19, 2009 at 10:12:24AM -0800, Randy Dunlap (randy.dunlap@oracle.com) wrote:
>>> There will be no build results for today's linux-next as our build server
>>> has failed.
>>>
>>> Changes since 20090116:
>>
>> DST build fails when CONFIG_BLOCK=n:
> 
> DST should depend on block and block device, in the original patch its
> kconfig entry was in the BLK_DEV menu, so this dependency was satisfied
> automatically. Should attached patch be pushed into drivers/staging?

Yes, thanks.
Acked-by: Randy Dunlap <randy.dunlap@oracle.com>


> --- ./drivers/staging/dst/Kconfig~	2009-01-14 02:10:02.000000000 +0300
> +++ ./drivers/staging/dst/Kconfig	2009-01-19 21:31:19.000000000 +0300
> @@ -1,6 +1,6 @@
>  config DST
>  	tristate "Distributed storage"
> -	depends on NET && CRYPTO && SYSFS
> +	depends on NET && CRYPTO && SYSFS && BLK_DEV
>  	select CONNECTOR
>  	---help---
>  	DST is a network block device storage, which can be used to organize
> 


-- 
~Randy
