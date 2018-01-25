From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the iversion tree with the nfsd tree
Date: Thu, 25 Jan 2018 15:42:13 +1100
Message-ID: <20180125154213.19909bab@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jeff Layton <jlayton@kernel.org>, "J. Bruce Fields" <bfields@fieldses.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Amir Goldstein <amir73il@gmail.com>
List-Id: linux-next.vger.kernel.org

Hi Jeff,

Today's linux-next merge of the iversion tree got a conflict in:

  fs/nfsd/nfsfh.h

between commit:

  3ac71a649c3d ("nfsd: store stat times in fill_pre_wcc() instead of inode times")

from the nfsd tree and commit:

  8ace40dfbdf4 ("nfsd: convert to new i_version API")

from the iversion tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc fs/nfsd/nfsfh.h
index 99be87b50ebe,b8444189223b..000000000000
--- a/fs/nfsd/nfsfh.h
+++ b/fs/nfsd/nfsfh.h
@@@ -257,10 -257,10 +258,10 @@@ static inline u64 nfsd4_change_attribut
  {
  	u64 chattr;
  
 -	chattr =  inode->i_ctime.tv_sec;
 +	chattr =  stat->ctime.tv_sec;
  	chattr <<= 30;
 -	chattr += inode->i_ctime.tv_nsec;
 +	chattr += stat->ctime.tv_nsec;
- 	chattr += inode->i_version;
+ 	chattr += inode_query_iversion(inode);
  	return chattr;
  }
  
