From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the target-updates tree with the libata
 tree
Date: Tue, 4 Aug 2015 13:35:46 +1000
Message-ID: <20150804133546.66badb66@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:40369 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753967AbbHDDfr (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 3 Aug 2015 23:35:47 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Nicholas A. Bellinger" <nab@linux-iscsi.org>, Tejun Heo <tj@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sagi Grimberg <sagig@mellanox.com>

Hi Nicholas,

Today's linux-next merge of the target-updates tree got a conflict in:

  drivers/ata/libata-scsi.c

between commit:

  fe16d4f202c5 ("Revert "libata-eh: Set 'information' field for autosense"")

from the libata tree and commit:

  f5a8b3a796db ("scsi: Protect against buffer possible overflow in scsi_set_sense_information")

from the target-updates tree.

I fixed it up (the former removed some code that was updated by the
latter, so I just removed the code) and can carry the fix as necessary
(no action is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
