From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the f2fs tree with the fscrypt tree
Date: Mon, 15 Jan 2018 09:17:25 +1100
Message-ID: <20180115091725.07d517a1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:33033 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751321AbeANWR1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 14 Jan 2018 17:17:27 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Theodore Ts'o <tytso@mit.edu>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Eric Biggers <ebiggers@google.com>, Chao Yu <yuchao0@huawei.com>

Hi Jaegeuk,

Today's linux-next merge of the f2fs tree got a conflict in:

  fs/f2fs/namei.c

between commit:

  393c038f5c55 ("f2fs: switch to fscrypt ->symlink() helper functions")

from the fscrypt tree and commit:

  acbf054d537d ("f2fs: inject fault to kzalloc")

from the f2fs tree.

I fixed it up (I just dropped the change to this file from the latter
commit) and can carry the fix as necessary. This is now fixed as far as
linux-next is concerned, but any non trivial conflicts should be mentioned
to your upstream maintainer when your tree is submitted for merging.
You may also want to consider cooperating with the maintainer of the
conflicting tree to minimise any particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
