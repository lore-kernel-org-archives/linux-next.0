From: Pekka Enberg <penberg@cs.helsinki.fi>
Subject: Re: linux-next: manual merge of the kmemcheck tree
Date: Wed, 13 Aug 2008 14:57:26 +0300
Message-ID: <1218628646.7813.324.camel@penberg-laptop>
References: <20080813152907.b76a06e3.sfr@canb.auug.org.au>
	 <20080813073205.GA398@elte.hu> <48A28DD9.7010108@cs.helsinki.fi>
	 <20080813075808.GA11645@elte.hu> <1218615288.7813.310.camel@penberg-laptop>
	 <20080813085800.GF23417@elte.hu> <1218627433.7813.320.camel@penberg-laptop>
	 <20080813115210.GD18660@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from courier.cs.helsinki.fi ([128.214.9.1]:37210 "EHLO
	mail.cs.helsinki.fi" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751763AbYHML5Y (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 13 Aug 2008 07:57:24 -0400
In-Reply-To: <20080813115210.GD18660@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Vegard Nossum <vegard.nossum@gmail.com>, linux-next@vger.kernel.org, Eduard - Gabriel Munteanu <eduard.munteanu@linux360.ro>, Christoph Lameter <cl@linux-foundation.org>

On Wed, 2008-08-13 at 13:52 +0200, Ingo Molnar wrote:
> seems pretty sane to me. We use something quite similar in -tip, with 
> the distinction that after a very short initial period [a few days at 
> most] we try to keep development branches append-only as well.

Sure, I try to do that as well. But like I said, I've had a lot of churn
coming from the defrag patches recently...

But how do you deal with reverts, btw? Assuming you have a patch that
you've pushed out already but not asked Linus to pull, what do you do? I
currently use git-rebase -i and just drop the patch completely.

		Pekka
