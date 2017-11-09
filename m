From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the staging tree with the vfs tree
Date: Thu, 9 Nov 2017 15:01:26 +1100
Message-ID: <20171109150126.3417da53@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:42837 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751472AbdKIEB1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 8 Nov 2017 23:01:27 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>, Al Viro <viro@ZenIV.linux.org.uk>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Srishti Sharma <srishtishar@gmail.com>

Hi Greg,

Today's linux-next merge of the staging tree got a conflict in:

  drivers/staging/pi433/pi433_if.c

between commit:

  f81f0b5c9a30 ("pi433: sanitize ioctl")

from the vfs tree and commit:

  69af5d92da20 ("Staging: pi433: Fix the position of brace after if")

from the staging tree.

I fixed it up (I just used the vfs tree version (for the conflicting bits)
as suggested by Al) and can carry the fix as necessary. This is now fixed
as far as linux-next is concerned, but any non trivial conflicts should
be mentioned to your upstream maintainer when your tree is submitted for
merging.  You may also want to consider cooperating with the maintainer
of the conflicting tree to minimise any particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
