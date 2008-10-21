From: "Vegard Nossum" <vegard.nossum@gmail.com>
Subject: Re: linux-next: manual merge of the kmemcheck tree
Date: Tue, 21 Oct 2008 10:07:57 +0200
Message-ID: <19f34abd0810210107r59f182d1j8c8708c7489bbe4b@mail.gmail.com>
References: <20081021162942.00517398.sfr@canb.auug.org.au>
	 <20081021073201.GB333@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from wa-out-1112.google.com ([209.85.146.179]:59608 "EHLO
	wa-out-1112.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751634AbYJUIH6 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 21 Oct 2008 04:07:58 -0400
Received: by wa-out-1112.google.com with SMTP id v27so1146234wah.21
        for <linux-next@vger.kernel.org>; Tue, 21 Oct 2008 01:07:57 -0700 (PDT)
In-Reply-To: <20081021073201.GB333@elte.hu>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Pekka Enberg <penberg@cs.helsinki.fi>, linux-next@vger.kernel.org

On Tue, Oct 21, 2008 at 9:32 AM, Ingo Molnar <mingo@elte.hu> wrote:
>
> * Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
>> Hi all,
>>
>> Today's linux-next merge of the kmemcheck tree got a conflict in
>> kernel/sysctl.c between commit af936a1606246a10c145feac3770f6287f483f02
>> ("vmscan: unevictable LRU scan sysctl") from Linus' tree and commit
>> 385e31b9eae0528bada07d16a189f3f40df23961 ("kmemcheck: add the kmemcheck
>> core") from the kmemcheck tree.
>>
>> Just overlapping additions (combined with a bad merge in the kmemcheck
>> tree).  I fixed it up (see below).
>
> thanks!
>
>> [Ingo: it looks like commit 05416cc42ac7072f39bcff036485e2b0fc1da3a9
>> ("Merge branch 'linus' into kmemcheck") in the kmemcheck tree merged
>> the "rcutorture_runnable" sysctl into the wrong table.]
>
> hm, good spotting! Vegard, will you apply it to your tree? If kmemcheck
> does not make it in in this cycle then maybe it's best to rebase it
> shortly after -rc1 is released, to get rid of uglies like that?

I will apply it and send a pull request. Thanks :-)

You want to rebase all of kmemcheck on top of -rc1? Sure, we can do
it. There's been a lot of back-and-forth with the set_memory_4k()/PSE
stuff as well, I imagine the patch-set wouldn't look very nice to
somebody trying to follow the history. But isn't rebasing very evil?


Vegard

-- 
"The animistic metaphor of the bug that maliciously sneaked in while
the programmer was not looking is intellectually dishonest as it
disguises that the error is the programmer's own creation."
	-- E. W. Dijkstra, EWD1036
