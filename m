From: Andi Kleen <andi@firstfloor.org>
Subject: Re: linux-next: manual merge of the rr tree
Date: Thu, 8 Jan 2009 22:49:08 +0100
Message-ID: <20090108214908.GJ496@one.firstfloor.org>
References: <20090105143239.08b1a060.sfr@canb.auug.org.au> <200901061134.49369.rusty@rustcorp.com.au> <Pine.LNX.4.64.0901060845001.11819@quilx.com> <200901071317.29141.rusty@rustcorp.com.au> <Pine.LNX.4.64.0901070858260.8329@quilx.com> <20090107172051.GK496@one.firstfloor.org> <Pine.LNX.4.64.0901071300430.8329@quilx.com> <20090108204835.GI496@one.firstfloor.org> <Pine.LNX.4.64.0901081514360.13768@quilx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from one.firstfloor.org ([213.235.205.2]:42193 "EHLO
	one.firstfloor.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752244AbZAHVe7 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 8 Jan 2009 16:34:59 -0500
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.64.0901081514360.13768@quilx.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoph Lameter <cl@linux-foundation.org>
Cc: Andi Kleen <andi@firstfloor.org>, Rusty Russell <rusty@rustcorp.com.au>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Mike Travis <travis@sgi.com>, Ingo Molnar <mingo@elte.hu>, Richard Henderson <rth@twiddle.net>, akpm@linux-foundation.org

On Thu, Jan 08, 2009 at 03:15:48PM -0600, Christoph Lameter wrote:
> This also then means that RELOC_HIDE can simply be pointer arithmetic on
> non PPC, right?

No, the C standard and the gcc optimizer are the same on all architectures.

-Andi
-- 
ak@linux.intel.com
