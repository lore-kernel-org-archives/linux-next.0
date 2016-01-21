From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm-current tree
Date: Thu, 21 Jan 2016 16:11:56 +1100
Message-ID: <20160121161156.69051295@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Johannes Weiner <hannes@cmpxchg.org>
List-Id: linux-next.vger.kernel.org

Hi Andrew,

After merging the akpm-current tree, today's linux-next build (arm
efm32_defconfig) failed like this:

fs/proc/task_nommu.c:132:28: error: 'mm' undeclared (first use in this function)

Caused by commit

  e87d4fd02f40 ("proc: revert /proc/<pid>/maps [stack:TID] annotation")

# CONFIG_MMU is not set

Discovered after today's linux-next release.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
