From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rr tree
Date: Tue, 28 Oct 2008 13:55:58 +1100
Message-ID: <20081028135558.536174c5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:49788 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752089AbYJ1C4F (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 27 Oct 2008 22:56:05 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, Heiko Carstens <heiko.carstens@de.ibm.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>

Hi Rusty,

Today's linux-next merge of the rr tree got a conflict in
arch/s390/Kconfig between commit 0d2a4a69f5a01c8886323afe742487f35493e209
("[S390] convert s390 to generic IPI infrastructure") from the s390 tree
and commit a5f0c6822e6795927091d756c51b51320305654a
("cpumask:centralize-common-maps") from the rr tree.

Just overlapping additions.  I fixed it up (see below) and can carry the fix.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc arch/s390/Kconfig
index abcc7f9,f7270d5..0000000
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@@ -78,7 -75,7 +78,8 @@@ config S39
  	select HAVE_KRETPROBES
  	select HAVE_KVM if 64BIT
  	select HAVE_ARCH_TRACEHOOK
 +	select USE_GENERIC_SMP_HELPERS if SMP
+ 	select INIT_ALL_POSSIBLE
  
  source "init/Kconfig"
  
