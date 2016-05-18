From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the dax-misc tree with the nvdimm tree
Date: Wed, 18 May 2016 13:34:13 +1000
Message-ID: <20160518133413.7b76b99e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:35136 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751546AbcERDeP (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 17 May 2016 23:34:15 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Verma, Vishal L" <vishal.l.verma@intel.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>, Jan Kara <jack@suse.cz>

Hi all,

Today's linux-next merge of the dax-misc tree got a conflict in:

  fs/block_dev.c

between commit:

  8044aae6f374 ("Revert "block: enable dax for raw block devices"")

from the nvdimm tree and commit:

  02fbd139759f ("dax: Remove complete_unwritten argument")

from the dax-misc tree.

I fixed it up (the former removed the code modified by the latter) and
can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
