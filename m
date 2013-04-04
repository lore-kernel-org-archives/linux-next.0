From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: linux-next: manual merge of the akpm tree with the vfs tree
Date: Thu, 4 Apr 2013 09:10:11 +0100
Message-ID: <20130404081011.GO21522@ZenIV.linux.org.uk>
References: <20130404172648.27834d12cbb68338f4b89482@canb.auug.org.au>
 <20130403235634.6bc72c39.akpm@linux-foundation.org>
 <20130404000253.2fc9c75d.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from zeniv.linux.org.uk ([195.92.253.2]:46909 "EHLO
	ZenIV.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1764264Ab3DDIKN (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 4 Apr 2013 04:10:13 -0400
Content-Disposition: inline
In-Reply-To: <20130404000253.2fc9c75d.akpm@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Nathan Zimmer <nzimmer@sgi.com>

On Thu, Apr 04, 2013 at 12:02:53AM -0700, Andrew Morton wrote:

> > Well perhaps the vfs tree should start paying some attention to the
> > rest of the world, particularly after -rc5.
> 
> I can't even find this "lift sb_start_write() out of ->write()".  Not on fsdevel,
> not on lkml.  What the heck is it and why was it so important?

Deadlocks around splice; see the threads re overlayfs/unionmount/aufs and
deadlocks in their copyup implementations.  See also XFS freeze-related
deadlocks, etc.

The thing is, sb_start_write() is pretty high in locking hierarchy (outside
->i_mutex, etc.), but ->splice_write() and friends had it buried pretty
deep.  With distinctly unpleasant results, including ->..._write() instances
using generic ones (which took the lock) *and* doing some IO outside of those
(ext4, for example; ocfs2 also looked fishy in that respect, IIRC).

The obvious solution is to lift taking that lock out of the methods, which
had been done.  It had been discussed on fsdevel and sat in #experimental for
several weeks; time for it to go into #for-next.
