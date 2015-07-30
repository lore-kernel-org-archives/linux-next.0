From: "J. Bruce Fields" <bfields@fieldses.org>
Subject: Re: linux-next: manual merge of the nfsd tree with Linus' tree
Date: Wed, 29 Jul 2015 22:12:12 -0400
Message-ID: <20150730021212.GB25234@fieldses.org>
References: <20150730112325.72240f81@canb.auug.org.au>
 <CAHQdGtSeaDoFp2mztbAdk4jTX55ox9Qb+YGV3wKhOF1teZCPXg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAHQdGtSeaDoFp2mztbAdk4jTX55ox9Qb+YGV3wKhOF1teZCPXg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Trond Myklebust <trond.myklebust@primarydata.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Wed, Jul 29, 2015 at 09:35:11PM -0400, Trond Myklebust wrote:
> Hi Stephen,
> 
> On Wed, Jul 29, 2015 at 9:23 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > Hi all,
> >
> > Today's linux-next merge of the nfsd tree got a conflict in:
> >
> >   fs/nfs/nfs42proc.c
> >
> > between commit:
> >
> >   bdcc2cd14e4e ("NFSv4.2: handle NFS-specific llseek errors")
> >
> > from Linus' tree and commit:
> >
> >   0183ae17c741 ("NFSv4.2: handle NFS-specific llseek errors")
> >
> > from the nfsd tree.
> >
> > The only difference here is that _nfs42_proc_llseek is static in the
> > former, so I used that.

Whoops, thanks, I shouldn't have even had that one in my tree....

> Yes, I snuck that declaration into the patch since it was obvious that
> we would never want to export _nfs42_proc_llseek(), and because
> "sparse" complained. Apologies if that caused a conflict...

I actually noticed that, then noticed a bunch of other stuff there had
the same problem, then started to make a patch to fix all those in one
fell swoop, then decided I was being annoying and dropped it.

Um.

--b.
