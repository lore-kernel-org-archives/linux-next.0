Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622A23FD15C
	for <linux-next@vger.kernel.org>; Fri, 31 Jul 2026 16:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785513601; cv=none; b=Ly3KrZdWkcb7AmHxM1WDLU8Wg421DRWsERgCRm4/MVeCarKCQ1kqAohh5D/aTqQxflkKAYnEF2xQl9a0V1o/ZcEOcfUWhaPMr1dMnG3nROhpg4CSjhA6KBSqjB+juj2uKaQWzSbzDjYFk2zqj5/XY0D1rKlvdZFLiYTZjXLQMKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785513601; c=relaxed/simple;
	bh=nZq7nqEwZIbuhhqABRRjWy1yqLqc2o1qa5idZx2l2rQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pmqEAsGD0WS5LvdqNfDbjg5d2XV9M9alVCJXt39Dp8UIq813L4vW8Cidx/Ga7AX4a6t+oOnLG6asnbp+0p94eCYefjl4HGISkOcFXhpf7eNIf/J98YA1LapCiAA40otN4ApVrZVdtPqABlqg3e88RYERBlvjgoA9jNKULfUrM/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mOKeyla/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a5clmJC7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mOKeyla/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a5clmJC7"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VFONTD205498
	for <linux-next@vger.kernel.org>; Fri, 31 Jul 2026 15:59:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dQsX7F+ONooTOlHDtv4W+IdYK4hwMODaWQQQ+BoImdI=; b=mOKeyla/2RnvpH+I
	IKkN8Gg0mYA663o0/dMIVPsrw8kcwUcYVMdZT0QT6OXwEeRAzzjcnDfZ4ujg5aic
	khHSvwJFCJKYoN6jjxM6JSIoi3Bjw8LLyoqgl1sTIOQWSmXlFgMBFvJ3yGVqT+dv
	jtZgphFLqDZDt+mpHMe9/vBcz5zuRCl+5QkfMJm7drogavXUQ+s/px6cu4o5sU8C
	HglwT931Uy2ycoWA53iaQs7SAgfnjxr+wwqaljymWIROssKhd2go7rdLba6Q/JZU
	0nPDnHVPe/JvrE34A3JiLp40V1xLrxfBzGosLw3BknNe7WpXJJ9BYKBwd4H7O9xf
	OUuhFg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fru5dh46g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-next@vger.kernel.org>; Fri, 31 Jul 2026 15:59:59 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c0f0a0760so22223101cf.2
        for <linux-next@vger.kernel.org>; Fri, 31 Jul 2026 08:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785513594; x=1786118394; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dQsX7F+ONooTOlHDtv4W+IdYK4hwMODaWQQQ+BoImdI=;
        b=a5clmJC7Fq/63+UmgoD6fhqMgi3bJ/OjKyA18+3uuuhV060TH21RS8GIdpGeIHDXAS
         X+sDPvG+6U/5H7JyQYKrg0fylYlhTJmQ6Le8Dplbyn0f9ulpqbkOqEbOYh4HFd5exd1k
         4XGaUFyTa9hDOFyizgBfgzVs71eOd41R3Cp7FTK7jSXkTNaM1qYnRWawuJ7coniDPt0N
         TEu7fg3uZB4oLC9L5xRhPOJFwxdVbpnYjC7xY4qH7/hAX32KoxuY3Dlg7WtNRAVzLIm8
         m0crgremAsVtHldbX1j5/RaXgMEXxa7u7J9PcvbjmK60qlZuyoTJqzkXxBpJdSTPj0Ay
         3evQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785513594; x=1786118394;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dQsX7F+ONooTOlHDtv4W+IdYK4hwMODaWQQQ+BoImdI=;
        b=fm/E5OSA29V3ZpQl+S7KN2b9pKSsgXs4miHS3+7PNTKd5rVvBU/RKt1Z2NAPbiJufc
         DqL2rCZWaxLv5SoKTSh/4kGu0iiBSy4oG1mJuyTPtG7IxvyMBnvaJWcvF0/ccSkISFz3
         1Wm+aZKq2P+cUUhSqtZLHhkP1g487kEjpQ4nzRsnmzMKzOA94BeraPeZsBRG1vSPAdXw
         MEXsaEQYg3vvcQ3d1cLNQHqvPXn8kw8qW45axqZcnl7QD8fSbM/dyg4CI2U3wfDFohV+
         oadQSUKrVWn2zhHwgPXzX1FlzCERKFPYi2Ro3lhCCSqv85Rabw5G9OoOoZ8Zxn0N9XBi
         gYbQ==
X-Forwarded-Encrypted: i=1; AHgh+RqH7QcH7CpFll9NOGdjv5muRdlWQ45T6CA4QgxLiKyFpjb4AFgN7AY2RXeI96U1NaA0rtozXPgojS1P@vger.kernel.org
X-Gm-Message-State: AOJu0Yypzs835CPLR0sT4elbW8LspdW2BdY4iVtv+NYO2NTe5Wulg1FV
	cuFh7BeDDmdqYk4m/vk/pSWI1Iv1WeJNKme75oQN706K+ib8gGJUJp4QSIV0GVoLJUoW/FlSVwm
	VmHvbXD0EF6fN/nxy5SdCqxUzYTOa4uhDoBgypVE940nCHLqbIvlAYwdw0S0/39dJ
X-Gm-Gg: AR+sD13MDJSBCMfhc7RGTvetc5jR/CB1T0h0Wp9bxdxGyCZ0t0DGlgS5ydYJWw8+Hw1
	E8EHpCA3hIfpCGxFDxj2H9wFDDVu4DwVRm0b4I9oII6UzXW8BnC3qxNGws0rC2gaHUprbwugvAr
	z/QcENbYRHpdnYZgmTVifYf6BRXbhsdPSBB4M0HAwE8QwIDVDrcz2naLNQKkeArAgpV3f/NX6Xl
	+5ux8dy4Wm5+3btjHcLAfeF3tuD0MCARXRlMvGKk1KDaicWT6oMW1i33yShjbQ4ZvFp0Ev4PQX0
	dtTDfS/WX4ud6KSbUDPf/I0cv31fbQ98pbrqkOVh6vuD908jn8ZvSCE02i0PnknvLSW0FxRhsvx
	DOJTKMrAkD+S5wt6YbjTQZ/pnTtU=
X-Received: by 2002:ac8:7fc4:0:b0:517:a7ff:935f with SMTP id d75a77b69052e-52b5666b775mr14281481cf.9.1785513593635;
        Fri, 31 Jul 2026 08:59:53 -0700 (PDT)
X-Received: by 2002:ac8:7fc4:0:b0:517:a7ff:935f with SMTP id d75a77b69052e-52b5666b775mr14280871cf.9.1785513592925;
        Fri, 31 Jul 2026 08:59:52 -0700 (PDT)
Received: from [192.168.68.104] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-6a09c01f7b8sm1976985a12.0.2026.07.31.08.59.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 08:59:52 -0700 (PDT)
Message-ID: <42c97254-957b-4144-92ab-7edec194384d@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 16:59:51 +0100
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: duplicate patch in the nvmem tree
To: Mark Brown <broonie@kernel.org>, Srinivas Kandagatla <srini@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <amy62FeftQnnQ350@sirena.org.uk>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <amy62FeftQnnQ350@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Ddp5aesQp9vjh-GZwWYq_4-aJTuLxRKD
X-Proofpoint-GUID: Ddp5aesQp9vjh-GZwWYq_4-aJTuLxRKD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDEyMSBTYWx0ZWRfX1RW98QVbDA7i
 hGZ3mKatpKuEYYb3mgXOVIUOsNBYUuX3Ov97KCAuMjM5GSRfMAYnPKsjQYFA4WByG0XBlPLIrt9
 l8G3Z2yKx4us/XTi6jBPqCjNPOsr15wm1rc5fdC9yPI7ZGm5st+gDk/jSJHZEjTlohQe6fY926U
 uwBDsEAEJ/nwzHCbKYwEXoC9wvYTOxKAC4pLtqdKz33bOTDKsGBxic1QGXc7TwF1f9koKX7UV59
 Iaww/aV2sdUtShHi4qC8+ps3VTWQ+I8Z5ZXEfBjO3Sh6GrilBFnVnOXHxDcFZy0qVscrVUbWAQu
 VHRo2fF28DVzqdztirKTh/2ys4M0ynrWBb/4uHE3uezhLghf7dJxtfCPHBOYIxtCqj0q2lWjIYI
 /bUTWHrdSEoiauawVBUfEHGJGXQhKI43k3tgyaq4ALBxP4wAQEIoU3pgBGbkWI1V6AFw36i6BvK
 pLGOXh6khYMu0UuaTHQ==
X-Authority-Analysis: v=2.4 cv=SKZykuvH c=1 sm=1 tr=0 ts=6a6cc67f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=08OiFA9r5RcGhkjifHoA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDEyMSBTYWx0ZWRfX1fgQrHhnWYCP
 hP4zEPxfvcQyWXEwc3MguJKMgEP577TvYUrMLYtcKPOaOVxq5fAwHoR2+47tUNR3ElDSXu0c/YN
 51wgO4q1U2zLN5T/Y/iqEE+gRhp/i7I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_05,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 adultscore=0 impostorscore=0 spamscore=0 suspectscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310121



On 7/31/26 4:10 PM, Mark Brown wrote:
> Hi all,
> 
> The following commit is also in the char-misc tree as a different commit
> (but the same patch):
> 

I will drop these patches Mark, normally all the nvmem patches go via
Greg's char-misc tree, so there is a overlap for few days while Greg
applies this to char-misc tree.

--srini

>   18f2b79951a9e ("nvmem: qcom: Unify user-visible "Qualcomm" name")
>   512946cf0f32e ("nvmem: rockchip-otp: alloc clks with main struct")
>   5a2bba5b74227 ("dt-bindings: nvmem: lan9662-otpc: Add LAN969x series")
>   68628e84bc61e ("dt-bindings: nvmem: airoha: add SMC eFuses schema")
>   7089170e1df16 ("nvmem: apple-spmi-nvmem: wrap regmap calls to satisfy CFI")
>   7106dcb57aa1b ("nvmem: core: Default to read-only if wp-gpios present")
>   7592c50152619 ("nvmem: lan9662-otp: add support for LAN969x")
>   9f902e68cfe33 ("dt-bindings: nvmem: qfprom: Add Milos compatible")
>   a3122a19f00b7 ("nvmem: layouts: u-boot-env: check earlier for ethaddr length")
>   ac0a5d17aa3cc ("dt-bindings: nvmem: qcom,qfprom: Add Shikra compatible")
>   b13e7886c2e16 ("nvmem: airoha: Add support for SMC eFUSE")
>   c00ca6cc2fc96 ("nvmem: layouts: Add fixed-layout driver")
>   c33862c0a3a9a ("dt-bindings: nvmem: qfprom: Add glymur compatible")
>   c896d1c34f2bb ("dt-bindings: nvmem: qfprom: qcom: Add Hawi compatible")
>   d5bd22d9d2032 ("nvmem: cleanup dead code in Kconfig")

