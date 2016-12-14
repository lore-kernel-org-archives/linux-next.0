From: Heiko Carstens <heiko.carstens@de.ibm.com>
Subject: Re: linux-next: Tree for Dec 14
Date: Wed, 14 Dec 2016 21:07:51 +0100
Message-ID: <20161214200751.GA3622@osiris>
References: <20161214152218.3a4fda3d@canb.auug.org.au>
 <CAP=VYLqtuDk-wyHqrp8kySo6Uz4=5QQ_P5qweW_g9W9QkYmzmg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAP=VYLqtuDk-wyHqrp8kySo6Uz4=5QQ_P5qweW_g9W9QkYmzmg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Peter Oberparleiter <oberpar@linux.vnet.ibm.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Wed, Dec 14, 2016 at 11:25:49AM -0500, Paul Gortmaker wrote:
> On Tue, Dec 13, 2016 at 11:22 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > Hi all,
> >
> > Please do not add any material for v4.11 to your linux-next included
> > branches until after v4.10-rc1 has been released.
> >
> > Changes since 20161213:
> >
> > The vfs-miklos tree gained a conflict against the ubifs tree.
> >
> > The akpm-current tree gained a conflict against the jc_docs tree.
> >
> > Non-merge commits (relative to Linus' tree): 4498
> >  4320 files changed, 189429 insertions(+), 94239 deletions(-)
> 
> New s390 build failure today:
> 
> http://kisskb.ellerman.id.au/kisskb/buildresult/12883922/
> 
> I reproduced it locally using the older korg s390 toolchain.
> 
> Reverting this and the file compiles fine:
> 
> commit d543a106f96d6f15e4507cf349128912d44356d9
> Author: Heiko Carstens <heiko.carstens@de.ibm.com>
> Date:   Tue Dec 6 15:52:10 2016 +0100
> 
>     s390: fix initrd corruptions with gcov/kcov instrumented kernels
> 
> Appears old toolchains don't like this commit.
> 
> Paul.

Yes, a fix is ready to be merged soon:

https://git.kernel.org/cgit/linux/kernel/git/s390/linux.git/commit/?h=features&id=75a357341e7c9d3893405ea6f9d722036012dd1f

Thanks,
Heiko
