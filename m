From: Pekka Enberg <penberg@cs.helsinki.fi>
Subject: Re: linux-next: manual merge of the kmemleak tree
Date: Tue, 21 Apr 2009 21:02:57 +0300
Message-ID: <49EE0A51.9010303@cs.helsinki.fi>
References: <20090115162717.de2b3a3c.sfr@canb.auug.org.au>	 <20090115102950.GA5201@localhost>	 <1232021097.32016.25.camel@pc1117.cambridge.arm.com>	 <20090115174921.GA5314@localhost>	 <1240312442.1369.9.camel@pc1117.cambridge.arm.com> <1240314430.1369.18.camel@pc1117.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from courier.cs.helsinki.fi ([128.214.9.1]:49871 "EHLO
	mail.cs.helsinki.fi" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753272AbZDUSHF (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 21 Apr 2009 14:07:05 -0400
In-Reply-To: <1240314430.1369.18.camel@pc1117.cambridge.arm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Eduard - Gabriel Munteanu <eduard.munteanu@linux360.ro>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>

Hi Catalin,

Catalin Marinas wrote:
>> I noticed that the memory allocation tracepoints were merged into
>> mainline. I'll modify kmemleak to use them and probably add another for
>> vmalloc.
> 
> After a quick look, it turns out not to be so simple. Kmemleak needs to
> trace all the memory allocations (missing some could cause false
> positives) and it currently has a static buffer to store the first
> allocations before kmemleak is fully initialised.
> 
> Registering a probe requires memory allocations and therefore it needs
> to be done after kmem_cache_init(). It means that kmemleak would miss
> several allocations before it can register the probes. I don't see any
> solution other than inserting kmemleak_*() calls near the tracing hooks.
> 
> Any other suggestion? Thanks.

Yup, sounds like kmemleak hooks should stay there as-is.

			Pekka
