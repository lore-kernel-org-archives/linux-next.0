From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: manual merge of the rr tree
Date: Thu, 8 Jan 2009 12:50:31 -0800
Message-ID: <20090108125031.5d27e069.akpm@linux-foundation.org>
References: <20090105143239.08b1a060.sfr@canb.auug.org.au>
	<200901061134.49369.rusty@rustcorp.com.au>
	<Pine.LNX.4.64.0901060845001.11819@quilx.com>
	<200901071317.29141.rusty@rustcorp.com.au>
	<Pine.LNX.4.64.0901070858260.8329@quilx.com>
	<20090107172051.GK496@one.firstfloor.org>
	<Pine.LNX.4.64.0901071300430.8329@quilx.com>
	<20090108204835.GI496@one.firstfloor.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:50543 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752389AbZAHUur (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 8 Jan 2009 15:50:47 -0500
In-Reply-To: <20090108204835.GI496@one.firstfloor.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
Cc: cl@linux-foundation.org, andi@firstfloor.org, rusty@rustcorp.com.au, sfr@canb.auug.org.au, linux-next@vger.kernel.org, travis@sgi.com, mingo@elte.hu, rth@twiddle.net

On Thu, 8 Jan 2009 21:48:35 +0100
Andi Kleen <andi@firstfloor.org> wrote:

> +/*
> + * This macro obfuscates arithmetic on a variable address so that gcc
> + * shouldn't recognize the original var, and make assumptions about it.
> + *
> + * This is needed because the C standard makes it undefined to do
> + * pointer arithmetic on "objects" outside their boundaries and the
> + * gcc optimizers assume this is the case. In particular they
> + * assume such arithmetic does not wrap.
> + *
> + * A miscompilation has been observed because of this on PPC.
> + * To work around it we hide the relationship of the pointer and the object
> + * using this macro.
> + *

wow, thanks.  I always wondered.
