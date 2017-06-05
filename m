From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the v4l-dvb tree with the v4l-dvb-fixes
 tree
Date: Mon, 5 Jun 2017 12:03:11 +1000
Message-ID: <20170605120311.0edff177@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:39077 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751281AbdFECDO (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 4 Jun 2017 22:03:14 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mauro Carvalho Chehab <mchehab@osg.samsung.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Hans Verkuil <hans.verkuil@cisco.com>, Arnd Bergmann <arnd@arndb.de>

Hi Mauro,

Today's linux-next merge of the v4l-dvb tree got a conflict in:

  include/media/cec-notifier.h

between commit:

  e94c32818d86 ("[media] cec: rename MEDIA_CEC_NOTIFIER to CEC_NOTIFIER")

from the v4l-dvb-fixes tree and commit:

  79eddc992ea4 ("[media] cec-notifier.h: handle unreachable CONFIG_CEC_CORE")

from the v4l-dvb tree.

I fixed it up (I just used the former version) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
