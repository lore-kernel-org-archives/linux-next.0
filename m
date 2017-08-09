From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Signed-off-by missing for commit in the v4l-dvb tree
Date: Thu, 10 Aug 2017 09:19:13 +1000
Message-ID: <20170810091913.52034d41@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:46723 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752067AbdHIXTP (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 9 Aug 2017 19:19:15 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mauro Carvalho Chehab <mchehab@osg.samsung.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Mauro,

Commit

  383c36471c00 ("media: cx231xx: only unregister successfully registered i2c adapters")

is missing a Signed-off-by from its committer.

-- 
Cheers,
Stephen Rothwell
