From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the scsi tree with the jc_docs tree
Date: Tue, 27 Jun 2017 14:29:31 +1000
Message-ID: <20170627142931.538a2a4e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:43939 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750829AbdF0E3e (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 27 Jun 2017 00:29:34 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>, Jonathan Corbet <corbet@lwn.net>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@s-opensource.com>, Tyrel Datwyler <tyreld@linux.vnet.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>

Hi all,

Today's linux-next merge of the scsi tree got a conflict in:

  drivers/scsi/scsi_transport_fc.c

between commit:

  739aca06a2d2 ("scsi: fix some kernel-doc markups")

from the jc_docs tree and commit:

  134699d2a896 ("scsi: fix typos and grammar in comments of scsi_transport_fc.c")

from the scsi tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/scsi/scsi_transport_fc.c
index 1df77453f6b6,6dd0922a499d..000000000000
--- a/drivers/scsi/scsi_transport_fc.c
+++ b/drivers/scsi/scsi_transport_fc.c
@@@ -2914,18 -2914,16 +2914,18 @@@ EXPORT_SYMBOL(fc_remote_port_add)
   * port is no longer part of the topology. Note: Although a port
   * may no longer be part of the topology, it may persist in the remote
   * ports displayed by the fc_host. We do this under 2 conditions:
 + *
   * 1) If the port was a scsi target, we delay its deletion by "blocking" it.
 - *   This allows the port to temporarily disappear, then reappear without
 - *   disrupting the SCSI device tree attached to it. During the "blocked"
 - *   period the port will still exist.
 + *    This allows the port to temporarily disappear, then reappear without
 + *    disrupting the SCSI device tree attached to it. During the "blocked"
 + *    period the port will still exist.
 + *
   * 2) If the port was a scsi target and disappears for longer than we
 - *   expect, we'll delete the port and the tear down the SCSI device tree
 - *   attached to it. However, we want to semi-persist the target id assigned
 - *   to that port if it eventually does exist. The port structure will
 - *   remain (although with minimal information) so that the target id
 - *   bindings also remain.
 + *    expect, we'll delete the port and the tear down the SCSI device tree
 + *    attached to it. However, we want to semi-persist the target id assigned
 + *    to that port if it eventually does exist. The port structure will
 + *    remain (although with minimal information) so that the target id
-  *    bindings remails.
++ *    bindings also remain.
   *
   * If the remote port is not an FCP Target, it will be fully torn down
   * and deallocated, including the fc_remote_port class device.
