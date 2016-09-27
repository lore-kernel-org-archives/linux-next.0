From: Jan Kara <jack@suse.cz>
Subject: Re: linux-next: manual merge of the vfs-jk tree with the fuse tree
Date: Tue, 27 Sep 2016 09:41:31 +0200
Message-ID: <20160927074131.GB1139@quack2.suse.cz>
References: <20160927101204.19fdab82@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:60200 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752814AbcI0Hle (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 27 Sep 2016 03:41:34 -0400
Content-Disposition: inline
In-Reply-To: <20160927101204.19fdab82@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jan Kara <jack@suse.cz>, Miklos Szeredi <miklos@szeredi.hu>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Stephen,

On Tue 27-09-16 10:12:04, Stephen Rothwell wrote:
> Today's linux-next merge of the vfs-jk tree got a conflict in:
> 
>   fs/fuse/dir.c
> 
> between commits:
> 
>   3b3fb74935ce ("fuse: invalidate dir dentry after chmod")
>   5f69e628df75 ("fuse: fix killing s[ug]id in setattr")
> 
> from the fuse tree and commit:
> 
>   62490330769c ("fuse: Propagate dentry down to inode_change_ok()")
> 
> from the vfs-jk tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This

Thanks! The resolution looks good to me.

								Honza

-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
