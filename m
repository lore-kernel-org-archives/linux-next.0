From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warnings after merge of the overlayfs tree
Date: Wed, 8 Mar 2017 10:16:43 +1100
Message-ID: <20170308101643.0bc34e88@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:43961 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S933426AbdCHA4H (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 7 Mar 2017 19:56:07 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Amir Goldstein <amir73il@gmail.com>

Hi Miklos,

After merging the overlayfs tree, today's linux-next build (powerpc
ppc64_defconfig) produced these warnings:

fs/overlayfs/inode.c:322:30: warning: 'ovl_i_mutex_key' defined but not used [-Wunused-variable]
 static struct lock_class_key ovl_i_mutex_key[FILESYSTEM_MAX_STACK_DEPTH];
                              ^
fs/overlayfs/inode.c:323:30: warning: 'ovl_i_mutex_dir_key' defined but not used [-Wunused-variable]
 static struct lock_class_key ovl_i_mutex_dir_key[FILESYSTEM_MAX_STACK_DEPTH];
                              ^

Introduced by commit

  a41471e8eff8 ("ovl: lockdep annotate of nested stacked overlayfs inode lock")

CONFIG_LOCKDEP is not set for this build.

-- 
Cheers,
Stephen Rothwell
