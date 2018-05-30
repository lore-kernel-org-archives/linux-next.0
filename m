From: Trond Myklebust <trondmy@gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the nfs tree
Date: Wed, 30 May 2018 18:26:34 -0400
Message-ID: <CAABAsM5W+LsPD_+Fxi_3FePoCBThFjhx15seGA=iZFi-v0XtTA@mail.gmail.com>
References: <20180531072629.6e19241b@canb.auug.org.au> <CAABAsM7VZcJvtSnbebOAWEAZ7oTkV6JXJF=GxOj=zLYgjSGQ_Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAABAsM7VZcJvtSnbebOAWEAZ7oTkV6JXJF=GxOj=zLYgjSGQ_Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: List Linux Next Mailing <linux-next@vger.kernel.org>, linux-kernel@vger.kernel.org, Neil Brown <neilb@suse.com>
List-Id: linux-next.vger.kernel.org

Note that there is another known problem with that linux-next branch
with the patch "NFSv4: Fix sillyrename to return the delegation when
appropriate". You might therefore just want to drop that branch for
today. It will be fixed up later tonight.
On Wed, 30 May 2018 at 18:22, Trond Myklebust <trondmy@gmail.com> wrote:
>
> Hi Stephen,
>
> Thanks for noticing and apologies for missing that. I'll take that
> patch out until Neil can update it.
>
> Cheers
>   Trond
> On Wed, 30 May 2018 at 17:26, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Hi Trond,
> >
> > Commit
> >
> >   f217ebf24480 ("NFS: slight optimization for walking list for delegations")
> >
> > is missing a Signed-off-by from its author.
> >
> > --
> > Cheers,
> > Stephen Rothwell
