From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the ext4 tree
Date: Thu, 23 Jul 2015 10:56:23 +1000
Message-ID: <20150723105623.2f8c9548@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:55337 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752585AbbGWA4Z (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 22 Jul 2015 20:56:25 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Theodore Ts'o <tytso@mit.edu>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tejun Heo <tj@kernel.org>

Hi Theodore,

After merging the ext4 tree, today's linux-next build (x86_64
allmodconfig) failed like this:

ERROR: "wbc_account_io" [fs/ext4/ext4.ko] undefined!
ERROR: "bio_associate_blkcg" [fs/ext4/ext4.ko] undefined!

Caused by commit

  001e4a8775f6 ("ext4: implement cgroup writeback support")

I have used the ext4 tree from next-20150722 for today.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
