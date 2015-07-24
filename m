From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm-current tree
Date: Fri, 24 Jul 2015 15:50:11 +1000
Message-ID: <20150724155011.670c2696@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:38972 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750990AbbGXFuN (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 24 Jul 2015 01:50:13 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mike Kravetz <mike.kravetz@oracle.com>

Hi Andrew,

After merging the akpm-current tree, today's linux-next build (i386
defconfig) failed like this:

fs/hugetlbfs/inode.c: In function 'hugetlbfs_fallocate':
fs/hugetlbfs/inode.c:578:13: error: 'struct vm_area_struct' has no member named 'vm_policy'
   pseudo_vma.vm_policy =
             ^
fs/hugetlbfs/inode.c:579:4: error: implicit declaration of function 'mpol_shared_policy_lookup' [-Werror=implicit-function-declaration]
    mpol_shared_policy_lookup(&HUGETLBFS_I(inode)->policy,
    ^
fs/hugetlbfs/inode.c:595:28: error: 'struct vm_area_struct' has no member named 'vm_policy'
    mpol_cond_put(pseudo_vma.vm_policy);
                            ^
fs/hugetlbfs/inode.c:601:27: error: 'struct vm_area_struct' has no member named 'vm_policy'
   mpol_cond_put(pseudo_vma.vm_policy);
                           ^
Caused by commit

  6b2ac4455b3d ("hugetlbfs: add hugetlbfs_fallocate()")

vm_policy and mpol_shared_policy_lookup are only defined when CONFIG_NUMA
is set.

I have reverted that commit for today.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
