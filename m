From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: [PATCH -next] input: serio_libps2 depends on serio_i8042
Date: Fri, 25 Sep 2009 15:30:51 -0700
Message-ID: <4ABD449B.2030200@oracle.com>
References: <20090925133830.1ba29584.sfr@canb.auug.org.au> <4ABD4219.5000608@oracle.com> <20090925222901.GC8618@core.coreip.homeip.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet12.oracle.com ([148.87.113.124]:21436 "EHLO
	rgminet12.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751803AbZIYWaP (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 25 Sep 2009 18:30:15 -0400
In-Reply-To: <20090925222901.GC8618@core.coreip.homeip.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Randy Dunlap <randy.dunlap@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, akpm <akpm@linux-foundation.org>

Dmitry Torokhov wrote:
> On Fri, Sep 25, 2009 at 03:20:09PM -0700, Randy Dunlap wrote:
>> From: Randy Dunlap <randy.dunlap@oracle.com>
>>
>> SERIO_LIBPS2 code uses SERIO_I8042 code, so the former
>> needs to depend on the latter.
>>
> 
> Umm, it should be useable without i8042... But I guess you have
> SERIO_LIBPS2=y but SERIO_I8042=m?

That's correct.

>> (.text+0x1f33ca): undefined reference to `i8042_check_port_owner'
>> (.text+0x1f33de): undefined reference to `i8042_unlock_chip'
>> (.text+0x1f3435): undefined reference to `i8042_check_port_owner'
>> (.text+0x1f3449): undefined reference to `i8042_lock_chip
>>
>> Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
>> ---
>>  drivers/input/serio/Kconfig |    1 +
>>  1 file changed, 1 insertion(+)
>>
>> --- linux-next-20090925.orig/drivers/input/serio/Kconfig
>> +++ linux-next-20090925/drivers/input/serio/Kconfig
>> @@ -168,6 +168,7 @@ config SERIO_MACEPS2
>>  
>>  config SERIO_LIBPS2
>>  	tristate "PS/2 driver library" if EMBEDDED
>> +	depends on SERIO_I8042
>>  	help
>>  	  Say Y here if you are using a driver for device connected
>>  	  to a PS/2 port, such as PS/2 mouse or standard AT keyboard.
> 
