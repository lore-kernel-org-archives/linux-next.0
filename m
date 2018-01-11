From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kspp tree with the net tree
Date: Thu, 11 Jan 2018 15:40:31 +1100
Message-ID: <20180111154031.577c213b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:38621 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752922AbeAKEke (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 10 Jan 2018 23:40:34 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Kees Cook <keescook@google.com>, David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Windsor <dave@nullcore.net>, Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>

Hi Kees,

Today's linux-next merge of the kspp tree got a conflict in:

  net/sctp/socket.c

between commit:

  c76f97c99ae6 ("sctp: make use of pre-calculated len")

from the net tree and commit:

  3511d716f5a8 ("sctp: Copy struct sctp_sock.autoclose to userspace using put_user()")

from the kspp tree.

I fixed it up (I just used the latter version) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
