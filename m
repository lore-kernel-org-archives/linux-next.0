From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the ext4
 tree
Date: Fri, 1 Jul 2016 15:35:24 +1000
Message-ID: <20160701153524.16bc4757@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:41433 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751912AbcGAFf0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 1 Jul 2016 01:35:26 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Theodore Ts'o <tytso@mit.edu>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jan Kara <jack@suse.cz>, Fabian Frederick <fabf@skynet.be>, Christoph Hellwig <hch@infradead.org>, Lukas Czerner <lczerner@redhat.com>

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in:

  fs/ext4/fsync.c

between commit:

  78d962510796 ("ext4: respect the nobarrier mount option in nojournal mode")

from the ext4 tree and commit:

  045d9e206ac0 ("fs/ext4/fsync.c: generic_file_fsync call based on barrier flag")

from the akpm-current tree.

I fixed it up (I used the ext4 tree version) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
