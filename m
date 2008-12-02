From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: cifs tree build failure
Date: Tue, 2 Dec 2008 13:23:18 +1100
Message-ID: <20081202132318.7e1581db.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:38608 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751555AbYLBCXk (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 1 Dec 2008 21:23:40 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Steve French <smfrench@gmail.com>, linux-cifs-client@lists.samba.org
Cc: linux-next@vger.kernel.org, Harvey Harrison <harvey.harrison@gmail.com>, "David S. Miller" <davem@davemloft.net>, Jeff Layton <jlayton@redhat.com>

Hi Steve,

Today's linux-next build (powerpc ppc64_defconfig) failed like this:

fs/cifs/cifsfs.c: In function 'cifs_show_options':
fs/cifs/cifsfs.c:363: error: 'NIP6_FMT' undeclared (first use in this function)
fs/cifs/cifsfs.c:363: error: (Each undeclared identifier is reported only once
fs/cifs/cifsfs.c:363: error: for each function it appears in.)
fs/cifs/cifsfs.c:364: error: implicit declaration of function 'NIP6'

Caused by the interaction of commits
b189db5d299c6824780af5590564ff608adb3dea ("net: remove NIP6(), NIP6_FMT,
NIP6_SEQFMT and final users") from the net tree and
20c4eef4f817ff65337e2fb3f1f5df52eeca09eb ("cifs: display addr and
prefixpath options in /proc/mounts") from the cifs tree.

I have reverted the include/linux/kernel.h part of the net tree patch for
now since the replacement (%p6) is not upstream yet ...

Dave, can you apply the below to the net tree, please.  The old interface
should really not go away until at least the end of the next merge
window ...

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 2 Dec 2008 13:11:22 +1100
Subject: [PATCH] net: don't remove the NIP6 interfaces yet

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 include/linux/kernel.h |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/include/linux/kernel.h b/include/linux/kernel.h
index ca9ff64..269df5a 100644
--- a/include/linux/kernel.h
+++ b/include/linux/kernel.h
@@ -372,6 +372,18 @@ static inline char *pack_hex_byte(char *buf, u8 byte)
 	((unsigned char *)&addr)[3]
 #define NIPQUAD_FMT "%u.%u.%u.%u"
 
+#define NIP6(addr) \
+	ntohs((addr).s6_addr16[0]), \
+	ntohs((addr).s6_addr16[1]), \
+	ntohs((addr).s6_addr16[2]), \
+	ntohs((addr).s6_addr16[3]), \
+	ntohs((addr).s6_addr16[4]), \
+	ntohs((addr).s6_addr16[5]), \
+	ntohs((addr).s6_addr16[6]), \
+	ntohs((addr).s6_addr16[7])
+#define NIP6_FMT "%04x:%04x:%04x:%04x:%04x:%04x:%04x:%04x"
+#define NIP6_SEQFMT "%04x%04x%04x%04x%04x%04x%04x%04x"
+
 #if defined(__LITTLE_ENDIAN)
 #define HIPQUAD(addr) \
 	((unsigned char *)&addr)[3], \
-- 
1.5.6.5
