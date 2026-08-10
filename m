Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1FF03E639E
	for <linux-next@vger.kernel.org>; Mon, 10 Aug 2026 13:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786370291; cv=none; b=Tz/L44Ji/B3EmkG4xs5esfC4tcx4jtZU+JOSR55fmGIVdkbVFfh1eCRJ/OoP722rYEcvKffsf3QW9qe4YxT6ylRggXxffu1JP1jNZQs+d8NOhJvzSq1uYw3fLxoaMSM9LJroyHb82R4+ZX0t5YAQ6OmVIRktH24vZMpSs4C2L4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786370291; c=relaxed/simple;
	bh=yOhYlGUoA+y/0MOJzgRRsm4AM5VWGSJZJ4bJi7miLgk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OHgbDHfT1dx4qV2bndgdD3TS2XJfdbkZETGZ4vm8jnMAVLS50U0xaHdJszNAAbfSwTO1gSnQPf+3Pj4esPIo0f3CCk2lQIIasQ35lX9Lw5JfRZUJRc7PmCgd5cePU0jb529vCGc3wrq3T3l+PlPj1au8g8uWqT/JmtHYiDfe01Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ch76fJ96; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hl7XeY0a; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ch76fJ96";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hl7XeY0a"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67ACkluF1311180
	for <linux-next@vger.kernel.org>; Mon, 10 Aug 2026 13:58:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZDqEWwwvziurEHhgoveO3wxgLIM1/4fDXgZCqtQAYTE=; b=ch76fJ96eFbHP+Gz
	fNK6s3/mHEDr7j+UwVRxCS45IZA3N8RsnD6370VnZtNhhUfiRnWzvzmcdJ5/o+1N
	L5+KTzwXQ2lNmj1FQPgBiKc0CwUPlODeBpyqUzA2F6sx+2CM78NES9l9wwYFuRZX
	+KoN06aChLQCK31dEdYfU7iDlNjHpSJ/rkhd7LKwk5Mnh5WO6pOlmfhw9bnZA4WT
	tnyeFmPVh1Hw7AAgqmrBdjYUBSG8q4rulYANkJ0JKSSXc7kmJpFfBFjQOi+2K8BY
	517xfqJcf9tCJahmoFwCvEOvUSydCMFXdt7qp/sQ0xcpQqO/CQOPshbxUt12BhYH
	F2hd+w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyccqrwww-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-next@vger.kernel.org>; Mon, 10 Aug 2026 13:58:09 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1d7886cdso37538491cf.1
        for <linux-next@vger.kernel.org>; Mon, 10 Aug 2026 06:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786370289; x=1786975089; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZDqEWwwvziurEHhgoveO3wxgLIM1/4fDXgZCqtQAYTE=;
        b=Hl7XeY0a+qCPMhhHJl/BH1EFaa+udmKwrarx9Zknqs7rdbZt8cfpkrwOtqyYWJu+4c
         YsgabOzDPxzqV0hLyuHs89adTxFV0napzALoU99IA3aEOtFTqU8jjRyGb23tjiNnqeuM
         FElrlTKkgWPhgDvURyzc8mCxx/IlszOw5SaFqEdRkyMswiJu2neFesmvD3lbXo5g4Xqf
         /1ptw3rQhSaKwiQph9k0mU6amAc/r4CzXvQTQ+k2GHNfY7jxl/EUY7vip7v4IHhYcpxG
         K0imInfF4Zp/NncoqFi8z55cbXw3VWBP7bqjvcRm+TgNgxl+NmddP31Sg/5xKzf41Dkm
         d0OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786370289; x=1786975089;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZDqEWwwvziurEHhgoveO3wxgLIM1/4fDXgZCqtQAYTE=;
        b=NzwJYt5x9ygRnim+SKuRgNXWaK0PV8sLzVkurCuiJitY/aDu+aVuNGpI7c4lluJpw2
         XnVQG71qfj0+PBSNcx50UM1Rh/DwBg5PYQbMnV77sohYPmNlSZgepDJUDQRm0FBXzvGm
         DBhGHWMLCUIbUSfkNchiou2/hC7WoEGh5v3QfOu3YnCkg1qsWEnenIpe78KCb1vxrdaQ
         VYey9IfPkk8S07xLF6aFfA/aPQP/FM+oPge6h0uFE+iJcnnDyg0Jp1va7iLBIwlFZ5Ei
         pTxhge4SUSj/UXwsJ9dEvLkFE65xuF+Og3KfssgVXIeMJ8cWr/8oOUvchWiB4HHmwt7I
         Li/g==
X-Forwarded-Encrypted: i=1; AHgh+Ro2FPKWwPti/Vb2qbse4GcERxAy4qgfGS/m0VTJ0CEZXF4ZZFEXncgtj4Xj+tCf7sCeEE1n22M3Uczf@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/OrOup/edXy0dwhIa5xd3MWvG0T+n4dWpBQd+5Lt/iz6i2xrR
	jLAiTcyrSX9DE7ADcGeRA+f26q9z9rl1g/FPWLFB4OVAoMGUn5H8uwIMyGRtUioJJ0vIJXwyiMk
	bNz6gZSBJJRSj513u/J/0OQ9VWFvy6t7PQCie6GMfqjXW+rZum3ZAr8aDRnuDUozr
X-Gm-Gg: AR+sD12YTWwovrcqrBgsC0/P99h35pSmVNOKoDQVCL/soUNcBR/WdLI16U4bSf85AmD
	255SJT7sVjJKG/JiPXYvkCGrwrMA4QJRqN1nQTTsrCQ/AgbTow01ymRI3En+8ahCUnSkclhvdqO
	+H4CNAwN/E7Tg3ddN3joOBRiFr1gIcCVXCuwzVXatAyr5sdynwKXNK4+Kr1ba729zGG9lfhRa9x
	PZ7tSLa4tFiLuzV9dbmrW3gOpFaXFKmgjrmnfxpGMXmsZ8ZhC91g0S4dKm5wH4t8Nv6lVvFnN8X
	ttp0TC8rCBciKSXp+7RK6ZpJAXt5prsxQ/DxM5CUTGrshj+2Xne1IT9GbglqhHIjp/dEiwu2Z5Q
	Dm6Bv9nmFzpAma1Qv5F7O2KUbZs9ADi7HLfuZcbos4gCcbTKrY2yrRwQJ9JNE4rk=
X-Received: by 2002:a05:622a:1829:b0:51c:1c73:5945 with SMTP id d75a77b69052e-52d4bc6933amr18129721cf.24.1786370288934;
        Mon, 10 Aug 2026 06:58:08 -0700 (PDT)
X-Received: by 2002:a05:622a:1829:b0:51c:1c73:5945 with SMTP id d75a77b69052e-52d4bc6933amr18129191cf.24.1786370288495;
        Mon, 10 Aug 2026 06:58:08 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:a029:8ef6:7f2b:de3e? ([2a05:6e02:1041:c10:a029:8ef6:7f2b:de3e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995420cb4esm410831605e9.2.2026.08.10.06.58.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 06:58:07 -0700 (PDT)
Message-ID: <942b3d76-cab7-4e13-b7c0-acf06332af00@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 15:58:06 +0200
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
X-Proofpoint-GUID: OzOD6lRm1EzxmsPKnw5Qw-bB5fugiAO9
X-Proofpoint-ORIG-GUID: OzOD6lRm1EzxmsPKnw5Qw-bB5fugiAO9
X-Authority-Analysis: v=2.4 cv=WNVPmHsR c=1 sm=1 tr=0 ts=6a79d8f1 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=Qb6j2I3yqe2I6Ri1q48A:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEyMCBTYWx0ZWRfX5K5wr4drYS7x
 67xWWC5IpvjUiyw7lvrf7av4giYNKlOIbUbVAyNlFH5fQci7o1Y9oIJEqeXQmFmM+3Ny1+GF7nz
 sFHy7qfEcFwtTnyz3Zq1t+HpD86hsi9q4BpJtEPQDBU5MlA6q4Ep6PrkNJ65nZh/Ucu3+jXX2he
 pX5AZYrBUYOPZ8bpA4cJd096Rm87T3bMW4+Vzyd6a4HFhNxGWL9ssql+GSuUhCFQCIypnh9sD6u
 +4+qD2dgfmxaYpy4mhdpONu+pzuBeR1gYN0jZXxipRmzFpksvUdhCHVdNe4szeUVwVLdfjTAlks
 twvv7Zt+TOiUKl+WHcePoSTxl761ayRPc3/aXTDA6eNxT3fPh5I2SaXCa4NTKXnmwr+ymTC7S0K
 7CityLYkLKkow1GLu9Ojucdyeur3DYvLC1BUIfZB16X5fA/xEnZYoaANLqmHp3ILF/OD4DzpE+r
 LXvHxSOFwAoFUdzt1WA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEyMCBTYWx0ZWRfX9FTpt63aYRQk
 V4Ph4RPvO6O5lQ9I2F6/N2SEXnXvJsZnjlxN1xd5mAgXjm4QrWSzBSltM+wYb42VeSdqBoCuRjM
 Yj5wOzYxKhAEGrvV193+Pv5Bd4uA8YY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100120

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

Ok, I simply missed to add the file after fixing a Makefile conflict
