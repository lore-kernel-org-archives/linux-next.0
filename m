From: Randy Dunlap <rdunlap-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org>
Subject: [PATCH resend] nfsd: fix nfs4recover.c printk format warning
Date: Mon, 30 Apr 2012 12:25:31 -0700
Message-ID: <4F9EE72B.1020401@xenotime.net>
References: <20120419164643.d9f918d44c890722b7707508@canb.auug.org.au> <4F909C78.7000008@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-nfs-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4F909C78.7000008-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org>
Sender: linux-nfs-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Randy Dunlap <rdunlap-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org>
Cc: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "J. Bruce Fields" <bfields-uC3wQj2KruNg9hUCZPvPmw@public.gmane.org>, linux-nfs-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
List-Id: linux-next.vger.kernel.org

From: Randy Dunlap <rdunlap-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org>

Fix printk format warnings -- both items are size_t,
so use %zu to print them.

fs/nfsd/nfs4recover.c:580:3: warning: format '%lu' expects type 'long unsigned int', but argument 3 has type 'size_t'
fs/nfsd/nfs4recover.c:580:3: warning: format '%lu' expects type 'long unsigned int', but argument 4 has type 'unsigned int'

Signed-off-by: Randy Dunlap <rdunlap-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org>
Cc:	"J. Bruce Fields" <bfields-uC3wQj2KruNg9hUCZPvPmw@public.gmane.org>
Cc:	linux-nfs-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
---
 fs/nfsd/nfs4recover.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

This patch was originally sent on Apr.19/2012 for linux-next.
It is still needed in linux-next and in mainline.


--- linux-next-20120419.orig/fs/nfsd/nfs4recover.c
+++ linux-next-20120419/fs/nfsd/nfs4recover.c
@@ -577,7 +577,7 @@ cld_pipe_downcall(struct file *filp, con
 	struct cld_net *cn = nn->cld_net;
 
 	if (mlen != sizeof(*cmsg)) {
-		dprintk("%s: got %lu bytes, expected %lu\n", __func__, mlen,
+		dprintk("%s: got %zu bytes, expected %zu\n", __func__, mlen,
 			sizeof(*cmsg));
 		return -EINVAL;
 	}
--
To unsubscribe from this list: send the line "unsubscribe linux-nfs" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
