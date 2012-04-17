From: Heiko Carstens <heiko.carstens@de.ibm.com>
Subject: [PATCH -next] tty: add missing tty_port_tty_get() call to
 raw3215_wakeup
Date: Tue, 17 Apr 2012 13:16:34 +0200
Message-ID: <20120417111634.GA4382@osiris.boeblingen.de.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e06smtp18.uk.ibm.com ([195.75.94.114]:52022 "EHLO
	e06smtp18.uk.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754173Ab2DQLQ5 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 17 Apr 2012 07:16:57 -0400
Received: from /spool/local
	by e06smtp18.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <heiko.carstens@de.ibm.com>;
	Tue, 17 Apr 2012 12:16:55 +0100
Received: from d06av02.portsmouth.uk.ibm.com (d06av02.portsmouth.uk.ibm.com [9.149.37.228])
	by d06nrmr1707.portsmouth.uk.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id q3HBGa9J2642142
	for <linux-next@vger.kernel.org>; Tue, 17 Apr 2012 12:16:36 +0100
Received: from d06av02.portsmouth.uk.ibm.com (loopback [127.0.0.1])
	by d06av02.portsmouth.uk.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id q3HBGZqt029473
	for <linux-next@vger.kernel.org>; Tue, 17 Apr 2012 05:16:36 -0600
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-next@vger.kernel.org, Martin Schwidefsky <schwidefsky@de.ibm.com>, Jiri Slaby <jslaby@suse.cz>

Fix compile error caused by "TTY: con3215, use tty from tty_port":

 CC      drivers/s390/char/con3215.o
drivers/s390/char/con3215.c: In function 'raw3215_wakeup':
drivers/s390/char/con3215.c:339:16: error: 'struct raw3215_info' has no member named 'tty'
make[1]: *** [drivers/s390/char/con3215.o] Error 1
make: *** [drivers/s390/char/] Error 2

Cc: Jiri Slaby <jslaby@suse.cz>
Cc: Martin Schwidefsky <schwidefsky@de.ibm.com>
Signed-off-by: Heiko Carstens <heiko.carstens@de.ibm.com>
---
 drivers/s390/char/con3215.c |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/s390/char/con3215.c b/drivers/s390/char/con3215.c
index e928e04..6c0116d 100644
--- a/drivers/s390/char/con3215.c
+++ b/drivers/s390/char/con3215.c
@@ -336,7 +336,11 @@ static inline void raw3215_try_io(struct raw3215_info *raw)
 static void raw3215_wakeup(unsigned long data)
 {
 	struct raw3215_info *raw = (struct raw3215_info *) data;
-	tty_wakeup(raw->tty);
+	struct tty_struct *tty;
+
+	tty = tty_port_tty_get(&raw->port);
+	tty_wakeup(tty);
+	tty_kref_put(tty);
 }
 
 /*
-- 
1.7.9.6
