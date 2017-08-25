From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Signed-off-by missing for commit in the ext4 tree
Date: Fri, 25 Aug 2017 10:01:33 +1000
Message-ID: <20170825100133.31e93cd9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:48467 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753456AbdHYABf (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 24 Aug 2017 20:01:35 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Theodore Ts'o <tytso@mit.edu>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Ted,

Commit

  18c725a653db ("ext4: in ext4_seek_{hole,data}, return -ENXIO for negative offsets")

is missing a Signed-off-by from its committer.

-- 
Cheers,
Stephen Rothwell
