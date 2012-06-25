From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: error: implicit declarations of BUG/BUG_ON/WARN_ON/WARN_ON_ONCE
Date: Sun, 24 Jun 2012 21:39:50 -0700
Message-ID: <4FE7EB96.4050908@xenotime.net>
References: <20120615143303.3b88edcbc3efc7b1bf81839b@canb.auug.org.au> <20120615065231.GA12272@localhost> <4FDB6261.2030400@xenotime.net> <4FDF5D50.7030505@xenotime.net> <20120622071305.GA15102@localhost> <20120625025301.GB9317@linux-sh.org> <20120625042017.GA11705@localhost> <4FE7E7CA.2030706@xenotime.net> <20120625043836.GA11937@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy1-pub.bluehost.com ([66.147.249.253]:60970 "HELO
	oproxy1-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1750743Ab2FYEkT (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 25 Jun 2012 00:40:19 -0400
In-Reply-To: <20120625043836.GA11937@localhost>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Fengguang Wu <fengguang.wu@intel.com>
Cc: Paul Mundt <lethal@linux-sh.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>

On 06/24/2012 09:38 PM, Fengguang Wu wrote:

> On Sun, Jun 24, 2012 at 09:23:38PM -0700, Randy Dunlap wrote:
>> On 06/24/2012 09:20 PM, Fengguang Wu wrote:
>>
>>> Hi Paul,
>>>
>>> The patch builds fine, thank you!
>>>
>>> Tested-by: Fengguang Wu <wfg@linux.intel.com>
>>
>> Acked-by: Randy Dunlap <rdunlap@xenotime.net>
>>
>> You clearly have better build hardware than I do (a simple Core i5
>> laptop).  ;)
> 
> Thanks, and it's a surprise that you caught so many bugs with a laptop! ;)

Well, that "automation" stuff helps.  It runs overnight while I sleep,
then I report results during the day.


> Thanks,
> Fengguang
> 
>>>> I'm really starting to loathe this header. This should take care of it:
>>>>
>>>> ---


-- 
~Randy
