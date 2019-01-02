From: Chandan Rajendra <chandan@linux.ibm.com>
Subject: Re: linux-next: manual merge of the f2fs tree with the fscrypt tree
Date: Wed, 02 Jan 2019 10:26:09 +0530
Message-ID: <2265186.H1UptfE7Oa@localhost.localdomain>
References: <20181211101322.438946fe@canb.auug.org.au> <20190102112610.3bc5fb97@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190102112610.3bc5fb97@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Theodore Ts'o <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Chandan Rajendra <chandan@linux.vnet.ibm.com>
List-Id: linux-next.vger.kernel.org

On Wednesday, January 2, 2019 5:56:10 AM IST Stephen Rothwell wrote:
> Hi all,
> 
> On Tue, 11 Dec 2018 10:13:22 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Today's linux-next merge of the f2fs tree got a conflict in:
> > 
> >   fs/f2fs/dir.c
> > 
> > between commit:
> > 
> >   848a010287e6 ("f2fs: use IS_ENCRYPTED() to check encryption status")
> > 
> > from the fscrypt tree and commit:
> > 
> >   4e240d1bab1e ("f2fs: check memory boundary by insane namelen")
> > 
> > from the f2fs tree.
> > 
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
> > 
> 
> This is now a conflict between the fscrypt tree and Linus' tree.
> 
> 

fscrypt's master branch has fsverity patches applied. These are not available
on Linus' tree. Hence the conflict.

Just FYI, The discussion on merging fsverity into mainline kernel is still
going on.

-- 
chandan
