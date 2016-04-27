From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the gpio
 tree
Date: Wed, 27 Apr 2016 16:06:46 +1000
Message-ID: <20160427160646.486aa3fa@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:42776 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752229AbcD0GGs (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 27 Apr 2016 02:06:48 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jiri Slaby <jslaby@suse.cz>

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in:

  arch/cris/Kconfig

between commit:

  f518abf00d50 ("cris: do away with ARCH_REQUIRE_GPIOLIB")

from the gpio tree and commit:

  11eaeaeaa756 ("exit_thread: remove empty bodies")

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

diff --cc arch/cris/Kconfig
index 99bda1ba3d2f,2b64a96c4483..000000000000
--- a/arch/cris/Kconfig
+++ b/arch/cris/Kconfig
@@@ -61,7 -61,8 +61,8 @@@ config CRI
  	select CLONE_BACKWARDS2
  	select OLD_SIGSUSPEND
  	select OLD_SIGACTION
 -	select ARCH_REQUIRE_GPIOLIB
 +	select GPIOLIB
+ 	select HAVE_EXIT_THREAD if ETRAX_ARCH_V32
  	select IRQ_DOMAIN if ETRAX_ARCH_V32
  	select OF if ETRAX_ARCH_V32
  	select OF_EARLY_FLATTREE if ETRAX_ARCH_V32
