From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: unsigned commits in the gfs2 tree
Date: Mon, 27 Mar 2017 00:22:20 +1100
Message-ID: <20170327002220.0b800d75@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:42157 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751338AbdCZNeU (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 26 Mar 2017 09:34:20 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Steven Whitehouse <swhiteho@redhat.com>, Bob Peterson <rpeterso@redhat.com>
Cc: linux-next@vger.kernel.org

Hi all,

I noticed that a few of the commits in the gfs2 tree
(git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git#for-next)
have no Signed-off-by from their committer.

Also commit e8325475d61e ("Merge commit 'f9fe1c1' into for-next") seems
to merge part of Dave Miller's net-next tree.  You really should have
an explanation of why this is being done.
-- 
Cheers,
Stephen Rothwell
