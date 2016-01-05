From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the ext4 tree
Date: Tue, 5 Jan 2016 17:01:27 +1100
Message-ID: <20160105170127.29dfcc7a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:33538 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751873AbcAEGBa (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 5 Jan 2016 01:01:30 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Theodore Ts'o <tytso@mit.edu>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Li Xi <pkuelelixi@gmail.com>, Andreas Dilger <adilger@dilger.ca>, Jan Kara <jack@suse.cz>

Hi Ted,

After merging the ext4 tree, today's linux-next build (powerpc
ppc64_defconfig) produced this warning:

fs/ext4/ioctl.c: In function 'ext4_ioctl_setproject':
fs/ext4/ioctl.c:426:1: warning: control reaches end of non-void function [-Wreturn-type]
 }
 ^

Introduced by commit

  e14c6dbc6429 ("ext4: add FS_IOC_FSSETXATTR/FS_IOC_FSGETXATTR interface support")

CONFIG_QUOTA is not set for this build.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
