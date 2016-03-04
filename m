From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the device-mapper tree
Date: Fri, 4 Mar 2016 13:59:33 +1100
Message-ID: <20160304135933.0ba93056@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:47389 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750874AbcCDC7g (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 3 Mar 2016 21:59:36 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alasdair G Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi all,

After merging the device-mapper tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

drivers/md/dm.c: In function '__split_and_process_non_flush':
drivers/md/dm.c:1761:6: error: 'ret' undeclared (first use in this function)
  if (ret < 0)
      ^

Caused by commit

  f838997d1784 ("dm: return error if bio_integrity_clone() fails in clone_bio()")

That one is a bit annoying ... clearly not build tested :-(

I have used the device-mapper tree from next-20160303 for today.

-- 
Cheers,
Stephen Rothwell
