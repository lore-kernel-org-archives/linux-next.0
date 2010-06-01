From: Andi Kleen <andi@firstfloor.org>
Subject: Re: linux-next: build failure after merge of the hwpoison tree
Date: Tue, 1 Jun 2010 09:22:33 +0200
Message-ID: <20100601072233.GB30556@basil.fritz.box>
References: <20100601160050.91404d78.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from one.firstfloor.org ([213.235.205.2]:56862 "EHLO
	one.firstfloor.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753482Ab0FAHWf (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 1 Jun 2010 03:22:35 -0400
Content-Disposition: inline
In-Reply-To: <20100601160050.91404d78.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andi Kleen <andi@firstfloor.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Naoya Horiguchi <n-horiguchi@ah.jp.nec.com>

On Tue, Jun 01, 2010 at 04:00:50PM +1000, Stephen Rothwell wrote:
> Hi Andi,
> 
> After merging the hwpoison tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> ERROR: "PageHuge" [mm/hwpoison-inject.ko] undefined!

Thanks Stephen. I pushed out an updated tree including
the missing EXPORT_SYMBOL. So hopefully tomorrow it will
work.

-Andi
-- 
ak@linux.intel.com -- Speaking for myself only.
