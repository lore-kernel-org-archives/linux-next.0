From: Benny Halevy <bhalevy-C4P08NqkoRlBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 1/2] SQUASHEM: nfsd41: define NFSD_DRC_SIZE_SHIFT in set_max_drc
Date: Mon,  6 Apr 2009 12:00:36 +0300
Message-ID: <1239008436-8073-1-git-send-email-bhalevy@panasas.com>
References: <49D9C308.6020500@panasas.com>
Return-path: <linux-nfs-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <49D9C308.6020500-C4P08NqkoRlBDgjK7y7TUQ@public.gmane.org>
Sender: linux-nfs-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: " J. Bruce Fields" <bfields-uC3wQj2KruNg9hUCZPvPmw@public.gmane.org>, Andy Adamson <andros-HgOvQuBEEgTQT0dZR+AlfA@public.gmane.org>
Cc: Alexander Beregalov <a.beregalov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pnfs-6DNke4IJHB0gsBAKwltoeQ@public.gmane.org, linux-nfs-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Benny Halevy <bhalevy-C4P08NqkoRlBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-next.vger.kernel.org

Fixes the following compiler error:
fs/nfsd/nfssvc.c: In function 'set_max_drc':
fs/nfsd/nfssvc.c:240: error: 'NFSD_DRC_SIZE_SHIFT' undeclared

CONFIG_NFSD_V4 is not set

Reported-by: Alexander Beregalov <a.beregalov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Benny Halevy <bhalevy-C4P08NqkoRlBDgjK7y7TUQ@public.gmane.org>
---
 fs/nfsd/nfssvc.c          |    2 ++
 include/linux/nfsd/nfsd.h |    3 ---
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/fs/nfsd/nfssvc.c b/fs/nfsd/nfssvc.c
index e9d5773..469c931 100644
--- a/fs/nfsd/nfssvc.c
+++ b/fs/nfsd/nfssvc.c
@@ -236,6 +236,8 @@ void nfsd_reset_versions(void)
  */
 static void set_max_drc(void)
 {
+	/* The percent of nr_free_buffer_pages used by the V4.1 server DRC */
+	#define NFSD_DRC_SIZE_SHIFT	7
 	nfsd_serv->sv_drc_max_pages = nr_free_buffer_pages()
 						>> NFSD_DRC_SIZE_SHIFT;
 	nfsd_serv->sv_drc_pages_used = 0;
diff --git a/include/linux/nfsd/nfsd.h b/include/linux/nfsd/nfsd.h
index 0ec4d14..2b49d67 100644
--- a/include/linux/nfsd/nfsd.h
+++ b/include/linux/nfsd/nfsd.h
@@ -333,9 +333,6 @@ extern struct timeval	nfssvc_boot;
 #define NFSD_LEASE_TIME                 (nfs4_lease_time())
 #define NFSD_LAUNDROMAT_MINTIMEOUT      10   /* seconds */
 
-/* The percent of nr_free_buffer_pages used by the V4.1 server DRC */
-#define NFSD_DRC_SIZE_SHIFT	7
-
 /*
  * The following attributes are currently not supported by the NFSv4 server:
  *    ARCHIVE       (deprecated anyway)
-- 
1.6.2.1

--
To unsubscribe from this list: send the line "unsubscribe linux-nfs" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
