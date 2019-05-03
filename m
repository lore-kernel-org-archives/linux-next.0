From: Mike Marshall <hubcap@omnibond.com>
Subject: Re: linux-next: manual merge of the vfs tree with the orangefs tree
Date: Fri, 3 May 2019 13:34:49 -0400
Message-ID: <CAOg9mSSGUiCoeecpdLs-8-TAMkVDubHK5jG87dGseV4gkGRiOQ@mail.gmail.com>
References: <20190503111510.6e866e3b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190503111510.6e866e3b@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Martin Brandenburg <martin@omnibond.com>
List-Id: linux-next.vger.kernel.org

Hi Stephen...

I noticed the conflict too when I added Al's patch series to the orangefs
tree we have on next. I understood Linus to say he'd fix the conflict the
way you did during the merge window. I guess that means you'll have to
keep fixing it on next until then... I hate causing trouble, let me know if
there's something different I should do to help...

-Mike

On Thu, May 2, 2019 at 9:15 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Today's linux-next merge of the vfs tree got a conflict in:
>
>   fs/orangefs/super.c
>
> between commit:
>
>   77becb76042a ("orangefs: implement xattr cache")
>
> from the orangefs tree and commit:
>
>   f276ae0dd6d0 ("orangefs: make use of ->free_inode()")
>
> from the vfs tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>
> --
> Cheers,
> Stephen Rothwell
>
> diff --cc fs/orangefs/super.c
> index 8fa30c13b7ed,3784f7e8b603..000000000000
> --- a/fs/orangefs/super.c
> +++ b/fs/orangefs/super.c
> @@@ -125,20 -124,9 +125,19 @@@ static struct inode *orangefs_alloc_ino
>         return &orangefs_inode->vfs_inode;
>   }
>
> - static void orangefs_i_callback(struct rcu_head *head)
> + static void orangefs_free_inode(struct inode *inode)
>   {
> -       struct inode *inode = container_of(head, struct inode, i_rcu);
>  -      kmem_cache_free(orangefs_inode_cache, ORANGEFS_I(inode));
>  +      struct orangefs_inode_s *orangefs_inode = ORANGEFS_I(inode);
>  +      struct orangefs_cached_xattr *cx;
>  +      struct hlist_node *tmp;
>  +      int i;
>  +
>  +      hash_for_each_safe(orangefs_inode->xattr_cache, i, tmp, cx, node) {
>  +              hlist_del(&cx->node);
>  +              kfree(cx);
>  +      }
>  +
>  +      kmem_cache_free(orangefs_inode_cache, orangefs_inode);
>   }
>
>   static void orangefs_destroy_inode(struct inode *inode)
> @@@ -148,17 -136,8 +147,15 @@@
>         gossip_debug(GOSSIP_SUPER_DEBUG,
>                         "%s: deallocated %p destroying inode %pU\n",
>                         __func__, orangefs_inode, get_khandle_from_ino(inode));
> -
> -       call_rcu(&inode->i_rcu, orangefs_i_callback);
>   }
>
>  +static int orangefs_write_inode(struct inode *inode,
>  +                              struct writeback_control *wbc)
>  +{
>  +      gossip_debug(GOSSIP_SUPER_DEBUG, "orangefs_write_inode\n");
>  +      return orangefs_inode_setattr(inode);
>  +}
>  +
>   /*
>    * NOTE: information filled in here is typically reflected in the
>    * output of the system command 'df'
> @@@ -316,8 -295,8 +313,9 @@@ void fsid_key_table_finalize(void
>
>   static const struct super_operations orangefs_s_ops = {
>         .alloc_inode = orangefs_alloc_inode,
> +       .free_inode = orangefs_free_inode,
>         .destroy_inode = orangefs_destroy_inode,
>  +      .write_inode = orangefs_write_inode,
>         .drop_inode = generic_delete_inode,
>         .statfs = orangefs_statfs,
>         .remount_fs = orangefs_remount_fs,
