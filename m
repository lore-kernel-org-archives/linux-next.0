From: Pekka Enberg <penberg@cs.helsinki.fi>
Subject: Re: next-20090216: slqb
Date: Tue, 17 Feb 2009 13:31:25 +0200
Message-ID: <84144f020902170331m765c50d6xd792de14ac220b9d@mail.gmail.com>
References: <20090216172016.f1d159a7.sfr@canb.auug.org.au>
	 <20090217005539.GA6292@x200.localdomain>
	 <20090217102733.GB26402@wotan.suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from fg-out-1718.google.com ([72.14.220.159]:52591 "EHLO
	fg-out-1718.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750974AbZBQLb2 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 17 Feb 2009 06:31:28 -0500
In-Reply-To: <20090217102733.GB26402@wotan.suse.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Nick Piggin <npiggin@suse.de>
Cc: Alexey Dobriyan <adobriyan@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@ozlabs.org

On Tue, Feb 17, 2009 at 03:55:40AM +0300, Alexey Dobriyan wrote:
>> FYI, on powerpc-64-smp-n-debug-n:
>>
>> mm/slqb.c: In function '__slab_free':
>> mm/slqb.c:1648: error: implicit declaration of function 'slab_free_to_remote'
>> mm/slqb.c: In function 'kmem_cache_open':
>> mm/slqb.c:2174: error: implicit declaration of function 'kmem_cache_dyn_array_free'
>> mm/slqb.c:2175: warning: label 'error_cpu_array' defined but not used
>> mm/slqb.c: In function 'kmem_cache_destroy':
>> mm/slqb.c:2294: error: implicit declaration of function 'claim_remote_free_list'
>> mm/slqb.c: In function 'kmem_cache_reap_percpu':
>> mm/slqb.c:2547: error: implicit declaration of function 'flush_remote_free_cache'
>> mm/slqb.c: In function 'kmem_cache_init':
>> mm/slqb.c:2783: error: 'per_cpu__kmem_cpu_nodes' undeclared (first use in this function)
>> mm/slqb.c:2783: error: (Each undeclared identifier is reported only once
>> mm/slqb.c:2783: error: for each function it appears in.)
>> mm/slqb.c:2784: error: 'kmem_cpu_cache' undeclared (first use in this function)

On Tue, Feb 17, 2009 at 12:27 PM, Nick Piggin <npiggin@suse.de> wrote:
> Hmm, I guess this (SMP=n && NUMA=y) must be a valid config on ppc if
> SLQB is the only one tripping on it, so I'll look at code to fix tihs
> up.

It would be nice if one of the ppc devs confirmed this, though. Other
architectures don't seem to support the combination.

                                              Pekka
