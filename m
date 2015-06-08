From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: randconfig build error with next-20150529, in
 crypto/jitterentropy.c
Date: Mon, 08 Jun 2015 17:59:45 +0200
Message-ID: <1433779185.1495.46.camel@twins>
References: <CA+r1ZhhfcfZ5RvAtFEnR0y3Y79dz2Em7JsuqF_XRPBRhL5pROQ@mail.gmail.com>
	 <20150608122502.GA29454@gondor.apana.org.au>
	 <1433766990.1495.39.camel@twins> <2190933.vdB90a64Et@tauon.atsec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:43931 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752178AbbFHP7x convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 8 Jun 2015 11:59:53 -0400
In-Reply-To: <2190933.vdB90a64Et@tauon.atsec.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephan Mueller <smueller@chronox.de>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, Andy Shevchenko <andy.shevchenko@gmail.com>, Jim Davis <jim.epost@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, "David S. Miller" <davem@davemloft.net>, linux-crypto <linux-crypto@vger.kernel.org>, Waiman Long <Waiman.Long@hp.com>, Ingo Molnar <mingo@kernel.org>, "x86@kernel.org" <x86@kernel.org>

On Mon, 2015-06-08 at 17:52 +0200, Stephan Mueller wrote:
> Am Monday 08 June 2015, 14:36:30 schrieb Peter Zijlstra:
> 
> Hi Peter,
> >
> >Would something like
> >
> >#pragma GCC push_options
> >#pragma GCC optimize ("-O0")
> >static __u64 jent_fold_time(struct rand_data *ec, __u64 time,
> >			    __u64 *folded, __u64 loop_cnt)
> >{
> >	...
> >}
> >#pragma GCC pop_options
> >
> >Be an option to allow the file to be compiled with regular optimizations
> >enabled?
> 
> After doing some tests, I see that neither the min entropy nor the Shannon 
> Entropy of the raw noise is affected by using the mentioned pragmas at the 
> right locations.
> 
> So I will prepare a patch tonight.
> 
> Just for my edification: why does an -O0 on a self contained file break the 
> compile run?

We rely on -finline-functions, which is disabled with -O0.

By inlining some things, the compiler can do constant value propagation
etc. and compile time evaluate things.

We often (as is the case here) use this to generate compiler warns
without generating actual code.

>  Any why do the pragmas work?

They are placed such that the code affected by the above creativity is
outside of the forced -O0 compile and life is good again.
