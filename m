From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm tree with the tip tree
Date: Thu, 10 Mar 2016 16:28:56 +1100
Message-ID: <20160310162856.3330418f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:57574 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750833AbcCJF26 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 10 Mar 2016 00:28:58 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Luis R. Rodriguez" <mcgrof@suse.com>

Hi Andrew,

Today's linux-next merge of the akpm tree got a conflict in:

  drivers/gpu/drm/omapdrm/omap_gem.c

between commit:

  f6e45661f9be ("dma, mm/pat: Rename dma_*_writecombine() to dma_*_wc()")

from the tip tree and patch:

  "dma-mapping: rename dma_*_writecombine() to dma_*_wc()"

from the akpm tree.

These a basically the same patch, so I dropped the one from the akpm tree.

-- 
Cheers,
Stephen Rothwell
