From: Luciano Coelho <coelho-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH -next] wireless: TI wlxxx depends on MAC80211
Date: Thu, 03 May 2012 15:55:55 +0300
Message-ID: <1336049755.12189.30.camel@cumari.coelho.fi>
References: <20120416161121.261ba4e7e38989173accfb16@canb.auug.org.au>
	 <4F8C784B.2040402@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4F8C784B.2040402-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Randy Dunlap <rdunlap-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org>
Cc: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "John W. Linville" <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>
List-Id: linux-next.vger.kernel.org

On Mon, 2012-04-16 at 12:51 -0700, Randy Dunlap wrote:
> From: Randy Dunlap <rdunlap-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org>
> 
> wl12xx build fails with many undefined symbol errors when MAC80211
> and CFG80211 are not enabled, so make WLCORE and WL12XX depend
> on MAC80211 (which already depends on CFG80211).
> 
> Here are a few of the many build errors:
> 
> drivers/built-in.o: In function `wl1271_register_hw':
> main.c:(.text+0x4197cd): undefined reference to `ieee80211_register_hw'
> drivers/built-in.o: In function `wl1271_rx_streaming_timer':
> main.c:(.text+0x419818): undefined reference to `ieee80211_queue_work'
> drivers/built-in.o: In function `wl1271_flush_deferred_work':
> main.c:(.text+0x419910): undefined reference to `ieee80211_rx'
> main.c:(.text+0x419938): undefined reference to `ieee80211_tx_status'
> drivers/built-in.o: In function `wl12xx_op_channel_switch':
> main.c:(.text+0x419afc): undefined reference to `ieee80211_chswitch_done'
> drivers/built-in.o: In function `wl1271_ssid_set':
> drivers/built-in.o: In function `wl1271_event_process':
> event.c:(.text+0x41fec4): undefined reference to `ieee80211_sched_scan_stopped'
> event.c:(.text+0x41ff88): undefined reference to `ieee80211_cqm_rssi_notify'
> event.c:(.text+0x42000d): undefined reference to `ieee80211_stop_rx_ba_session'
> event.c:(.text+0x420048): undefined reference to `ieee80211_stop_rx_ba_session'
> event.c:(.text+0x4200b8): undefined reference to `ieee80211_chswitch_done'
> event.c:(.text+0x4201ae): undefined reference to `ieee80211_find_sta'
> event.c:(.text+0x4201ba): undefined reference to `ieee80211_report_low_ack'
> event.c:(.text+0x42021b): undefined reference to `ieee80211_connection_loss'
> drivers/built-in.o: In function `wl1271_tx_complete_packet':
> tx.c:(.text+0x4206a6): undefined reference to `ieee80211_get_hdrlen_from_skb'
> drivers/built-in.o: In function `wl1271_tx_fill_hdr':
> tx.c:(.text+0x4208ca): undefined reference to `ieee80211_hdrlen'
> drivers/built-in.o: In function `wl1271_handle_tx_low_watermark':
> (.text+0x420e25): undefined reference to `ieee80211_wake_queue'
> drivers/built-in.o: In function `wl12xx_rearm_rx_streaming':
> (.text+0x420ed9): undefined reference to `ieee80211_queue_work'
> drivers/built-in.o: In function `wl1271_tx_work_locked':
> (.text+0x421008): undefined reference to `ieee80211_free_txskb'
> drivers/built-in.o: In function `wl1271_rx_status.clone.2':
> rx.c:(.text+0x421593): undefined reference to `ieee80211_channel_to_frequency'
> drivers/built-in.o: In function `wl1271_ps_filter_frames':
> ps.c:(.text+0x421a41): undefined reference to `ieee80211_tx_status'
> 
> Signed-off-by: Randy Dunlap <rdunlap-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org>
> Cc:	Luciano Coelho <coelho-l0cyMroinI0@public.gmane.org>
> Cc:	linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc:	"John W. Linville" <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>
> ---

Applied! Thanks Randy, and sorry for the delay in pushing this through
my tree.


--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
