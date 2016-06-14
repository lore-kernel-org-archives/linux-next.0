From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the staging tree with the block tree
Date: Tue, 14 Jun 2016 15:07:37 +1000
Message-ID: <20160614150737.015362de@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:49936 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751346AbcFNFHj (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 14 Jun 2016 01:07:39 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>, Jens Axboe <axboe@kernel.dk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, James Simmons <jsimmons@infradead.org>, Mike Christie <mchristi@redhat.com>

Hi Greg,

Today's linux-next merge of the staging tree got a conflict in:

  drivers/staging/lustre/lustre/llite/lloop.c

between commit:

  95fe6c1a209e ("block, fs, mm, drivers: use bio set/get op accessors")

from the block tree and commit:

  67b1a24e883c ("staging: lustre: llite: remove lloop device")

from the staging tree.

I fixed it up (I removed the file) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
