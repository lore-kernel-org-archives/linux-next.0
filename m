From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm-current tree
Date: Wed, 3 Feb 2016 16:36:13 +1100
Message-ID: <20160203163613.327c6101@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Joonsoo Kim <js1304@gmail.com>
List-Id: linux-next.vger.kernel.org

Hi Andrew,

After merging the akpm-current tree, today's linux-next build (arm
ep93xx_defconfig) failed like this:

mm/slab.c: In function 'is_debug_pagealloc_cache':
mm/slab.c:1608:2: error: implicit declaration of function 'debug_pagealloc_enabled' [-Werror=implicit-function-declaration]

Caused by commit

  0a244aea1a61 ("mm/slab: clean up DEBUG_PAGEALLOC processing code")

CONFIG_DEBUG_PAGEALLOC is not enabled in this build.

Discovered after the linux-next release.
-- 
Cheers,
Stephen Rothwell
