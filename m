From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH] mfd/wm8350: don't export static functions
Date: Wed, 22 Oct 2008 10:37:22 +0100
Message-ID: <20081022093721.GA10499@rakim.wolfsonmicro.main>
References: <20081016204754.a41646e5.sfr@canb.auug.org.au> <20081016120416.GA5753@rakim.wolfsonmicro.main> <20081022203112.5a213e8c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:38166 "EHLO
	opensource2.wolfsonmicro.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1754074AbYJVJhY (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 22 Oct 2008 05:37:24 -0400
Content-Disposition: inline
In-Reply-To: <20081022203112.5a213e8c.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Liam Girdwood <lrg@slimlogic.co.uk>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Linus <torvalds@linux-foundation.org>, ppc-dev <linuxppc-dev@ozlabs.org>, Andrew Morton <akpm@linux-foundation.org>

On Wed, Oct 22, 2008 at 08:31:12PM +1100, Stephen Rothwell wrote:

> I thought that this had been applied, but I have had to apply it to my
> tree today again.

Samuel doesn't seem to have picked it up (though looking at the CC list
you've not sent it to him).  I'm going to push another batch of stuff to
him later today, hopefully he will pick it up then.
