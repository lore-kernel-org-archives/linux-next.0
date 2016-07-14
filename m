From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvm tree with the s390 tree
Date: Thu, 14 Jul 2016 14:03:34 +1000
Message-ID: <20160714140334.7009275f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:60607 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750934AbcGNEDh (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 14 Jul 2016 00:03:37 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Marcelo Tosatti <mtosatti@redhat.com>, Gleb Natapov <gleb@kernel.org>, kvm@vger.kernel.org, Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, David Hildenbrand <dahi@linux.vnet.ibm.com>

Hi all,

Today's linux-next merge of the kvm tree got a conflict in:

  arch/s390/mm/gmap.c

between commit:

  f04540298440 ("s390/mm: fix gmap tlb flush issues")

from the s390 tree and commit:

  6ea427bbbd40 ("s390/mm: add reference counter to gmap structure")

from the kvm tree.

I fixed it up (I just assumed that the update to gmap_free is no longer
needed) and can carry the fix as necessary. This is now fixed as far as
linux-next is concerned, but any non trivial conflicts should be mentioned
to your upstream maintainer when your tree is submitted for merging.
You may also want to consider cooperating with the maintainer of the
conflicting tree to minimise any particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
