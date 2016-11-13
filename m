From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning in Linus' tree
Date: Mon, 14 Nov 2016 09:25:54 +1100
Message-ID: <20161114092554.7980f16b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:46725 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S935048AbcKMWZ6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 13 Nov 2016 17:25:58 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mauro Carvalho Chehab <mchehab@s-opensource.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Linus <torvalds@linux-foundation.org>

Hi all,

Starting with Linus' tree, today's linux-next build (x86_64 allmodconfig) produced
this warning:

WARNING: modpost: missing MODULE_LICENSE() in drivers/media/dvb-frontends/gp8psk-fe.o

Introduced by commit

  7a0786c19d65 ("gp8psk: Fix DVB frontend attach")

-- 
Cheers,
Stephen Rothwell
