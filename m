From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the target-updates tree with the libata
 tree
Date: Tue, 4 Aug 2015 13:35:27 +1000
Message-ID: <20150804133527.7d300005@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:42351 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753967AbbHDDfa (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 3 Aug 2015 23:35:30 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Nicholas A. Bellinger" <nab@linux-iscsi.org>, Tejun Heo <tj@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sagi Grimberg <sagig@mellanox.com>

Hi Nicholas,

Today's linux-next merge of the target-updates tree got conflicts in:

  drivers/scsi/scsi_error.c
  include/scsi/scsi_eh.h

between commit:

  fe16d4f202c5 ("Revert "libata-eh: Set 'information' field for autosense"")

from the libata tree and commit:

  7708c1656552 ("scsi: Move sense handling routines to scsi_common")

from the target-updates tree.

I fixed it up (I left scsi_set_sense_information in its new place) and
can carry the fix as necessary (no action is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
