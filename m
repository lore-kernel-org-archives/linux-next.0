From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the vhost
 tree
Date: Fri, 8 Jan 2016 16:59:08 +1100
Message-ID: <20160108165908.2da89bfd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:43987 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750851AbcAHF7K (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 8 Jan 2016 00:59:10 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Minchan Kim <minchan@kernel.org>

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in:

  mm/balloon_compaction.c

between commit:

  0b5ffdb4f7c6 ("balloon: fix page list locking")

from the vhost tree and commit:

  0c983ec0c078 ("virtio_balloon: fix race between migration and ballooning")

from the akpm-current tree.

I fixed it up (I think that the former is a superset of the latter, so
I used that, completely reversing the latter patch) and can carry the
fix as necessary (no action is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
