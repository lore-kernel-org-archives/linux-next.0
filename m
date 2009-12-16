From: Sachin Sant <sachinp@in.ibm.com>
Subject: Re: [Next] CPU Hotplug test failures on powerpc
Date: Wed, 16 Dec 2009 12:24:11 +0530
Message-ID: <4B288413.2070704@in.ibm.com>
References: <4B2224C7.1020908@in.ibm.com> <7b6bb4a50912152225p4f5dde13re83c439407c16eaf@mail.gmail.com> <4B288131.2050306@in.ibm.com> <7b6bb4a50912152245v61a7f1ebgb41f4857134f3476@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e28smtp05.in.ibm.com ([122.248.162.5]:36990 "EHLO
	e28smtp05.in.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932550AbZLPGyP (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 16 Dec 2009 01:54:15 -0500
In-Reply-To: <7b6bb4a50912152245v61a7f1ebgb41f4857134f3476@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Xiaotian Feng <xtfeng@gmail.com>
Cc: Linux/PPC Development <linuxppc-dev@ozlabs.org>, linux-kernel <linux-kernel@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@elte.hu>, linux-next@vger.kernel.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>

Xiaotian Feng wrote:
> On Wed, Dec 16, 2009 at 2:41 PM, Sachin Sant <sachinp@in.ibm.com> wrote:
>   
>> Xiaotian Feng wrote:
>>     
>>> Does this testcase hotplug cpu 0 off?
>>>
>>>       
>> No, i don't think so. It skips cpu0 during online/offline
>> process.
>>     
>
> Then how could this happen ? Looks like cpu 0 is offline ....
> 0:mon> <4>IRQ 17 affinity broken off cpu 0
> <4>IRQ 18 affinity broken off cpu 0
> <4>IRQ 19 affinity broken off cpu 0
> <4>IRQ 264 affinity broken off cpu 0
> <4>cpu 0 (hwid 0) Ready to die...
> <7>clockevent: decrementer mult[83126e97] shift[32] cpu[0]
>   
Sorry i was looking at only one script. Looking more closely
at the test there are 6 different sub tests. The rest of the
tests do seem to hotplug CPU 0.

Thanks
-Sachin


-- 

---------------------------------
Sachin Sant
IBM Linux Technology Center
India Systems and Technology Labs
Bangalore, India
---------------------------------
