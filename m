From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm-current tree
Date: Fri, 24 Jul 2015 15:33:34 +1000
Message-ID: <20150724153334.543cfc7b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:49236 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750990AbbGXFdf (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 24 Jul 2015 01:33:35 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Davidlohr Bueso <dave@stgolabs.net>

Hi Andrew,

After merging the akpm-current tree, today's linux-next build (powerpc
allnoconfig) failed like this:

mm/built-in.o: In function `shrink_slab.part.73.constprop.83':
vmscan.c:(.text+0xf760): undefined reference to `__srcu_read_lock'
vmscan.c:(.text+0xf924): undefined reference to `__srcu_read_unlock'
mm/built-in.o: In function `unregister_shrinker':
(.text+0xfa60): undefined reference to `synchronize_srcu'
mm/built-in.o:(.data+0x1e8): undefined reference to `process_srcu'

Caused by commit

  dab937da82f9 ("mm: srcu-ify shrinkers")

I have reverted that commit for today.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
