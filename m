From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warnings after merge of the scsi tree
Date: Wed, 6 Dec 2017 13:31:49 +1100
Message-ID: <20171206133149.30baf3eb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:43633 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754384AbdLFCbw (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 5 Dec 2017 21:31:52 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Johannes Thumshirn <jthumshirn@suse.de>, "Martin K. Petersen" <martin.petersen@oracle.com>, Hannes Reinecke <hare@suse.com>

Hi James,

After merging the scsi tree, today's linux-next build (x86_64
allmodconfig) produced these warnings:

drivers/scsi/bfa/bfad_bsg.c: In function 'bfad_im_bsg_vendor_request':
drivers/scsi/bfa/bfad_bsg.c:3137:35: warning: initialization makes pointer from integer without a cast [-Wint-conversion]
  struct bfad_im_port_s *im_port = shost->hostdata[0];
                                   ^
drivers/scsi/bfa/bfad_bsg.c: In function 'bfad_im_bsg_els_ct_request':
drivers/scsi/bfa/bfad_bsg.c:3353:35: warning: initialization makes pointer from integer without a cast [-Wint-conversion]
  struct bfad_im_port_s *im_port = shost->hostdata[0];
                                   ^

Introduced by commit

  45349821ab3a ("scsi: bfa: fix access to bfad_im_port_s")

-- 
Cheers,
Stephen Rothwell
