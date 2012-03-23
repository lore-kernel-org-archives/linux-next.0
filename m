From: Hans-Christian Egtvedt <egtvedt@samfundet.no>
Subject: Re: [PATCH] avr32: fix build failures from mis-naming of
 atmel_nand.h
Date: Fri, 23 Mar 2012 08:38:50 +0100
Message-ID: <20120323073850.GB31010@samfundet.no>
References: <1332296128-16262-1-git-send-email-paul.gortmaker@windriver.com>
 <20120321072632.GA15703@samfundet.no>
 <4F6990AF.2000004@atmel.com>
 <20120322051840.GC923@windriver.com>
 <20120322123327.GA14690@samfundet.no>
 <4F6B316F.5080307@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cassarossa.samfundet.no ([129.241.93.19]:37556 "EHLO
	cassarossa.samfundet.no" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755604Ab2CWHjF (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 23 Mar 2012 03:39:05 -0400
Content-Disposition: inline
In-Reply-To: <4F6B316F.5080307@atmel.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Nicolas Ferre <nicolas.ferre@atmel.com>
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, linux@maxim.org.za, David Woodhouse <dwmw2@infradead.org>

Around Thu 22 Mar 2012 15:04:31 +0100 or thereabout, Nicolas Ferre wrote:
> On 03/22/2012 01:33 PM, Hans-Christian Egtvedt :
>> Around Thu 22 Mar 2012 01:18:40 -0400 or thereabout, Paul Gortmaker wrote:

<snipp Atmel NAND cleanup>

>>>> Yes, we need to fix this. But I would not like to see this
>>>> "platform_data/atmel.h" renamed: I think that this file was designed to
>>>> collect several common platform data (ie: not just NAND related).
>>>>
>>>> So maybe we should just rename the entry that exists in
>>>> mach-at32ap/include/mach/board.h
>>>> and remove all occurrences of platform_data/atmel_nand.h
>>>
>>> Funny, since this is what I did 1st before I re-read the original commit
>>> log in more detail. :)  Oh well.  Here is the alternate solution.  You
>>> guys can pick whichever one you like best.  I compile tested this one
>>> as well.
>> 
>> I'll leave it to Nicolas to sign-off on this, but the changes look fine for
>> me.
> 
> Ok, which way do you want to follow for inclusion in mainline? I take it
> through arm-soc?

I have not gotten my key signed by any kernel developers yet, so typically
I've asked people to take it through Andrew's tree.

<snipp>

-- 
HcE
