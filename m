Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F9D3B1EFC
	for <linux-next@vger.kernel.org>; Tue, 21 Jul 2026 20:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784666077; cv=none; b=mo8eAcsprBcWXcfCgnFNBgQiY9FrJN4Qv0G4g3u8VPGBrQEaL7IXaH4yAOPkzfp38f6RW/qkoWK0WnBTDRC6eW0SZuNn+Woe9mFzpVwwM9qAbUNYlQGk/xMOenrc8OmozJlo/XAj9GotkrxRYUsiCO4fWtzhO9bgPgTy7n0x//8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784666077; c=relaxed/simple;
	bh=5mSz64f3sC+77w6YSTGrW+T6pLl4dO8lkOxiW18lx4M=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=PTxH0X48VUJ5wskFavn0Ndioc8b/WAWVdcRqFOR8Qvshr95RxF89xbuzDBNTjhw7NE+atYkZ+msbGqvabjdXEFufW/m9Pw5mfuLJxi7DyNQ4KQvQVFEMddblYLBteE0egAS/M02Pid6uYTsoyE4IyJCRIGHBJIsxtMVp9PDa8Ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fii+mBbR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F/LtmZhv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fii+mBbR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F/LtmZhv"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LH2cJf2160318
	for <linux-next@vger.kernel.org>; Tue, 21 Jul 2026 20:34:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WLRXMkWV8tA9ERL4FELLls+FLC+Njte9SeASwXi/Nu8=; b=Fii+mBbRhJLKThsm
	wTCFdV5JNkh91OAfS3K71oHdkU4nRX9kkWm+WOdlF3QyTufzoMF97u5TX6oqusMD
	qF5uDzIsG8RDCfM7TqoNt/R5tDUQ1pwH/Oa0V+aYw6xwvX9HaBkhCqpNAH48nEOg
	DR1FFt5DroNipjXbkgtR4OmUYN+753UFNFnc7vMjGyfU0VwVCUdWu0yippvIMz9K
	VwjGom3HwV7LbUUMVE3MeZiWHtmUFRHhgnA177/5cXbeBNibCcPAEQSjrP4B1de6
	SrqT9siofYyf2y3IyGXKPBSUyxT4qFgR2gMhMA0sp473E0/8/duSyS8UUeo9i0La
	Xh5Fpg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj9c421xb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-next@vger.kernel.org>; Tue, 21 Jul 2026 20:34:35 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c85798977dcso14119165a12.0
        for <linux-next@vger.kernel.org>; Tue, 21 Jul 2026 13:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784666075; x=1785270875; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WLRXMkWV8tA9ERL4FELLls+FLC+Njte9SeASwXi/Nu8=;
        b=F/LtmZhvRm68IayMdG6FoE2K9552rUKT89pTW4CYTs2+/LGnGWIObHUgwMI0zeKYjS
         1XJNBTqgVzRimicaE/ihoJIOucI8HeRO3hBJeuclHWyadhQKwnZRIYECgladDEKAx8xq
         Z83OXv7jJYAJg1mwkrSSEKaRls6AouLelwt5VVfPrxmhGgz5TLhXSpAnFZLYiGuSJbFG
         y9UQhfwHBQbC84F4HPB5k9/LVYJOj+L5hoKPc8A7765LZn+mOaKAh6gIx4wjhtq0rLQl
         zhKAPID17BFSfYn+2cW/8bNYDWMAxlnHDUksajocdAwLzuc14iOw6VGZGKKR1wO3jvnf
         nhoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784666075; x=1785270875;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WLRXMkWV8tA9ERL4FELLls+FLC+Njte9SeASwXi/Nu8=;
        b=GXB7UD4rgliaZfq0l/iM7laavQbcLNwXHU9YH6w7D1RuMufdXLOe2wTNdzendir5YU
         B8iM19wULKTTkEPNEai7GJ7EiVAFuLI1Te032jBwcLc4XRCq41vlGcjNWeLInm43Fb0S
         Rj4vuSmTA96f/fmHOgqyHG9R1zC/xb0fEyjik3woBlkTI4y9BBNBOmRQMYSk56OkJzS5
         FgauDq1DScQxmPqirh6X9ysNUNJ1OiiXyOB/wE0kqW2R9fc0+eByqEIdYiw24JY/Q8pS
         Lu0VixRkrpCoczGl2/gs8cMYYubgz79KVNW705TRPi+W7KDMgcq6sFsONTRNeMZKzUlc
         o3JQ==
X-Gm-Message-State: AOJu0YxxOIyIA+Zt01nt57/q762oceFhicAt6Vb50gJwLS7/InqQY45/
	7MuVxq4RArsFLzke6dMlOglRR2qKYbu9Q0f0YRaSLqAQYkmUSZ4caWldOJlQfapBOBC9mVvVGMu
	VofrndwJjE8+yt4oBGmnWseG2An5NWqxcL73yg5Hb3O+80cMXa7YvD6Y01IrsGw5X6sVYM678
X-Gm-Gg: AR+sD12pXcUdFDdbzXOkaFBhSc/TIfOmE37EUH3agDB104WZcZXS2EakPqgLH99bRxY
	AnkhCYuUdUm4idGftFC9atvINFTBPtAdn7FuTSGuIBlpeHP716hSYmc2Fpyh66OT7KSmb/rUoVk
	mijSRVi8SsipQyyhWiMYdhEJkrQhJudU/24xqsfIYB+pMob0YBjhrTjor7B5ogWerRado2h+7uU
	RtsErhCqnOnHW5Lp1uAWr0D0qAAF2KNvHn7PdyWmIOYP2+S5dZigm2qRyTbk4S8W54/SxM2ga+1
	xNsloK732b/6t2OUR5STeJaxwlSnMkLcQQ2AvKf1gFEK1io9laZMaANuUI+bLaG4nz5tAZtlfHa
	lCS1sivpGhDWibRIgEKJJZAZLCyHfb9bLATA1GyazhtcD3+oUMr6jNUSSxw==
X-Received: by 2002:a05:6a21:1f81:b0:3b2:8685:118b with SMTP id adf61e73a8af0-3c3ad66b6f7mr22557306637.20.1784666074823;
        Tue, 21 Jul 2026 13:34:34 -0700 (PDT)
X-Received: by 2002:a05:6a21:1f81:b0:3b2:8685:118b with SMTP id adf61e73a8af0-3c3ad66b6f7mr22557280637.20.1784666074360;
        Tue, 21 Jul 2026 13:34:34 -0700 (PDT)
Received: from [192.168.1.11] (15.sub-75-218-246.myvzw.com. [75.218.246.15])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1cf8fasm1639658eec.31.2026.07.21.13.34.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 13:34:33 -0700 (PDT)
Message-ID: <40efd021-9a65-4669-83a7-38a45c3d9846@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 13:34:32 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: conflicting changes between wireless and wireless-next
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>
References: <d5581c2d-ec80-4698-8d2b-055e8e8e909f@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <d5581c2d-ec80-4698-8d2b-055e8e8e909f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=I4JVgtgg c=1 sm=1 tr=0 ts=6a5fd7db cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=6VQYfvmiyQ8t40WkS/mQdw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=QyXUC8HyAAAA:8 a=6LRLqSnDzlHCCWA_l4MA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: zCj3M28JWhvDEeX9Mt-aYS3SqbPV9mC3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDIxMyBTYWx0ZWRfX0t/gRhLoiLH0
 RI1Y+j3NfRhi3m90QhL7DzHY61/8F3Izwz2RV+/T/3aEoYISzz+mK6GTqr52+PIqeEQ85BUlclg
 TU7MRHuMGmcG5WNCowGmm66eLRHbX6yjgt4rGCtlGwxcZy9nraIKW01wmPeaUQuimKgh2vfLOta
 lHV6i1weI/Sla7PBi7Wix/5zQkGkQVAK7A3rIiZ1o7gBdivw4lFVI+Y608ftCuASOUFTualHjAj
 oMhgh5hKHmDHJ8UCCWJ1AgD/cYib4U/Y50pxgY50HcdPQTD3Z8ET/moqkFicqNlvXacyUjJVX7e
 3Hy60EUVCYUnqF1wwmg+rp2cILlqTh3ojX9/k87Kr3mi2qlMyiOpt/OPBfWXpYdGvvdrqKwGC/g
 zCy3R8/f0zy/Wxi9bv38D9AGkzyJ9cU69K4aqVi/C+jWhEtp2+EEUJ2nWnIwN4NvAfuV+exs5XI
 q6SGMd7dmQkiUNOt76w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDIxMyBTYWx0ZWRfX9Ns4EE2wbV6K
 +5CFSEAuSBbnu+WSIEBhBGG0xPTOl40u+SPwmGmDD9b+z92RrJxF1hmkl4peVfXEHS4ugaIHRx6
 V6I2kTMS2W/zhQzO/WWeQWSGaMXRJQg=
X-Proofpoint-GUID: zCj3M28JWhvDEeX9Mt-aYS3SqbPV9mC3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210213

On 7/21/2026 1:24 PM, Jeff Johnson wrote:
> Johannes,
> I'm trying to construct a new ath/main which involves combining:
> wireless + wireless-next + ath-current + ath-next
> 
> I'm seeing a conflict when combining wireless and wireless-next.
> 
> There are similar patches in each tree fixing the same problem in a slightly
> different way.
> 
> Can you pick one over the other? I'm guessing drop the wireless-next version?
> 
> thanks
> /jeff
> 
> wireless:
> commit 4a360c6e18dfa9d70006c7247a6a8cc8dfe0d60f
> Author: Zhao Li <enderaoelyther@gmail.com>
> Date:   Sat Jun 13 02:50:45 2026 +0800
> 
>     wifi: mac80211: validate deauth frame length before reason access
> 
> @@ -5641,13 +5641,15 @@ static void ieee80211_rx_mgmt_deauth(struct ieee80211_sub_if_data *sdata,
>                                      struct ieee80211_mgmt *mgmt, size_t len)
>  {
>         struct ieee80211_if_managed *ifmgd = &sdata->u.mgd;
> -       u16 reason_code = le16_to_cpu(mgmt->u.deauth.reason_code);
> +       u16 reason_code;
>  
>         lockdep_assert_wiphy(sdata->local->hw.wiphy);
>  
> -       if (len < 24 + 2)
> +       if (len < offsetofend(struct ieee80211_mgmt, u.deauth.reason_code))
>                 return;
>  
> +       reason_code = le16_to_cpu(mgmt->u.deauth.reason_code);
> +
> 
> wireless-next
> commit 8a0ed6ce39852d6a5dace3b3908c77c17468f250
> Author: Shahar Tzarfati <shahar.tzarfati@intel.com>
> Date:   Wed Jul 15 21:27:44 2026 +0300
> 
>     wifi: mac80211: mlme: read deauth reason_code after frame length check
> 
> @@ -5639,13 +5639,15 @@ static void ieee80211_rx_mgmt_deauth(struct ieee80211_sub_if_data *sdata,
>                                      struct ieee80211_mgmt *mgmt, size_t len)
>  {
>         struct ieee80211_if_managed *ifmgd = &sdata->u.mgd;
> -       u16 reason_code = le16_to_cpu(mgmt->u.deauth.reason_code);
> +       u16 reason_code;
>  
>         lockdep_assert_wiphy(sdata->local->hw.wiphy);
>  
> -       if (len < 24 + 2)
> +       if (len < IEEE80211_DEAUTH_FRAME_LEN)
>                 return;
>  
> +       reason_code = le16_to_cpu(mgmt->u.deauth.reason_code);
> +
> 
> 

There is a second conflict, but unrelated changes
(take both sets)

wireless:
commit 035ed430ce6a2c35b01e211844a9f0a7643e57a4
Author: Zhao Li <enderaoelyther@gmail.com>
Date:   Fri Jun 12 23:24:41 2026 +0800

    wifi: mac80211: avoid non-S1G AID fallback for S1G assoc

--- a/net/mac80211/mlme.c
+++ b/net/mac80211/mlme.c
@@ -7138,7 +7138,7 @@ static void ieee80211_rx_mgmt_assoc_resp(struct ieee80211_sub_if_data *sdata,
 {
        struct ieee80211_if_managed *ifmgd = &sdata->u.mgd;
        struct ieee80211_mgd_assoc_data *assoc_data = ifmgd->assoc_data;
-       u16 capab_info, status_code, aid;
+       u16 capab_info, status_code, aid = 0;
        struct ieee80211_elems_parse_params parse_params = {
                .bss = NULL,
                .link_id = -1,

wireless-next
commit a607344292c2ec4546f33ed360eb713d261a7133
Author: Pagadala Yesu Anjaneyulu <pagadala.yesu.anjaneyulu@intel.com>
Date:   Fri Jul 17 17:10:44 2026 +0300

    wifi: mac80211: notify driver before destroying assoc link

@@ -7138,6 +7146,7 @@ static void ieee80211_rx_mgmt_assoc_resp(struct ieee80211_
sub_if_data *sdata,
 {
        struct ieee80211_if_managed *ifmgd = &sdata->u.mgd;
        struct ieee80211_mgd_assoc_data *assoc_data = ifmgd->assoc_data;
+       enum assoc_status assoc_status = ASSOC_ABANDON;
        u16 capab_info, status_code, aid;
        struct ieee80211_elems_parse_params parse_params = {
                .bss = NULL,

