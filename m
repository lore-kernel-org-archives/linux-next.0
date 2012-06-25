From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: error: implicit declarations of BUG/BUG_ON/WARN_ON/WARN_ON_ONCE
Date: Sun, 24 Jun 2012 21:23:38 -0700
Message-ID: <4FE7E7CA.2030706@xenotime.net>
References: <20120615143303.3b88edcbc3efc7b1bf81839b@canb.auug.org.au> <20120615065231.GA12272@localhost> <4FDB6261.2030400@xenotime.net> <4FDF5D50.7030505@xenotime.net> <20120622071305.GA15102@localhost> <20120625025301.GB9317@linux-sh.org> <20120625042017.GA11705@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy6-pub.bluehost.com ([67.222.54.6]:51480 "HELO
	oproxy6-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1751530Ab2FYEYG (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 25 Jun 2012 00:24:06 -0400
In-Reply-To: <20120625042017.GA11705@localhost>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Fengguang Wu <fengguang.wu@intel.com>
Cc: Paul Mundt <lethal@linux-sh.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>

On 06/24/2012 09:20 PM, Fengguang Wu wrote:

> Hi Paul,
> 
> The patch builds fine, thank you!
> 
> Tested-by: Fengguang Wu <wfg@linux.intel.com>


You clearly have better build hardware than I do (a simple Core i5
laptop).  ;)

Acked-by: Randy Dunlap <rdunlap@xenotime.net>

Thanks.

> 
> Thanks,
> Fengguang
> 
>> I'm really starting to loathe this header. This should take care of it:
>>
>> ---
>>
>> diff --git a/include/asm-generic/bug.h b/include/asm-generic/bug.h
>> index 506ec19..7d10f96 100644
>> --- a/include/asm-generic/bug.h
>> +++ b/include/asm-generic/bug.h
>> @@ -3,10 +3,18 @@
>>  
>>  #include <linux/compiler.h>
>>  
>> +#ifdef CONFIG_GENERIC_BUG
>> +#define BUGFLAG_WARNING		(1 << 0)
>> +#define BUGFLAG_TAINT(taint)	(BUGFLAG_WARNING | ((taint) << 8))
>> +#define BUG_GET_TAINT(bug)	((bug)->flags >> 8)
>> +#endif
>> +
>> +#ifndef __ASSEMBLY__
>> +#include <linux/kernel.h>
>> +
>>  #ifdef CONFIG_BUG
>>  
>>  #ifdef CONFIG_GENERIC_BUG
>> -#ifndef __ASSEMBLY__
>>  struct bug_entry {
>>  #ifndef CONFIG_GENERIC_BUG_RELATIVE_POINTERS
>>  	unsigned long	bug_addr;
>> @@ -23,17 +31,8 @@ struct bug_entry {
>>  #endif
>>  	unsigned short	flags;
>>  };
>> -#endif		/* __ASSEMBLY__ */
>> -
>> -#define BUGFLAG_WARNING		(1 << 0)
>> -#define BUGFLAG_TAINT(taint)	(BUGFLAG_WARNING | ((taint) << 8))
>> -#define BUG_GET_TAINT(bug)	((bug)->flags >> 8)
>> -
>>  #endif	/* CONFIG_GENERIC_BUG */
>>  
>> -#ifndef __ASSEMBLY__
>> -#include <linux/kernel.h>
>> -
>>  /*
>>   * Don't use BUG() or BUG_ON() unless there's really no way out; one
>>   * example might be detecting data structure corruption in the middle



-- 
~Randy
