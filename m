From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH v2] lockd: fix FILE_LOCKING=n build error
Date: Tue, 28 Apr 2009 14:01:00 -0700
Message-ID: <49F76E8C.3070808@oracle.com>
References: <20090428165343.2e357d7a.sfr@canb.auug.org.au>	 <49F71F4A.3080908@oracle.com> <20090428172137.GA22451@fieldses.org>	 <49F7421A.1090709@oracle.com> <1240942554.7376.38.camel@heimdal.trondhjem.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <1240942554.7376.38.camel@heimdal.trondhjem.org>
Sender: linux-fsdevel-owner@vger.kernel.org
To: Trond Myklebust <trond.myklebust@fys.uio.no>
Cc: "J. Bruce Fields" <bfields@fieldses.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Matthew Wilcox <matthew@wil.cx>, linux-fsdevel <linux-fsdevel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Trond Myklebust wrote:
> Until someone finds time to go through the code and add in all the
> CONFIG_FILE_LOCKING special cases, the above needs to be a 'depends on
> INET && FILE_LOCKING'.

That seems to work.  Thanks.




From: Randy Dunlap <randy.dunlap@oracle.com>

lockd without FILE_LOCKING doesn't make sense, so make LOCKD and
LOCKD_V4 depend on FILE_LOCKING, and make NFS depend on FILE_LOCKING.

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 fs/Kconfig     |    2 ++
 fs/nfs/Kconfig |    2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

--- linux-next-20090428.orig/fs/Kconfig
+++ linux-next-20090428/fs/Kconfig
@@ -226,10 +226,12 @@ source "fs/nfsd/Kconfig"
 
 config LOCKD
 	tristate
+	depends on FILE_LOCKING
 
 config LOCKD_V4
 	bool
 	depends on NFSD_V3 || NFS_V3
+	depends on FILE_LOCKING
 	default y
 
 config EXPORTFS
--- linux-next-20090428.orig/fs/nfs/Kconfig
+++ linux-next-20090428/fs/nfs/Kconfig
@@ -1,6 +1,6 @@
 config NFS_FS
 	tristate "NFS client support"
-	depends on INET
+	depends on INET && FILE_LOCKING
 	select LOCKD
 	select SUNRPC
 	select NFS_ACL_SUPPORT if NFS_V3_ACL
