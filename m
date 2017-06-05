From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the staging tree with the tty tree
Date: Mon, 5 Jun 2017 14:57:49 +1000
Message-ID: <20170605145749.4d6df5cd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:47027 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751258AbdFEE5w (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 5 Jun 2017 00:57:52 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Okash Khawaja <okash.khawaja@gmail.com>, Alan Cox <alan@llwyncelyn.cymru>

Hi Greg,

Today's linux-next merge of the staging tree got a conflict in:

  include/uapi/linux/tty.h

between commit:

  8a8dabf2dd68 ("tty: handle the case where we cannot restore a line discipline")

from the tty tree and commit:

  1ab92da32e37 ("staging: speakup: add tty-based comms functions")

from the staging tree.

I fixed it up (I used the tty tree version) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
