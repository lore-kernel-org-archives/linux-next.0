From: Nicholas Mc Guire <der.herr@hofr.at>
Subject: Re: [PATCH] staging: rtl8188eu: style fixes
Date: Fri, 2 Jun 2017 17:41:22 +0000
Message-ID: <20170602174122.GB16574@osadl.at>
References: <20170602143643.GA9038@lear>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 92-243-34-74.adsl.nanet.at ([92.243.34.74]:41021 "EHLO
        mail.osadl.at" rhost-flags-OK-FAIL-OK-OK) by vger.kernel.org
        with ESMTP id S1751164AbdFBRvA (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 2 Jun 2017 13:51:00 -0400
Content-Disposition: inline
In-Reply-To: <20170602143643.GA9038@lear>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Galo <anglor@varoa.net>
Cc: linux-next@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Larry Finger <Larry.Finger@lwfinger.net>

On Fri, Jun 02, 2017 at 04:36:44PM +0200, Galo wrote:
> Fix several "CHECK: spaces preferred around that .." checks.
> 
> Signed-off-by: Galo Navarro <anglor@varoa.net>

cleanup patches are ok - but if you do cleanups you should also
run checkpatch.pl on your patch. This would have shown you that
two of the lines you fixed are over 80 char and should be broken

Also I do not see much sense in picking out individual lines for
space fixing and leaving other adjacent lines out e.g.:

        ss_final = ((u32)(src->PhyInfo.SignalStrength)+(u32)(dst->PhyInfo.SignalStrength)*4)/5;
        sq_final = ((u32)(src->PhyInfo.SignalQuality)+(u32)(dst->PhyInfo.SignalQuality)*4)/5;
        rssi_final = (src->Rssi+dst->Rssi*4)/5;

All three lines have the same spacing issue - but your patch addresses
the last line only. While it is ok not to fix all spacing issues in a
file at once I think that at least within a basic block one should keep
it consistent. style cleanup intends to make code more readable but if
styles are mixed on a line-by-line basis this goal is hardly achieved

I would prefere you redo this patch and ensure at least local consistency

> 
> ---
>  drivers/staging/rtl8188eu/core/rtw_mlme.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/staging/rtl8188eu/core/rtw_mlme.c b/drivers/staging/rtl8188eu/core/rtw_mlme.c
> index de9ab59..92f7297 100644
> --- a/drivers/staging/rtl8188eu/core/rtw_mlme.c
> +++ b/drivers/staging/rtl8188eu/core/rtw_mlme.c
> @@ -370,14 +370,14 @@ void update_network(struct wlan_bssid_ex *dst, struct wlan_bssid_ex *src,
>  		sq_final = padapter->recvpriv.signal_qual;
>  		/* the rssi value here is undecorated, and will be used for antenna diversity */
>  		if (sq_smp != 101) /* from the right channel */
> -			rssi_final = (src->Rssi+dst->Rssi*4)/5;
> +			rssi_final = (src->Rssi + dst->Rssi * 4) / 5;
>  		else
>  			rssi_final = rssi_ori;
>  	} else {
>  		if (sq_smp != 101) { /* from the right channel */
>  			ss_final = ((u32)(src->PhyInfo.SignalStrength)+(u32)(dst->PhyInfo.SignalStrength)*4)/5;
>  			sq_final = ((u32)(src->PhyInfo.SignalQuality)+(u32)(dst->PhyInfo.SignalQuality)*4)/5;
> -			rssi_final = (src->Rssi+dst->Rssi*4)/5;
> +			rssi_final = (src->Rssi + dst->Rssi * 4) / 5;
>  		} else {
>  			/* bss info not receiving from the right channel, use the original RX signal infos */
>  			ss_final = dst->PhyInfo.SignalStrength;
> @@ -1926,7 +1926,7 @@ unsigned int rtw_restructure_ht_ie(struct adapter *padapter, u8 *in_ie, u8 *out_
>  
>  		if (pqospriv->qos_option == 0) {
>  			out_len = *pout_len;
> -			rtw_set_ie(out_ie+out_len, _VENDOR_SPECIFIC_IE_,
> +			rtw_set_ie(out_ie + out_len, _VENDOR_SPECIFIC_IE_,
>  				   _WMM_IE_Length_, WMM_IE, pout_len);
>  
>  			pqospriv->qos_option = 1;
> @@ -1964,10 +1964,10 @@ unsigned int rtw_restructure_ht_ie(struct adapter *padapter, u8 *in_ie, u8 *out_
>  
>  		phtpriv->ht_option = true;
>  
> -		p = rtw_get_ie(in_ie+12, _HT_ADD_INFO_IE_, &ielen, in_len-12);
> +		p = rtw_get_ie(in_ie + 12, _HT_ADD_INFO_IE_, &ielen, in_len - 12);

		p = rtw_get_ie(in_ie + 12, _HT_ADD_INFO_IE_, &ielen,
			       in_len - 12);

>  		if (p && (ielen == sizeof(struct ieee80211_ht_addt_info))) {
>  			out_len = *pout_len;
> -			rtw_set_ie(out_ie+out_len, _HT_ADD_INFO_IE_, ielen, p+2, pout_len);
> +			rtw_set_ie(out_ie + out_len, _HT_ADD_INFO_IE_, ielen, p + 2, pout_len);

 			rtw_set_ie(out_ie + out_len, _HT_ADD_INFO_IE_, ielen,
 				   p + 2, pout_len);

>  		}
>  	}
>  	return phtpriv->ht_option;
> @@ -2058,8 +2058,8 @@ void rtw_issue_addbareq_cmd(struct adapter *padapter, struct xmit_frame *pxmitfr
>  	phtpriv = &psta->htpriv;
>  
>  	if ((phtpriv->ht_option) && (phtpriv->ampdu_enable)) {
> -		issued = (phtpriv->agg_enable_bitmap>>priority)&0x1;
> -		issued |= (phtpriv->candidate_tid_bitmap>>priority)&0x1;
> +		issued = (phtpriv->agg_enable_bitmap >> priority) & 0x1;
> +		issued |= (phtpriv->candidate_tid_bitmap >> priority) & 0x1;
>  
>  		if (issued == 0) {
>  			DBG_88E("rtw_issue_addbareq_cmd, p=%d\n", priority);
> -- 
> 2.1.4
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-next" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

thx!
hofrat
