From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for January 22 (staging/android)
Date: Thu, 22 Jan 2009 14:55:36 -0800
Message-ID: <4978F968.7010108@oracle.com>
References: <20090122180543.1ab0baa6.sfr@canb.auug.org.au> <4978A9D0.2050103@oracle.com> <20090122221849.GA30477@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet12.oracle.com ([148.87.113.124]:33942 "EHLO
	rgminet12.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752768AbZAVWz7 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 22 Jan 2009 17:55:59 -0500
In-Reply-To: <20090122221849.GA30477@suse.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <gregkh@suse.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

Greg KH wrote:
> On Thu, Jan 22, 2009 at 09:16:00AM -0800, Randy Dunlap wrote:
>> Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> Changes since 20090121:
>> drivers/staging/android/timed_gpio.c: In function 'gpio_enable_show':
>> drivers/staging/android/timed_gpio.c:52: error: 'ktime_t' has no member named 'tv'
>> drivers/staging/android/timed_gpio.c:52: error: 'ktime_t' has no member named 'tv'
> 
> Is this due to a change in -next?  I see 'tv' as a valid field in
> kime_t in Linus's tree.
> 
> confused,
> 
> greg k-h


'tv' is a union name, not a field name, right?


http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=blob;f=include/linux/ktime.h;h=ce5983225be4e6430cadbff9cc5cbf448a66e647;hb=HEAD :


 46 union ktime {
47         s64     tv64;
48 #if BITS_PER_LONG != 64 && !defined(CONFIG_KTIME_SCALAR)
49         struct {
50 # ifdef __BIG_ENDIAN
51         s32     sec, nsec;
52 # else
53         s32     nsec, sec;
54 # endif
55         } tv;
56 #endif
57 };
58
59 typedef union ktime ktime_t;            /* Kill this */
