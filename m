From: Christoph Lameter <cl@linux-foundation.org>
Subject: Re: linux-next: manual merge of the rr tree
Date: Wed, 7 Jan 2009 13:01:06 -0600 (CST)
Message-ID: <Pine.LNX.4.64.0901071300430.8329@quilx.com>
References: <20090105143239.08b1a060.sfr@canb.auug.org.au>
 <200901061134.49369.rusty@rustcorp.com.au> <Pine.LNX.4.64.0901060845001.11819@quilx.com>
 <200901071317.29141.rusty@rustcorp.com.au> <Pine.LNX.4.64.0901070858260.8329@quilx.com>
 <20090107172051.GK496@one.firstfloor.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from nlpi053.sbcis.sbc.com ([207.115.36.82]:36268 "EHLO
	nlpi053.prodigy.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753090AbZAGTBz (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 7 Jan 2009 14:01:55 -0500
In-Reply-To: <20090107172051.GK496@one.firstfloor.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andi Kleen <andi@firstfloor.org>
Cc: Rusty Russell <rusty@rustcorp.com.au>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Mike Travis <travis@sgi.com>, Ingo Molnar <mingo@elte.hu>, Richard Henderson <rth@twiddle.net>

On Wed, 7 Jan 2009, Andi Kleen wrote:

> The C standard says that arithmetic on pointers in defined objects outside
> the boundaries of these objects (except for the special case of one beyond
> the end for arrays) is undefined. The gcc optimizers take advantage
> of this by assuming that such arithmetic doesn't wrap (and might have other
> assumptions)

Ok then we need to say so in a comment around RELOC_HIDE.
