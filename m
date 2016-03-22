From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rdma tree with Linus' tree
Date: Tue, 22 Mar 2016 11:17:37 +1100
Message-ID: <20160322111737.182bd3f9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:35964 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750962AbcCVARk (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 21 Mar 2016 20:17:40 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Doug Ledford <dledford@redhat.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Bhaktipriya Shridhar <bhaktipriya96@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jubin John <jubin.john@intel.com>

Hi Doug,

Today's linux-next merge of the rdma tree got a conflict in:

  drivers/staging/rdma/hfi1/mad.c

between commits:

  a4fe1bc16411 ("staging: rdma: hfi1: Remove casts of pointer to same type")
  acc17d671c62 ("staging: rdma: hfi1: Remove unnecessary parantheses")

from Linus' tree and commit:

  58721b8f8c71 ("staging/rdma/hfi1: Remove unnecessary parentheses")

from the rdma tree.

I fixed it up (the result was like the former) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
