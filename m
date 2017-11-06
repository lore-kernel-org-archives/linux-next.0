From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm tree
Date: Mon, 6 Nov 2017 17:55:11 +1100
Message-ID: <20171106175511.1e767e2f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:38697 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750727AbdKFGzO (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 6 Nov 2017 01:55:14 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Clement Courbet <courbet@google.com>

Hi Andrew,

After merging the akpm tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

lib/cpumask.c: In function 'cpumask_next_and':
lib/cpumask.c:39:9: error: implicit declaration of function 'find_next_and_bit' [-Werror=implicit-function-declaration]
  return find_next_and_bit(cpumask_bits(src1p), cpumask_bits(src2p),
         ^
cc1: some warnings being treated as errors

Introduced by commit

  1eae9bb7e6f2 ("lib: optimize cpumask_next_and()")

I have reverted that commit for today.

-- 
Cheers,
Stephen Rothwell
