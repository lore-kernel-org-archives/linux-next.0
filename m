From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the kspp
 tree
Date: Wed, 27 Jul 2016 16:23:43 +1000
Message-ID: <20160727162343.4e103919@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:46619 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751452AbcG0GXp (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 27 Jul 2016 02:23:45 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in:

  Makefile

between commit:

  228d96c603cf ("kbuild: Abort build on bad stack protector flag")

from the kspp tree and commit:

  f273155b8dc7 ("kbuild: abort build on bad stack protector flag")

from the akpm-current tree.

I fixed it up (I just arbitrarily used the version from the kspp tree)
and can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
