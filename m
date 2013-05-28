From: Wenchao Xia <wenchaolinux@gmail.com>
Subject: [PATCH] vhost-scsi: return -ENOENT when no matching tcm_vhost_tpg found
Date: Tue, 28 May 2013 16:54:44 +0800
Message-ID: <1369731284-4139-1-git-send-email-wenchaolinux@gmail.com>
Return-path: <kvm-owner@vger.kernel.org>
Sender: kvm-owner@vger.kernel.org
To: linux-next@vger.kernel.org
Cc: wenchaolinuxkvm@gmail.com, mst@redhat.com, kvm@vger.kernel.org, virtualization@lists.linux-foundation.org, asias@redhat.com, pbonzini@redhat.com, nab@linux-iscsi.org, Wenchao Xia <wenchaolinux@gmail.com>
List-Id: linux-next.vger.kernel.org

ioctl for VHOST_SCSI_SET_ENDPOINT report file exist errori, when I forget
to set it correctly in configfs, make user confused. Actually it fail
to find a matching one, so change the error value.

Signed-off-by: Wenchao Xia <wenchaolinux@gmail.com>
---
 drivers/vhost/scsi.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/vhost/scsi.c b/drivers/vhost/scsi.c
index 7014202..6325b1d 100644
--- a/drivers/vhost/scsi.c
+++ b/drivers/vhost/scsi.c
@@ -1219,7 +1219,7 @@ static int vhost_scsi_set_endpoint(
 		}
 		ret = 0;
 	} else {
-		ret = -EEXIST;
+		ret = -ENOENT;
 	}
 
 	/*
-- 
1.7.1

