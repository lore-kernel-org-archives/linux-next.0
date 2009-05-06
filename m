From: Trond Myklebust <Trond.Myklebust@netapp.com>
Subject: Re: [PATCH] nfs: fix build error in nfsroot with initconst
Date: Wed, 06 May 2009 09:45:43 -0400
Message-ID: <1241617543.4880.2.camel@heimdal.trondhjem.org>
References: <20090505111712.ae4649b3.sfr@canb.auug.org.au>
	 <20090505111114.GA16497@uranus.ravnborg.org>
	 <20090506133253.43409da9.sfr@canb.auug.org.au>
	 <20090506044056.GA23277@uranus.ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.netapp.com ([216.240.18.37]:42251 "EHLO mx2.netapp.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754318AbZEFNqO (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 6 May 2009 09:46:14 -0400
In-Reply-To: <20090506044056.GA23277@uranus.ravnborg.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Jan Beulich <jbeulich@novell.com>, Steven Whitehouse <swhiteho@redhat.com>

On Wed, 2009-05-06 at 06:40 +0200, Sam Ravnborg wrote:
> On Wed, May 06, 2009 at 01:32:53PM +1000, Stephen Rothwell wrote:
> > Hi Sam,
> > 
> > On Tue, 5 May 2009 13:11:14 +0200 Sam Ravnborg <sam@ravnborg.org> wrote:
> > >
> > > fix build error with latest kbuild adjustments to initconst.
> > > 
> > > The commit a447c0932445f92ce6f4c1bd020f62c5097a7842 ("vfs: Use
> > > const for kernel parser table") changed:
> > > 
> > >     static match_table_t __initdata tokens = {
> > > to
> > >     static match_table_t __initconst tokens = {
> > > 
> > > But the missing const causes popwerpc to fail with latest
> > > updates to __initconst like this:
> > > 
> > > fs/nfs/nfsroot.c:400: error: __setup_str_nfs_root_setup causes a section type conflict
> > > fs/nfs/nfsroot.c:400: error: __setup_str_nfs_root_setup causes a section type conflict
> > > 
> > > The bug is only present with kbuild-next.
> > > Following patch has been build tested.
> > > 
> > > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > > Cc: Steven Whitehouse <swhiteho@redhat.com>
> > > Cc: Stephen Rothwell <sfr@canb.auug.org.au>
> > 
> > I build tested this with the offending compilers, so
> > 
> > Tested-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > Acked-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > 
> > I also build tested with the updates to __initconst as well.
> > 
> > > Please apply this either to your -next tree or preferably upstream.
> > 
> > If you want to keep the __initconst changes in your tree, then you need
> > the above in your tree as well ... (preferably before the __initconst
> > changes).
> I hope that Trond would pull it into his tree and get it
> upstream.
> 
> But if this does not happen within a few days (or Trond says I should do so),
> I will add it to the kbuild-next.git.
> 
> 	Sam


I've got some stuff from Chuck that I need to send upstream too, so I
expect to send it in the next couple of days...

-- 
Trond Myklebust
Linux NFS client maintainer

NetApp
Trond.Myklebust@netapp.com
www.netapp.com
