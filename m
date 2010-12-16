From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] crypto: fix af_alg memory_allocated data type
Date: Thu, 16 Dec 2010 10:18:00 -0800
Message-ID: <20101216101800.36529e89.randy.dunlap@oracle.com>
References: <20101216173745.264eb2ca.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-crypto-owner@vger.kernel.org>
In-Reply-To: <20101216173745.264eb2ca.sfr@canb.auug.org.au>
Sender: linux-crypto-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Herbert Xu <herbert@gondor.hengli.com.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-crypto@vger.kernel.org
List-Id: linux-next.vger.kernel.org

From: Randy Dunlap <randy.dunlap@oracle.com>

Change data type to fix warning:

crypto/af_alg.c:35: warning: initialization from incompatible pointer type

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 crypto/af_alg.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20101216.orig/crypto/af_alg.c
+++ linux-next-20101216/crypto/af_alg.c
@@ -27,7 +27,7 @@ struct alg_type_list {
 	struct list_head list;
 };
 
-static atomic_t alg_memory_allocated;
+static atomic_long_t alg_memory_allocated;
 
 static struct proto alg_proto = {
 	.name			= "ALG",
