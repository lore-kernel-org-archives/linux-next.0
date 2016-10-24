From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: bad commit in the device-mapper tree
Date: Tue, 25 Oct 2016 09:26:22 +1100
Message-ID: <20161025092622.09282aad@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:47779 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751335AbcJXW0Y (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 24 Oct 2016 18:26:24 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alasdair G Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi all,

In today's device-mapper tree
(git://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git#for-next)
I noticed that commit

  a6e3a623e7d9 ("dm cache metadata: DM_CACHE_FEATURE_INCOMPAT_SEP_DIRTY_BITS")

has no Signed-off-by tags.

-- 
Cheers,
Stephen Rothwell
