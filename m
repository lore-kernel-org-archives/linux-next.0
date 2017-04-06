From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the staging tree with the v4l-dvb tree
Date: Thu, 6 Apr 2017 13:34:20 +1000
Message-ID: <20170406133420.3e231d2a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:39079 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753260AbdDFDeX (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 5 Apr 2017 23:34:23 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Derek Robson <robsonde@gmail.com>, Sean Young <sean@mess.org>

Hi all,

Today's linux-next merge of the staging tree got conflicts in:

  drivers/staging/media/lirc/lirc_sasem.c
  drivers/staging/media/lirc/lirc_sir.c

between commits:

  e66267161971 ("[media] rc: promote lirc_sir out of staging")
  51bb3fd788cb ("[media] staging: lirc_sasem: remove")

from the v4l-dvb tree and commit:

  87ddb91067b9 ("Staging: media: lirc - style fix")

from the staging tree.

I fixed it up (I removed both files - the updates to lirc_sir.c were
also done in the v4l-dvb tree) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell
