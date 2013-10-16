From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: linux-next: manual merge of the trivial tree
Date: Wed, 16 Oct 2013 16:56:52 +0200
Message-ID: <20131016145652.GB16959@localhost>
References: <1381845763-10487-1-git-send-email-treding@nvidia.com>
 <1381845763-10487-2-git-send-email-treding@nvidia.com>
 <alpine.DEB.2.10.1310161057190.13374@blackhole.kfki.hu>
 <alpine.LNX.2.00.1310161118070.12405@pobox.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.LNX.2.00.1310161118070.12405@pobox.suse.cz>
Sender: linux-kernel-owner@vger.kernel.org
To: Jiri Kosina <jkosina@suse.cz>
Cc: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, Thierry Reding <thierry.reding@gmail.com>, Patrick McHardy <kaber@trash.net>, Maxime Jayat <maxime@artisandeveloppeur.fr>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Wed, Oct 16, 2013 at 11:20:04AM +0200, Jiri Kosina wrote:
> On Wed, 16 Oct 2013, Jozsef Kadlecsik wrote:
> 
> > > Today's linux-next merge of the trivial tree got conflicts in
> > > 
> > > 	net/netfilter/xt_set.c
> > > 
> > > caused by commits 3f79410 (treewide: Fix common typo in "identify") and
> > > bd3129f (netfilter: ipset: order matches and targets separatedly in
> > > xt_set.c).
> > > 
> > > I fixed them up (see below). Please verify that the resolution looks
> > > good.
> > 
> > I don't really get it: patch bd3129f was part of a patchset, which was 
> > applied to net-next and there it was complete.
> > 
> > There's none of the patchset in question in linux-next, so what's the 
> > trivial tree? Where's lost what?

To Jozsef: David collects all the networking patches in net-next until
Linus' merge window opens, that's why you don't see your patches in
linux-next. It seems Jiri merges this trivial tree (which indeed
contains your net-next patches already) to linux-next.

> > [The patch below doesn't look good, because it should contain the removed 
> > part for the revision 1 match due to the reordering in the file.]
> 
> This is just a super-simple conflict between
> 
> 	https://git.kernel.org/cgit/linux/kernel/git/davem/net-next.git/commit/?id=bd3129f
> 
> and
> 
> 	https://git.kernel.org/cgit/linux/kernel/git/jikos/trivial.git/diff/net/netfilter/xt_set.c?h=for-next&id=3f79410c7c
> 
> I don't think it needs any special handling, do you? I can of course drop 
> the respective hunk from my tree and let you handle it in net-next if you 
> wish.

Please, don't drop it, I think Jozsef got confused by the handling of
your trivial tree.
