From: "Nicholas A. Bellinger" <nab@linux-iscsi.org>
Subject: Re: Updated target-pending.git branches for linux-next
Date: Wed, 26 Oct 2011 12:44:01 -0700
Message-ID: <1319658241.421.1.camel@haakon2.linux-iscsi.org>
References: <1319436327.15576.4.camel@haakon2.linux-iscsi.org>
	 <1319573050.6463.2.camel@haakon2.linux-iscsi.org>
	 <20111027023405.f4f5d5b24eb504119c59892c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <target-devel-owner@vger.kernel.org>
In-Reply-To: <20111027023405.f4f5d5b24eb504119c59892c@canb.auug.org.au>
Sender: target-devel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next <linux-next@vger.kernel.org>, target-devel <target-devel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>
List-Id: linux-next.vger.kernel.org

On Thu, 2011-10-27 at 02:34 +1100, Stephen Rothwell wrote:
> Hi Nicholas,
> 
> On Tue, 25 Oct 2011 13:04:10 -0700 "Nicholas A. Bellinger" <nab@linux-iscsi.org> wrote:
> >
> > On Sun, 2011-10-23 at 23:05 -0700, Nicholas A. Bellinger wrote:
> > > 
> > > The target-pending.git tree is now back on kernel.org, and as before
> > > the following branch is used as 'for-next' updates to existing
> > > drivers/target/ code:
> > > 
> > >   git://git.kernel.org/pub/scm/linux/kernel/git/nab/target-pending.git for-next
> > > 
> > > I've also added another branch that is being used for new target modules
> > > being merged in the next development cycle:
> > > 
> > >   git://git.kernel.org/pub/scm/linux/kernel/git/nab/target-pending.git for-next-merge
> > > 
> > > If you would be so kind, please go ahead and add the second entry as well
> > > into your linux-next daily builds.
> > 
> > Just another friendly reminder to please add the for-next-merge branch
> > into Next/Trees..  Also if you would, please change the tree names to
> > 'target-updates' and 'target-merge' respectively.
> 
> You said above that the for-next-merge branch is for "new target modules
> being merged in the next development cycle" which I assumed to mean that
> they would be intended for v3.3.  As such, I will add that branch after
> v3.2-rc1 is released.  Let me know if my assumption is incorrect.
> 

Sorry, that is not what I intended to convey.  What's currently in
for-next-merge it what's slated to go in this merge window..  Apologies
for the extra confusion.

> I have renamed iscsi-target to target-updates.

Thank you.

--nab
