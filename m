From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rdma tree with Linus' tree
Date: Tue, 22 Mar 2016 11:29:20 +1100
Message-ID: <20160322112920.733aac03@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:51621 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751111AbcCVA3W (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 21 Mar 2016 20:29:22 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Doug Ledford <dledford@redhat.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Bhaktipriya Shridhar <bhaktipriya96@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mitko Haralanov <mitko.haralanov@intel.com>

Hi Doug,

Today's linux-next merge of the rdma tree got a conflict in:

  drivers/staging/rdma/hfi1/user_pages.c

between commit:

  7e43d4d25558 ("staging: rdma: hfi1: Compress return logic")

from Linus' tree and commit:

  0b091fb32c5a ("staging/hfi1: Enable TID caching feature")

from the rdma tree.

I fixed it up (the latter removed the function that was updated in the
former) and can carry the fix as necessary. This is now fixed as far as
linux-next is concerned, but any non trivial conflicts should be mentioned
to your upstream maintainer when your tree is submitted for merging.
You may also want to consider cooperating with the maintainer of the
conflicting tree to minimise any particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
