Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC402E4257
	for <linux-next@vger.kernel.org>; Tue, 21 Jul 2026 21:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784667863; cv=none; b=Y1Bl7wYk2ADKLu2K58zX3leDLaUKJJEjjQUcN3sAUWbw3BJHTb1lA2ivW/tSAYGesvDuNLlewE55DA6PuBPUT88nCR5siVTGKn13lXv6B34v6/HMQDKVkMqCs8rNm9zFlnN6IXUEejeijt+YVYn/qpb5grA4oQQ0h5EoaPKcy3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784667863; c=relaxed/simple;
	bh=IqFcwmxBe5aWu038MWuuzYXZFWrp3jtkzKfyIg3ZdvI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=jSWUa80XaeyeVHVkcSnU8EC2IlJhqC+Q9fYM4yunb/+YH4VJjt4b1CRheEy7FgA7/ZZSiQXoHITxe1rG88YP4NsN2EoqoecrrHSYQNaYR4I+v0eaPe1ofE1aQ5LG7miSunMZr280aP7pmNsVfSPWR6kOoVLYxw+fCyYhs/GCrZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ew2uQItG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dgDguVGA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ew2uQItG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dgDguVGA"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LKmGWa2702777
	for <linux-next@vger.kernel.org>; Tue, 21 Jul 2026 21:04:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/8HRqqL+VK0u2+Rmqm3hHVuWatgOjv9PsLV7OJ4MnM4=; b=Ew2uQItGGmQRu9wp
	EhEXp5KLB/k3p2eFbAw5aFVcwRMqWL52f3hby7aJ2ht0PjZZvNSEeQAfEImNWDEo
	e4mlHcNxcYOhwdfp6Peto7kQ6NrRsueve1C/6wPAuvDGWn+tjxw0c7egI20lahl+
	Scn9J9Ipj/pHKIiR0vxb8C5uqrn9beNhhB5rCDDAzfnxro5ANNex4nI8KI5UlIwq
	MthoTSaBRsetIyWTUqlp01A6h9hkhUqhXJKkjaSkvMteMBr80S90mHqKG3TrEoGr
	yuNmNu/MWsilW5W/qkpKDiV0vnS3oe4NthJU2LrlRATROs6bxouBFCRBpRn0Brwn
	C51YMw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj9aea930-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-next@vger.kernel.org>; Tue, 21 Jul 2026 21:04:17 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cc8bde6318so209739455ad.3
        for <linux-next@vger.kernel.org>; Tue, 21 Jul 2026 14:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784667856; x=1785272656; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/8HRqqL+VK0u2+Rmqm3hHVuWatgOjv9PsLV7OJ4MnM4=;
        b=dgDguVGAO40O0rKhM3yqrDPAEZCx2fgIqF1LTJ0pggRWSbkjZ4KdkHR7Ek6zLymgt1
         lEGXmA9RwtI5SPIEtzrfmAT+wCD9PsBiFw9nVtTZ8W/bh4kvyD0tkPnEdn8tQbJrR+Yi
         NLC2U0Fc/352qnyTAtcBiLgl4KxBdNR1MZuSs0gVHcm0q7rbCs0qnXFMbQCnwVEjbHW/
         Qr210Gv47yl8MjLOanleCX8QjMdXJPfTFh16oFdl3uGCdReyAEBlLT1WlEo60FzBtRQh
         4VcEXIgSOH6WEf1ifqyLOkrYpusJWOrx09xJpj9pbm4MWCHmpSZucjAVJ5UNTMsEijXT
         AFCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784667856; x=1785272656;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/8HRqqL+VK0u2+Rmqm3hHVuWatgOjv9PsLV7OJ4MnM4=;
        b=mDjJD4Vv0nbfzcaY/o6wglPH691hYHkJlQ9hT2ctSVEw/r5IZ1Rv5VDFe3UIAkscu5
         yK5R5SUcrnVImmDNwiycvJtGCfVlOerPkapiMRLpG66qaqMM/R02HzuZvJkukS9DcxGC
         u8TZekunRn61oqBwp5vFivbwhQGWwyFqQNkpxtybysBnWcvIhINtHyLME9kHwnck0Osb
         5ZVVMzb009J539FoDxLzP1gitsolPVRmBaWnZnw4LEuCVgLeAQjmhNrm6rDSQI0KFOVJ
         20JQHtP5FJtUJ+5DuguFkD5pVaylJ2ZJFbyMzGdmFc2SINg4gGWzu2c2v3snDIVnvJe9
         PxRA==
X-Gm-Message-State: AOJu0Yxs/9fSA3pWVbmt2kVRPy/4LUZSe0ImEswgJa1645HrIB3g+SLP
	z33mZamMkmI+a74xt9YeI4YDlrP5UP7FIuRDyXmNUHN/dcVTyidNl8EzBARyF7n8Z1GTzO99kFE
	3r2K5NK0OVrN6f4LhQmzFgtyh2veIHuoHIyJCDvL5lZd2BJ6sqZpnw6PuRlJijmSWYt5zV3KF
X-Gm-Gg: AR+sD13idw2M2ry0hzWBF2HSUoIkkFkly1UkU6NMgMfTiMJ8bkZH+daHf0F+K9Irmvy
	lS1F9Xqb4QjxYkK5Oadzocern6hjmKwOx51HCk5YQWcAJLJv7xgrHDc2NudSVoGOJf7OSXmuWmB
	Sba1iHoTi/HmvMzQvr+IPwm52lX2uZa0YT98uyL8j7tAvtt3iA+nT+oZOqUVrAeOKPOkacQGMPW
	n26QtTWwCtV/PQisTxhTli8r/DDPvknq4zUMW4x7U2OKj42Ti+ARpzVrWjhBWENDqftbCCipf3S
	8pyC+bdb1cjVsvcFh1TbcR2f8cI7UE9sAJulGzo/xV5GZPtrMWqCpxfjlvAtyANBtcwydMJxOKp
	l/dmFF1OIkrCmUjVScjgVv40EcQdabpSpU6wcZJBntwlMSo593zYFJr6ARA==
X-Received: by 2002:a17:902:ce82:b0:2c9:b396:1a55 with SMTP id d9443c01a7336-2cf348bf5c2mr226138055ad.12.1784667855961;
        Tue, 21 Jul 2026 14:04:15 -0700 (PDT)
X-Received: by 2002:a17:902:ce82:b0:2c9:b396:1a55 with SMTP id d9443c01a7336-2cf348bf5c2mr226137585ad.12.1784667855330;
        Tue, 21 Jul 2026 14:04:15 -0700 (PDT)
Received: from [192.168.1.11] (15.sub-75-218-246.myvzw.com. [75.218.246.15])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147d47960dsm1877542eec.0.2026.07.21.14.04.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 14:04:14 -0700 (PDT)
Message-ID: <98fc8d35-04a3-404a-8a94-5d4980da9141@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 14:04:13 -0700
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
 <40efd021-9a65-4669-83a7-38a45c3d9846@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <40efd021-9a65-4669-83a7-38a45c3d9846@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: GQgZpdmuHUitDmRpw7hL1sTaF_cJwkXL
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDIxNyBTYWx0ZWRfX788PKu99+sNQ
 AkccOWDYGyW8XZlgl7sQFXBDKvu/soTznIkns8vaOs1v9r2KDBgUEbTOJzagfOqss+tcP6QoI/9
 pC7alImIZRqTzE1coxjYZMgVOZ7UVS0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDIxNyBTYWx0ZWRfX3oyVyEzd34pb
 T++WiFMJ5l0b8V52cT6NX1RpDEIaNxl0ERyLWcoTJLhDYmrxJmHe5OKKDqLMbWl4QB9twEtyiTf
 RKL8YfIwI64NgR8fnrBoZqu23lc5UqKjly9ebIp3L8uNiK0yxdGIokIVRkMplcv2yybbAxcMVjs
 VagDWh3dhIne+g/O0oJuzsEKYLuvTp3lp5KCV1fnjPMLMiuFjVwfHMwC1SPhO5XlXkU9pX0uD6S
 sRB4NYFhixE14RMnzxFfAlOQH1OvcKwYuOlctyQ/zJL9ecsZXAMGFYx3idT0glTWQAWl74LIADm
 hziOZGRbv6NdnFBI4rqqupxnJZDzcMls7P3ZEmr3BvPuNJUOWDommliXB7Zln7q8wA+yK9onYTK
 LdqWLVU/wbEwGVORr6mVfosaxMed931XDcVAvv9Q78ORgPFZwHqpx6B58hemv7cIB24TvrXZ1HB
 ++RaCKxoNv5jrFKukeg==
X-Proofpoint-GUID: GQgZpdmuHUitDmRpw7hL1sTaF_cJwkXL
X-Authority-Analysis: v=2.4 cv=Cr6PtH4D c=1 sm=1 tr=0 ts=6a5fded1 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=6VQYfvmiyQ8t40WkS/mQdw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=QyXUC8HyAAAA:8 a=Aq1jvSbqs73Igt3XPC8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_04,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 clxscore=1015 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210217

On 7/21/2026 1:34 PM, Jeff Johnson wrote:
> On 7/21/2026 1:24 PM, Jeff Johnson wrote:
>> Johannes,
>> I'm trying to construct a new ath/main which involves combining:
>> wireless + wireless-next + ath-current + ath-next
>>
>> I'm seeing a conflict when combining wireless and wireless-next.
>>
>> There are similar patches in each tree fixing the same problem in a slightly
>> different way.
>>
>> Can you pick one over the other? I'm guessing drop the wireless-next version?
>>
>> thanks
>> /jeff
>>
>> wireless:
>> commit 4a360c6e18dfa9d70006c7247a6a8cc8dfe0d60f
>> Author: Zhao Li <enderaoelyther@gmail.com>
>> Date:   Sat Jun 13 02:50:45 2026 +0800
>>
>>     wifi: mac80211: validate deauth frame length before reason access
>>
>> @@ -5641,13 +5641,15 @@ static void ieee80211_rx_mgmt_deauth(struct ieee80211_sub_if_data *sdata,
>>                                      struct ieee80211_mgmt *mgmt, size_t len)
>>  {
>>         struct ieee80211_if_managed *ifmgd = &sdata->u.mgd;
>> -       u16 reason_code = le16_to_cpu(mgmt->u.deauth.reason_code);
>> +       u16 reason_code;
>>  
>>         lockdep_assert_wiphy(sdata->local->hw.wiphy);
>>  
>> -       if (len < 24 + 2)
>> +       if (len < offsetofend(struct ieee80211_mgmt, u.deauth.reason_code))
>>                 return;
>>  
>> +       reason_code = le16_to_cpu(mgmt->u.deauth.reason_code);
>> +
>>
>> wireless-next
>> commit 8a0ed6ce39852d6a5dace3b3908c77c17468f250
>> Author: Shahar Tzarfati <shahar.tzarfati@intel.com>
>> Date:   Wed Jul 15 21:27:44 2026 +0300
>>
>>     wifi: mac80211: mlme: read deauth reason_code after frame length check
>>
>> @@ -5639,13 +5639,15 @@ static void ieee80211_rx_mgmt_deauth(struct ieee80211_sub_if_data *sdata,
>>                                      struct ieee80211_mgmt *mgmt, size_t len)
>>  {
>>         struct ieee80211_if_managed *ifmgd = &sdata->u.mgd;
>> -       u16 reason_code = le16_to_cpu(mgmt->u.deauth.reason_code);
>> +       u16 reason_code;
>>  
>>         lockdep_assert_wiphy(sdata->local->hw.wiphy);
>>  
>> -       if (len < 24 + 2)
>> +       if (len < IEEE80211_DEAUTH_FRAME_LEN)
>>                 return;
>>  
>> +       reason_code = le16_to_cpu(mgmt->u.deauth.reason_code);
>> +
>>
>>
> 
> There is a second conflict, but unrelated changes
> (take both sets)
> 
> wireless:
> commit 035ed430ce6a2c35b01e211844a9f0a7643e57a4
> Author: Zhao Li <enderaoelyther@gmail.com>
> Date:   Fri Jun 12 23:24:41 2026 +0800
> 
>     wifi: mac80211: avoid non-S1G AID fallback for S1G assoc
> 
> --- a/net/mac80211/mlme.c
> +++ b/net/mac80211/mlme.c
> @@ -7138,7 +7138,7 @@ static void ieee80211_rx_mgmt_assoc_resp(struct ieee80211_sub_if_data *sdata,
>  {
>         struct ieee80211_if_managed *ifmgd = &sdata->u.mgd;
>         struct ieee80211_mgd_assoc_data *assoc_data = ifmgd->assoc_data;
> -       u16 capab_info, status_code, aid;
> +       u16 capab_info, status_code, aid = 0;
>         struct ieee80211_elems_parse_params parse_params = {
>                 .bss = NULL,
>                 .link_id = -1,
> 
> wireless-next
> commit a607344292c2ec4546f33ed360eb713d261a7133
> Author: Pagadala Yesu Anjaneyulu <pagadala.yesu.anjaneyulu@intel.com>
> Date:   Fri Jul 17 17:10:44 2026 +0300
> 
>     wifi: mac80211: notify driver before destroying assoc link
> 
> @@ -7138,6 +7146,7 @@ static void ieee80211_rx_mgmt_assoc_resp(struct ieee80211_
> sub_if_data *sdata,
>  {
>         struct ieee80211_if_managed *ifmgd = &sdata->u.mgd;
>         struct ieee80211_mgd_assoc_data *assoc_data = ifmgd->assoc_data;
> +       enum assoc_status assoc_status = ASSOC_ABANDON;
>         u16 capab_info, status_code, aid;
>         struct ieee80211_elems_parse_params parse_params = {
>                 .bss = NULL,
> 

Sigh, with those two conflicts resolved there is now a build error:

net/mac80211/mlme.c: In function ‘ieee80211_rx_mgmt_assoc_resp’:
net/mac80211/mlme.c:7279:17: error: label ‘abandon_assoc’ used but not defined
 7279 |                 goto abandon_assoc;
      |                 ^~~~

wireless has the following references:
035ed430ce6a2 net/mac80211/mlme.c          (Zhao Li                   2026-06-12 23:24:41 +0800  7225)          goto abandon_assoc;
81151ce462e53 net/mac80211/mlme.c          (Johannes Berg             2022-06-01 21:17:34 +0200  7284)                          goto abandon_assoc;
81151ce462e53 net/mac80211/mlme.c          (Johannes Berg             2022-06-01 21:17:34 +0200  7295)                          goto abandon_assoc;
81151ce462e53 net/mac80211/mlme.c          (Johannes Berg             2022-06-01 21:17:34 +0200  7371) abandon_assoc:

wireless-next removed the last 3 with:
commit a607344292c2ec4546f33ed360eb713d261a7133
Author: Pagadala Yesu Anjaneyulu <pagadala.yesu.anjaneyulu@intel.com>
Date:   Fri Jul 17 17:10:44 2026 +0300

    wifi: mac80211: notify driver before destroying assoc link

So in my merged tree I had to replace the 1st one, which I changed to
		goto destroy_assoc_data;

/jeff
