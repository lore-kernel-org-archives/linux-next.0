From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the vfs tree
Date: Thu, 7 Jan 2016 11:42:53 +1100
Message-ID: <20160107114253.19d92b55@canb.auug.org.au>
References: <20151210111847.07db6062@canb.auug.org.au>
	<20151221112301.56bcf3f1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:43324 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751905AbcAGAmz (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 6 Jan 2016 19:42:55 -0500
In-Reply-To: <20151221112301.56bcf3f1@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mike Marshall <hubcap@omnibond.com>

Hi all,

On Mon, 21 Dec 2015 11:23:01 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> On Thu, 10 Dec 2015 11:18:47 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > After merging the vfs tree, today's linux-next build (x86_64 allmodconfig)
> > failed like this:
> > 
> > fs/orangefs/symlink.c:26:2: error: unknown field 'follow_link' specified in initializer
> >   .follow_link = pvfs2_follow_link,
> >   ^
> > fs/orangefs/symlink.c:26:17: warning: initialization from incompatible pointer type [-Wincompatible-pointer-types]
> >   .follow_link = pvfs2_follow_link, 
> >                  ^
> > fs/orangefs/symlink.c:26:17: note: (near initialization for 'pvfs2_symlink_inode_operations.put_link')
> > 
> > Caused by commit
> > 
> >   6b2553918d8b ("replace ->follow_link() with new method that could stay in RCU mode")
> > 
> > [I wish there was some way to stage these API changes :-(]
> > 
> > I applied the following merge fix patch (which may need more work):
> > 
> > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > Date: Thu, 10 Dec 2015 11:12:36 +1100
> > Subject: [PATCH] orangfs: update for follow_link to get_link change
> > 
> > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > ---
> >  fs/orangefs/symlink.c | 12 +++++++++---
> >  1 file changed, 9 insertions(+), 3 deletions(-)
> > 
> > diff --git a/fs/orangefs/symlink.c b/fs/orangefs/symlink.c
> > index 2adfceff7730..dbf24a98a3c9 100644
> > --- a/fs/orangefs/symlink.c
> > +++ b/fs/orangefs/symlink.c
> > @@ -8,9 +8,15 @@
> >  #include "pvfs2-kernel.h"
> >  #include "pvfs2-bufmap.h"
> >  
> > -static const char *pvfs2_follow_link(struct dentry *dentry, void **cookie)
> > +static const char *pvfs2_get_link(struct dentry *dentry, struct inode *inode,
> > +				  void **cookie)
> >  {
> > -	char *target =  PVFS2_I(dentry->d_inode)->link_target;
> > +	char *target;
> > +
> > +	if (!dentry)
> > +		return ERR_PTR(-ECHILD);
> > +
> > +	target =  PVFS2_I(inode)->link_target;
> >  
> >  	gossip_debug(GOSSIP_INODE_DEBUG,
> >  		     "%s: called on %s (target is %p)\n",
> > @@ -23,7 +29,7 @@ static const char *pvfs2_follow_link(struct dentry *dentry, void **cookie)
> >  
> >  struct inode_operations pvfs2_symlink_inode_operations = {
> >  	.readlink = generic_readlink,
> > -	.follow_link = pvfs2_follow_link,
> > +	.get_link = pvfs2_get_link,
> >  	.setattr = pvfs2_setattr,
> >  	.getattr = pvfs2_getattr,
> >  	.listxattr = pvfs2_listxattr,  
> 
> This patch now looks like this (after changes to the orangefs tree):
> 
> diff --git a/fs/orangefs/symlink.c b/fs/orangefs/symlink.c
> index 1b3ae63463dc..01977e88e95d 100644
> --- a/fs/orangefs/symlink.c
> +++ b/fs/orangefs/symlink.c
> @@ -8,9 +8,15 @@
>  #include "orangefs-kernel.h"
>  #include "orangefs-bufmap.h"
>  
> -static const char *orangefs_follow_link(struct dentry *dentry, void **cookie)
> +static const char *orangefs_get_link(struct dentry *dentry, struct inode *inode,
> +				     void **cookie)
>  {
> -	char *target =  ORANGEFS_I(dentry->d_inode)->link_target;
> +	char *target;
> +
> +	if (!dentry)
> +		return ERR_PTR(-ECHILD);
> +
> +	target = ORANGEFS_I(inode)->link_target;
>  
>  	gossip_debug(GOSSIP_INODE_DEBUG,
>  		     "%s: called on %s (target is %p)\n",
> @@ -23,7 +29,7 @@ static const char *orangefs_follow_link(struct dentry *dentry, void **cookie)
>  
>  struct inode_operations orangefs_symlink_inode_operations = {
>  	.readlink = generic_readlink,
> -	.follow_link = orangefs_follow_link,
> +	.get_link = orangefs_get_link,
>  	.setattr = orangefs_setattr,
>  	.getattr = orangefs_getattr,
>  	.listxattr = orangefs_listxattr,

This patch now looks like this (I think this is right):

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 7 Jan 2016 11:37:17 +1100
Subject: [PATCH] orangfs: update for follow_link to get_link change

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 fs/orangefs/symlink.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/fs/orangefs/symlink.c b/fs/orangefs/symlink.c
index 1b3ae63463dc..a21083790fb8 100644
--- a/fs/orangefs/symlink.c
+++ b/fs/orangefs/symlink.c
@@ -8,22 +8,26 @@
 #include "orangefs-kernel.h"
 #include "orangefs-bufmap.h"
 
-static const char *orangefs_follow_link(struct dentry *dentry, void **cookie)
+static const char *orangefs_get_link(struct dentry *dentry, struct inode *inode,
+				     struct delayed_call *done)
 {
-	char *target =  ORANGEFS_I(dentry->d_inode)->link_target;
+	char *target;
+
+	if (!dentry)
+		return ERR_PTR(-ECHILD);
+
+	target =  ORANGEFS_I(dentry->d_inode)->link_target;
 
 	gossip_debug(GOSSIP_INODE_DEBUG,
 		     "%s: called on %s (target is %p)\n",
 		     __func__, (char *)dentry->d_name.name, target);
 
-	*cookie = target;
-
 	return target;
 }
 
 struct inode_operations orangefs_symlink_inode_operations = {
 	.readlink = generic_readlink,
-	.follow_link = orangefs_follow_link,
+	.get_link = orangefs_get_link,
 	.setattr = orangefs_setattr,
 	.getattr = orangefs_getattr,
 	.listxattr = orangefs_listxattr,
-- 
2.6.4

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
