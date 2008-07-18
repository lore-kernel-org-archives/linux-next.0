From: Harvey Harrison <harvey.harrison@gmail.com>
Subject: Re: [PATCH] gfs2: remove nameidata arg from gfs_iop_permission
Date: Fri, 18 Jul 2008 10:30:10 -0700
Message-ID: <1216402210.6029.147.camel@brick>
References: <1216328912.6029.18.camel@brick>
	 <1216398403.6029.145.camel@brick>
	 <20080718172308.GQ28946@ZenIV.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from wf-out-1314.google.com ([209.85.200.168]:42036 "EHLO
	wf-out-1314.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755507AbYGRRaM (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 18 Jul 2008 13:30:12 -0400
Received: by wf-out-1314.google.com with SMTP id 27so343430wfd.4
        for <linux-next@vger.kernel.org>; Fri, 18 Jul 2008 10:30:11 -0700 (PDT)
In-Reply-To: <20080718172308.GQ28946@ZenIV.linux.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: Steven Whitehouse <swhiteho@redhat.com>, linux-next <linux-next@vger.kernel.org>

On Fri, 2008-07-18 at 18:23 +0100, Al Viro wrote:
> On Fri, Jul 18, 2008 at 09:26:42AM -0700, Harvey Harrison wrote:
> > Noticed by sparse
> > > fs/gfs2/ops_inode.c:1153:16: warning: incorrect type in initializer (different argument counts)
> > > fs/gfs2/ops_inode.c:1153:16:    expected int ( *permission )( ... )
> > > fs/gfs2/ops_inode.c:1153:16:    got int ( static [toplevel] *<noident> )( ... )
> > > fs/gfs2/ops_inode.c:1172:16: warning: incorrect type in initializer (different argument counts)
> > > fs/gfs2/ops_inode.c:1172:16:    expected int ( *permission )( ... )
> > > fs/gfs2/ops_inode.c:1172:16:    got int ( static [toplevel] *<noident> )( ... )
> > > fs/gfs2/ops_inode.c:1184:16: warning: incorrect type in initializer (different argument counts)
> > > fs/gfs2/ops_inode.c:1184:16:    expected int ( *permission )( ... )
> > > fs/gfs2/ops_inode.c:1184:16:    got int ( static [toplevel] *<noident> )( ... )
> > > fs/gfs2/ops_inode.c:1153: warning: initialization from incompatible pointer type
> > > fs/gfs2/ops_inode.c:1172: warning: initialization from incompatible pointer type
> > > fs/gfs2/ops_inode.c:1184: warning: initialization from incompatible pointer type
> > 
> > Signed-off-by: Harvey Harrison <harvey.harrison@gmail.com>
> > ---
> > Appeared between next-20080716 and next-20080717
> > 
> >  fs/gfs2/ops_inode.c |    3 +--
> >  1 files changed, 1 insertions(+), 2 deletions(-)
> > 
> > diff --git a/fs/gfs2/ops_inode.c b/fs/gfs2/ops_inode.c
> > index 1e252df..0456e2b 100644
> > --- a/fs/gfs2/ops_inode.c
> > +++ b/fs/gfs2/ops_inode.c
> > @@ -915,8 +915,7 @@ int gfs2_permission(struct inode *inode, int mask)
> >  	return error;
> >  }
> >  
> > -static int gfs2_iop_permission(struct inode *inode, int mask,
> > -			       struct nameidata *nd)
> > +static int gfs2_iop_permission(struct inode *inode, int mask)
> >  {
> >  	return gfs2_permission(inode, mask);
> >  }
> 
> Er?  Commit c0beafa477f3f59d0f27c477f9b7f97498f2f96a kills the function
> completely; what tree are you working with?

next-20080717 still had it, this was a response to my e-mail from
yesterday noting new sparse warnings.  Hence the, appeared between...

If it's gone today, then no worries.

Harvey
