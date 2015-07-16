From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the akpm-current tree
Date: Thu, 16 Jul 2015 15:26:00 +1000
Message-ID: <20150716152600.0ec446c2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:33159 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751335AbbGPF0B (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 16 Jul 2015 01:26:01 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>

Hi Andrew,

After merging the akpm-current tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

lib/genalloc.c: In function 'gen_pool_get':
/scratch/sfr/next/lib/genalloc.c:599:6: warning: passing argument 4 of 'devres_find' discards 'const' qualifier from pointer target type
  p = devres_find(dev, devm_gen_pool_release, devm_gen_pool_match, name);
      ^
In file included from /scratch/sfr/next/include/linux/node.h:17:0,
                 from /scratch/sfr/next/include/linux/cpu.h:16,
                 from /scratch/sfr/next/include/linux/of_device.h:4,
                 from /scratch/sfr/next/lib/genalloc.c:37:
/scratch/sfr/next/include/linux/device.h:620:14: note: expected 'void *' but argument is of type 'const char *'
 extern void *devres_find(struct device *dev, dr_release_t release,
              ^

Caused by commit

  e89a70fd54f2 ("genalloc: add support of multiple gen_pools per device")

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
