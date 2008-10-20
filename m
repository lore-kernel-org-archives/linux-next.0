From: David Woodhouse <dwmw2@infradead.org>
Subject: Re: linux-next: mtd tree build failure
Date: Mon, 20 Oct 2008 09:48:02 +0100
Message-ID: <1224492482.6770.1531.camel@macbook.infradead.org>
References: <20081020163518.b858f3f7.sfr@canb.auug.org.au>
	 <1224487490.6770.1509.camel@macbook.infradead.org>
	 <48FC4277.2000405@compulab.co.il>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([18.85.46.34]:47703 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751617AbYJTIsZ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 20 Oct 2008 04:48:25 -0400
In-Reply-To: <48FC4277.2000405@compulab.co.il>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mike Rapoport <mike@compulab.co.il>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Russell King <rmk+kernel@arm.linux.org.uk>

On Mon, 2008-10-20 at 10:33 +0200, Mike Rapoport wrote:
> You applied the correct version of the patch. It did depend on ARM at the
> beginning, but after discussion it was decided to make it generic so that other
> architecture would be able to use it. I just haven't thought that readsw/writesw
> might be not available on all architectures.

I've made it depend on ARM again for now. For 2.6.29, let's look at
making use ioread8_rep().

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
