From: Nitin Gupta <ngupta@vflare.org>
Subject: Re: linux-next: Tree for February 10 (zcache)
Date: Fri, 11 Feb 2011 02:35:26 +0530
Message-ID: <4D545316.2030809@vflare.org>
References: <20110210180525.54ec83e9.sfr@canb.auug.org.au> <20110210110037.39f4b7b3.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-vx0-f174.google.com ([209.85.220.174]:40851 "EHLO
	mail-vx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751296Ab1BJVEu (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 10 Feb 2011 16:04:50 -0500
In-Reply-To: <20110210110037.39f4b7b3.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@ORACLE.COM>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Dan Magenheimer <dan.magenheimer@ORACLE.COM>

On 02/11/2011 12:30 AM, Randy Dunlap wrote:
> On Thu, 10 Feb 2011 18:05:25 +1100 Stephen Rothwell wrote:
>
>> Hi all,
>>
>> [The kernel.org mirroring is being slow ...]
>>
>> Changes since 20110209:
>
>
> ZCACHE=m
> ZRAM is not enabled (since BLOCK is not enabled)
>
> ERROR: "xv_malloc" [drivers/staging/zcache/zcache.ko] undefined!
> ERROR: "tmem_put" [drivers/staging/zcache/zcache.ko] undefined!
> ERROR: "tmem_new_pool" [drivers/staging/zcache/zcache.ko] undefined!
> ERROR: "tmem_get" [drivers/staging/zcache/zcache.ko] undefined!
> ERROR: "tmem_flush_object" [drivers/staging/zcache/zcache.ko] undefined!
> ERROR: "tmem_destroy_pool" [drivers/staging/zcache/zcache.ko] undefined!
> ERROR: "xv_free" [drivers/staging/zcache/zcache.ko] undefined!
> ERROR: "xv_get_object_size" [drivers/staging/zcache/zcache.ko] undefined!
> ERROR: "tmem_flush_page" [drivers/staging/zcache/zcache.ko] undefined!
>
> Also, in zcache/Kconfig, there is:
> 	select XVMALLOC
> but that kconfig symbol does not exist.  What should that be?
>


Just posted fix for this:
https://lkml.org/lkml/2011/2/10/367

Thanks,
Nitin
