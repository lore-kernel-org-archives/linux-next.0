From: Trond Myklebust <trond.myklebust@fys.uio.no>
Subject: Re: linux-next: nfs tree build failure
Date: Thu, 12 Mar 2009 14:54:32 -0400
Message-ID: <1236884072.7179.37.camel@heimdal.trondhjem.org>
References: <20090312112605.d22546b6.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-out2.uio.no ([129.240.10.58]:60340 "EHLO mail-out2.uio.no"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751587AbZCLSym (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 12 Mar 2009 14:54:42 -0400
In-Reply-To: <20090312112605.d22546b6.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Ian Dall <ian@beware.dropbear.id.au>

On Thu, 2009-03-12 at 11:26 +1100, Stephen Rothwell wrote:
> Hi Trond,
> 
> Today's linux-next build (powerpc ppc64_defconfig) failed like this:
> 
> fs/built-in.o: In function `.nfs_get_client':
> client.c:(.text+0x115010): undefined reference to `.__ipv6_addr_type'
> 
> # CONFIG_IPV6 is not set
> 
> Probably caused by commit d7371c41b0cda782256b1df759df4e8d4724584c ("Bug
> 11061, NFS mounts dropped").
> 
> I have used the nfs tree from next-20090311 instead of today's.

Should be fixed in today's tree. I appended the following patch:
-----------------------------------------------------------------
From: Trond Myklebust <Trond.Myklebust@netapp.com>
Subject: NFS: Fix the fix to Bugzilla #11061, when IPv6 isn't defined...

Stephen Rothwell reports:

Today's linux-next build (powerpc ppc64_defconfig) failed like this:

fs/built-in.o: In function `.nfs_get_client':
client.c:(.text+0x115010): undefined reference to `.__ipv6_addr_type'

Fix by moving the IPV6 specific parts of commit
d7371c41b0cda782256b1df759df4e8d4724584c ("Bug 11061, NFS mounts dropped")
into the '#ifdef IPV6..." section.

Also fix up a couple of formatting issues.

Signed-off-by: Trond Myklebust <Trond.Myklebust@netapp.com>
---

 fs/nfs/client.c |   68 ++++++++++++++++++++++++++++++++-----------------------
 1 files changed, 39 insertions(+), 29 deletions(-)


diff --git a/fs/nfs/client.c b/fs/nfs/client.c
index 06654b8..574158a 100644
--- a/fs/nfs/client.c
+++ b/fs/nfs/client.c
@@ -255,6 +255,32 @@ static int nfs_sockaddr_match_ipaddr(const struct sockaddr *sa1,
 	}
 	return 0;
 }
+
+/*
+ * Test if two ip6 socket addresses refer to the same socket by
+ * comparing relevant fields. The padding bytes specifically, are not
+ * compared. sin6_flowinfo is not compared because it only affects QoS
+ * and sin6_scope_id is only compared if the address is "link local"
+ * because "link local" addresses need only be unique to a specific
+ * link. Conversely, ordinary unicast addresses might have different
+ * sin6_scope_id.
+ *
+ * The caller should ensure both socket addresses are AF_INET6.
+ */
+static int nfs_sockaddr_cmp_ip6(const struct sockaddr *sa1,
+				const struct sockaddr *sa2)
+{
+	const struct sockaddr_in6 *saddr1 = (const struct sockaddr_in6 *)sa1;
+	const struct sockaddr_in6 *saddr2 = (const struct sockaddr_in6 *)sa2;
+
+	if (!ipv6_addr_equal(&saddr1->sin6_addr,
+			     &saddr1->sin6_addr))
+		return 0;
+	if (ipv6_addr_scope(&saddr1->sin6_addr) == IPV6_ADDR_SCOPE_LINKLOCAL &&
+	    saddr1->sin6_scope_id != saddr2->sin6_scope_id)
+		return 0;
+	return saddr1->sin6_port == saddr2->sin6_port;
+}
 #else
 static int nfs_sockaddr_match_ipaddr4(const struct sockaddr_in *sa1,
 				 const struct sockaddr_in *sa2)
@@ -270,6 +296,12 @@ static int nfs_sockaddr_match_ipaddr(const struct sockaddr *sa1,
 	return nfs_sockaddr_match_ipaddr4((const struct sockaddr_in *)sa1,
 			(const struct sockaddr_in *)sa2);
 }
+
+static int nfs_sockaddr_cmp_ip6(const struct sockaddr * sa1,
+				const struct sockaddr * sa2)
+{
+	return 0;
+}
 #endif
 
 /*
@@ -279,38 +311,18 @@ static int nfs_sockaddr_match_ipaddr(const struct sockaddr *sa1,
  *
  * The caller should ensure both socket addresses are AF_INET.
  */
-static int nfs_sockaddr_cmp_ip4(const struct sockaddr_in * saddr1,
-				const struct sockaddr_in * saddr2)
+static int nfs_sockaddr_cmp_ip4(const struct sockaddr *sa1,
+				const struct sockaddr *sa2)
 {
+	const struct sockaddr_in *saddr1 = (const struct sockaddr_in *)sa1;
+	const struct sockaddr_in *saddr2 = (const struct sockaddr_in *)sa2;
+
 	if (saddr1->sin_addr.s_addr != saddr2->sin_addr.s_addr)
 		return 0;
 	return saddr1->sin_port == saddr2->sin_port;
 }
 
 /*
- * Test if two ip6 socket addresses refer to the same socket by
- * comparing relevant fields. The padding bytes specifically, are not
- * compared. sin6_flowinfo is not compared because it only affects QoS
- * and sin6_scope_id is only compared if the address is "link local"
- * because "link local" addresses need only be unique to a specific
- * link. Conversely, ordinary unicast addresses might have different
- * sin6_scope_id.
- *
- * The caller should ensure both socket addresses are AF_INET6.
- */
-static int nfs_sockaddr_cmp_ip6 (const struct sockaddr_in6 * saddr1,
-				 const struct sockaddr_in6 * saddr2)
-{
-	if (!ipv6_addr_equal(&saddr1->sin6_addr,
-			     &saddr1->sin6_addr))
-		return 0;
-	if (ipv6_addr_scope(&saddr1->sin6_addr) == IPV6_ADDR_SCOPE_LINKLOCAL &&
-	    saddr1->sin6_scope_id != saddr2->sin6_scope_id)
-		return 0;
-	return saddr1->sin6_port == saddr2->sin6_port;
-}
-
-/*
  * Test if two socket addresses represent the same actual socket,
  * by comparing (only) relevant fields.
  */
@@ -322,11 +334,9 @@ static int nfs_sockaddr_cmp(const struct sockaddr *sa1,
 
 	switch (sa1->sa_family) {
 	case AF_INET:
-		return nfs_sockaddr_cmp_ip4((const struct sockaddr_in *) sa1,
-					    (const struct sockaddr_in *) sa2);
+		return nfs_sockaddr_cmp_ip4(sa1, sa2);
 	case AF_INET6:
-		return nfs_sockaddr_cmp_ip6((const struct sockaddr_in6 *) sa1,
-					    (const struct sockaddr_in6 *) sa2);
+		return nfs_sockaddr_cmp_ip6(sa1, sa2);
 	}
 	return 0;
 }
