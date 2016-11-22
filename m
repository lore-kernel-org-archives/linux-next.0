From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the lightnvm tree with Linus' tree
Date: Tue, 22 Nov 2016 14:59:17 +1100
Message-ID: <20161122145917.4f1d0e86@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matias =?UTF-8?B?QmrDuHJsaW5n?= <m@bjorling.me>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jens Axboe <axboe@fb.com>
List-Id: linux-next.vger.kernel.org

Hi Matias,

Today's linux-next merge of the lightnvm tree got a conflict in:

  drivers/nvme/host/lightnvm.c

between commit:

  409ae5a76e05 ("lightnvm: invalid offset calculation for lba_shift")

from Linus' tree and commit:

  2db3cb58a3dd ("nvme: lightnvm: attach lightnvm sysfs to nvme block device")

from the lightnvm tree.

I fixed it up (I just used the latter version) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise
any particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
