From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the scsi-mkp tree with the scsi tree
Date: Wed, 9 Nov 2016 13:57:42 +1100
Message-ID: <20161109135742.5b07f051@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:45269 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752564AbcKIC5o (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 8 Nov 2016 21:57:44 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Martin K. Petersen" <martin.petersen@oracle.com>, James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Martin,

Today's linux-next merge of the scsi-mkp tree got a conflict in:

  drivers/scsi/ufs/ufs-qcom.c

Again this is caused by the rebase of the scsi-mkp tree (including
commits already in the scsi tree) followed by more changes to this file.

I fixed it up (I used the scsi-mkp tree version) and can carry the fix
as necessary. This is now fixed as far as linux-next is concerned, but
any non trivial conflicts should be mentioned to your upstream
maintainer when your tree is submitted for merging.  You may also want
to consider cooperating with the maintainer of the conflicting tree to
minimise any particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
