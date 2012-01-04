From: Russell King <rmk@arm.linux.org.uk>
Subject: Re: linux-next: manual merge of the s5p tree with the arm tree
Date: Wed, 4 Jan 2012 09:07:02 +0000
Message-ID: <20120104090702.GA28052@flint.arm.linux.org.uk>
References: <20120104131830.ec4341de50a69f4f3f2c5b7b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:47397 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752755Ab2ADJHd (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 4 Jan 2012 04:07:33 -0500
Content-Disposition: inline
In-Reply-To: <20120104131830.ec4341de50a69f4f3f2c5b7b@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Jan 04, 2012 at 01:18:30PM +1100, Stephen Rothwell wrote:
> Hi Kukjin,
> 
> Today's linux-next merge of the s5p tree got a conflict in
> arch/arm/plat-samsung/include/plat/system-reset.h between commit
> 281c8724c10c ("ARM: restart: Temporary #error to persuade platform
> maintainers to take the restart changes seriously") from the arm tree and
> commit 08c6fc52956c ("ARM: restart: EXYNOS: use new restart hook") from
> the s5p tree.
> 
> The arm tree patch seems to have had the desired affect so I used the s5p
> tree version.

Err, what are the Samsung people playing at, merging the patches that
they've sent me for merging into their own tree?

This is a recipe for breakage, especially as the exynos patch depends
on previous patches in my tree _and_ patches in my tree depend on that
patch as well.

Well, we'll see what we end up with when you do the next linux-next,
as by then my public tree should be updated with yesterdays work by
then.

I've a feeling that this coming merge window is going to be a horrible
mess.

-- 
Russell King
 Linux kernel    2.6 ARM Linux   - http://www.arm.linux.org.uk/
 maintainer of:
