From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kdbus tree with Linus' tree
Date: Mon, 14 Sep 2015 10:53:56 +1000
Message-ID: <20150914105356.02aef8f0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:47924 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752090AbbINAx6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 13 Sep 2015 20:53:58 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Daniel Mack <daniel@zonque.org>, Pranith Kumar <bobby.prani@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, David Herrmann <dh.herrmann@gmail.com>, Djalal Harouni <tixxdz@opendz.org>

Hi Greg,

Today's linux-next merge of the kdbus tree got a conflict in:

  tools/testing/selftests/Makefile

between commit:

  b6d973441675 ("selftests: add membarrier syscall test")

from Linus' tree and commit:

  b7270dd9f7d4 ("kdbus: add selftests")

from the kdbus tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc tools/testing/selftests/Makefile
index 89b05e2222c9,b57100cefb74..000000000000
--- a/tools/testing/selftests/Makefile
+++ b/tools/testing/selftests/Makefile
@@@ -4,9 -4,8 +4,10 @@@ TARGETS += efivarf
  TARGETS += exec
  TARGETS += firmware
  TARGETS += ftrace
 +TARGETS += futex
  TARGETS += kcmp
+ TARGETS += kdbus
 +TARGETS += membarrier
  TARGETS += memfd
  TARGETS += memory-hotplug
  TARGETS += mount
