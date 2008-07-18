From: Harvey Harrison <harvey.harrison@gmail.com>
Subject: Re: [PATCH] gfs2: remove nameidata arg from gfs_iop_permission
Date: Fri, 18 Jul 2008 11:22:34 -0700
Message-ID: <1216405354.6029.154.camel@brick>
References: <1216328912.6029.18.camel@brick>
	 <1216398403.6029.145.camel@brick>
	 <20080718172308.GQ28946@ZenIV.linux.org.uk>
	 <1216402210.6029.147.camel@brick>
	 <20080718180429.GR28946@ZenIV.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from wf-out-1314.google.com ([209.85.200.171]:29848 "EHLO
	wf-out-1314.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750971AbYGRSWk (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 18 Jul 2008 14:22:40 -0400
Received: by wf-out-1314.google.com with SMTP id 27so357858wfd.4
        for <linux-next@vger.kernel.org>; Fri, 18 Jul 2008 11:22:37 -0700 (PDT)
In-Reply-To: <20080718180429.GR28946@ZenIV.linux.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: Steven Whitehouse <swhiteho@redhat.com>, linux-next <linux-next@vger.kernel.org>

On Fri, 2008-07-18 at 19:04 +0100, Al Viro wrote:
> On Fri, Jul 18, 2008 at 10:30:10AM -0700, Harvey Harrison wrote:
> 
> > > Er?  Commit c0beafa477f3f59d0f27c477f9b7f97498f2f96a kills the function
> > > completely; what tree are you working with?
> > 
> > next-20080717 still had it, this was a response to my e-mail from
> > yesterday noting new sparse warnings.  Hence the, appeared between...
> > 
> > If it's gone today, then no worries.
> 
> Joy.  A mismerge, with Miklos' patch applied both in gfs2 and vfs trees,
> with vfs one containing a patch on top of that.  Parts of the latter patch
> in fs/gfs2/ got dropped at merge in linux-next...

I noticed one in security/capability.c in next-20080718 today and sent you a patch.

That was the only new sparse warning in today's linux-next.

Harvey
