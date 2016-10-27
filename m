From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning in Linus' tree
Date: Fri, 28 Oct 2016 09:29:20 +1100
Message-ID: <20161028092920.4d84f8f1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Hi Linus,

Building your tree, today's linux-next build (powerpc ppc64_defconfig)
produced this warning:

mm/memory_hotplug.c: In function 'try_offline_node':
mm/memory_hotplug.c:2120:6: warning: unused variable 'i' [-Wunused-variable]
 int i;
     ^

Introduced by commit

  9dcb8b685fc3 ("mm: remove per-zone hashtable of bitlock waitqueues")

-- 
Cheers,
Stephen Rothwell
