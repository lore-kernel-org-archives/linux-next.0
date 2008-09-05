From: David Woodhouse <dwmw2@infradead.org>
Subject: Re: linux-next: Tree for September 4
Date: Fri, 05 Sep 2008 01:07:49 +0100
Message-ID: <1220573269.4843.1.camel@shinybook.infradead.org>
References: <20080904193606.573f2cb3.sfr@canb.auug.org.au>
	 <20080904165309.b5fd9214.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([18.85.46.34]:49928 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751543AbYIEAHz (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 4 Sep 2008 20:07:55 -0400
In-Reply-To: <20080904165309.b5fd9214.akpm@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, 2008-09-04 at 16:53 -0700, Andrew Morton wrote:
> 
> sparc64 `make headers_check':
> 
> make[1]: *** No rule to make target
> `/usr/src/devel/arch/sparc/include/asm/statfs_32.h', needed by
> `/usr/src/devel/usr/include/asm/.install'.  Stop.

Fixed in ~dwmw2/random-2.6.git. Thanks.

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
