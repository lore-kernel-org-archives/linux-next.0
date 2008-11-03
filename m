From: Pekka Enberg <penberg@cs.helsinki.fi>
Subject: Re: linux-next: manual merge of the slab tree
Date: Mon, 03 Nov 2008 11:38:59 +0200
Message-ID: <1225705140.22949.12.camel@penberg-laptop>
References: <20081103150750.87fe762d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from courier.cs.helsinki.fi ([128.214.9.1]:43857 "EHLO
	mail.cs.helsinki.fi" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754639AbYKCJiI (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 3 Nov 2008 04:38:08 -0500
In-Reply-To: <20081103150750.87fe762d.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Christoph Lameter <cl@linux-foundation.org>, linux-next@vger.kernel.org, Alexey Dobriyan <adobriyan@gmail.com>

Hi Stephen,

On Mon, 2008-11-03 at 15:07 +1100, Stephen Rothwell wrote:
> Today's linux-next merge of the slab tree got a conflict in
> fs/proc/inode.c between commit 5bcd7ff9e1690dbdbccb2a1cb3c2ea8b8381c435
> ("proc: proc_init_inodecache() can't fail") from Linus' tree and commit
> f7f650b4b85ad364072936db9e6beddcb2ca33b8 ("Filesystem: /proc filesystem
> support for slab defrag") from the slab tree.
> 
> It is just a context change. I fixed it up (see below) and will carry the
> fix for a couple of days (during which time it will hopefully be fixed in
> your tree).

I fixed up this by rebasing the whole series to 2.6.28-rc3. Thanks!
