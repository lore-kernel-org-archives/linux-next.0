From: Michael Ellerman <mpe@ellerman.id.au>
Subject: linux-next: manual merge of the akpm-current tree with the vfs tree
Date: Wed, 17 Jun 2015 13:24:13 +1000
Message-ID: <1434511453.24642.8.camel@ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:42854 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753023AbbFQDYO (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 16 Jun 2015 23:24:14 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Fabian Frederick <fabf@skynet.be>

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in:

  fs/ufs/namei.c

between commit:

  a50e4a02ad69 "ufs: don't bother with lock_ufs()/unlock_ufs() for directory access"

from the vfs tree and commit:

  2ce1efe3965b "fs/ufs: revert "ufs: fix deadlocks introduced by sb mutex merge"

from the akpm-current tree.

I fixed it up by taking the vfs version and can carry the fix as necessary (no
action is required).

cheers
