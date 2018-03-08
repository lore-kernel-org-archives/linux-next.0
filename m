From: Joe Perches <joe@perches.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the rdma-fixes
 tree
Date: Thu, 08 Mar 2018 09:23:12 -0800
Message-ID: <1520529792.11634.12.camel@perches.com>
References: <20180308164058.2ad5a158@canb.auug.org.au>
         <20180308161845.GC6773@mellanox.com> <1520527178.11634.9.camel@perches.com>
         <20180308170317.GE6773@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180308170317.GE6773@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jason Gunthorpe <jgg@mellanox.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Andy Whitcroft <apw@canonical.com>, Doug Ledford <dledford@redhat.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Leon Romanovsky <leonro@mellanox.com>
List-Id: linux-next.vger.kernel.org

On Thu, 2018-03-08 at 10:03 -0700, Jason Gunthorpe wrote:
> On Thu, Mar 08, 2018 at 08:39:38AM -0800, Joe Perches wrote:
> > On Thu, 2018-03-08 at 09:18 -0700, Jason Gunthorpe wrote:
> > > On Thu, Mar 08, 2018 at 04:40:58PM +1100, Stephen Rothwell wrote:
> > > > Hi all,
> > > > 
> > > > Commit
> > > > 
> > > >   aa0de36a40f4 ("RDMA/mlx5: Fix integer overflow while resizing CQ")
> > > > 
> > > > is missing a Signed-off-by from its author.
> > > 
> > > Thanks Stephen,
> > > 
> > > May I suggest to the checkpatch maintainers that checkpack should look
> > > for this too?
> > 
> > No such commit in current -hext
> > $ git status HEAD
> > HEAD detached at next-20180308
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma.git/commit/?h=for-rc&id=aa0de36a40f446f5a21a7c1e677b98206e242edb
> 
> > checkpatch doesn't try to match email sender to sign-off
> > as the email sender doesn't have to sign-off on a patch.
> > 
> > It currently does:
> > 
> > 	if ($is_patch && $has_commit_log && $chk_signoff && $signoff == 0) {
> > 		ERROR("MISSING_SIGN_OFF",
> > 		      "Missing Signed-off-by: line(s)\n");
> > 	}
> 
> If I were to suggest an exact check it would be that the commit git
> author and commit git commiter both have signed-off-by lines,

The git commit committer can't be known by checkpatch.

It just looks at patches.

The original author of any patch can't be known either.

There is a mechanism to add a "From:" line that is
supposed to represent the sender of the patch, but that
person may not be the original author.
