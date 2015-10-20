From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the nfs tree
Date: Tue, 20 Oct 2015 15:37:29 +1100
Message-ID: <20151020153729.732c0fb6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Trond Myklebust <trond.myklebust@fys.uio.no>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Peng Tao <tao.peng@primarydata.com>
List-Id: linux-next.vger.kernel.org

Hi Trond,

After merging the nfs tree, today's linux-next build (powerpc allyesconfig
produced this warning:

./usr/include/linux/nfs.h:40: found __[us]{8,16,32,64} type without #include <linux/types.h>

Introduced by commit

  a340abcf4173 ("nfs42: add NFS_IOC_CLONE_RANGE ioctl")

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
