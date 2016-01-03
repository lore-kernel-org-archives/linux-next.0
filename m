From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the ext4 tree
Date: Mon, 4 Jan 2016 10:34:19 +1100
Message-ID: <20160104103419.56719f0b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:58162 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751130AbcACXeX (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 3 Jan 2016 18:34:23 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Theodore Ts'o <tytso@mit.edu>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Li Xi <pkuelelixi@gmail.com>

Hi Ted,

After merging the ext4 tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

fs/ext4/ioctl.c: In function 'ext4_ioctl_setproject':
fs/ext4/ioctl.c:399:26: error: implicit declaration of function 'dqget' [-Werror=implicit-function-declaration]
  transfer_to[PRJQUOTA] = dqget(sb, make_kqid_projid(kprojid));
                          ^
fs/ext4/ioctl.c:399:24: warning: assignment makes pointer from integer without a cast [-Wint-conversion]
  transfer_to[PRJQUOTA] = dqget(sb, make_kqid_projid(kprojid));
                        ^
fs/ext4/ioctl.c:401:9: error: implicit declaration of function '__dquot_transfer' [-Werror=implicit-function-declaration]
   err = __dquot_transfer(inode, transfer_to);
         ^
fs/ext4/ioctl.c:402:3: error: implicit declaration of function 'dqput' [-Werror=implicit-function-declaration]
   dqput(transfer_to[PRJQUOTA]);
   ^
fs/ext4/super.c: In function 'ext4_statfs_project':
fs/ext4/super.c:4839:10: error: implicit declaration of function 'dqget' [-Werror=implicit-function-declaration]
  dquot = dqget(sb, qid);
          ^
fs/ext4/super.c:4839:8: warning: assignment makes pointer from integer without a cast [-Wint-conversion]
  dquot = dqget(sb, qid);
        ^
fs/ext4/super.c:4866:2: error: implicit declaration of function 'dqput' [-Werror=implicit-function-declaration]
  dqput(dquot);
  ^

CONFIG_QUOTA is not set for this build.

Caused by commit

  92a86644738b ("ext4: add FS_IOC_FSSETXATTR/FS_IOC_FSGETXATTR interface support")

I have used the ext4 tree from next-20151231 for today.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
