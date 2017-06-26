From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the v4l-dvb-next tree with the
 v4l-dvb-fixes tree
Date: Mon, 26 Jun 2017 11:29:58 +1000
Message-ID: <20170626112958.53c2d463@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:37373 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751486AbdFZBaB (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 25 Jun 2017 21:30:01 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mauro Carvalho Chehab <mchehab@osg.samsung.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Mauro,

Today's linux-next merge of the v4l-dvb-next tree got conflicts in:

  Documentation/media/uapi/dvb/fe-diseqc-send-burst.rst
  Documentation/media/uapi/dvb/fe-set-tone.rst
  Documentation/media/uapi/dvb/fe-set-voltage.rst

between commit:

  affd250dec17 ("[media] dvb uapi docs: enums are passed by value, not reference")

from the v4l-dvb-fixes tree and commit:

  d9c4615854ec ("[media] dvb uapi docs: enums are passed by value, not reference")

from the v4l-dvb-next tree.

I fixed it up (I used the version from the former tree since it was
committed more recently) and can carry the fix as necessary. This is now
fixed as far as linux-next is concerned, but any non trivial conflicts
should be mentioned to your upstream maintainer when your tree is
submitted for merging.  You may also want to consider cooperating with
the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell
