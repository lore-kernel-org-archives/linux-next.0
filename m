From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: ttydev tree build failure
Date: Wed, 20 Aug 2008 18:23:53 +1000
Message-ID: <20080820182353.024d5a9e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:38278 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753138AbYHTIX7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 20 Aug 2008 04:23:59 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: linux-next@vger.kernel.org

Hi Alan,

Today's linux-next build (powerpc allnoconfig) failed like this:

drivers/char/pty.c:420: error: 'pty_bsd_ioctl' undeclared here (not in a function)

Caused by 5265223407c8eed1b023aca77492c631e2676f5c ("tty-fix-shutdown").
I applied the following patch (which may not be correct).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 20 Aug 2008 18:21:53 +1000
Subject: [PATCH] ttydev: fix for tty-fix-shutdown

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/char/pty.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/char/pty.c b/drivers/char/pty.c
index fbd215b..2cae85c 100644
--- a/drivers/char/pty.c
+++ b/drivers/char/pty.c
@@ -417,7 +417,7 @@ static const struct tty_operations pts_unix98_ops = {
 	.chars_in_buffer = pty_chars_in_buffer,
 	.unthrottle = pty_unthrottle,
 	.set_termios = pty_set_termios,
-	.ioctl = pty_bsd_ioctl,
+	.ioctl = pty_unix98_ioctl,
 	.shutdown = pty_shutdown
 };
 
-- 
1.5.6.3
