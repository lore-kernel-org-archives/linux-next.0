From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: [PATCH -next] pktcdvd: improve BKL and compat_ioctl.c usage
Date: Thu, 25 Feb 2010 14:10:44 -0800
Message-ID: <4B86F564.9000105@oracle.com>
References: <20100225183523.80361261.sfr@canb.auug.org.au> <4B86B97D.6030208@oracle.com> <201002252227.11472.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from acsinet12.oracle.com ([141.146.126.234]:39164 "EHLO
	acsinet12.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934167Ab0BYWLv (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 25 Feb 2010 17:11:51 -0500
In-Reply-To: <201002252227.11472.arnd@arndb.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, Peter Osterlund <petero2@telia.com>, Jens Axboe <jens.axboe@oracle.com>, Akinobu Mita <akinobu.mita@gmail.com>

On 02/25/10 13:27, Arnd Bergmann wrote:
> The pktcdvd driver uses proper locking and does not need the
> BKL in the ioctl and llseek functions of the character device,
> so kill both. Moving the compat_ioctl handling from common code
> into the driver itself fixes build problems when CONFIG_BLOCK is
> disabled.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> 
> ---
> On Thursday 25 February 2010, Randy Dunlap wrote:
>> From: Randy Dunlap <randy.dunlap@oracle.com>
>>
>> fs/compat_ioctl.c should omit pktcdvd.h and its ioctl when CONFIG_BLOCK
>> is not enabled.  This fixes these build errors:
>>
>> In file included from fs/compat_ioctl.c:105:
>> include/linux/pktcdvd.h:166: error: field 'read_queue' has incomplete type
>> include/linux/pktcdvd.h:167: error: field 'write_queue' has incomplete type
>> include/linux/pktcdvd.h:207: error: field 'orig_bios' has incomplete type
>> make[2]: *** [fs/compat_ioctl.o] Error 1
> 
> How about this one instead, cleaning pktcdvd ioctl handling up for good?

OK, that works too.

Acked-by: Randy Dunlap <randy.dunlap@oracle.com>


thanks,
-- 
~Randy
