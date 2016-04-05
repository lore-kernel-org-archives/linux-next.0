From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: please clean up the ceph tree
Date: Tue, 5 Apr 2016 10:42:28 +1000
Message-ID: <20160405104228.22b0de07@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:41483 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751368AbcDEAmd (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 4 Apr 2016 20:42:33 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sage Weil <sage@newdream.net>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Sage,

It appears that the ceph tree was completely rebased before asking Linus to
merge it (to remove its first commit (ebfadc523e06 "[DO NOT MERGE] rbd:
bump RBD_MAX_PARENT_CHAIN_LEN to 128")).  Please clean it up as it is
starting to produce comflicts in linux-next (against Linus' tree so far).

-- 
Cheers,
Stephen Rothwell
