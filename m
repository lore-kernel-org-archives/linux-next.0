From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the target-updates tree with the rdma
 tree
Date: Fri, 8 Jan 2016 15:34:57 +1100
Message-ID: <20160108153457.2e08bfdf@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:46697 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753544AbcAHEe6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 7 Jan 2016 23:34:58 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Nicholas A. Bellinger" <nab@linux-iscsi.org>, Doug Ledford <dledford@redhat.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Or Gerlitz <ogerlitz@mellanox.com>

Hi Nicholas,

Today's linux-next merge of the target-updates tree got a conflict in:

  drivers/infiniband/ulp/isert/ib_isert.c

between commit:

  4a061b287b1e ("IB/ulps: Avoid calling ib_query_device")

from the rdma tree and commit:

  373a4cd73782 ("iser-target: Fix non negative ERR_PTR isert_device_get usage")

from the target-updates tree.

I fixed it up (the former removed the code fixed up by the latter)
and can carry the fix as necessary (no action
is required).



-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/
