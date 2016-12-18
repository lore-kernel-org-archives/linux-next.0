From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the overlayfs tree with Linus' tree
Date: Mon, 19 Dec 2016 10:25:55 +1100
Message-ID: <20161219102555.15519eee@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:34281 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751697AbcLRXZ7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 18 Dec 2016 18:25:59 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Miklos,

Today's linux-next merge of the overlayfs tree got conflicts in:

  fs/overlayfs/dir.c
  fs/overlayfs/inode.c

I am pretty sure thses conflicts only exist because the overlayfs tree
was rebased before being merged by Linus.  I am dropping the oevrlay fs
tree for today.  Please clean it up.

-- 
Cheers,
Stephen Rothwell
