From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vhost tree with the kbuild tree
Date: Tue, 28 Mar 2017 14:57:23 +1100
Message-ID: <20170328145723.6345493c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Michael S. Tsirkin" <mst@redhat.com>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Nicolas Dichtel <nicolas.dichtel@6wind.com>
List-Id: linux-next.vger.kernel.org

Hi Michael,

Today's linux-next merge of the vhost tree got a conflict in:

  include/uapi/linux/Kbuild

between commit:

  65017bab8a9e ("uapi: export all headers under uapi directories")

from the kbuild tree and commit:

  80363894995b ("virtio_mmio: expose header to userspace")

from the vhost tree.

I fixed it up (the former supercedes the latter, so I used the former)
and can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
