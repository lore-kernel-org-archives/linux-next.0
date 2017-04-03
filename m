From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the nfsd tree
Date: Mon, 3 Apr 2017 11:09:48 +1000
Message-ID: <20170403110948.3ca5ab8b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "J. Bruce Fields" <bfields@fieldses.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, NeilBrown <neilb@suse.com>
List-Id: linux-next.vger.kernel.org

Hi,

After merging the nfsd tree, today's linux-next build (powerpc
ppc64_defconfig) produced this warning:

fs/nfsd/nfs4state.c: In function 'copy_cred':
fs/nfsd/nfs4state.c:1917:6: warning: unused variable 'ret' [-Wunused-variable]
  int ret;
      ^

Introduced by commit

  d39662236bf8 ("nfsd4: remove pointless strdup_if_nonnull")

Also, that commit has no Signed-off-by from its Author.

-- 
Cheers,
Stephen Rothwell
