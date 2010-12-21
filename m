From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: [patch] cgroup fs: avoid switching ->d_op on live dentry
Date: Tue, 21 Dec 2010 18:25:51 +0000
Message-ID: <20101221182551.GL19804@ZenIV.linux.org.uk>
References: <AANLkTinod+7fDMwh8_XsQe4mnF1P6WoRWyh36yJXM4LO@mail.gmail.com>
 <20101221085538.GA9133@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20101221085538.GA9133@amd>
Sender: linux-fsdevel-owner@vger.kernel.org
To: Nick Piggin <npiggin@kernel.dk>
Cc: sedat.dilek@gmail.com, systemd-devel@lists.freedesktop.org, linux-fsdevel@vger.kernel.org, linux-next@vger.kernel.org, eparis@redhat.com
List-Id: linux-next.vger.kernel.org

On Tue, Dec 21, 2010 at 07:55:38PM +1100, Nick Piggin wrote:
> On Tue, Dec 21, 2010 at 09:44:40AM +0100, Sedat Dilek wrote:
> > Against linux-next (next-20101210) it should look like:
> 
> Yep, I'll rebase my tree with the fix shortly.
> 
> > 
> > $ diff -Naur cgroup-fix/cgroup-fs-avoid-switching-d_op-on-live-dentry.patch
> > cgroup-fix/cgroup-fs-avoid-switching-d_op-on-live-dentry-v2.patch
> > --- cgroup-fix/cgroup-fs-avoid-switching-d_op-on-live-dentry.patch
> >  2010-12-21 09:31:38.649601964 +0100
> > +++ cgroup-fix/cgroup-fs-avoid-switching-d_op-on-live-dentry-v2.patch
> >  2010-12-21 09:40:21.151033232 +0100
> > @@ -83,7 +83,7 @@
> >                 inode->i_size = 0;
> >                 inode->i_fop = &cgroup_file_operations;
> >         }
> > --      dentry->d_op = &cgroup_dops;
> > +-      d_set_d_op(dentry, &cgroup_dops);
> >         d_instantiate(dentry, inode);
> >         dget(dentry);   /* Extra count - pin the dentry in core */
> >         return 0;

How about not doing that d_set_d_op() at all?  See #d_op in vfs-2.6.git;
just set ->s_d_op to that once and be done with that.  No need to reassign
it on a live dentry...
