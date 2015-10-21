From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm-current tree
Date: Wed, 21 Oct 2015 17:34:38 +1100
Message-ID: <20151021173438.08f16380@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:34010 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751106AbbJUGel (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 21 Oct 2015 02:34:41 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Minchan Kim <minchan@kernel.org>

Hi Andrew,

After merging the akpm-current tree, today's linux-next build (arm
allnoconfig and others) failed like this:

In file included from init/main.c:50:0:
include/linux/rmap.h:274:1: error: expected declaration specifiers or '...' before '{' token

Caused by commit

  e4f28388eb72 ("mm: simplify reclaim path for MADV_FREE")

Discovered after the linux-next release.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
