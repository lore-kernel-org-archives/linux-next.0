From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the target-bva tree with the
 target-updates tree
Date: Mon, 20 Feb 2017 13:51:31 +1100
Message-ID: <20170220135131.617bfef4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bart Van Assche <bart.vanassche@gmail.com>, "Nicholas A. Bellinger" <nab@linux-iscsi.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Varun Prakash <varun@chelsio.com>
List-Id: linux-next.vger.kernel.org

Hi Bart,

Today's linux-next merge of the target-bva tree got conflicts in:

  drivers/target/iscsi/cxgbit/cxgbit_target.c
  drivers/target/iscsi/iscsi_target.c
  include/target/iscsi/iscsi_transport.h

between commits:

  9a584bf9bf0a ("target/iscsi: split iscsit_check_dataout_hdr()")
  79e57cfe00f4 ("target/cxgbit: add T6 iSCSI DDP completion feature")

from the target-updates tree and commit:

  b6f2cd5ab404 ("target/iscsi: split iscsit_check_dataout_hdr()")
  b0d5eab94c37 ("target/cxgbit: add T6 iSCSI DDP completion feature")

from the target-bva tree.

I fixed it up (the target-update versions are updates from the others,
so I used those) and can carry the fix as necessary. This is now fixed
as far as linux-next is concerned, but any non trivial conflicts should
be mentioned to your upstream maintainer when your tree is submitted for
merging.  You may also want to consider cooperating with the maintainer
of the conflicting tree to minimise any particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
