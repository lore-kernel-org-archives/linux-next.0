From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the char-misc tree with the lightnvm
 tree
Date: Tue, 22 Nov 2016 18:29:08 +1100
Message-ID: <20161122182908.4c961d64@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>, Matias =?UTF-8?B?QmrDuHJsaW5n?= <m@bjorling.me>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Gortmaker <paul.gortmaker@windriver.com>, Javier =?UTF-8?B?R29uesOhbGV6?= <jg@lightnvm.io>
List-Id: linux-next.vger.kernel.org

Hi all,

Today's linux-next merge of the char-misc tree got a conflict in:

  drivers/lightnvm/core.c

between commit:

  7b0d392f6957 ("lightnvm: remove sysfs configuration interface")

from the lightnvm tree and commit:

  389b2a1c0e90 ("lightnvm: make core.c explicitly non-modular")

from the char-misc tree.

I fixed it up (the former removed the code that was commented by the
latter, so I just removed it) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your
tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

I do wonder why commit 389b2a1c0e90 is in the char-misc tree and not
the lightnvm or block trees?
-- 
Cheers,
Stephen Rothwell
