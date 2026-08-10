Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2420E3101D4
	for <linux-next@vger.kernel.org>; Mon, 10 Aug 2026 13:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786369735; cv=none; b=suyU1CEUtQMSLsfseiAkCNf+EmHqajRatXof5MpUHUfkbLmDX4j5eogvthTsvkHJclkev9TcFR6IVg9cw9k6xQ+xEHF/w6S34LnXkDNerfqqLKezmEQ1lYbiCr8vydE7JKxoZq/DDKWRzImIyBqk9KTFUmy2YXFMF8Q1AaTqJ+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786369735; c=relaxed/simple;
	bh=m7ynAzGxvW+bJ9HoY0qSikC5TtRCtHhi4qXMcz6Qu/8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MrrFN28fJZy3C4gC2cpLdK4THWbAf/8Tcv2q2ai6o+sc4VC+wDcyN9ccoup3ekLNBDO1zxEIQ35S+18b1yC+ja3m4450mz5Y3shbelVlkOZA+qnrMdye5w71O/cDqIwHQg+LqTnuXekJnfWv7JI1RqMe20t8BlXpEe++5tyA9bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TFgmpSDg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DLASadkR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TFgmpSDg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DLASadkR"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67ACj5eZ1367801
	for <linux-next@vger.kernel.org>; Mon, 10 Aug 2026 13:48:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yby/J3HTNNsWU50RY17+Vmkhqsskf9Mlm0TWv0Fl08A=; b=TFgmpSDg4lXAqyaq
	f7WsFIehCGKmR3ufXba4qP4hCGiVuPFOLDipFX69gtySlSTmIZJTvdCkc5qHT4t0
	RMhw4bITMZi5qL+v6q0zDaMWIzPB479sNnO1QtY+QYxGiZ/RxfjiCj+hI7HgSf/Q
	lGTBBHNqkSQAtBLUMHrGAIynw/xfniINmgiNiHhTJaom06Gj9BqrUQAQxlNM3FXq
	p6gXabT5++ttjFRjLcIvE2EmnBBMXFwNmKYFS1uuXfDCrurU7Aq6+DB/NxOTjjYk
	k/Ntxd+5n5E5fpwyYAUvHohwqMYUydqfYqOn4kYliNn44wEg1Dn7ODNavXLoUQhb
	6z3DiA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8v49sh5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-next@vger.kernel.org>; Mon, 10 Aug 2026 13:48:52 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1eb52e1fso36217611cf.0
        for <linux-next@vger.kernel.org>; Mon, 10 Aug 2026 06:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786369732; x=1786974532; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yby/J3HTNNsWU50RY17+Vmkhqsskf9Mlm0TWv0Fl08A=;
        b=DLASadkRa96KxWm2LWy7C80pqwMUFbLrZXnz9I9PRIDmQxDLvz5KUsZ1Ub9ZI40bwy
         88rqeoCtmcEiF6ZbJX9ZYXj5UmCXLv6pDN5NK1PiUgFHaq0eRRl9PD2TWSWIkAbuXHPh
         nRK5/TVrl1CjO8M+za0rf1cugsMtpnHSeIlmVANfY6VV92kjabMbOnw1eKcGsbNzEkWS
         4K+wk3yKoATZulZhAF0wRc41Kjqg4AUemyt8llItDYuDP0Y8gU4G7sdTV31Efo855Lb8
         q+RpIbwj0xB6pV5fpHaI7dWBED4zbcqq8S4lcrkfrk9E32FXaGNrNGg0ek1eZvdLwVpH
         3aGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786369732; x=1786974532;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yby/J3HTNNsWU50RY17+Vmkhqsskf9Mlm0TWv0Fl08A=;
        b=FN1U1t5onlV0DwaWbxwpIq1i/tLJDrva5IwVOK/ipbQPCwndUMs9MLSnFO8BuPypmo
         16eRyL4lFAZvqTO6zXpGqQQR3m/VZUbWOLOMCf17pnCwxlIgGwa3WLgts4I9br5hGVU1
         5tkTTXMpOc5osrXfYewrx0lBkKlgDjF14ds0VTqiShW72Yv6dXiNB7D7N9Epyq5K8rF8
         qdLLCrBMSPEiaSyvKjbZ4t/ePY2rPTuw8QZHXCerbKWZYChLeDi2I9e8d01q0ECV4r5T
         ckv9sFGNoouE1N/de+GI5HA/mmYaw7dyv3Y+vecJ11XhAB6XF6pJAShIo/Po09fregNu
         pfDA==
X-Forwarded-Encrypted: i=1; AHgh+RpMrblHN8VjBFymsxQHO8UFcVaMKAatz6AJrUwK1J+/9CDJyVdCTwGx603I6BWniwUsLoAOURvnme0V@vger.kernel.org
X-Gm-Message-State: AOJu0YxD9f155hMOMcqwqAyijgpAP9wuLIEikCJTtGVAb86qerPwVFsp
	I8R96Sp1VbzMj1sua/7i+rQhWIHl4m+Vn0z39bVOO2ebiWpdgIgTbrtVfezkmKyGmWlBuZ8eA6W
	n2m5APo58GyatLbEH32daMHX+dWTf7gPZKYVTQoZirrwFxZAO/XWA6dJ0hqEwr7gz
X-Gm-Gg: AR+sD13Er1VgI4jbtV8Eah+ZCN7zC9zs8gfFo6cBtxa3JFE2/iZ+d7Qgg4gkxPwoeln
	EHoz8loBwADmzPXEv4MFpaSF7CVV7dEW63d+bFlkUHjbTBvBuv2b6KaXNA2c3hVkdH2LfxiCLv5
	5nkEIM5mSzgxwysvqhre1mBRWzN0XTonNJdLxEZA96+VL4chB4GqAslSPdw694zkAhf2I/mgWEA
	agt/oHW1cXSMrcsxJNrqIHWBIg5NWEOKkJ0TvPyUCcnUHOCbDwqct658VsxQNpi2W5MQeaHwZvY
	IKj+tmbyBqADcAxfzKtROYl4BJzzsHN2ohr82/Xh6Ss0K1pCjK6LBT8SEfXCBUVCNWdHEtVWWEV
	rAB4kR9zalwWj185WFWNSWyaOAd1MK/2Q1uJEs0mLrZDIumq7DkcONfXznjrVmPA=
X-Received: by 2002:a05:622a:1791:b0:517:2c1e:8b6 with SMTP id d75a77b69052e-52d4bdb7598mr21726381cf.38.1786369732161;
        Mon, 10 Aug 2026 06:48:52 -0700 (PDT)
X-Received: by 2002:a05:622a:1791:b0:517:2c1e:8b6 with SMTP id d75a77b69052e-52d4bdb7598mr21725841cf.38.1786369731671;
        Mon, 10 Aug 2026 06:48:51 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:a029:8ef6:7f2b:de3e? ([2a05:6e02:1041:c10:a029:8ef6:7f2b:de3e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021f90f8sm31403183f8f.26.2026.08.10.06.48.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 06:48:50 -0700 (PDT)
Message-ID: <b6969ae2-25cd-4bb4-93c7-a8e387b56113@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 15:48:50 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the pm tree
To: Mark Brown <broonie@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <annVRNepH48qe6b8@sirena.org.uk>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <annVRNepH48qe6b8@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: wwFdJ98OA9b30D0fiwprioggvRIR1A7O
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDExOCBTYWx0ZWRfXy3tYmrCJbL0A
 FcjK3j5rmjM6TrBIEfqYHeG9OdFw7qdWJZl2NFgTln+0wrID6BcZkC5cVRr6IPrpiRO1qx6HXAg
 Ei2k+UPV6Pgri8+p0ZXSD7MN3TsuYq4=
X-Authority-Analysis: v=2.4 cv=W5EIkxWk c=1 sm=1 tr=0 ts=6a79d6c4 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=Qb6j2I3yqe2I6Ri1q48A:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDExOCBTYWx0ZWRfX/mmKCMoI5ZIs
 tAeaYabGSXW0EVFbHTti52k5y4k/RtQClK2zZn6zuCGIUwaUqoHVaFS2stzhjO4dDVzw8zNuql9
 FhzaIY1b4zcqZDUaNU77ppB/btTM7kzXeqyil0DmckyuGHZxLbbBeTE6SOlGZPPZ64BMj//GBXQ
 qWyMRGFACsIpemSHuNg+OEP+DYRZZHLaaNgCjgkOGfPlK1W7HZuao7FNrVEalMdkHKZXAahBC8d
 XpyTmJalBaocLu0HmPwTcGLBsO1P9Ntuzi/yJDM1wV9Fa22wATI0ofnpbxO4HEjCIlLtM7T7ryX
 nttX0gQh5GqqlrEPzRp2JARR/Mlvo9JPiWiHmqFi1IR/ucUrvSazadaoGpb+vAdULehHuoFXZBd
 9neRw5lEVHKV20Az56jXY1YQqwLbVMzxffufK9bdy9wSGP4Yqs/Y/ui7w33Og7Kqpq83RknjqPV
 5C1e1hpObUnKnkFtajA==
X-Proofpoint-GUID: wwFdJ98OA9b30D0fiwprioggvRIR1A7O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 clxscore=1011 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608100118

On 8/10/26 15:42, Mark Brown wrote:
> Hi all,
> 
> After merging the pm tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
> 
> make[6]: *** No rule to make target 'drivers/thermal/qcom/qcom-spmi-adc-tm5-gen3.o', needed by 'drivers/thermal/qcom/'.  Stop.
> 
> Caused by commit
> 
>     948ee3a74f356 (thermal/drivers/qcom: add support for PMIC5 Gen3 ADC thermal monitoring)
> 
> I have used the tree from next-20260807 instead.

Ok, I'll take care of fixing these issues now
