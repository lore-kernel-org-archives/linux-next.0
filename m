From: Eduard - Gabriel Munteanu <eduard.munteanu@linux360.ro>
Subject: Re: linux-next: manual merge of the kmemleak tree
Date: Thu, 15 Jan 2009 19:49:21 +0200
Message-ID: <20090115174921.GA5314@localhost>
References: <20090115162717.de2b3a3c.sfr@canb.auug.org.au> <20090115102950.GA5201@localhost> <1232021097.32016.25.camel@pc1117.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ew0-f17.google.com ([209.85.219.17]:33984 "EHLO
	mail-ew0-f17.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755496AbZAORs7 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 15 Jan 2009 12:48:59 -0500
Received: by ewy10 with SMTP id 10so1424066ewy.13
        for <linux-next@vger.kernel.org>; Thu, 15 Jan 2009 09:48:56 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1232021097.32016.25.camel@pc1117.cambridge.arm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Pekka Enberg <penberg@cs.helsinki.fi>

On Thu, Jan 15, 2009 at 12:04:57PM +0000, Catalin Marinas wrote:
> The only issue is that kmemleak would need to register the callbacks
> before the slab allocator is initialised (otherwise it may miss some
> allocations). So it would need a 3-stage initialisation - pre-slab,
> post-slab and late_initcall.

Sure, that is not a problem, as kmemtrace needn't be compiled in for
the tracepoints to work. As long as they're defined in some header and
included, you can register multiple probes from all over the kernel.
This also means you won't have to interact with kmemtrace code.


	Eduard
