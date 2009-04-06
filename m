From: Benny Halevy <bhalevy-C4P08NqkoRlBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 2/2] SQUASHME: nfsd41: define nfsd4_set_statp as noop for !CONFIG_NFSD_V4
Date: Mon,  6 Apr 2009 12:00:49 +0300
Message-ID: <1239008449-8105-1-git-send-email-bhalevy@panasas.com>
References: <49D9C308.6020500@panasas.com>
Return-path: <linux-nfs-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <49D9C308.6020500-C4P08NqkoRlBDgjK7y7TUQ@public.gmane.org>
Sender: linux-nfs-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: " J. Bruce Fields" <bfields-uC3wQj2KruNg9hUCZPvPmw@public.gmane.org>, Andy Adamson <andros-HgOvQuBEEgTQT0dZR+AlfA@public.gmane.org>
Cc: Alexander Beregalov <a.beregalov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pnfs-6DNke4IJHB0gsBAKwltoeQ@public.gmane.org, linux-nfs-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Benny Halevy <bhalevy-C4P08NqkoRlBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-next.vger.kernel.org

Fixes following modpost error:
ERROR: "nfsd4_set_statp" [fs/nfsd/nfsd.ko] undefined!

Signed-off-by: Benny Halevy <bhalevy-C4P08NqkoRlBDgjK7y7TUQ@public.gmane.org>
---
 include/linux/nfsd/cache.h |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/include/linux/nfsd/cache.h b/include/linux/nfsd/cache.h
index a59a2df..5bccaab 100644
--- a/include/linux/nfsd/cache.h
+++ b/include/linux/nfsd/cache.h
@@ -75,6 +75,13 @@ int	nfsd_reply_cache_init(void);
 void	nfsd_reply_cache_shutdown(void);
 int	nfsd_cache_lookup(struct svc_rqst *, int);
 void	nfsd_cache_update(struct svc_rqst *, int, __be32 *);
+
+#ifdef CONFIG_NFSD_V4
 void	nfsd4_set_statp(struct svc_rqst *rqstp, __be32 *statp);
+#else  /* CONFIG_NFSD_V4 */
+static inline void nfsd4_set_statp(struct svc_rqst *rqstp, __be32 *statp)
+{
+}
+#endif /* CONFIG_NFSD_V4 */
 
 #endif /* NFSCACHE_H */
-- 
1.6.2.1

--
To unsubscribe from this list: send the line "unsubscribe linux-nfs" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
