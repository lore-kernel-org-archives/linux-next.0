From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Signed-off-by missing for commit in the ext4 tree
Date: Mon, 18 Dec 2017 07:46:55 +1100
Message-ID: <20171218074655.4f892db2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:60839 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1757370AbdLQUq6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 17 Dec 2017 15:46:58 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Theodore Ts'o <tytso@mit.edu>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Chandan Rajendra <chandan@linux.vnet.ibm.com>

Hi Ted,

Commit

  9d5afec6b8bd ("ext4: fix crash when a directory's i_size is too small")

is missing a Signed-off-by from its committer.

-- 
Cheers,
Stephen Rothwell
