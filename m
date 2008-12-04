From: Christoph Hellwig <hch@lst.de>
Subject: Re: XFS breakage on m68k (was: Re: linux-next: Tree for December 3)
Date: Thu, 4 Dec 2008 14:23:27 +0100
Message-ID: <20081204132327.GA12971@lst.de>
References: <20081203183602.c06f8c39.sfr@canb.auug.org.au> <Pine.LNX.4.64.0812040956370.10635@anakin> <20081204121330.GA18815@infradead.org> <20081204234603.b5a28cd6.sfr@canb.auug.org.au> <20081204125006.GA13411@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from verein.lst.de ([213.95.11.210]:58630 "EHLO verein.lst.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754174AbYLDNdE (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 4 Dec 2008 08:33:04 -0500
Content-Disposition: inline
In-Reply-To: <20081204125006.GA13411@infradead.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoph Hellwig <hch@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Geert Uytterhoeven <geert@linux-m68k.org>, Eric Sandeen <sandeen@sandeen.net>, Christoph Hellwig <hch@lst.de>, Lachlan McIlroy <lachlan@sgi.com>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, xfs@oss.sgi.com

On Thu, Dec 04, 2008 at 07:50:06AM -0500, Christoph Hellwig wrote:
> Yeah, but Niv fixed it up and the correct version is not in the xfs git
> tree.

Hah, he noticed the bug but the wrong version got checked in anyway.

Here's the fix (for todays xfs tree):

-- 

[XFS] Fix compile with CONFIG_COMPAT enabled


Signed-off-by: Christoph Hellwig <hch@lst.de>

Index: xfs/fs/xfs/linux-2.6/xfs_ioctl.h
===================================================================
--- xfs.orig/fs/xfs/linux-2.6/xfs_ioctl.h	2008-12-04 14:19:32.000000000 +0100
+++ xfs/fs/xfs/linux-2.6/xfs_ioctl.h	2008-12-04 14:19:38.000000000 +0100
@@ -74,7 +74,7 @@ xfs_file_compat_ioctl(
 	unsigned long		arg);
 
 extern long
-xfs_file_compat_ioctl_invis(
+xfs_file_compat_invis_ioctl(
 	struct file		*file,
 	unsigned int		cmd,
 	unsigned long		arg);
