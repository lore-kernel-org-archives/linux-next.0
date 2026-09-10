Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C0D4A9D63
	for <linux-next@vger.kernel.org>; Thu, 10 Sep 2026 14:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789052267; cv=none; b=vD33oMODuAWHdmtRCdzPYU8LuNGhWrikNN+aCwN2b2xxMOKqbA+d5qjmvYFaFsDI5IbbeTDuWkTRAW+c7WhQP1NrZO3eT9UG/eMP4lPgGbWXjr/GDq18GIb7Dl3qwIn/XbXvmK14y1Nqu2sPFVFpw5WCWAiZzsnS5PbgA5n75q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789052267; c=relaxed/simple;
	bh=4IhL3hdVBjSkwp3tHpxBzbcp2btgjpd+4Rs/0dgsnqY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eKCgsjZRhsDqBObmX55B9rxHjoD2CcKtB7/BtEFjVa/kFTEM/4DRzi/z+WenONFNkLvkO2rSAyMonz6k6TRTNTmVnYR7adtVeMuiRUFGoY86RN0+34UKODU8e5n44FNOphbGtTc5jQNAwZaSTvuzJ7gH5sHTxkWLu6276/DYrxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BkQr52cx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R1qCcfOR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BkQr52cx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R1qCcfOR"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7eTZ216121
	for <linux-next@vger.kernel.org>; Thu, 10 Sep 2026 14:57:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WOhP1EfYDCuzBlcUHllLpwpuZOdXHfemEhFe64d3kp8=; b=BkQr52cxFxOmIl0l
	eIXTTquh8E+z8ly/+szilfdSN2nWqs8iM3k01OKp12aRSOL1rB6V487m+wJAF0b+
	A1GYbDkW1g4Fncy0HxL6Hs4R2Ybe7mrA7PHfZP2rGcdQ2UceFQdl72+F42C9SdLk
	m7d6eb1oSFcNskTjqzRuQtyRQ7BNmuItPyWxTuCjRsYTyLD+xcVETs3e5nhHDtek
	SfpdLKxfKf6Uy7qkDMAURQs/PyQ+uVRWkjfOOd4qIljGNsBZ6uuOWktCUAPZR2Zk
	u8+pWZWvroXkDjKXWnZqI7bzerA7OYIgUmgnkErWu5pfRPrt7WkDjBXXzDPgzlyP
	emCUxA==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkrdn9sky-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-next@vger.kernel.org>; Thu, 10 Sep 2026 14:57:44 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4b597558c4cso582285b6e.1
        for <linux-next@vger.kernel.org>; Thu, 10 Sep 2026 07:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789052264; x=1789657064; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WOhP1EfYDCuzBlcUHllLpwpuZOdXHfemEhFe64d3kp8=;
        b=R1qCcfOR5Bwi9ra6gmYU7DhoIi+tXwmd9xJyXFx2P95BpKtSs08iq1PhFvYoabmYwN
         x/6ra/Zas4EZ8LxWb0FGtA4JJoCvh6/1QQqUKkWeCmdnznL+q3OgtXWCiQenJ+4EHILq
         lEVKcpfs3YwBl2hCa/Xu3ncRMcGXAByhn92BKVyu6MyJHdRWd7S/XDc36Ws9Eb6mUZAy
         5UD/3tAhOp7PHYl+ipMK6wiaxWxbjNmexupCXr05RxknN5aJt5UAATaxA5v/rJXsPzTq
         7lA9rx3p1q6QdgHw8pDJm0YQ31jEFOOxh4anhX+muPfM0fqwKuqSKDmLBediE1MbyxXJ
         6bHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789052264; x=1789657064;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WOhP1EfYDCuzBlcUHllLpwpuZOdXHfemEhFe64d3kp8=;
        b=Wwy7Eqi58KpWvzrvntBCahsSbvuqx+ntqdePWVM8f/TF5TyeHc/08XAi6ewGbtsxRQ
         HkvGEG0b4MDdFweaIbXD4invh9A4SgwJihJtMFG9CVyj26ScXUSOP4gGWV88kv/RBfKq
         mUX+f+XS9CwKQc03911ddJmm/3zNpaUaP2M9Q/uO6ygas/tJVQNZ5D3RwLTUcwXJu7Fe
         ln4Q1+MiwtIpbzmcESgHl0T8dxL2+jQs4N2/4QUEJ3WHWPXhyBnjqvkPZcn62VTi2PxY
         qfW2warFbzMleGA3+J6ff88sP60brSQEP4LJUx5ND9XZTk4pN0TVMIzYnxJtIt+hG/E6
         E/VQ==
X-Forwarded-Encrypted: i=1; AKwUvBxmqXw/nDXVEPqoLr6uz9m9fdRTLLarHGeoEJaYcT/22KSdl/2y6hyiJNgFPeyi4AlGTohZJ0KvwSn6@vger.kernel.org
X-Gm-Message-State: AFuF++nIy5T5Ap6VGwnVLJUP6Azir+eRSil6tRSGwyuPtl7CLVUXwwp4
	4RCHd/gJIzhVMR/D1wrBLBZMGbZHtEnJg9tA2sDTHkWW98Qd5xGJuehOOZ6JEsoKDyK9Wmgb8Wz
	QPWFKxXwjVFD9iNIPe7rE31O2JkQxKvaenhvw4HuVma9xyzVD/VwYJhVS5X7ys/80
X-Gm-Gg: AYBFou06k7O0KZSDuIcZsA8FH+0Wy9BZwlbVj90Bt0fe1Uw+unxIAQJtWYHTyxwZrAS
	ARFd6RFpQ8ul2h7IROlqfMrBiTLch5VNPIJunggISJJNFaVg2DyOdNUceExi+h2X/wo0ykgqqCR
	NMrcS7ArFlzNgJz9Thu70fiprVmmkM4AN4LoAZv2HZi6haLDFKwsCRFIj/+uGSoRq0QGIaWNhnR
	or5mWnRWg7HFQCt0sxI5vdFCAs9a2Khag514p5wnUDzMkgOqbOvI5Crd1AA5OwOIIaEJ2l5Ceoh
	A1H1Y2jnbc+UlYbN2g07z2GDQOBzAI7sfvyLy9WpT9fFTdb9/nl1XoQ0UIiZVNaMaj2Q84gEx4R
	GXC45DZMEXm9S8qDjFr2QH/6TpySCJeWoHYD38VEv4/19GhaB2x8mP90=
X-Received: by 2002:a05:6808:c008:20b0:4c1:dc01:f1ef with SMTP id 5614622812f47-4c1dc01f72fmr3827313b6e.15.1789052263943;
        Thu, 10 Sep 2026 07:57:43 -0700 (PDT)
X-Received: by 2002:a05:6808:c008:20b0:4c1:dc01:f1ef with SMTP id 5614622812f47-4c1dc01f72fmr3827287b6e.15.1789052263393;
        Thu, 10 Sep 2026 07:57:43 -0700 (PDT)
Received: from [192.168.1.20] (163.sub-97-215-3.myvzw.com. [97.215.3.163])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b971675f82sm17916653b6e.12.2026.09.10.07.57.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 07:57:42 -0700 (PDT)
Message-ID: <e2c332da-3fb8-47e2-bd59-b64a563f1236@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 07:57:40 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Fixes tags need work in the ath tree
To: Mark Brown <broonie@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Ath10k List <ath10k@lists.infradead.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
References: <aqKuWv0oUjGHSMIV@sirena.org.uk>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <aqKuWv0oUjGHSMIV@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE4MSBTYWx0ZWRfX5R0Q+7rh9CtA
 m7w42WojA70Jcy+XV4Jpq/w20fHv/iJNRP6SECB+WrwZH6ePVOZkFrxe7jwI/JfO2FSLQUc8Mj/
 Yr+ykYnQFa+EUgU3FxTxiek0z7H3OrXKSGNVTNue4XDISvH8JFIksUrTvPKpO4EkfIYZQtET2uc
 75OBoiED+yUlGMV7O530+9/bnhd2/i6JFxwG/8x6IfX0HB0tE5lmerrZE/5QtdQjpiUKMTDdAXc
 /UUYQG+tLMQdw2+dlfugSx0+JQYQvVjNX6RinaWfXBeX47trsVTx27Hg/GO4i0LCdEmvIxE9EUc
 Dd0WjCoKQCMuwq8XEFrbcFGZt/tKpn4/Nss8vojDrXM9qat5Zewyq6ciedhfdbswAL31kp75JQv
 T3FpOZ4rPy/BkY1KzTZ843qjAPqbnH5dPGoPrLdfn8qG14hQHV7DeJB4RXkvXSP6MGfhts9poQW
 9X/ZrB5+S/XY0eulW0g==
X-Proofpoint-GUID: 9GGNd5ZDQt-Jf1NfDKQ524cpsKMEdDUp
X-Proofpoint-ORIG-GUID: 9GGNd5ZDQt-Jf1NfDKQ524cpsKMEdDUp
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE4MSBTYWx0ZWRfX2zA557YYTAMI
 9+HVukw/3CaqCmXU7vhbbohTTIc8Eg+1BcBNEg6n59z96yNQ74o6Lxhl+mAF+NG2L6Ng9C57nkf
 CO3BHxiy2uve6QoRPtYO44DEFj14IHM=
X-Authority-Analysis: v=2.4 cv=eOmGH3p1 c=1 sm=1 tr=0 ts=6aa2c568 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=7QqFuFOOHQR3GLhHC5mhXA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=Bv2zyjIpLVm8bXmoBHAA:9 a=QEXdDO2ut3YA:10 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100181

On 9/10/2026 6:19 AM, Mark Brown wrote:
> In commit
> 
>   bea22601ee301 ("wifi: cfg80211: don't free driver-owned scan requests")
> 
> Fixes tag
> 
>   Fixes: 4a58e7c38443 ("cfg80211: don't 'leak' uncompleted scans")
> 
> has these problem(s):
> 
>   - Subject does not match target commit subject
>     Just use
> 	git log -1 --format='Fixes: %h ("%s")'

I inherited this from the wireless tree. the wireless tree rewrote history to
fix this and I've now synced the ath tree up with that rewritten history.

/jeff
