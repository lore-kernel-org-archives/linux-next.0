From: Rik van Riel <riel@redhat.com>
Subject: Re: mmotm 2014-04-24-13-07 uploaded
Date: Tue, 29 Apr 2014 13:31:07 -0400
Message-ID: <535FE1DB.2060601@redhat.com>
References: <535AC91A.1070504@infradead.org> <535ACB0E.4070600@infradead.org> <20140427062650.GW4496@linux.vnet.ibm.com> <20140428135540.GA14661@linux.vnet.ibm.com> <535E8D14.7080405@infradead.org> <535E8E17.2050600@nod.at> <20140428200640.GG4430@linux.vnet.ibm.com> <535EBAE6.3080907@infradead.org> <20140428211535.GK4430@linux.vnet.ibm.com> <535F95FC.1020909@redhat.com> <20140429163604.GH8754@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:63845 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S933921AbaD2Rbl (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 29 Apr 2014 13:31:41 -0400
In-Reply-To: <20140429163604.GH8754@linux.vnet.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: paulmck@linux.vnet.ibm.com
Cc: Randy Dunlap <rdunlap@infradead.org>, Richard Weinberger <richard@nod.at>, akpm@linux-foundation.org, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, umgwanakikbuti@gmail.com

On 04/29/2014 12:36 PM, Paul E. McKenney wrote:
> On Tue, Apr 29, 2014 at 08:07:24AM -0400, Rik van Riel wrote:
>> On 04/28/2014 05:15 PM, Paul E. McKenney wrote:
>>> On Mon, Apr 28, 2014 at 01:32:38PM -0700, Randy Dunlap wrote:
>>>> On 04/28/14 13:06, Paul E. McKenney wrote:
>>
>>>>> Please see below for a patch against next-20140428 that makes this build
>>>>> for me.  This is derived from Rik's patch, my patch, and is consistent with
>>>>> Arnd's patch.
>>>>>
>>>>> 							Thanx, Paul
>>>>
>>>> Thnx, works for me.  Finally.
>>>
>>> Good!
>>>
>>> Rik, how would you like to proceed with this?
>>
>> I guess this fix should go into -mm?
> 
> Andrew dropped the original patch, so a consolidated patch is needed.
> I believe that something like the following is what we ended up with.
> Does this look right to you?

That looks exactly like the one I have here :)

Andrew, should I send you the two patches?

-- 
All rights reversed
