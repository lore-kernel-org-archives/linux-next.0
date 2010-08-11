From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: remove inode_setattr
Date: Wed, 11 Aug 2010 02:01:52 +0100
Message-ID: <20100811010152.GD31363@ZenIV.linux.org.uk>
References: <201008101859.o7AIx9BM026915@hera.kernel.org>
 <20100810155011.b9657102.akpm@linux-foundation.org>
 <20100811101751.1afdded8.sfr@canb.auug.org.au>
 <20100811104503.4082f68f.sfr@canb.auug.org.au>
 <20100811005216.GB31363@ZenIV.linux.org.uk>
 <20100810175944.5919319e.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from zeniv.linux.org.uk ([195.92.253.2]:56395 "EHLO
	ZenIV.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752370Ab0HKBB6 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 10 Aug 2010 21:01:58 -0400
Content-Disposition: inline
In-Reply-To: <20100810175944.5919319e.akpm@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Christoph Hellwig <hch@lst.de>, Linus Torvalds <torvalds@linux-foundation.org>, Eric Van Hensbergen <ericvh@gmail.com>, Sripathi Kodi <sripathik@in.ibm.com>, LKML <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org

On Tue, Aug 10, 2010 at 05:59:44PM -0700, Andrew Morton wrote:

> That's v9fs_vfs_setattr().  The problem is in the new
> v9fs_vfs_setattr_dotl().

Yeah, see another posting...  Fix is in the queue I'm putting together
for tonight.  Sorry about that...
