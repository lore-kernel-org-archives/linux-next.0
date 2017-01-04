From: Theodore Ts'o <tytso@mit.edu>
Subject: Please add fscrypt.git to linux-next
Date: Tue, 3 Jan 2017 23:44:24 -0500
Message-ID: <20170104044424.jcztr7swmyjc2cwn@thunk.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from imap.thunk.org ([74.207.234.97]:36858 "EHLO imap.thunk.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752439AbdADFuT (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 4 Jan 2017 00:50:19 -0500
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Could you please add:

git://git.kernel.org/pub/scm/linux/kernel/git/tytso/fscrypt.git  master

To the linux-next tree?  I was previously feeding fscrypt changes by
merging them into the ext4.git dev branch, but it will make life
simpler if we have a separate git tree for it.

Linus has already accepted a pull request from the for-stable branch
of fscrypt.git.  I plan to send a separate pull request for the master
branch of fscrypt.git during the next merge window.

Thanks!!

						- Ted
