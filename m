From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for October 21 (jffs2)
Date: Tue, 21 Oct 2008 21:25:44 -0700
Message-ID: <20081021212544.06588df7.randy.dunlap@oracle.com>
References: <20081021195109.ed83b102.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from agminet01.oracle.com ([141.146.126.228]:20551 "EHLO
	agminet01.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750815AbYJVE0L (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 22 Oct 2008 00:26:11 -0400
In-Reply-To: <20081021195109.ed83b102.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, dwmw2@infradead.org

On Tue, 21 Oct 2008 19:51:09 +1100 Stephen Rothwell wrote:

> Hi all,
> 
> Today's tree will not build for powerpc allyesconfig (libc aborts the
> link due to a free() problem), sparc(32) defconfig and probably some
> other configurations.
> 
> I am no longer commenting on conflicts that are clearly just caused by
> slight differences in what has been merged into Linus' tree and
> linux-next or conflicts caused by further changes in the linux-next after
> a subset of a tree has been merged.

linux-next-20081021/fs/jffs2/nodemgmt.c:265: error: 'struct jffs2_sb_info' has no member named 'wbuf_ofs'
linux-next-20081021/fs/jffs2/nodemgmt.c:265: error: 'struct jffs2_sb_info' has no member named 'wbuf_len'
linux-next-20081021/fs/jffs2/nodemgmt.c:266: error: 'struct jffs2_sb_info' has no member named 'wbuf_ofs'


---
~Randy
