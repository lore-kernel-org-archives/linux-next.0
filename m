From: Jaegeuk Kim <jaegeuk@kernel.org>
Subject: Re: linux-next: build failure after merge of the vfs tree
Date: Tue, 16 Oct 2018 09:37:44 -0700
Message-ID: <20181016163744.GA29774@jaegeuk-macbookpro.roam.corp.google.com>
References: <20181003103222.6e1655cd@canb.auug.org.au>
 <20181016111712.33f9dc2e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181016111712.33f9dc2e@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Al Viro <viro@ZenIV.linux.org.uk>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Howells <dhowells@redhat.com>, Daniel Rosenberg <drosen@google.com>
List-Id: linux-next.vger.kernel.org

On 10/16, Stephen Rothwell wrote:
> Hi all,
> 
> On Wed, 3 Oct 2018 10:32:22 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > After merging the vfs tree, today's linux-next build (x86_64 allmodconfig)
> > failed like this:
> > 
> > /home/sfr/next/next/fs/f2fs/super.c: In function 'f2fs_remount':
> > /home/sfr/next/next/fs/f2fs/super.c:1589:16: error: 'MS_RDONLY' undeclared (first use in this function); did you mean 'IS_RDONLY'?
> >   if ((*flags & MS_RDONLY) && test_opt(sbi, DISABLE_CHECKPOINT)) {
> >                 ^~~~~~~~~
> >                 IS_RDONLY
> > 
> > Caused by commit
> > 
> >   dcf8001d292b ("vfs: Suppress MS_* flag defs within the kernel unless explicitly enabled")
> > 
> > interacting with commit
> > 
> >   f80f781514ef ("f2fs: checkpoint disabling")
> > 
> > from the f2fs tree.
> > 
> > I have added the following merge fix patch for today.  If it is correct,
> > I assume that it could be applied to f2fs tree as the the other uses of
> > MS_RDONLY have already been changed to SB_RDONLY.  (There is another
> > use of MS_READONLY in this function that is already cleaned up in the
> > vfs tree commit.)
> 
> Can this be applied to the f2fs tree?

Hi Stephen,

I've modified this patch in f2fs tree to use SB_RDONLY.

Thanks,

> 
> > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > Date: Wed, 3 Oct 2018 10:27:04 +1000
> > Subject: [PATCH] f2fs: update for MS_* flags mostly going away
> > 
> > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > ---
> >  fs/f2fs/super.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> > index 6ed77589ff2b..b612a9e4a35e 100644
> > --- a/fs/f2fs/super.c
> > +++ b/fs/f2fs/super.c
> > @@ -1586,7 +1586,7 @@ static int f2fs_remount(struct super_block *sb, int *flags,
> >  		goto restore_opts;
> >  	}
> >  
> > -	if ((*flags & MS_RDONLY) && test_opt(sbi, DISABLE_CHECKPOINT)) {
> > +	if ((*flags & SB_RDONLY) && test_opt(sbi, DISABLE_CHECKPOINT)) {
> >  		err = -EINVAL;
> >  		f2fs_msg(sbi->sb, KERN_WARNING,
> >  			"disabling checkpoint not compatible with read-only");
> > -- 
> > 2.18.0
> 
> -- 
> Cheers,
> Stephen Rothwell
