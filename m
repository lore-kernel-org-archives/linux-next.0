From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net tree
Date: Wed, 24 Dec 2008 10:15:13 +1100
Message-ID: <20081224101513.def05c7e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:39944 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751791AbYLWXPV (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 23 Dec 2008 18:15:21 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, =?UTF-8?B?IktyenlzenRvZiBIYcWCYXNhIg==?= <khc@pm.waw.pl>, Inaky Perez-Gonzalez <inaky@linux.intel.com>

Hi Dave,

Today's linux-next merge of the net tree got a conflict in
Documentation/DocBook/networking.tmpl between commit
66aa675719ab82a03a66b75210fd40be6541f8fb ("wimax: Makefile, Kconfig and
docbook linkage for the stack") from the usb tree and commit
72364706c3b7c09a658e356218a918c5f92dcad0 ("WAN: syncppp.c is no longer
used by any kernel code. Remove it") from the net tree.

Juts an overlapping add/remove. I fixed it up (see below) and can carry
the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc Documentation/DocBook/networking.tmpl
index 7053c1c,627707a..0000000
--- a/Documentation/DocBook/networking.tmpl
+++ b/Documentation/DocBook/networking.tmpl
@@@ -98,17 -98,6 +98,14 @@@
  X!Enet/core/wireless.c
       </sect1>
  -->
-      <sect1><title>Synchronous PPP</title>
- !Edrivers/net/wan/syncppp.c
-      </sect1>
 +     <sect1><title>WiMAX</title>
 +!Enet/wimax/op-msg.c
 +!Enet/wimax/op-reset.c
 +!Enet/wimax/op-rfkill.c
 +!Enet/wimax/stack.c
 +!Iinclude/net/wimax.h
 +!Iinclude/linux/wimax.h
 +     </sect1>
    </chapter>
  
  </book>
