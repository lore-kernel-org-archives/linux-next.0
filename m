Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795607692;
	b=2EDxzN+r6j4E1qfg7jDJ+aC5D5+YTIKhRni91CDGuEezYMQ/4XXydDcP1YJjx/cFmG2n
	 QIUGF28i2DYuDllbHtQh27pyNFKgbiTeC1vlqLWU0aaHMywulu2ZkiEV63JTUii+/nDD1
	 SrI3hxiqEzavzgKsZyjUZtflHHlpnVsWWcNU5MaYFva/zvvbGJnebqPAIZd/VzXYEkwbV
	 jOnqO/RSdHsWasG6Bfc71rKsSQoZsiyRl3wtW/IKnOU1awOGtCw/39zAn/MTfEY3taRxA
	 mr6uMhBQJ6dL001yof8viHZLPIhl3TAYLfDgWKrIVyOD6u8g4qcGn6Uoo4TodU3M1WA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795607692;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lTb1A0Hfb5XeXnPFSrjY1zIvAVboe0+YM7ZLM2/CDL0=;
	b=2hjaYDy6D+c96gL4H6g/dPqZ6TEJvP1MqJi0ArP0tmYSyYB5dBpfEEB6YGuvACYpRMRw
	 ZEGfeAOJetSHF7GqUT3/fqoQm+Th7sY+bfJSzoqBVh0GS1W/+Qi/KadWweuCCVIFoDzFd
	 lYMgd0n4PGxChLrToAPrtm1fgGB7jAw9bfQkCG3qjStV8/0ehqNYS4ytrsnk2Q8Won1hM
	 VcwyFfEPJUfqvTg9S1O3a5vPMqM0lD4ekG4DFdLHEluNGRJR1mIpXtT9J3CW+OjEZboi3
	 n4x+Rb6jYMw5fIpESLx+XyQZ6VTbwsGMsvsZ4L7oBonk35cRGGssvQM0yPlAuEZh0Vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="BR/xPm9m";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ji7TjIIb;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DAF3606A32C
	for <linux-next@vger.kernel.org>; Wed, 25 Nov 2026 11:54:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DAF3606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BR/xPm9m;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ji7TjIIb
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9miCX3642179
	for <linux-next@vger.kernel.org>; Wed, 25 Nov 2026 11:54:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lTb1A0Hfb5XeXnPFSrjY1zIvAVboe0+YM7ZLM2/CDL0=; b=BR/xPm9mPVuMbuTY
	qHOhoTAFWYOZnL4xNdYviUSRHm/m91Vbe6K2nsuGgkjrmBoFAGfcDsvuTZWCvN+V
	0gOK5xCvXgJqx9/oiJpniMJjQRnEhVUFH4OBScOQF4ZF4xVjoY/5xfp/LPCyiRxt
	nMwE+AYCbNr9xOtFXiN2hyL7lEL2TI85JDN9OpzPto6ID/D/kGYmn8Uwj8bkmmHk
	W2DsICAdW4V5T8uyjiBIdHzdUvQtYRAmrhD33c96XdmRrFwAUa9buggFUibtkiHE
	nBRfI314xJSisFPsyc5mgeJaW1iK9RexHab++KklPsxu/Ebf0uvAN48fNkoIvPmo
	rr+slA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mc2apkd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-next@vger.kernel.org>; Wed, 25 Nov 2026 11:54:51 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f5844cb60so993921785a.0
        for <linux-next@vger.kernel.org>; Wed, 25 Nov 2026 03:54:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795607690; x=1796212490; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lTb1A0Hfb5XeXnPFSrjY1zIvAVboe0+YM7ZLM2/CDL0=;
        b=Ji7TjIIbLGS71ae3i5v0WVfWPLdNV3S9ACMgxZmCthke+fuB1wxSs0OIhH1Xzo6AWW
         jwbz7oKRsLhc2/YD/aBHWfebJnsrluTmMurfU1c5Y54aYrRNvOC8kUlCu/BGGBy1xtjX
         t2Da/RH9Y5aidft3NK7U8ezuejjHzfOqrcSh3n6MfTxjS0GfeOUeDky+iXFJIVqH4a3h
         RD/5m7f3fLzlLR9YtL6JSJ5fMtSfEJXG8cZhI/d4fz+8BAsBEjU/WeybHHdDZJl3YJgE
         GzEeBxyLEc8OMB6OG54IN3eLQw1D050cDs10jQg6iSywbRttwANTIMv69tNVBGTZRi1y
         t3FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795607690; x=1796212490;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lTb1A0Hfb5XeXnPFSrjY1zIvAVboe0+YM7ZLM2/CDL0=;
        b=00UO+xHaYMk92o9TVNI/xrUVMhG8xVS3yQ8WlL10lpzgikpaECBzzVnTzKwsQAiN+s
         uGIFWmO/aKzylMJ5nK39PfeT2eP45ta5EOXRgWOzYK5EOpPccwAKrgYcK7DAjJQ9g4SI
         qw3rOeuJKjoN2TzxVEVN+vBOXDUG1YMk76UMKSRqYF5l7UXn/NxyRU3PKfRM0QaMU58f
         LsjNouS3JjwYIwQiF3FEuLe69loSBZCFYRC1IrygQ7AD7l03UrDhiFu7AisXgvDW4Hfo
         +/fr1NbO9k8QzqpklcTuxROpQ5N65tVXUe36xGLIA46K41eERr4BocujewEETxAUziIQ
         4rkA==
X-Forwarded-Encrypted: i=1; AL+hErGQOm8JvmlQ3LV+5RlARHq10qlGT7cIlBg80mcp9AQ7Yi+QcuAp0o3oI8FHes8W2C4KZdBfaqon8fBY@vger.kernel.org
X-Gm-Message-State: APuU4Z961adm4MXU1LMpleuVcNGlom44vLaEyHVei1gruO/UL8OVZkAD
	7Z9tMCOg5O0PdD9cK/LBKK7OiLVl5kNh96mt3ZeNgwnDUQ2QDP4zN6rz7iICb6OqTSl8wEZOzxS
	SLSRaZVSyITIoHNn4ZCbGkKwBjsoqakMw8YPsus6gX9v4IL6SlpA+Em1Za135aFQN
X-Gm-Gg: AZFdTZfMwnTTgwhit7uCUaIAqZ/k7RRdCr0f6uVlbqxBWDqBBVePGt5mIQMMQHDHKDH
	GVr0i9TaPtEVVEUYyj4HhLR0oDG9hmHepoCmhbWxYxzw2p8MWsronhsFbGJrM3M18DFek48qDb2
	u3YL9D6drQ2lIkD8jl7PRLQTx1FBqFRf1ZdL5YLSrxv0F+n6ncTidO3EY7J3DJsvlAArvgkidI6
	1kMqEbW6Qh8nZaz9+vm2BEWYfygKV42CA6oV3h4Zqmsf6F9D+3oCiN4duIZGwGuXiRnG5fyEnDw
	gyUUXBLUhNGCOQEPt28YfRZL3U9+dUU552DUdS7KmjqvQebFQhfLaBE1nXsoUDsE+533nZSEB8V
	co1eKUjN1wk6oFHlLR/MuOt7pkjqyakdnE7aDcrPvWhl442yeMJl+u33JNVD3+gEiplQ3A4cq4t
	p1ucAIdlMuUVsvTuGqwWgsQivrL+ory887ST4=
X-Received: by 2002:a05:620a:1a20:b0:944:4e6:85d8 with SMTP id af79cd13be357-949b3402288mr3213981885a.5.1795607690589;
        Wed, 25 Nov 2026 03:54:50 -0800 (PST)
X-Received: by 2002:a05:620a:1a20:b0:944:4e6:85d8 with SMTP id af79cd13be357-949b3402288mr3213979385a.5.1795607690114;
        Wed, 25 Nov 2026 03:54:50 -0800 (PST)
Received: from ?IPV6:2a05:6e02:1041:c10:ae4e:e70c:bc04:68c3? ([2a05:6e02:1041:c10:ae4e:e70c:bc04:68c3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fe75sm38679674f8f.24.2026.11.25.03.54.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 03:54:49 -0800 (PST)
Message-ID: <3c02886d-5c5e-4b62-a671-e469157a5b9d@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 12:54:48 +0100
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Missing signoff in the thermal tree
To: Mark Brown <broonie@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
        Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
References: <au4SKRePRjYBItxx@sirena.co.uk>
 <56328964-8d06-452a-adf5-ea37fede069e@sirena.org.uk>
 <782a33af-566d-406e-9f4d-52d80cd3c756@sirena.org.uk>
 <70a066cf-533e-45c8-9db7-e79727dc6c44@sirena.org.uk>
 <03320894-97d4-46bc-b11e-5fec18146963@sirena.org.uk>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <03320894-97d4-46bc-b11e-5fec18146963@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aPJlOr9m c=1 sm=1 tr=0 ts=6b06cc8b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=1LtqeKAUxZIeCVZ3D7kA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 8HqaB9fkuUGKnRmrkMuP_jaN1RUcjtE4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0NyBTYWx0ZWRfX6/VqhmzQGMi9
 XqO5HngU6y6GDHygt0kcuK6Iwet50b7gkry6f1j+GvoxmYdKVG8OHCNxoEey4avojIMGSSI/rhh
 r5zFRWEcdS2NzNnDk92ZO6VMMQgBz7NsZdgA37pxWTe2L3j586+va0YcmXxgcXGvuSWv2NXsJcH
 z+TtGYfZEz9vC5NGmVW0lZ0hoyDXjLEar/eKVrDcaxmNgVNIDQ2QnhTElELkJtbI7nzYUtB+QiU
 bXE5OPtKn4PakkS72Z/fA9AVGjiDdxBDvKnZ+WcdjduMXIjgOqgN9ckbdIkfp/36vob4VMglaeP
 zSE6Isg4i//zmGI/UieiJPHzU+6cgU2OvYzkFlgDb/z6a3iaCx1WjaWy8KNqjufw7ahinMSeyC3
 V6z/2qGuA15NCt1vr2vvmvKyLcJVj8G+qJYfn/gKM3d6/QI7rBUN29dJKKVb7l2hrO0kARzAgSi
 KdN+/2wCAMSsa3RAovg==
X-Proofpoint-ORIG-GUID: 8HqaB9fkuUGKnRmrkMuP_jaN1RUcjtE4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0NyBTYWx0ZWRfX+AR4iTduTquU
 oPvEBMxx1rMiATMCr9/e6E0CudLNnsnTFb9bmmGYIy6feAa6zwQnwmKuLrRW/xzSHeMDwswaJiv
 BIZEMuckh0lygZwOvamZgTvSwDonfqg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250047

On 11/23/26 19:22, Mark Brown wrote:
> On Mon, Nov 16, 2026 at 10:18:31PM +0000, Mark Brown wrote:
>> On Mon, Nov 16, 2026 at 10:17:14PM +0000, Mark Brown wrote:
>>> On Mon, Nov 16, 2026 at 09:51:27PM +0000, Mark Brown wrote:
>>>> On Fri, Nov 06, 2026 at 05:45:13PM +0000, Mark Brown wrote:
>>>>> Commit
>>>>>
>>>>>    115b4ff52cd35 ("dt-bindings: timer: renesas,tmu: Add SH7305 support")
>>>>>
>>>>> is missing a Signed-off-by from its committer
>>>>
>>>> This issue is still present today.
>>>
>>> ...and you've not told me about your new email address so you've
>>> probably been missing some of these mails :(
>>
>> Found another address to try.
> 
> This issue is still present today.

Should be fixed now
