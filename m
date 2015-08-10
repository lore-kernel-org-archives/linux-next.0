From: Boaz Harrosh <ooo@electrozaur.com>
Subject: Re: linux-next: error when fetching the osd tree
Date: Mon, 10 Aug 2015 11:23:12 +0300
Message-ID: <55C85F70.9080406@electrozaur.com>
References: <20150807090104.0d54f11f@canb.auug.org.au> <1438910647.2322.4.camel@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wi0-f180.google.com ([209.85.212.180]:36081 "EHLO
	mail-wi0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753093AbbHJIXP (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 10 Aug 2015 04:23:15 -0400
In-Reply-To: <1438910647.2322.4.camel@perches.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Joe Perches <joe@perches.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On 08/07/2015 04:24 AM, Joe Perches wrote:
> On Fri, 2015-08-07 at 09:01 +1000, Stephen Rothwell wrote:
>> Hi Boaz,
>>
>> Fetching the osd tree
>> (git://git.open-osd.org/linux-open-osd.git#linux-next) for the past few
>> days has produced this error:
>>
>> connection reset by peer
> 
> And mail sent to osd-dev@open-osd.org gets:
> 
> Technical details of temporary failure: 
> The recipient server did not accept our requests to connect. Learn more
> at https://support.google.com/mail/answer/7720 
> [(0) cyclone.open-osd.org. [209.166.131.141]:25: socket error]
> 
> 
> 

Sorry for the delay Stephen. I only now seen this email so
am responding ASAP.

I will try and see what is going on.

Perhaps it is time to change servers after all. But I will only
be able to do this after plumbers.

Yes it looks like the server is dead. It does ping but i'm unable
to ssh into it.

Please disable this next tree for now, and I will organize a new
server after plumbers week.

Thanks
Boaz
