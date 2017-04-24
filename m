From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the
 kselftest tree
Date: Mon, 24 Apr 2017 16:30:10 +1000
Message-ID: <20170424163010.532ac045@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:55123 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1165435AbdDXGaM (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 24 Apr 2017 02:30:12 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuahkh@osg.samsung.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, SeongJae Park <sj38.park@gmail.com>, Mike Rapoport <rppt@linux.vnet.ibm.com>

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in:

  tools/testing/selftests/vm/run_vmtests

between commit:

  ff80d9152fd7 ("selftests/vm/run_vmtests: Fix wrong comment")

from the kselftest tree and commit:

  7b7c7dac4437 ("userfaultfd: selftest: combine all cases into a single executable")

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc tools/testing/selftests/vm/run_vmtests
index 2ed05ad00daa,3214a6456d13..000000000000
--- a/tools/testing/selftests/vm/run_vmtests
+++ b/tools/testing/selftests/vm/run_vmtests
@@@ -92,10 -92,10 +92,10 @@@ echo "NOTE: The above hugetlb tests pro
  echo "      https://github.com/libhugetlbfs/libhugetlbfs.git for"
  echo "      hugetlb regression testing."
  
 -echo "--------------------"
 +echo "-------------------"
  echo "running userfaultfd"
 -echo "--------------------"
 +echo "-------------------"
- ./userfaultfd 128 32
+ ./userfaultfd anon 128 32
  if [ $? -ne 0 ]; then
  	echo "[FAIL]"
  	exitcode=1
@@@ -103,11 -103,11 +103,11 @@@ els
  	echo "[PASS]"
  fi
  
 -echo "----------------------------"
 +echo "---------------------------"
  echo "running userfaultfd_hugetlb"
 -echo "----------------------------"
 -# 258MB total huge pages == 128MB src and 128MB dst
 +echo "---------------------------"
 +# 256MB total huge pages == 128MB src and 128MB dst
- ./userfaultfd_hugetlb 128 32 $mnt/ufd_test_file
+ ./userfaultfd hugetlb 128 32 $mnt/ufd_test_file
  if [ $? -ne 0 ]; then
  	echo "[FAIL]"
  	exitcode=1
@@@ -116,10 -116,10 +116,10 @@@ els
  fi
  rm -f $mnt/ufd_test_file
  
 -echo "----------------------------"
 +echo "-------------------------"
  echo "running userfaultfd_shmem"
 -echo "----------------------------"
 +echo "-------------------------"
- ./userfaultfd_shmem 128 32
+ ./userfaultfd shmem 128 32
  if [ $? -ne 0 ]; then
  	echo "[FAIL]"
  	exitcode=1
