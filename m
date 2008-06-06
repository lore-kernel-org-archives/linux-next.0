From: "Vegard Nossum" <vegard.nossum@gmail.com>
Subject: Re: linux-next: Tree for June 5
Date: Fri, 6 Jun 2008 17:13:58 +0200
Message-ID: <19f34abd0806060813t10d422fel10dcb25c71f3b032@mail.gmail.com>
References: <20080606024811.70db9ab2.akpm@linux-foundation.org>
	 <20080606115759.GA29321@elte.hu>
	 <19f34abd0806060533x6d3ff66tc29306143103fc40@mail.gmail.com>
	 <48493CBD.1000202@sgi.com>
	 <19f34abd0806060650q203bef48rd3b20c0cabec4774@mail.gmail.com>
	 <19f34abd0806060707x7570c835u4b1837b54dfa36ba@mail.gmail.com>
	 <484947A9.5050804@sgi.com>
	 <19f34abd0806060736m10424455kfbc3e6272d18646e@mail.gmail.com>
	 <20080606145717.GA5300@elte.hu> <20080606150102.GA14141@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rv-out-0506.google.com ([209.85.198.236]:9985 "EHLO
	rv-out-0506.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758174AbYFFPN6 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 6 Jun 2008 11:13:58 -0400
Received: by rv-out-0506.google.com with SMTP id l9so1541862rvb.1
        for <linux-next@vger.kernel.org>; Fri, 06 Jun 2008 08:13:58 -0700 (PDT)
In-Reply-To: <20080606150102.GA14141@elte.hu>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Mike Travis <travis@sgi.com>, Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Fri, Jun 6, 2008 at 5:01 PM, Ingo Molnar <mingo@elte.hu> wrote:
>
> * Ingo Molnar <mingo@elte.hu> wrote:
>
>> > Subject: [PATCH] sched: don't call node_to_cpumask() on nodes >
>> > nr_node_ids
>>
>> AFAICS this is not yet required for v2.6.26, as the requirement to
>> never iterate to MAX_NUMNODES and call nr_cpus_node() with the index
>> only got introduced by Mike's patch.
>
> the one below is needed as well i think.

Yeah. I think you had better take Mike's patches, I don't trust even
that my patch and your fixlet does everything correctly.


Vegard

-- 
"The animistic metaphor of the bug that maliciously sneaked in while
the programmer was not looking is intellectually dishonest as it
disguises that the error is the programmer's own creation."
	-- E. W. Dijkstra, EWD1036
