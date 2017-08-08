From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Signed-off-by missing for commit in the v4l-dvb tree
Date: Wed, 9 Aug 2017 07:47:26 +1000
Message-ID: <20170809074726.009440a2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:35505 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752305AbdHHVr2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 8 Aug 2017 17:47:28 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mauro Carvalho Chehab <mchehab@osg.samsung.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kbuild test robot <lkp@intel.com>, Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>, Fengguang Wu <fengguang.wu@intel.com>, Hans Verkuil <hans.verkuil@cisco.com>

Hi Mauro,

Commit

  05ad2b6dbbb0 ("media: i2c: fix semicolon.cocci warnings")

is missing a Signed-off-by from its author.  Preumably the author should
have been "Fengguang Wu <fengguang.wu@intel.com>"?

-- 
Cheers,
Stephen Rothwell
