From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the ext4 tree
Date: Mon, 8 Feb 2016 10:50:05 +1100
Message-ID: <20160208105005.438a5419@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Theodore Ts'o <tytso@mit.edu>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Hi Ted,

After merging the ext4 tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

fs/ext4/namei.c: In function 'ext4_lookup':
fs/ext4/namei.c:1572:24: error: 'struct ext4_inode_info' has no member named 'i_crypt_info'
         if (EXT4_I(dir)->i_crypt_info == NULL)
                        ^

i_crypt_info only exists when CONFIG_EXT4_FS_ENCRYPTION is set.

Caused by commit

  676a9962a683 ("ext4 crypto: revalidate dentry after adding or removing the key")

I have used the ext4 tree from next-20160205 for today.

-- 
Cheers,
Stephen Rothwell
