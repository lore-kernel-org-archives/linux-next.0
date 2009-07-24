From: Alexander Beregalov <a.beregalov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] ar9170: fix build error when !CONFIG_AR9170_LEDS
Date: Fri, 24 Jul 2009 11:55:44 +0400
Message-ID: <1248422144-6150-1-git-send-email-a.beregalov@gmail.com>
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, chunkeey-S0/GAf8tV78@public.gmane.org, linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Alexander Beregalov <a.beregalov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-next.vger.kernel.org

Fix this build error when CONFIG_AR9170_LEDS is not set
drivers/net/wireless/ath/ar9170/main.c:1296: error: 'struct ar9170' has
no member named 'led_work'

Signed-off-by: Alexander Beregalov <a.beregalov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/net/wireless/ath/ar9170/main.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/net/wireless/ath/ar9170/main.c b/drivers/net/wireless/ath/ar9170/main.c
index c7287a8..85a1452 100644
--- a/drivers/net/wireless/ath/ar9170/main.c
+++ b/drivers/net/wireless/ath/ar9170/main.c
@@ -1293,7 +1293,9 @@ static void ar9170_op_stop(struct ieee80211_hw *hw)
 	flush_workqueue(ar->hw->workqueue);
 
 	cancel_delayed_work_sync(&ar->tx_janitor);
+#ifdef CONFIG_AR9170_LEDS
 	cancel_delayed_work_sync(&ar->led_work);
+#endif
 	cancel_work_sync(&ar->filter_config_work);
 	cancel_work_sync(&ar->beacon_work);
 	mutex_lock(&ar->mutex);
-- 
1.6.3.3

--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
