From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the kmemcheck tree
Date: Wed, 13 Aug 2008 09:58:08 +0200
Message-ID: <20080813075808.GA11645@elte.hu>
References: <20080813152907.b76a06e3.sfr@canb.auug.org.au> <20080813073205.GA398@elte.hu> <48A28DD9.7010108@cs.helsinki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:44836 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750980AbYHMH6a (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 13 Aug 2008 03:58:30 -0400
Content-Disposition: inline
In-Reply-To: <48A28DD9.7010108@cs.helsinki.fi>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Pekka Enberg <penberg@cs.helsinki.fi>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Vegard Nossum <vegard.nossum@gmail.com>, linux-next@vger.kernel.org, Eduard - Gabriel Munteanu <eduard.munteanu@linux360.ro>, Christoph Lameter <cl@linux-foundation.org>


* Pekka Enberg <penberg@cs.helsinki.fi> wrote:

> Ingo Molnar wrote:
>> * Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>>> Hi all,
>>>
>>> Today's linux-next merge of the kmemcheck tree got a conflict in
>>> mm/slab.c between commit fccd5095804ffc190cb2371c319cb4f5b2c0ee14
>>> ("kmemtrace: SLAB hooks") from the slab tree and commit
>>> 30532cb3c49a2a9fed94127aab26003c52398a51 ("slab: add hooks for
>>> kmemcheck") from the kmemcheck tree.
>>>
>>> Simply overlapping additions of includes.
>>
>> thanks Stephen! I suspect these resolutions will live in linux-next for 
>> the next 2 months, as that's the soonest there will be a natural merge  
>> between slab.git and tip/kmemcheck.
>
> Oh, I was just asking Stephen what to do with those. If the 
> resolutions can be in linux-next, I'm fine with that.

yep, that's the best i think. I dont think we want to couple the two 
trees.

If it ever becomes hard we could start tracking your slab.git in -tip 
and auto-merge it all into auto-kmemcheck-next and make sure kmemcheck 
branch is merged in linux-next after slab.git is merged, and thus 
offload the conflict resolutions from Stephen to the people who actually 
generate the conflicts :-) (This would be doable and pretty painless as 
long as slab.git is purely append-only and not rebased.)

	Ingo
