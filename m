From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the xfs tree
Date: Tue, 9 Feb 2016 11:17:21 +1100
Message-ID: <20160209111721.359f8558@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Ben Myers <bpm@sgi.com>, David Chinner <david@fromorbit.com>, xfs@oss.sgi.com
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Hi all,

After merging the xfs tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

ERROR: "xfs_rtbuf_ops" [fs/xfs/xfs.ko] undefined!

Caused by commit

  ca4de5c7e86a ("xfs: RT bitmap and summary buffers need verifiers")

CONFIG_XFS_RT is not set for this build.

I have used the xfs tree from next-20160208 for today.

-- 
Cheers,
Stephen Rothwell
