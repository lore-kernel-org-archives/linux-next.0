From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: error fetching the y2038 tree
Date: Fri, 22 Jul 2016 10:01:59 +1000
Message-ID: <20160722100159.72aa6476@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:42269 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752105AbcGVACC (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 21 Jul 2016 20:02:02 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Arnd,

Fetching the y2038
(git://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git#y2038)
this morning produces this error:

fatal: Couldn't find remote ref refs/heads/y2038

I am still using the last version of this tree I fetched which contains:

4b277763c5b3 vfs: Add support to document max and min inode times
0b38aceef3f3 vfs: Add vfs_time accessors
df5999b78b01 fs: Add current_fs_time_sec() function
549eb7b22e24 AFS: Correctly use 64-bit time for UUID

-- 
Cheers,
Stephen Rothwell
