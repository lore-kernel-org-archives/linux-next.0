From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip tree with the bluetooth tree
Date: Wed, 28 Jun 2017 13:22:43 +1000
Message-ID: <20170628132243.7f0833bd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:46635 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753453AbdF1DWq (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 27 Jun 2017 23:22:46 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Gustavo Padovan <gustavo@padovan.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jeffy Chen <jeffy.chen@rock-chips.com>, Marcel Holtmann <marcel@holtmann.org>

Hi all,

Today's linux-next merge of the tip tree got conflicts in:

  net/bluetooth/bnep/core.c
  net/bluetooth/cmtp/core.c
  net/bluetooth/hidp/core.c

between commits:

  25717382c1dd ("Bluetooth: bnep: fix possible might sleep error in bnep_session")
  f06d977309d0 ("Bluetooth: cmtp: fix possible might sleep error in cmtp_session")
  5da8e47d849d ("Bluetooth: hidp: fix possible might sleep error in hidp_session_thread")

from the bluetooth tree and commit:

  ac6424b981bc ("sched/wait: Rename wait_queue_t => wait_queue_entry_t")

from the tip tree.

I fixed it up (the former changed the wait_queue_t declarations
to DEFINE_WAIT_FUNC(), so I used that) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
