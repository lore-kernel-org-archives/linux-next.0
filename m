From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: [PATCH] gfs2: remove nameidata arg from gfs_iop_permission
Date: Fri, 18 Jul 2008 19:04:29 +0100
Message-ID: <20080718180429.GR28946@ZenIV.linux.org.uk>
References: <1216328912.6029.18.camel@brick> <1216398403.6029.145.camel@brick> <20080718172308.GQ28946@ZenIV.linux.org.uk> <1216402210.6029.147.camel@brick>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from zeniv.linux.org.uk ([195.92.253.2]:60519 "EHLO
	ZenIV.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754273AbYGRSEb (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 18 Jul 2008 14:04:31 -0400
Content-Disposition: inline
In-Reply-To: <1216402210.6029.147.camel@brick>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Harvey Harrison <harvey.harrison@gmail.com>
Cc: Steven Whitehouse <swhiteho@redhat.com>, linux-next <linux-next@vger.kernel.org>

On Fri, Jul 18, 2008 at 10:30:10AM -0700, Harvey Harrison wrote:

> > Er?  Commit c0beafa477f3f59d0f27c477f9b7f97498f2f96a kills the function
> > completely; what tree are you working with?
> 
> next-20080717 still had it, this was a response to my e-mail from
> yesterday noting new sparse warnings.  Hence the, appeared between...
> 
> If it's gone today, then no worries.

Joy.  A mismerge, with Miklos' patch applied both in gfs2 and vfs trees,
with vfs one containing a patch on top of that.  Parts of the latter patch
in fs/gfs2/ got dropped at merge in linux-next...
