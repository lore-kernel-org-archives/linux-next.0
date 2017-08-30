From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Signed-off-bys missing for commits in the block tree
Date: Thu, 31 Aug 2017 03:06:47 +1000
Message-ID: <20170831030647.19c22478@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:55395 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751923AbdH3RGu (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 30 Aug 2017 13:06:50 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, Arnav Dawn <a.dawn@samsung.com>, Guan Junxiong <guanjunxiong@huawei.com>, Max Gurtovoy <maxg@mellanox.com>, James Smart <james.smart@broadcom.com>, Martin Wilck <mwilck@suse.com>, "Jan H. =?UTF-8?B?U2Now7ZuaGVycg==?=" <jschoenh@amazon.de>, "Martin K. Petersen" <martin.petersen@oracle.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Philipp Reisner <philipp.reisner@linbit.com>, Lars Ellenberg <lars.ellenberg@linbit.com>, Roland Kammerer <roland.kammerer@linbit.com>

Hi Jens,

Commits

  b6dccf7fae43 ("nvme: add support for FW activation without reset")
  62346eaeb2f1 ("nvme: define NVME_NSID_ALL")
  9b483da15dd0 ("nvme-fabrics: log a warning if hostid is invalid")
  ad4e05b24c42 ("nvme: add symbolic constants for CC identifiers")
  60b43f627a71 ("nvme: rename AMS symbolic constants to fit specification")
  5533d42480d6 ("nvme-fc: Reattach to localports on re-registration")
  48fa362b6c3f ("nvmet-fc: simplify sg list handling")
  01f33c336e2d ("string.h: add memcpy_and_pad()")
  17c39d053a46 ("nvmet: use memcpy_and_pad for identify sn/fr")
  a7b7c7a105a5 ("nvme-rdma: Use unlikely macro in the fast path")
  5228b3280b9b ("nvme: fix uninitialized prp2 value on small transfers")
  07fbd32a6b21 ("nvme: honor RTD3 Entry Latency for shutdowns")

are missing a Signed-off-bys from their committers.

Commits

  8ab761e17efa ("drbd: rename "usermode_helper" to "drbd_usermode_helper"")
  d3d2948f4353 ("drbd: abort drbd_start_resync if there is no connection")
  365cf663b647 ("drbd: switch from kmalloc() to kmalloc_array()")

are missing a Signed-off-bys from their authors.

-- 
Cheers,
Stephen Rothwell
