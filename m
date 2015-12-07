From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vfs tree with the s390 tree
Date: Tue, 8 Dec 2015 09:31:44 +1100
Message-ID: <20151208093144.05913519@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Al Viro <viro@ZenIV.linux.org.uk>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Hi Al,

Today's linux-next merge of the vfs tree got a conflict in:

  drivers/s390/char/zcore.c

between commit:

  ffa52d02c50e ("s390/zcore: remove /sys/kernel/debug/zcore/mem")

from the s390 tree and commit:

  41fb31e4f962 ("new helper: no_seek_end_llseek()")

from the vfs tree.

I fixed it up (the former removed the code modifie by the latter, so I
did that) and can carry the fix as necessary (no action is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
