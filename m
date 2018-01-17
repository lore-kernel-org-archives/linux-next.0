From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the f2fs tree
Date: Thu, 18 Jan 2018 10:04:30 +1100
Message-ID: <20180118100430.4fc0151e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chris Mason <clm@fb.com>, Josef Bacik <jbacik@fb.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Yufen Yu <yuyufen@huawei.com>, Tejun Heo <tj@kernel.org>
List-Id: linux-next.vger.kernel.org

Hi Jaegeuk,

After merging the f2fs tree, today's linux-next build (x86_64
allmodconfig) failed like this:

/home/sfr/next/next/fs/f2fs/super.c: In function 'f2fs_fill_super':
/home/sfr/next/next/fs/f2fs/super.c:2563:18: error: 'SB_I_CGROUPWB' undeclared (first use in this function); did you mean 'S_CGROUPWB'?
  sb->s_iflags |= SB_I_CGROUPWB;
                  ^~~~~~~~~~~~~
                  S_CGROUPWB

Caused by commit

  578c647879f7 ("f2fs: implement cgroup writeback support")

interacting with commit

  34934189a3dd ("cgroup, writeback: replace SB_I_CGROUPWB with per-inode S_CGROUPWB"

from the btrfs tree.

I have reverted the f2fs tree commit for today, but a better resolution
would be appreciated.

-- 
Cheers,
Stephen Rothwell
