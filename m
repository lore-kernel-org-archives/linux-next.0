From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: unsigned commit in the v4l-dvb-fixes tree
Date: Wed, 26 Jul 2017 11:02:08 +1000
Message-ID: <20170726110208.03d9a32b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:51951 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751047AbdGZBCK (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 25 Jul 2017 21:02:10 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mauro Carvalho Chehab <mchehab@osg.samsung.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Javier Martinez Canillas <javierm@redhat.com>

Hi Mauro,

I noticed that commit

  bb3abbb74efd ("media: vimc: set id_table for platform drivers")

has no Signed-off-by for you as the committer.

-- 
Cheers,
Stephen Rothwell
