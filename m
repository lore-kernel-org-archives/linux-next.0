From: Jens Axboe <axboe@kernel.dk>
Subject: Re: linux-next: failed to fetch block tree
Date: Mon, 11 Apr 2011 11:14:32 +0200
Message-ID: <4DA2C678.1050208@kernel.dk>
References: <20110407102602.f0ef8b5c.sfr@canb.auug.org.au>	<BANLkTinw7=WDF_UWHmDDEomgE6bvA-y2AA@mail.gmail.com> <20110407104040.daf2a613.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 0122700014.0.fullrate.dk ([95.166.99.235]:59978 "EHLO kernel.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752912Ab1DKJOb (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 11 Apr 2011 05:14:31 -0400
In-Reply-To: <20110407104040.daf2a613.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: sedat.dilek@gmail.com, Sedat Dilek <sedat.dilek@googlemail.com>, linux-next@vger.kernel.org

On 2011-04-07 02:40, Stephen Rothwell wrote:
> Hi Sedat,
> 
> On Thu, 7 Apr 2011 02:37:10 +0200 Sedat Dilek <sedat.dilek@googlemail.com> wrote:
>>
>> On Thu, Apr 7, 2011 at 2:26 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>>
>>> Trying to fetch the block tree yesterday and today produced this error:
>>>
>>> git.kernel.dk[0: 95.166.99.235]: errno=Connection timed out
>>>
>>> I am using the block tree from next-20110405.
>>
>> Clone-able here:
>> git://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-2.6-block.git
> 
> Yes, but that is not the tree Jens has asked me to fetch.

My DSL went down while I was away. In general, the kernel.org repo
should be identical to the kernel.dk one. It's pushed out when changes
happen. It may lag due to the kernel.org mirror latencies, but apart
from that it should be fine.

So at least in the future, using the above kernel.org url is fine as a
backup.

-- 
Jens Axboe
