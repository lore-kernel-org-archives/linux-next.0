Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726A8390237
	for <linux-next@vger.kernel.org>; Tue, 15 Sep 2026 01:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789436461; cv=none; b=EL56PzaWQQquGT+7faTZLqeN4Kx2UZ1MQ9yAyDstUwOMpw8iNs047fUs+5SHXpWuHn42tTYTJqI0IiJzoF0Iqip5FBmFhbRImYBbiC+pXlFApNlr2pdiIUwD9589KiGw9eHJgq9wCL30wG/bvv62L1lKqASWIUbI/1XRljOi40E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789436461; c=relaxed/simple;
	bh=251TQdKgXLMCxRl4qfO1/paTU2xaQ1nbXIrOC0WsrxM=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:Cc:Content-Type; b=HeWzmHgl7LWIzAW2XL/opOc85c9IiIgidDQfTQtO/r2uNxulzfrhbmxmzIzrvuvCiX6oC7eRdzTgRkyObFIn2JYX9zCHY5M+CjcZ9lFrQs2M2Fy67u6wnwhxTdO5g0AAR6cjf2J0l2OcI2JFp3jDj/f6xRK/+S5RRHfQyKpHfz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XEKgzVlE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gWr0Hzgv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XEKgzVlE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gWr0Hzgv"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EMxpVU1439831
	for <linux-next@vger.kernel.org>; Tue, 15 Sep 2026 01:40:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=MhIXvod0tZO9+Fa6Auqj3m
	xxJgH2oUQwSB4hK/UPFXc=; b=XEKgzVlEwIrjlPEVlXa0nUJ63CQo6ziKu92c0j
	/gn2I57ypvOyQnv5tqTRbYeAZgDbOl0p+0stPQs3SWBn2Cw+5IQdpoty/7QrsbQr
	N6KwlvhPm6pf4zrBXcHzPz1/NiwTdSVheX6ed+L4IXtmrXH3rEqzyXW8ub/S6kH5
	Mv9J0lBF1p1incnoPsW37TIj9gJ0LAlQ0AIaLkXc2go0U5y237pwrDiBblXSmGIZ
	LXp3Rj4iwVEUoL0+yOOUxKCJdCs8whfxzZNO/60+WpkkKrOT4i83PTmrdrHROmW0
	Ed63uk7WETRZIFt3Cnn+5xTd6UwUym1xEiu6pNedvQLftd6g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpeuqbc8p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-next@vger.kernel.org>; Tue, 15 Sep 2026 01:40:59 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38f57e31b6eso3938666a91.1
        for <linux-next@vger.kernel.org>; Mon, 14 Sep 2026 18:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789436459; x=1790041259; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:subject:to:from
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MhIXvod0tZO9+Fa6Auqj3mxxJgH2oUQwSB4hK/UPFXc=;
        b=gWr0Hzgvkla2XH3jfXx7MaCiS41jOPKp468hK4tOF5CBsBx46cdvhvFTN4q04g5DJb
         UJL87Mu2D7Njl9j2DCr0A4OBGBD6WK/aa3/lVfTPDf1nSRqW2BgNGGtA6FahcSo5D5cd
         egxD6NoK+t2oU/ew6F+pgu6c1XrTORlG7njhv2cPaIrog+ZImYT2hZstkGOj7VClQG+B
         Mzs/LU+83VsuwyYfhs9xJRyUtcS8+IRQB6rw5m/5dEbYJOlXFlNUw/UfY0LJsQ7Px4Mq
         0flw90dPTb4RJzBP6UfTSFYP2AjeTGHgTtqE6CoRynyhWTKHQQa3isecd4L3NXy9wrmt
         aKwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789436459; x=1790041259;
        h=content-transfer-encoding:content-type:cc:subject:to:from
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MhIXvod0tZO9+Fa6Auqj3mxxJgH2oUQwSB4hK/UPFXc=;
        b=G1cuMsokwZfhytfetVlIw0V5k6CsFe82o8Rp0KrdeurrPED6TlGD+wD/ToLGMlelzu
         VvELZQQtHXYVzgU/yWZN9+2UyW9nqd2zJSQf57HcPhi75JSVYPF+Mm20AxpNdcHKUI0H
         umjI1puL7/nZfEvPmyScK7NB3gLlFoplREmBK6Pzc+lVMTPCIPlkm4bUDcMzdHZ+PzEi
         0emjV0uV9gv7AJvatHHIgY0XwA8kvosZzdtLrRkLXxA906Zy1hAxI2YKy1fXxMBNry2/
         nF9+i9s2qKhxSmDqYyV94qNX/PU9TUZsSlIBesbKS9aYOH6wTOM1owBRHq9La1G2+a1S
         W53w==
X-Gm-Message-State: AFuF++n7njNGBVJt6zVvpnzRyukVjOsq4yr2Fv/S/JQRBw+TRd9JLC6b
	3Px+7REOPsnwzP5LnogA15oYd3isHD1xh5V4wrwewu5xJjhYbk55AJEvw1KbGjaUfJo04BBvJiz
	qTNpuej27o7jz44rtOjLPTRdqc3iTJn1UsZIp9FFZmuBak9RbiJxerspFd4ImB7kE4ab0+j8c
X-Gm-Gg: AYBFou0FLSIIVL1erMpFYpzHLdahwqGPPA9FDH0Z/kPN1olpJejx3PWs1ieaaDO1S45
	GkNOA6n3rNpeSVbL2TV7HOU91ZSBBLF+QiwNJJd9A4ttvKrJlm5Nq5AQoOC48b3eistXsGR8GNi
	kHlESZnbgYbTHHoHW+/ZQ/uyG+CBJgWvboBmMt1mvEvpYAmmVc2JWn3j8ETJ6z2v32PF9c7zvxY
	bjx6+fNFaWmHnykJ22NwMwYR5JiaUAOQXOY4L0u01hUJGLr/T0oobGijYkqXL+BFJN1ec7EZTyE
	VbsowOr9l2pxj+GIRs9S9n1HN20trgfpDUo650Ul0trJfbxWoDlmLqiSvu6gU+5J3N+a9rzIqcM
	KelL7ZHO04a5CWuB5oEWCwyCW/xj9E0M4dsYJrm3MZgB1XTDSXbc3fZtFPA==
X-Received: by 2002:a17:90b:1642:b0:398:dc16:3c29 with SMTP id 98e67ed59e1d1-39debf7a8e2mr10316723a91.7.1789436458669;
        Mon, 14 Sep 2026 18:40:58 -0700 (PDT)
X-Received: by 2002:a17:90b:1642:b0:398:dc16:3c29 with SMTP id 98e67ed59e1d1-39debf7a8e2mr10316653a91.7.1789436458113;
        Mon, 14 Sep 2026 18:40:58 -0700 (PDT)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b97994sm52181257c88.12.2026.09.14.18.40.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 18:40:57 -0700 (PDT)
Message-ID: <dd5f82ce-90a5-4427-bcdb-656d899c63c2@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 18:40:56 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Linux-next conflict between ath-current and ath-next
Cc: Johannes Berg <johannes@sipsolutions.net>,
        Paolo Abeni
 <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDAyMCBTYWx0ZWRfXzHwckUQqHSPT
 ZlDedwVqzxRFytIrdghMfglysKJ8gB5FBXj26J40Tdu1ivkyTe8lRXLzcSIyFPpeCjm7Qtnhwvi
 nVNE7bPnIMto+zZ0kx0khGyyA0dT1JoeMli07XhjWlbmYyxlte/IjG1bTG6K3pEf0S93vqlLBVw
 +dT2+UOeR4n7wMpl3LA5AyJw6vZkbgRAY4Fo90t6HDNRNPC8Y9uufPlv5uANo0mRCwUWg7AkHyL
 H2BSGTF/B+sV43MsC64C6FhbNFkGEew7UnBazWzM87tHKz7LHoF7UmzQs5JUdZ7aYxYgL7MMyFn
 YO82Ll1lyFelrpyKxPjvmzBIV3yg+pJmYTDkEZs1FZWP45D8fNpJSFpIrWniwkwRvuJ7p4hxY/L
 /AEI/Pm/v+K8GPw0k//WkUKeb0cZAxI1m59oP1cjJ2iIElfWbnXXIgK6t1LyuLDtspQq8sZDQ+r
 rto8XhpyGJyx1y+5JSQ==
X-Authority-Analysis: v=2.4 cv=TrFzFzXh c=1 sm=1 tr=0 ts=6aa8a22b cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=Cs2Dxi7TK382Vxjjg1YA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: rzHj4cu19n8dPQq9xyzslaZWVHA8RRJx
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDAyMCBTYWx0ZWRfXzdO8d/qa3PRH
 CAGabbR+hbtlwZQSTlv6l2Q6VgCoBK223JA3T1fluB8YP3IO80MBNCHsjKrCEGrXBkpPySauJ5R
 v1NZ6d3WsH/lic2S+dDNoxuGtDWHGl8=
X-Proofpoint-GUID: rzHj4cu19n8dPQq9xyzslaZWVHA8RRJx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_05,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150020

For linux-next, wireless, and netdev maintainers:

In drivers/net/wireless/ath/ath12k/wifi7/ahb.c function
ath12k_wifi7_ahb_probe() there is a conflict between:

ce9d5197d651 wifi: ath12k: ahb: Revert undocumented ABI and dead code
in the ath.git ath-current branch

and:

c3bace8584ca wifi: ath12k: add support to load shared firmware on multiPD
in the ath.git ath-next branch

The conflict exists because a new line is added next to ones that were
reverted:
	ab_ahb->scm_auth_enabled = desc->auth_enabled;
 +	ab_ahb->supports_multipd = desc->supports_multipd;
-	ab_ahb->userpd_id = ath12k_wifi7_ahb_get_userpd_id(ab);
+	ab_ahb->userpd_id = ATH12K_AHB_USERPD_ID_0;
	if (!ab_ahb->userpd_id)
		return -EOPNOTSUPP;

Since multi-PD is not completely supported in ath/main, my resolution is to
keep just the ath-current code:
	ab_ahb->scm_auth_enabled = desc->auth_enabled;
	ab_ahb->userpd_id = ATH12K_AHB_USERPD_ID_0;
	if (!ab_ahb->userpd_id)
		return -EOPNOTSUPP;

A DT-approved mechanism for determining UserPD IDs is needed for ath-next.

I'm about to send my ath-current PR to Johannes for v7.3-rc4.

/jeff
