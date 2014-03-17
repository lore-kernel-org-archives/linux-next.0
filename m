From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: linux-next: manual merge of the akpm-current tree with the tip
 tree
Date: Mon, 17 Mar 2014 10:36:02 +0100
Message-ID: <20140317093602.GY27965@twins.programming.kicks-ass.net>
References: <20140317203124.3b947e0799cc8142df5e4a2e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:55144 "EHLO
	merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753311AbaCQJgd (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 17 Mar 2014 05:36:33 -0400
Content-Disposition: inline
In-Reply-To: <20140317203124.3b947e0799cc8142df5e4a2e@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Josh Triplett <josh@joshtriplett.org>

On Mon, Mar 17, 2014 at 08:31:24PM +1100, Stephen Rothwell wrote:
> Hi Andrew,
> 
> Today's linux-next merge of the akpm-current tree got a conflict in
> kernel/locking/Makefile between commit fb0527bd5ea9 ("locking/mutexes:
> Introduce cancelable MCS lock for adaptive spinning") from the  tree and
> commit 4dc0fe493027 ("lglock: map to spinlock when !CONFIG_SMP") from the
> akpm-current tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

I'm a bit sad of not having seen that lglock patch at all.
