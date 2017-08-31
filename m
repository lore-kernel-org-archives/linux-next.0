From: "J. Bruce Fields" <bfields@fieldses.org>
Subject: Re: linux-next: build failure after merge of the nfsd tree
Date: Thu, 31 Aug 2017 11:55:41 -0400
Message-ID: <20170831155541.GA7569@fieldses.org>
References: <20170825102420.3ab48a1b@canb.auug.org.au>
 <20170831094814.1549b70e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170831094814.1549b70e@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Thu, Aug 31, 2017 at 09:48:14AM +1000, Stephen Rothwell wrote:
> On Fri, 25 Aug 2017 10:24:20 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
...
> > fs/nfsd/nfs4proc.c:2405:17: note: (near initialization for 'nfsd4_ops[50].op_release')
> > fs/nfsd/nfs4proc.c: In function 'nfsd4_layoutget_release':
> > fs/nfsd/nfs4proc.c:1442:1: warning: control reaches end of non-void function [-Wreturn-type]
> >  }
> >  ^
> > 
> > Caused by commit
> > 
> >   93e92e5d0016 ("nfsd4: define ->op_release for compound ops")
> > 
> > I have used the nfsd tree from next-20170824 for today.
> 
> I am still getting this failure.

Apologies, it looks like I'd fixed this locally but not pushed it to the
nfsd-next branch.

--b.
