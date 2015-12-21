From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the vfs tree
Date: Mon, 21 Dec 2015 11:23:01 +1100
Message-ID: <20151221112301.56bcf3f1@canb.auug.org.au>
References: <20151210111847.07db6062@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151210111847.07db6062@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mike Marshall <hubcap@omnibond.com>
List-Id: linux-next.vger.kernel.org

Hi Stephen,

On Thu, 10 Dec 2015 11:18:47 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi Al,
> 
> After merging the vfs tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
> 
> fs/orangefs/symlink.c:26:2: error: unknown field 'follow_link' specified in initializer
>   .follow_link = pvfs2_follow_link,
>   ^
> fs/orangefs/symlink.c:26:17: warning: initialization from incompatible pointer type [-Wincompatible-pointer-types]
>   .follow_link = pvfs2_follow_link, 
>                  ^
> fs/orangefs/symlink.c:26:17: note: (near initialization for 'pvfs2_symlink_inode_operations.put_link')
> 
> Caused by commit
> 
>   6b2553918d8b ("replace ->follow_link() with new method that could stay in RCU mode")
> 
> [I wish there was some way to stage these API changes :-(]
> 
> I applied the following merge fix patch (which may need more work):
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Thu, 10 Dec 2015 11:12:36 +1100
> Subject: [PATCH] orangfs: update for follow_link to get_link change
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  fs/orangefs/symlink.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/orangefs/symlink.c b/fs/orangefs/symlink.c
> index 2adfceff7730..dbf24a98a3c9 100644
> --- a/fs/orangefs/symlink.c
> +++ b/fs/orangefs/symlink.c
> @@ -8,9 +8,15 @@
>  #include "pvfs2-kernel.h"
>  #include "pvfs2-bufmap.h"
>  
> -static const char *pvfs2_follow_link(struct dentry *dentry, void **cookie)
> +static const char *pvfs2_get_link(struct dentry *dentry, struct inode *inode,
> +				  void **cookie)
>  {
> -	char *target =  PVFS2_I(dentry->d_inode)->link_target;
> +	char *target;
> +
> +	if (!dentry)
> +		return ERR_PTR(-ECHILD);
> +
> +	target =  PVFS2_I(inode)->link_target;
>  
>  	gossip_debug(GOSSIP_INODE_DEBUG,
>  		     "%s: called on %s (target is %p)\n",
> @@ -23,7 +29,7 @@ static const char *pvfs2_follow_link(struct dentry *dentry, void **cookie)
>  
>  struct inode_operations pvfs2_symlink_inode_operations = {
>  	.readlink = generic_readlink,
> -	.follow_link = pvfs2_follow_link,
> +	.get_link = pvfs2_get_link,
>  	.setattr = pvfs2_setattr,
>  	.getattr = pvfs2_getattr,
>  	.listxattr = pvfs2_listxattr,

This patch now looks like this (after changes to the orangefs tree):

diff --git a/fs/orangefs/symlink.c b/fs/orangefs/symlink.c
index 1b3ae63463dc..01977e88e95d 100644
--- a/fs/orangefs/symlink.c
+++ b/fs/orangefs/symlink.c
@@ -8,9 +8,15 @@
 #include "orangefs-kernel.h"
 #include "orangefs-bufmap.h"
 
-static const char *orangefs_follow_link(struct dentry *dentry, void **cookie)
+static const char *orangefs_get_link(struct dentry *dentry, struct inode *inode,
+				     void **cookie)
 {
-	char *target =  ORANGEFS_I(dentry->d_inode)->link_target;
+	char *target;
+
+	if (!dentry)
+		return ERR_PTR(-ECHILD);
+
+	target = ORANGEFS_I(inode)->link_target;
 
 	gossip_debug(GOSSIP_INODE_DEBUG,
 		     "%s: called on %s (target is %p)\n",
@@ -23,7 +29,7 @@ static const char *orangefs_follow_link(struct dentry *dentry, void **cookie)
 
 struct inode_operations orangefs_symlink_inode_operations = {
 	.readlink = generic_readlink,
-	.follow_link = orangefs_follow_link,
+	.get_link = orangefs_get_link,
 	.setattr = orangefs_setattr,
 	.getattr = orangefs_getattr,
 	.listxattr = orangefs_listxattr,

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
