From: "Vegard Nossum" <vegard.nossum@gmail.com>
Subject: Re: linux-next: manual merge of the kmemcheck tree
Date: Mon, 28 Jul 2008 11:17:31 +0200
Message-ID: <19f34abd0807280217n2c059cfkaeb194fed3f72ba9@mail.gmail.com>
References: <20080728140111.832c3bc8.sfr@canb.auug.org.au>
	 <20080728090530.GA5732@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from py-out-1112.google.com ([64.233.166.180]:33904 "EHLO
	py-out-1112.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750827AbYG1JRd (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 28 Jul 2008 05:17:33 -0400
Received: by py-out-1112.google.com with SMTP id p76so3226845pyb.10
        for <linux-next@vger.kernel.org>; Mon, 28 Jul 2008 02:17:32 -0700 (PDT)
In-Reply-To: <20080728090530.GA5732@elte.hu>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Pekka Enberg <penberg@cs.helsinki.fi>, linux-next@vger.kernel.org, Eduard - Gabriel Munteanu <eduard.munteanu@linux360.ro>

On Mon, Jul 28, 2008 at 11:05 AM, Ingo Molnar <mingo@elte.hu> wrote:
> * Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> Today's linux-next merge of the kmemcheck tree got a conflict in
>> init/main.c between commits c2147a5092cfe13dbf3210e54e8a622015edeecc
>> ("Better interface for hooking early initcalls") and
>> 7babe8db99d305340cf4828ce1f5a1481d5622ef ("Full conversion to
>> early_initcall() interface, remove old interface") from Linus' tree
>> and commit 385e31b9eae0528bada07d16a189f3f40df23961 ("kmemcheck: add
>> the kmemcheck core") from the kmemcheck tree.
>>
>> I used the upstream version and turned kmemcheck_init into an
>> early_initcall().
>
> thanks Stephen.
>
> I made this fixup too, yesterday, but solved it differently: i added
> kmemcheck_init() to before all early initcalls. I think that's the best
> solution for a fundamental debug feature like kmemcheck. (which could
> catch bugs in early initcalls as well) What do you think?
>
> i've pushed out a new auto-kmemcheck-next branch, so the conflicts
> should go away on your next iteration.

I'm sorry, I didn't have the chance to review your conflict resolutions yet.

But I think it's correct to use an early_initcall() -- we do catch
errors even before kmemcheck_init(); the only purpose of
kmemcheck_init is to prevent additional CPUs from going up. And that's
exactly the purpose of "early initcalls", to run just before
additional CPUs are upped. (Yeah, I did point out in review that
"presmp_initcall" would have been a better name than "early", at least
for our purposes, however, it seems that the idea was rejected.)

Perhaps kmemcheck_init() is a misnomer as well. We are functional
before that, too. If you are looking for a different init() function,
there isn't one :-) Just an option parser, param_kmemcheck().


Vegard

-- 
"The animistic metaphor of the bug that maliciously sneaked in while
the programmer was not looking is intellectually dishonest as it
disguises that the error is the programmer's own creation."
	-- E. W. Dijkstra, EWD1036
