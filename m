From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the overlayfs tree
Date: Wed, 17 May 2017 10:19:56 +1000
Message-ID: <20170517101956.69c03d78@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:38319 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751181AbdEQAUA (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 16 May 2017 20:20:00 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Amir Goldstein <amir73il@gmail.com>

Hi Miklos,

After merging the overlayfs tree, today's linux-next build (powerpc
ppc64_defconfig) produced this warning:

fs/overlayfs/dir.c: In function 'ovl_rename':
fs/overlayfs/dir.c:1060:2: warning: 'newdentry' may be used uninitialized in this function [-Wmaybe-uninitialized]
  dput(newdentry);
  ^
fs/overlayfs/dir.c:1062:2: warning: 'olddentry' may be used uninitialized in this function [-Wmaybe-uninitialized]
  dput(olddentry);
  ^

Introduced by commit

  02cac3227a28 ("ovl: mark upper dir with type origin entries "impure"")

-- 
Cheers,
Stephen Rothwell
