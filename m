From: Zefir Kurtisi <zefir.kurtisi-ASv44eHyqLVBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH] ath9k: fix roadkill due to Joe's patch on ath_dbg() changes
Date: Tue, 20 Dec 2011 10:34:46 +0100
Message-ID: <4EF056B6.4050204@neratec.com>
References: <1324351843-4115-1-git-send-email-rodrigue@qca.qualcomm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1324351843-4115-1-git-send-email-rodrigue-A+ZNKFmMK5xy9aJCnZT0Uw@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Luis R. Rodriguez" <rodrigue-A+ZNKFmMK5xy9aJCnZT0Uw@public.gmane.org>
Cc: linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Luis R. Rodriguez" <mcgrof-A+ZNKFmMK5xy9aJCnZT0Uw@public.gmane.org>, Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>, Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
List-Id: linux-next.vger.kernel.org

Luis,

thank you for fixing this that fast. And sorry for the follow-up work after you helped me so much to get the DFS patches upstreamable.


Thanks again,
Zefir

On 12/20/2011 04:30 AM, Luis R. Rodriguez wrote:
> From: Luis R. Rodriguez <mcgrof-A+ZNKFmMK5xy9aJCnZT0Uw@public.gmane.org>
> 
> Joe changed ath_dbg() to simpify code but while his patch was
> being merged dfs.c was born and as such did not get the change
> Joe envisioned. This fixes that. Test compiled with:
> 
>  make allmodconfig
> 
> Cc: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
> Cc: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
> Cc: John W. Linville <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>
> Reported-by: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
> Signed-off-by: Luis R. Rodriguez <mcgrof-A+ZNKFmMK5xy9aJCnZT0Uw@public.gmane.org>
> ---
>  drivers/net/wireless/ath/ath9k/dfs.c |    8 ++++----
>  1 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath9k/dfs.c b/drivers/net/wireless/ath/ath9k/dfs.c
> index e4e84a9..f4f56af 100644
> --- a/drivers/net/wireless/ath/ath9k/dfs.c
> +++ b/drivers/net/wireless/ath/ath9k/dfs.c
> @@ -66,7 +66,7 @@ ath9k_postprocess_radar_event(struct ath_softc *sc,
>  	u8 rssi;
>  	u16 dur;
>  
> -	ath_dbg(ath9k_hw_common(sc->sc_ah), ATH_DBG_DFS,
> +	ath_dbg(ath9k_hw_common(sc->sc_ah), DFS,
>  		"pulse_bw_info=0x%x, pri,ext len/rssi=(%u/%u, %u/%u)\n",
>  		are->pulse_bw_info,
>  		are->pulse_length_pri, are->rssi,
> @@ -161,7 +161,7 @@ void ath9k_dfs_process_phyerr(struct ath_softc *sc, void *data,
>  
>  	if ((!(rs->rs_phyerr != ATH9K_PHYERR_RADAR)) &&
>  	    (!(rs->rs_phyerr != ATH9K_PHYERR_FALSE_RADAR_EXT))) {
> -		ath_dbg(common, ATH_DBG_DFS,
> +		ath_dbg(common, DFS,
>  			"Error: rs_phyer=0x%x not a radar error\n",
>  			rs->rs_phyerr);
>  		return;
> @@ -190,7 +190,7 @@ void ath9k_dfs_process_phyerr(struct ath_softc *sc, void *data,
>  	ard.pulse_length_ext = vdata_end[-2];
>  	ard.pulse_length_pri = vdata_end[-3];
>  
> -	ath_dbg(common, ATH_DBG_DFS,
> +	ath_dbg(common, DFS,
>  		"bw_info=%d, length_pri=%d, length_ext=%d, "
>  		"rssi_pri=%d, rssi_ext=%d\n",
>  		ard.pulse_bw_info, ard.pulse_length_pri, ard.pulse_length_ext,
> @@ -200,7 +200,7 @@ void ath9k_dfs_process_phyerr(struct ath_softc *sc, void *data,
>  	drp.ts = mactime;
>  	if (ath9k_postprocess_radar_event(sc, &ard, &drp)) {
>  		static u64 last_ts;
> -		ath_dbg(common, ATH_DBG_DFS,
> +		ath_dbg(common, DFS,
>  			"ath9k_dfs_process_phyerr: channel=%d, ts=%llu, "
>  			"width=%d, rssi=%d, delta_ts=%llu\n",
>  			drp.freq, drp.ts, drp.width, drp.rssi, drp.ts-last_ts);

--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
