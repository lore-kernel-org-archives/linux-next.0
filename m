From: Pekka Enberg <penberg@cs.helsinki.fi>
Subject: Re: linux-next: manual merge of the kmemcheck tree
Date: Wed, 13 Aug 2008 10:31:37 +0300
Message-ID: <48A28DD9.7010108@cs.helsinki.fi>
References: <20080813152907.b76a06e3.sfr@canb.auug.org.au> <20080813073205.GA398@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from courier.cs.helsinki.fi ([128.214.9.1]:37028 "EHLO
	mail.cs.helsinki.fi" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752026AbYHMHfJ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 13 Aug 2008 03:35:09 -0400
In-Reply-To: <20080813073205.GA398@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Vegard Nossum <vegard.nossum@gmail.com>, linux-next@vger.kernel.org, Eduard - Gabriel Munteanu <eduard.munteanu@linux360.ro>, Christoph Lameter <cl@linux-foundation.org>

Ingo Molnar wrote:
> * Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
>> Hi all,
>>
>> Today's linux-next merge of the kmemcheck tree got a conflict in
>> mm/slab.c between commit fccd5095804ffc190cb2371c319cb4f5b2c0ee14
>> ("kmemtrace: SLAB hooks") from the slab tree and commit
>> 30532cb3c49a2a9fed94127aab26003c52398a51 ("slab: add hooks for
>> kmemcheck") from the kmemcheck tree.
>>
>> Simply overlapping additions of includes.
> 
> thanks Stephen! I suspect these resolutions will live in linux-next for 
> the next 2 months, as that's the soonest there will be a natural merge 
> between slab.git and tip/kmemcheck.

Oh, I was just asking Stephen what to do with those. If the resolutions 
can be in linux-next, I'm fine with that.
