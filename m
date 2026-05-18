Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 453D322339
	for <linux-next@vger.kernel.org>; Mon, 18 May 2026 15:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779117434; cv=none; b=NMGpr4odByujA+zlqAAY20qs7u1k96tLXV5BKoCFV3rwwfWFEwXgq1RNQMSw99NRd3+pGYrGaRZgINPnQZXOUos1rlCbkUzsfFG7OjnjF/Z+q0LTGXvXychPzuBQUAQcTQAk3Y8bW7dOzNJTtvtuZ2JE7n4SMhaQQtXR3kkj0e0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779117434; c=relaxed/simple;
	bh=n8h4EhDFhAesyTYNCtScPTm3jfMlBTRPmB0Mx2C4I8E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LC+foRhMGlWchDOnlzI25M5FgwIRD1rIK+ch2lAs8ODgQc4HjQ+Bd1N7jim9y4hYbwKJaBlKkeCzqrlT3IbplFiwFeshgM5ha9um04StBOMlfg/YjxPHBLuzBC+HABEmBNIhObygRkGxEtkaRWxxXuiBzzG/PGeL+wWqfJ19yG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q3ZTYG8r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VtJUaTFu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q3ZTYG8r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VtJUaTFu"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IAopmN2083071
	for <linux-next@vger.kernel.org>; Mon, 18 May 2026 15:17:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2iaKtRsx86cPwqY75Rv0P3PiHHXW1gEy5c86WzdmfcM=; b=Q3ZTYG8r9RzuE0uR
	ziYfnAnxP9XashkeSwLk+v1YpzmH776H90LNHIAQE859VBF83Y4/lU3basgWziwa
	o3odeb2im5L196cmJ9Ncp7qNq1v1ht9d7hZkoOTB9KAsBYfs8KYGGOefaxrUvCAt
	GinVHM3W8QdvAfN0i+91pAM0caDoIMm9xeqzC/G4Ujj7G+3ncv2H+K1AXY1/G3qy
	e3fpLA1vJeOrZ0Gbhju/ot/OP4qy/1TyGFscyTEjgm9M6KrBLW81hHYWobLWRNt8
	zRt1akiKQEX4LkExaMqQqA+InzibNhwen30zlXZ6LRF09mYJm+f+SBhIgKescttT
	XSOuTQ==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e81ch91q7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-next@vger.kernel.org>; Mon, 18 May 2026 15:17:12 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-7bd795b6288so30950997b3.0
        for <linux-next@vger.kernel.org>; Mon, 18 May 2026 08:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779117432; x=1779722232; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2iaKtRsx86cPwqY75Rv0P3PiHHXW1gEy5c86WzdmfcM=;
        b=VtJUaTFuKBDblFfLgn0iaPW4yhxEG+DgAiEbzxz5HArdquz9xT0wLZuutjddt3mKLq
         3TuWyrbcLdmOWL3DTf1IiZ1E0hzkeWbbyaA7n8GTPvpc5x4ON7pxsPAnTemnYoHkSxCq
         x9ox2lsKL1P5bl9XCX0ZcuXABQ+X8+AJf+fHj7gRGliRBacFtpdTNqbktHHN/UXG74Ku
         CPgazvffotxne0Z1YW30iddElBd9ZjudbILsDSl6GGGJZe02s+M5m1tN+yCKGec+bEMJ
         Wa3GumWV7KD0x/9OzqWk9nBuK+u51L2gPOXZeumaNX66GtCZh8fTU9mYHJBGVGn5YrUO
         ZNEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779117432; x=1779722232;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2iaKtRsx86cPwqY75Rv0P3PiHHXW1gEy5c86WzdmfcM=;
        b=I7GHRCLEs/BYJN03P3l2ZbG+yfWq1lAPtOk4dBs66iVZpGHdg07xP6g5WG5WzBIVC8
         vK/pnzwQv8Ydlb7w1aYqKDRYDYwdmTH8FCoW0HeQ7WuecS7SlPLE/WKXOOJDVQjRiCq+
         DwvngvUFqoqZva9ee8MwG4MDPG+sMO2kfu5SABZwKxP4z05hZPaiiaxcDKYdbw59s/83
         kqAiAgVV5qCtKp+7ReCnLYnGSw1kQIwJA87896y0yBrsBcOOVQ3pM3S7/OR3pDIVHC0g
         LVZvnlOFeAbZoLLuYoJoKhaKn+ahGeBGYxqIJ3ZvvNFcs4jIDMT+9jVrlPsQAZVTzm3C
         va3A==
X-Forwarded-Encrypted: i=1; AFNElJ+RBS9oP/ynmIYOU2Ji9p9iUzw8CzjjX40yvfsELrewyvQ7i2uaC34UMYAtAOzLuutV9u9J1P40Z3OR@vger.kernel.org
X-Gm-Message-State: AOJu0Yzh+0+sa/GEybe2lwTPu6YGSOgWyV4renz2ARy2zHBG09YPV6J2
	U6MgZUGQwvZJz6Tf6WDGOHtvtD9Cs6cIaxB5LLFintTPMHIOkB1BM4gxAg/o6zmfPDU0Hi2XmL/
	D/LdU+WFQUkEjd51oR43S/NzkVCzIIs4gD8MXUCrxvMLjCY8IwacxM3cziGNG6HgQ
X-Gm-Gg: Acq92OHAR4zrfQzp6RBozxIGXV/QOY+eb+GzjUMV5gf37gc06D6crs1dEGxpaR2z4S5
	z/6ks0y49bkD7EY4KHDm94htWErh58cQl0ch9ehI65nOliMaigOcEVaNsxKkt9yPPSR/Gqmg4T6
	gbCh86wPd9Lw7Jtxgunhw0sUk91YsJoS7YKnGmfNVguDHbsF1Iac5k/lvTKB1nR/SYuk4jKq9Q3
	l2RjYi9Y5cTYpe7AK9L/pUE4OHlnhvLKJgnuP/tYWFKQXR96Gpt98atxCg7YqGq4RIzusoPsDjq
	MmKt3aatm1YSsOmvgDSvDLBSiZVB95QfBeF5pqdT5ERZRJnqUU0jnB2P5pkiIS9tWt1ewF1u2ul
	ajdZtfotmKbPU3C+AFh6BECcdhs3vgUgA+mY2bAnVket/77p1
X-Received: by 2002:a05:690c:6d84:b0:7b2:30d8:b680 with SMTP id 00721157ae682-7c7e5d8e246mr173530637b3.5.1779117431570;
        Mon, 18 May 2026 08:17:11 -0700 (PDT)
X-Received: by 2002:a05:690c:6d84:b0:7b2:30d8:b680 with SMTP id 00721157ae682-7c7e5d8e246mr173528997b3.5.1779117430581;
        Mon, 18 May 2026 08:17:10 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68311660f76sm5150996a12.19.2026.05.18.08.17.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 08:17:08 -0700 (PDT)
Message-ID: <ff150272-c748-48e4-8273-3487278f3d71@oss.qualcomm.com>
Date: Mon, 18 May 2026 17:17:07 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the iommu tree with the arm-soc tree
To: Mark Brown <broonie@kernel.org>, Joerg Roedel <joro@8bytes.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Joerg Roedel <joerg.roedel@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <agsOzbfiOszzuUvk@sirena.org.uk>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <agsOzbfiOszzuUvk@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=a4MAM0SF c=1 sm=1 tr=0 ts=6a0b2d78 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=ve9ONL5yK1x25ckWzsUA:9 a=QEXdDO2ut3YA:10 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDE1MCBTYWx0ZWRfX70YFCX/A+oOG
 RgPxCwkF7iQ9SDjgUEqR//86n0q8Ipz4ohwavuulg/EOppJHTcFH8ZlUOO+jlfZBTaxDGrPdfPY
 xDl0diHAx+m/6WvAUYsdnP8/on3QpR4azjoV7L144swsbG8thlaAcCher3yPhGx7e9xcd7xExLd
 4njcVkI1zy7btP37nr8ZTTc0cLtYo2mqg8woyK7MEWj6qkmMbrbfOZTNq4dcCLmKHCoD1j9AAZC
 UN2fhS0dlNFDAeJkDYS1JeFKjjMG3Dm+K6/yo7zcAACM1q1u1hnlXbn3SZwlKePrDutxnn25XCj
 YMweazjg4KgrjXgothtCdajKjPSmIQs0eomk6IdnSpMFu+DLZld5M4p+nBEJ1FM/oQkYLUeDis1
 lSmTXKU6rRIoKbN1VoeoxxpgJrPjCucWFzsjtaCqMntmMfDuxkEuqR7X/DXbCmyld8Bf/rSaF6N
 UPBwws0E+EjZiDmWn1w==
X-Proofpoint-ORIG-GUID: N2zxqCdLfb-9ZxV5M9GpxU2TGj55hfpM
X-Proofpoint-GUID: N2zxqCdLfb-9ZxV5M9GpxU2TGj55hfpM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180150

On 18/05/2026 15:06, Mark Brown wrote:
> Hi all,
> 
> Today's linux-next merge of the iommu tree got a conflict in:
> 
>   arch/arm64/configs/defconfig
> 
> between commit:
> 
>   f54f7979ff88d ("arm64: defconfig: Move entries to match savedefconfig")
> 
> from the arm-soc tree and commit:
> 
>   187029b922d0e ("arm64: defconfig: enable Verisilicon IOMMU for Rockchip RK3588")

This patch should rather not be taken by iommu tree.

Just like DTS this is patch for SoC platform. Joerg, could you drop it?
It's better if SoC platform maintainer handles the conflicts.

Best regards,
Krzysztof
