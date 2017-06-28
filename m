From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the
 kselftest tree
Date: Wed, 28 Jun 2017 18:31:11 +1000
Message-ID: <20170628183111.05680b34@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:54133 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751650AbdF1IbR (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 28 Jun 2017 04:31:17 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuahkh@osg.samsung.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Orson Zhai <orson.zhai@linaro.org>, "Luis R. Rodriguez" <mcgrof@kernel.org>

Hi all,

Today's linux-next merge of the akpm-current tree got conflicts in:

  tools/testing/selftests/sysctl/common_tests
  tools/testing/selftests/sysctl/run_numerictests
  tools/testing/selftests/sysctl/run_stringtests

between commit:

  d644437a1dc6 ("tools/testing/selftests/sysctl: Add pre-check to the value of writes_strict")

from the kselftest tree and commit:

  fed7038685f3 ("test_sysctl: add generic script to expand on tests")

from the akpm-current tree.

I fixed it up (I removed the files and so, for now I have effectively
dropped the kselftest tree patch) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell
