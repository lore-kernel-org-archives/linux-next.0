From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the vfs tree with the overlayfs
 tree
Date: Thu, 25 Jan 2018 14:39:47 +1100
Message-ID: <20180125143947.513e895a@canb.auug.org.au>
References: <20180125143155.20b15b37@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180125143155.20b15b37@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Al Viro <viro@ZenIV.linux.org.uk>, Miklos Szeredi <miklos@szeredi.hu>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, NeilBrown <neilb@suse.com>
List-Id: linux-next.vger.kernel.org

Hi all,

On Thu, 25 Jan 2018 14:31:55 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> + 	if (!disconnected) {
>  -		hlist_bl_lock(&tmp->d_sb->s_roots);
>  -		hlist_bl_add_head(&tmp->d_hash, &tmp->d_sb->s_roots);
>  -		hlist_bl_unlock(&tmp->d_sb->s_roots);
> ++		hlist_bl_lock(&dentry->d_sb->s_roots);
> ++		hlist_bl_add_head(&dentry->d_hash, &tmp->d_sb->s_roots);

I fixed up the "tmp" here ... it should have been "dentry".

-- 
Cheers,
Stephen Rothwell
