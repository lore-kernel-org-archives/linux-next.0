From: Miklos Szeredi <miklos@szeredi.hu>
Subject: request new tree for linux-next
Date: Wed, 17 Aug 2016 14:58:17 +0200
Message-ID: <CAJfpegsWt52zN33xzyXzQEjmT-rTjJG6vU_vQ_iEejFtVZ-MYA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-oi0-f67.google.com ([209.85.218.67]:35501 "EHLO
	mail-oi0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751463AbcHQM6T (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 17 Aug 2016 08:58:19 -0400
Received: by mail-oi0-f67.google.com with SMTP id e80so10516363oig.2
        for <linux-next@vger.kernel.org>; Wed, 17 Aug 2016 05:58:18 -0700 (PDT)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

Hi Stephen,

Could you please add

  git://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/vfs.git#next

to -next?

This is for any filesystem related stuff that doesn't fit in the fuse
or overlayfs queues.

Thanks,
Miklos
