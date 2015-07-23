From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the FIXME
 tree
Date: Thu, 23 Jul 2015 16:00:48 +1000
Message-ID: <20150723160048.01a283c5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:59667 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751000AbbGWGAu (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 23 Jul 2015 02:00:50 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Jan Kara <jack@suse.cz>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alexey Dobriyan <adobriyan@gmail.com>

Hi Andrew,

Today's linux-next merge of the akpm-current tree got conflicts in:

  fs/ext3/super.c

between commit:

  106542e7987c ("fs: Remove ext3 filesystem driver")

from the FIXME tree and commit:

  d2c05ecd59bc ("parse_integer: convert ext2, ext3, ext4")

from the akpm-current tree.

I fixed it up (I just removed the file) and can carry the fix as necessary
(no action is required).

Jan, I also removed the JBD section from the MAINTAINERS file ... your
version has conflict markers left around it ...

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
