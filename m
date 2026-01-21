Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF012E03E4
	for <linux-next@vger.kernel.org>; Wed, 21 Jan 2026 23:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769036922; cv=none; b=oiyqN+7jDXIEnOH8bbIUWNedjrF9Z5GpIgjybvffW67yptyqzX0g8+Lf/GQ2yD/x8Y1JCzTCWLPi+zf7la6hNGedI1qtYGXyqdAVrzDmUrwZvxDCNqsWVcKt8qlG7n019AOUQNW3JUUihZqdau65ie4yvhLcyAjToaZUNRTPszk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769036922; c=relaxed/simple;
	bh=m9A7bk85tMSO37OtowKGqXS2zyPGb13dxYjml0NLucg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WZNb2UCveEzLuhu1r14qB/gQ+Ti+YFTLymjwFIIBTBn2ycLMG5Bi9KY2o+iRKeNqiCIAXxVjeEtpnmZP2A+Gx97baUIFrJaUsxUJ8qKJp2inS9goPuhJ1Sg3+1nwuaAusuk4AmMLf4iHjAU+ZZAag1WVBF1Sbmmg79rJu2kiagU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lXjEJDrw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bwuB4qUF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lXjEJDrw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bwuB4qUF"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60LLOVUS107348
	for <linux-next@vger.kernel.org>; Wed, 21 Jan 2026 23:08:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4u3WwArjRUrg/9ZFfg6tm8S+mWnNC7VmqcKWfaX9dsE=; b=lXjEJDrw3cYFVmzd
	W26Ah3ej222VrYf80mrlm3Km0dKhPHhNTMA4+NmegJVJwYBtUkcWE5PTJ5195aLE
	UX5Tvy63zQ8CnKsEvothk2kSuDBey+PWngpFEUp7P1G/j9zuj3TNUPQAYXUPXvm4
	xc8xaZwpYChCafMAlBFAs79devqZZ460EScR1UypbNa168bhbv6rxAHpX9fWwjWV
	8xTYML0m/d5bL4EpJ9tkQDHEL/dtxcYrZGN9LIgNIHQTjDxH5wyLp9KuWWG09lPv
	4zsFGi0nf4UO7IZC9+veJ39XZTDQfXKvXZG/gETGLGtZlvs1/71Xmmu/d4KJbarf
	5gC5zA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu6pgr7cr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-next@vger.kernel.org>; Wed, 21 Jan 2026 23:08:38 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1233893db9fso1791308c88.0
        for <linux-next@vger.kernel.org>; Wed, 21 Jan 2026 15:08:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769036918; x=1769641718; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4u3WwArjRUrg/9ZFfg6tm8S+mWnNC7VmqcKWfaX9dsE=;
        b=bwuB4qUFQxieZQCKADfIzhnF2lEXFMzZp0BxP1u4xX0AKHq4q39Q2DoZST5zlylX7V
         b+PDFeYbj6IO8SgQvaVFuQOAAW2ufE14ZAgqQvot0LMJ/J1f4dQ9XO1ZOJkYVwesbtDe
         Ct86ge4uPEWjWKms2q9PUVCPcwsqyAtMQNfyX9mLjkj79n5Mm9/ghRFDRx1RQ4TM3qai
         1i5nzL+iWoqEsNWixF4Ux4+1fSV6n9DTA4vvAdbQ6xgFFa6LrbgzIcCEBKGZHQL+Kj0W
         JuUlhIMG4eh8zAyTb2Qdmx3UNihqmIEP5QHuifuZk8GNtRfCOT2cdg9A5ffLhRCrc940
         C/oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769036918; x=1769641718;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4u3WwArjRUrg/9ZFfg6tm8S+mWnNC7VmqcKWfaX9dsE=;
        b=mSVgwjkDMgEBRt4KyOnE7D3+bibZKCJ2/AG5cYkHHAMl+EpZk4cuU2aHJ2O8FW/0ql
         ETu2D7lphdG//vtvI6mtuxb5n2wbSrsppm4FeZ9mJbQQUQtKkPXPjk+JweJNW3kPBBzr
         MRPvEFfNq8hFDa2KFdqMAeJr09M6inCphEvB6Fn+QyC/qrGWgSMomnOy4HTrY0Hb4OKk
         M1aMXQDiiz6TwYUvscXVDV6zhZZkTU24tR8VxO5yT/PVlsNzBlH2G/8DnHbsFQBa56W6
         Uhwx5GggPz85YnOQ2Rt14x3ikISSfmP1s3gWXXtHbsweiMKH/VSYnSBoRo8ExMjYZl1O
         I0yA==
X-Forwarded-Encrypted: i=1; AJvYcCXN8WRxWM05jzKh4DuF8WKqgswJWA4Vj84iciNWpm6bDaIBaq6txCGseB3cGMQCKohiY1gaP7MuZ+Oh@vger.kernel.org
X-Gm-Message-State: AOJu0YyvMINnqG+nUxGWwE4E8SPnCyXg4cIcj2FH09MEt7KwJyRCx4N4
	3p7PsNeMc/NcBEQ6ekJ5D33+DmYg+F7TdaX3mYdIzNjBQr+aiz65/wk0VfJ+7R1TC/ej6uxpkSd
	Y4coXHWNjqbP0qMVOIOxj3ZcEz6nUWxGKoPo6IrGM8VTD8gQ+lMAPFPN6kQHXGAJ6
X-Gm-Gg: AZuq6aIFgd0UEA3/TKuEVnkafKdZLc5TTz6mt+HUBF4CMCn53MkVVHSUkrrVEDK+c99
	GVHMlYxspVmVnE60mE7H0MVx5pIrsmCYve81u6ofJmKJCc7ZHSf2x/akjbAdjV6q1TNOyYEb7Uy
	AqAGiZGUeyaxgRVqa3ykFNfk6O4i1tpIQFwazOtFA4upS/86tglsc3ncdnD5ag4xHRIkKpiNBLe
	fXZAe4GH70wHl9OKqfySOSbAz6SkTqcQnJKazxF4Tx0GT9vFfpR+74dcfZxakc/VC0QidjUjPir
	JYY/I+uIum6AsL//miz0j3LcVAiPl/PxVI2oxOPqGwfQPoSrY/iPYccmHElwGtSQw9RQrKlUtQ8
	ZAX5lmO3LXxAoC0QKGxDhKdPMG61Qf/MR09F+y3cf2zzAtB2k3Q7APWbUphKvmobBQkXIU0Y4Az
	Rh
X-Received: by 2002:a05:7022:1601:b0:123:345f:5d9c with SMTP id a92af1059eb24-1244a6fa70amr14161887c88.2.1769036917737;
        Wed, 21 Jan 2026 15:08:37 -0800 (PST)
X-Received: by 2002:a05:7022:1601:b0:123:345f:5d9c with SMTP id a92af1059eb24-1244a6fa70amr14161868c88.2.1769036917207;
        Wed, 21 Jan 2026 15:08:37 -0800 (PST)
Received: from [192.168.1.3] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244aefa7c5sm29144155c88.10.2026.01.21.15.08.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jan 2026 15:08:36 -0800 (PST)
Message-ID: <5c9d3f87-de21-45a8-8bec-9bf95f9e011c@oss.qualcomm.com>
Date: Wed, 21 Jan 2026 15:08:35 -0800
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the char-misc tree
To: Mark Brown <broonie@kernel.org>, Greg KH <greg@kroah.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Kiran Venkatappa <quic_kiranv@quicinc.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <aXD6X23btw8s-RZP@sirena.org.uk>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <aXD6X23btw8s-RZP@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDE5NCBTYWx0ZWRfX/OJfMX4DfvZw
 SOwDjlvIgElYoZFU3M4WOfd50p6LTmBQyfC7w4EFNLI0V/sIvpnj13aN3z78c3PJ5gb7JAnRve2
 C6bVTfzKvkKVXMnSgmjCqSHBU4K5HIbAtKeu95bANXVrrqiiTB7VtMU9/Qyu+v4s+Wb7weN2OGz
 N9Nv/9M9oKBCuI9DA+jHNQlDRI2S5MpsdvmTmh58mHocjQ27pdC0LCAs0IGlXOgfF68NZCnWIPL
 BUfdjKQV1SPYgLDgJzmABay9Kd4Qpegu5F1Ut9Fxo0hMN1FpTQOgSEzRWCB1ewzKm99CLWsCQXx
 E7pzD7AmRawcGepVKWCsTwtC+uXHZR0yhY2KhcwmqlV0YGRzYz+cQZvbZV+OApXLOpbECcxJyrq
 uWZYKcysvkvXoZ51/opuOtu3428JK+XKzfKlwz+hDUc3VJa+eiOlzHfi4ZX7J3i+FngbVdw30U0
 8wbfK147rId2w93m28A==
X-Authority-Analysis: v=2.4 cv=OZGVzxTY c=1 sm=1 tr=0 ts=69715c76 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=s3fUXvsprhi5mUoOFRgA:9
 a=QEXdDO2ut3YA:10 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-ORIG-GUID: hUrqNamuHPv8OvT8T57_Rzb_Lnq3T2_w
X-Proofpoint-GUID: hUrqNamuHPv8OvT8T57_Rzb_Lnq3T2_w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_04,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0 adultscore=0
 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210194

On 1/21/2026 8:10 AM, Mark Brown wrote:
> Hi all,
> 
> After merging the char-misc tree, today's linux-next build (arm64
> defconfig) failed like this:
> 
> /tmp/next/build/drivers/net/wireless/ath/ath12k/wifi7/mhi.c:23:18: error: 'const struct mhi_channel_config' has no member named 'auto_queue'
>    23 |                 .auto_queue = false,
>       |                  ^~~~~~~~~~
> /tmp/next/build/drivers/net/wireless/ath/ath12k/wifi7/mhi.c:37:18: error: 'const struct mhi_channel_config' has no member named 'auto_queue'
>    37 |                 .auto_queue = true,
>       |                  ^~~~~~~~~~
> /tmp/next/build/drivers/net/wireless/ath/ath12k/wifi7/mhi.c:88:18: error: 'const struct mhi_channel_config' has no member named 'auto_queue'
>    88 |                 .auto_queue = false,
>       |                  ^~~~~~~~~~
> /tmp/next/build/drivers/net/wireless/ath/ath12k/wifi7/mhi.c:102:18: error: 'const struct mhi_channel_config' has no member named 'auto_queue'
>   102 |                 .auto_queue = true,
>       |                  ^~~~~~~~~~
> 
> 
> Caused by commit
> 
>   4a9ba211d0264 (bus: mhi: host: Drop the auto_queue support)
> 
> interacting with commit
> 
>   a72027045263f (wifi: ath12k: Modularize driver into common and Wi-Fi 7 specific components)
> 
> from the net-next tree.  I have applied a fixup:
> 
> From 3cf082adcac859e3c68956352688074c2046bba4 Mon Sep 17 00:00:00 2001
> From: Mark Brown <broonie@kernel.org>
> Date: Wed, 21 Jan 2026 15:31:33 +0000
> Subject: [PATCH] bus: mhi: Fix up interaction with net-next tree
> 
> /tmp/next/build/drivers/net/wireless/ath/ath12k/wifi7/mhi.c:23:18: error: 'const struct mhi_channel_config' has no member named 'auto_queue'
>    23 |                 .auto_queue = false,
>       |                  ^~~~~~~~~~
> /tmp/next/build/drivers/net/wireless/ath/ath12k/wifi7/mhi.c:37:18: error: 'const struct mhi_channel_config' has no member named 'auto_queue'
>    37 |                 .auto_queue = true,
>       |                  ^~~~~~~~~~
> /tmp/next/build/drivers/net/wireless/ath/ath12k/wifi7/mhi.c:88:18: error: 'const struct mhi_channel_config' has no member named 'auto_queue'
>    88 |                 .auto_queue = false,
>       |                  ^~~~~~~~~~
> /tmp/next/build/drivers/net/wireless/ath/ath12k/wifi7/mhi.c:102:18: error: 'const struct mhi_channel_config' has no member named 'auto_queue'
>   102 |                 .auto_queue = true,
>       |                  ^~~~~~~~~~
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  drivers/net/wireless/ath/ath12k/wifi7/mhi.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/wifi7/mhi.c b/drivers/net/wireless/ath/ath12k/wifi7/mhi.c
> index b8d972659314b..988affafcfd1b 100644
> --- a/drivers/net/wireless/ath/ath12k/wifi7/mhi.c
> +++ b/drivers/net/wireless/ath/ath12k/wifi7/mhi.c
> @@ -20,7 +20,6 @@ static const struct mhi_channel_config ath12k_wifi7_mhi_channels_qcn9274[] = {
>  		.lpm_notify = false,
>  		.offload_channel = false,
>  		.doorbell_mode_switch = false,
> -		.auto_queue = false,
>  	},
>  	{
>  		.num = 21,
> @@ -34,7 +33,6 @@ static const struct mhi_channel_config ath12k_wifi7_mhi_channels_qcn9274[] = {
>  		.lpm_notify = false,
>  		.offload_channel = false,
>  		.doorbell_mode_switch = false,
> -		.auto_queue = true,
>  	},
>  };
>  
> @@ -85,7 +83,6 @@ static const struct mhi_channel_config ath12k_wifi7_mhi_channels_wcn7850[] = {
>  		.lpm_notify = false,
>  		.offload_channel = false,
>  		.doorbell_mode_switch = false,
> -		.auto_queue = false,
>  	},
>  	{
>  		.num = 21,
> @@ -99,7 +96,6 @@ static const struct mhi_channel_config ath12k_wifi7_mhi_channels_wcn7850[] = {
>  		.lpm_notify = false,
>  		.offload_channel = false,
>  		.doorbell_mode_switch = false,
> -		.auto_queue = true,
>  	},
>  };
>  

Thank you, that is the correct fixup.

/jeff
