From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: [PATCH -next] libs: force lzma_wrapper to be retained
Date: Sun, 3 Jan 2010 20:42:30 -0800
Message-ID: <20100103204230.a85ae137.randy.dunlap@oracle.com>
References: <20100101120737.94d4acc4.sfr@canb.auug.org.au>
	<20100101183344.398f2538.randy.dunlap@oracle.com>
	<4B3FEB1B.7040106@lougher.demon.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from acsinet12.oracle.com ([141.146.126.234]:59551 "EHLO
	acsinet12.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752587Ab0ADEnX (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 3 Jan 2010 23:43:23 -0500
In-Reply-To: <4B3FEB1B.7040106@lougher.demon.co.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Phillip Lougher <phillip@lougher.demon.co.uk>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Michal Marek <mmarek@suse.cz>, akpm <akpm@linux-foundation.org>

On Sun, 03 Jan 2010 00:55:55 +0000 Phillip Lougher wrote:

> Randy Dunlap wrote:
> > From: Randy Dunlap <randy.dunlap@oracle.com>
> > 
> > When CONFIG_SQUASHFS=m and CONFIG_DECOMPRESS_LZMA=m, decompress_lzma
> > is built but then discarded from the library because no built-in code
> > uses it, so change it from a lib- to an obj- to force it to be kept
> > in the library.
> > 
> > ERROR: "unlzma" [fs/squashfs/squashfs.ko] undefined!
> > 
> 
> Thanks for fixing this, I should have spotted it in my various
> config tests but didn't.  I could add this to my squashfs-next patches
> to stop the linux-next tree breakage, however, should it go into
> Michal's kbuild -next tree instead?

You can/should go ahead and include this patch, I think.

> This patch raises a small additional issue, why is DECOMPRESS_LZMA
> (and DECOMPRESS_GZIP/DECOMPRESS_BZIP2) and defined as tristate?
> None of the above compressors can be built as modules.

No idea.  Sounds like a potential problem.

> Regards
> 
> Phillip


---
~Randy
