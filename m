From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kselftest tree with the jc_docs
 tree
Date: Wed, 7 Jun 2017 14:43:02 +1000
Message-ID: <20170607144302.7f549acf@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:39913 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750709AbdFGEnF (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 7 Jun 2017 00:43:05 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Shuah Khan <shuahkh@osg.samsung.com>, Jonathan Corbet <corbet@lwn.net>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, =?UTF-8?B?TWlja2HDq2wgU2Fs?= =?UTF-8?B?YcO8bg==?= <mic@digikod.net>, Kees Cook <keescook@chromium.org>

Hi Shuah,

Today's linux-next merge of the kselftest tree got a conflict in:

  MAINTAINERS

between commit:

  c061f33f35be ("doc: ReSTify seccomp_filter.txt")

from the jc_docs tree and commit:

  11fe3c3f54f9 ("selftests: Make test_harness.h more generally available")

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

diff --cc MAINTAINERS
index d0cda330adbb,ef292b8c771d..000000000000
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@@ -11599,7 -11492,7 +11599,8 @@@ F:	kernel/seccomp.
  F:	include/uapi/linux/seccomp.h
  F:	include/linux/seccomp.h
  F:	tools/testing/selftests/seccomp/*
+ F:	tools/testing/selftests/kselftest_harness.h
 +F:	Documentation/userspace-api/seccomp_filter.rst
  K:	\bsecure_computing
  K:	\bTIF_SECCOMP\b
  
