From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kselftest tree with the net-next
 tree
Date: Wed, 25 Jan 2017 15:03:21 +1100
Message-ID: <20170125150321.0b377f57@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:55147 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751137AbdAYEDX (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 24 Jan 2017 23:03:23 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Shuah Khan <shuahkh@osg.samsung.com>, David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Daniel Borkmann <daniel@iogearbox.net>, "bamvor.zhangjian@huawei.com" <bamvor.zhangjian@huawei.com>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>

Hi Shuah,

Today's linux-next merge of the kselftest tree got a conflict in:

  tools/testing/selftests/bpf/Makefile

between commit:

  62b64660262a ("bpf: add prog tag test case to bpf selftests")

from the net-next tree and commit:

  88baa78d1f31 ("selftests: remove duplicated all and clean target")

from the kselftest tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc tools/testing/selftests/bpf/Makefile
index 769a6cb42b4b,058351b0694f..000000000000
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@@ -1,13 -1,7 +1,7 @@@
  CFLAGS += -Wall -O2 -I../../../../usr/include
  
- test_objs = test_verifier test_tag test_maps test_lru_map test_lpm_map
 -TEST_GEN_PROGS = test_verifier test_maps test_lru_map
++TEST_GEN_PROGS = test_verifier test_tag test_maps test_lru_map test_lpm_map
  
- TEST_PROGS := $(test_objs) test_kmod.sh
- TEST_FILES := $(test_objs)
- 
- all: $(test_objs)
+ TEST_PROGS := test_kmod.sh
  
  include ../lib.mk
- 
- clean:
- 	$(RM) $(test_objs)
