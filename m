From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Signed-off-by missing for commits in the gfs2 tree
Date: Tue, 31 Oct 2017 16:46:16 +1100
Message-ID: <20171031164523.0361fae4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:46155 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751530AbdJaFqT (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 31 Oct 2017 01:46:19 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Steven Whitehouse <swhiteho@redhat.com>, Bob Peterson <rpeterso@redhat.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andreas Gruenbacher <agruenba@redhat.com>

Hi all,

Commits

  cfdee655b178 ("GFS2: Make height info part of metapath")
  8bdecc2563a5 ("GFS2: flush the log and all pages for jdata as we do for WB_SYNC_ALL")
  1ecfcbf9a59e ("GFS2: Take inode off order_write list when setting jdata flag")

are missing a Signed-off-by from their committer.

-- 
Cheers,
Stephen Rothwell
