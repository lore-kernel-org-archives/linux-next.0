From: Thiemo Nagel <thiemo.nagel@ph.tum.de>
Subject: Re: [PATCH v2] ext4: add checks of block references for non-extent
 inodes
Date: Tue, 31 Mar 2009 10:41:27 +0200
Message-ID: <49D1D737.9080105@ph.tum.de>
References: <49B94396.2020800@ph.tum.de> <49C3A51C.1030201@ph.tum.de>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------050607010509040606020502"
Return-path: <linux-ext4-owner@vger.kernel.org>
In-Reply-To: <49C3A51C.1030201@ph.tum.de>
Sender: linux-ext4-owner@vger.kernel.org
To: Theodore Ts'o <tytso@mit.edu>, "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>, sfr@canb.auug.org.au
Cc: Ext4 Developers List <linux-ext4@vger.kernel.org>, linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org

This is a multi-part message in MIME format.
--------------050607010509040606020502
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Dear Ted, Aneesh, Stephen,

thanks a lot for your comments and fixes!  The attached patch (applied 
on-top) should fix the
* buffer head leak spotted by Aneesh
* warning reported by Stephen

Kind regards,

Signed-off-by: Thiemo Nagel <thiemo.nagel@ph.tum.de>




--------------050607010509040606020502
Content-Type: text/x-patch;
 name="fixup-blockref-checks.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="fixup-blockref-checks.patch"

diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index 9ab845e..69715e5 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -380,9 +380,9 @@ static int __ext4_check_blockref(const char *function, struct inode *inode,
 		if (unlikely(*bref >= maxblocks)) {
 			ext4_error(inode->i_sb, function,
 				   "block reference %u >= max (%u) "
-				   "in inode #%lu, offset=%u",
+				   "in inode #%lu, offset=%i",
 				   *bref, maxblocks,
-				   inode->i_ino, bref-p);
+				   inode->i_ino, (int)(bref-p));
  			return -EIO;
  		}
 		bref++;
@@ -453,8 +453,10 @@ static Indirect *ext4_get_branch(struct inode *inode, int depth,
 				goto failure;
 			}
 			/* validate block references */
-			if (ext4_check_indirect_blockref(inode, bh))
+			if (ext4_check_indirect_blockref(inode, bh)) {
+				put_bh(bh);
 				goto failure;
+			}
 		}
 		
 		add_chain(++p, bh, (__le32 *)bh->b_data + *++offsets);

--------------050607010509040606020502--
