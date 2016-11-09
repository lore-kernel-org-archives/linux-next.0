From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm tree with the jc_docs tree
Date: Wed, 9 Nov 2016 15:19:15 +1100
Message-ID: <20161109151915.16d93e4b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:48101 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751226AbcKIEUA (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 8 Nov 2016 23:20:00 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jani Nikula <jani.nikula@intel.com>, Mimi Zohar <zohar@linux.vnet.ibm.com>

Hi Andrew,

Today's linux-next merge of the akpm tree got a conflict in:

  Documentation/admin-guide/kernel-parameters.rst

between commit:

  e52347bd66f6 ("Documentation/admin-guide: split the kernel parameter list to a separate file")

from the jc_docs tree and patch:

  "ima: define a canonical binary_runtime_measurements list format"

from the akpm tree.

I fixed it up (I moved the change to
Documentation/admin-guide/kernel-parameters.txt) and can carry the fix
as necessary. This is now fixed as far as linux-next is concerned, but
any non trivial conflicts should be mentioned to your upstream
maintainer when your tree is submitted for merging.  You may also want
to consider cooperating with the maintainer of the conflicting tree to
minimise any particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
