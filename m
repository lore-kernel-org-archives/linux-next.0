From: Christoph Lameter <cl@linux-foundation.org>
Subject: Re: Git next: Second stage of cpu_alloc patches
Date: Wed, 5 Nov 2008 07:59:01 -0600 (CST)
Message-ID: <Pine.LNX.4.64.0811050757360.11867@quilx.com>
References: <Pine.LNX.4.64.0811042053510.31638@quilx.com>
 <20081104195205.fe1bf62b.akpm@linux-foundation.org>
 <20081105182642.8497301a.sfr@canb.auug.org.au>
 <19f34abd0811042352q2df6ed0r6c92a35159d2b04c@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Return-path: <linux-next-owner@vger.kernel.org>
Received: from nlpi025.sbcis.sbc.com ([207.115.36.54]:37870 "EHLO
	nlpi025.prodigy.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756766AbYKEN71 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 5 Nov 2008 08:59:27 -0500
In-Reply-To: <19f34abd0811042352q2df6ed0r6c92a35159d2b04c@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Vegard Nossum <vegard.nossum@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, travis@sgi.com, linux-next@vger.kernel.org

On Wed, 5 Nov 2008, Vegard Nossum wrote:

> Just in case it helps track down the problem: Adding percpu=100000 to
> the kernel command line got the thing booting for me. The number
> itself was picked at random, but it worked on the first try. The
> machine is a single-core P4 3.0 GHz with HT, 1G RAM, using slightly
> modified F9 config.

Its only happening if !CONFIG_MODULES because then the reserve size is 
zero. The second stage patches fix that because there will then be other 
uses of the allocator so that reserves are always needed. This hunk from 
the second stage fixes the !CONFIG_MODULES issue.


Index: linux-2.6/include/linux/percpu.h
===================================================================
--- linux-2.6.orig/include/linux/percpu.h	2008-11-05 07:41:22.134646124 -0600
+++ linux-2.6/include/linux/percpu.h	2008-11-05 07:44:28.603155403 -0600
@@ -44,11 +44,7 @@
  extern unsigned int percpu_reserve;
  /* Enough to cover all DEFINE_PER_CPUs in kernel, including modules. */
  #ifndef PERCPU_AREA_SIZE
-#ifdef CONFIG_MODULES
  #define PERCPU_RESERVE_SIZE	8192
-#else
-#define PERCPU_RESERVE_SIZE	0
-#endif

  #define PERCPU_AREA_SIZE						\
  	(__per_cpu_end - __per_cpu_start + percpu_reserve)
