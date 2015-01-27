From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: Tree for Jan 27 (build failures due to 'don't offset
 memmap for flatmem')
Date: Tue, 27 Jan 2015 09:31:28 -0800
Message-ID: <20150127173128.GA1555@roeck-us.net>
References: <20150127195123.46885d96@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:37800 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753886AbbA0Rbf (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 27 Jan 2015 12:31:35 -0500
Received: from mailnull by bh-25.webhostbox.net with sa-checked (Exim 4.82)
	(envelope-from <linux@roeck-us.net>)
	id 1YG9zD-0001NT-46
	for linux-next@vger.kernel.org; Tue, 27 Jan 2015 17:31:35 +0000
Content-Disposition: inline
In-Reply-To: <20150127195123.46885d96@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Laura Abbott <lauraa@codeaurora.org>

On Tue, Jan 27, 2015 at 07:51:23PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20150123:
> 
> The arm64 tree gained a conflict against Linus' tree.
> 
> The net-next tree gained conflicts against the arm-soc and net trees.
> 
> The drm-panel tree gained a conflict against the drm tree.
> 
> The wireless-drivers-next tree gained a build failure for which I reverted
> a commit.
> 
> The block tree gained conflicts against the vfs and Linus' trees.
> 
> The clockevents tree gained a conflict against the arm tree.
> 
> The akpm tree lost a patch that turned up elsewhere.
> 
> Non-merge commits (relative to Linus' tree): 5237
>  4877 files changed, 200964 insertions(+), 94565 deletions(-)
> 
There are various build failures due to commit
	'mm/page_alloc.c: don't offset memmap for flatmem',
which assumes that ARCH_PFN_OFFSET is defined for all architectures,
but it isn't. This is also the first use of ARCH_PFN_OFFSET outside
an architecture directory.

Build fails for mn10300, m68k_nommu, and avr32.

Guenter
