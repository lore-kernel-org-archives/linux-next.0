From: Christoph Lameter <cl@linux-foundation.org>
Subject: Re: linux-next: manual merge of the rr tree
Date: Thu, 8 Jan 2009 15:15:48 -0600 (CST)
Message-ID: <Pine.LNX.4.64.0901081514360.13768@quilx.com>
References: <20090105143239.08b1a060.sfr@canb.auug.org.au>
 <200901061134.49369.rusty@rustcorp.com.au> <Pine.LNX.4.64.0901060845001.11819@quilx.com>
 <200901071317.29141.rusty@rustcorp.com.au> <Pine.LNX.4.64.0901070858260.8329@quilx.com>
 <20090107172051.GK496@one.firstfloor.org> <Pine.LNX.4.64.0901071300430.8329@quilx.com>
 <20090108204835.GI496@one.firstfloor.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from nlpi025.sbcis.sbc.com ([207.115.36.54]:54271 "EHLO
	nlpi025.prodigy.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752003AbZAHVQe (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 8 Jan 2009 16:16:34 -0500
In-Reply-To: <20090108204835.GI496@one.firstfloor.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andi Kleen <andi@firstfloor.org>
Cc: Rusty Russell <rusty@rustcorp.com.au>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Mike Travis <travis@sgi.com>, Ingo Molnar <mingo@elte.hu>, Richard Henderson <rth@twiddle.net>, akpm@linux-foundation.org

This also then means that RELOC_HIDE can simply be pointer arithmetic on
non PPC, right?


Reviewed-by: Christoph Lameter <cl@linux-foundation.org>
