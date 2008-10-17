From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the hdlc tree
Date: Fri, 17 Oct 2008 16:50:46 +1100
Message-ID: <20081017165046.b5a05953.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:34992 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751455AbYJQFuw (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 17 Oct 2008 01:50:52 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Krzysztof Halasa <khc@pm.waw.pl>
Cc: linux-next@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>

Hi Krzysztof,

Today's linux-next merge of the hdlc tree got a conflict in
Documentation/DocBook/Makefile between commit
7e3975617df8dd8b7fd94f14200abdec9f71729e ("Remove videobook.tmpl") from
Linus' tree and commit 9c7205161b03a43861765a26fc72f5a00fdadf75 ("WAN:
syncppp.c is no longer used by any kernel code. Remove it") from the hdlc
tree.

Overlapping changes.  I fixed it up (see below).
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc Documentation/DocBook/Makefile
index fabc064,69f4a93..0000000
--- a/Documentation/DocBook/Makefile
+++ b/Documentation/DocBook/Makefile
@@@ -6,7 -6,7 +6,7 @@@
  # To add a new book the only step required is to add the book to the
  # list of DOCBOOKS.
  
- DOCBOOKS := wanbook.xml z8530book.xml mcabook.xml \
 -DOCBOOKS := z8530book.xml mcabook.xml videobook.xml \
++DOCBOOKS := z8530book.xml mcabook.xml \
  	    kernel-hacking.xml kernel-locking.xml deviceiobook.xml \
  	    procfs-guide.xml writing_usb_driver.xml networking.xml \
  	    kernel-api.xml filesystems.xml lsm.xml usb.xml kgdb.xml \
