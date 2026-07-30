Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B79323C3C02
	for <linux-next@vger.kernel.org>; Thu, 30 Jul 2026 09:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=67.231.153.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785402907; cv=pass; b=u5r51it6nJoTPOQud8BhDJsBXgEQKKj1iptVLUsBvizeMzgjqX5rO+bqJrxD1eYLbDpfVI4iaqpKMjrcGtOkXgcSM2lFAq0DOtdhmSzulbQhr/4G2Dbl10kf74IdIRxN2ubaan8EL8abGh8iZS4YXHTjAxEZ3Yl7E+izACvYhmM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785402907; c=relaxed/simple;
	bh=P0va1hTmkVaW3Bp+JGoO8chXawfK+QVt7ZDwn0DcAHI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VmFZyNiM1htXuatV4B5FVGSppvsZa6Rlz1ppIBp5QDesTJQlel4SQFXlSEZHU5v56i5BLbjzwSI04RNBgkjtI901mWsoovEL9AxWbCBhV4FfOzDtg8VGP3nPy0ny68FuEZ95Eaauf6iGNzBZudwtzABebEu/f+7ONkd40eHfvcU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=Wrng/bTV; arc=pass smtp.client-ip=67.231.153.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="Wrng/bTV"
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U6b4u01624096
	for <linux-next@vger.kernel.org>; Thu, 30 Jul 2026 02:15:04 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=s2048-2025-q2;
	 bh=Z7Mw+bgUsNo952FJlqTQquwJ3OSF/sNng0+4x7RXm9Y=; b=Wrng/bTVvmPF
	UNEYihLxozWoyU7Kknbdj7kOzV7SguAbptREmqP0zwU5YpXiVYqkbX0oRdGZtq3g
	7HyjVIRi1SivrM60OeIaf4FhD+wGdhDoeSfuMe7JcXzSFcDA8NC5xY1zbFy6k2X3
	i2D4DDwHVqOXBC5RTF6ztuFMv9OLKAQnM3frB0OyoPvhOhw/ctCD/tBxTbgHKX5p
	Q5TpPfsRKYl/gIsnPKygLcHVq436XZw/MJUdi1+o1Fuf5TPzm4r4mYU6Tl3xHPF+
	QdCi/EYRiwoJbwuT6aOScrAP4qgIyHyeJ8GjF3dtZ7h6RqYM2VYpxO0wjdP4tkpi
	CYYfTLMvyg==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4fqrn4kya9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-next@vger.kernel.org>; Thu, 30 Jul 2026 02:15:04 -0700 (PDT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-7f5b54da461so30895917b3.3
        for <linux-next@vger.kernel.org>; Thu, 30 Jul 2026 02:15:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785402904; cv=none;
        d=google.com; s=arc-20260327;
        b=YRZk8R4B6jTPzP7eCVM9WQPb1k6KYLeOlO7cIN6bx1gh0pJWIeUs7aMGlYLWnOaiHz
         ol+lmi4BgQHclP0uEp7y7hQLHRIEAASRX3MsutWNXpXweJNpFxBt1AHK4atOTMAzct1q
         v+XcBi5Vat9TyGaXXd6a7g/ECEsZOIjngt+6G2WXmPTfhgxUZKiAGLIUtyuTSQm1WE3T
         JU+COI0R/MujbOGhQ3PoE5r6qBqFx3CLltvHC7ZuNakIoxsAAUtl722XZl5PWzY+jCNM
         U5G2/zzJv4ESS2W+R1hNAXGsXGmagGhiPNu54aKGOcKLBYS2iZqfERL5ham4ycrMjlcM
         0tPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=Z7Mw+bgUsNo952FJlqTQquwJ3OSF/sNng0+4x7RXm9Y=;
        fh=1FBKKyXBpNpgGx69Fq43XnmwinBsEa9uJnm3vlZy1M0=;
        b=dxZltxWkVWSLEO7+ehQ4j7cwXF3gkErJsQjH+0ahoS4y8DLSMXWTR6L6TbPbFSbqBr
         vhabxS+M+1f80ALZ9wfJItLwBnLuPeYKBPZuyy7YKZMfX8WoEcp3ssLP2k2mvyGhYjK3
         UeMcLY9HYNqJXbzk5/NzWp3i78cOP71Ci6W+ISNetInfqHzPY4YlUz6M+LxzZeOFdjaK
         +ws3OZfWScVTrMn8IJzbyLavlEi/tRFRpfj+s8olDZ+vs01/d+sbqgYMdawLhcS+zwJ2
         Jtq20xKmm9FcHcodRaR/nx7Y4HlTN8QVRFX3qQS/zXKUt33CGJaLisAxHdiklMwGWAy5
         vwcg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785402904; x=1786007704;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z7Mw+bgUsNo952FJlqTQquwJ3OSF/sNng0+4x7RXm9Y=;
        b=TD8/Bka7IzaADhJzkjL9FEVwGuHqlQghejBJHw0vJQaPgs7ChrGmzk1pcKeVTn6BIc
         ekFcRbcb0jpTtrCtzdEPo3noWSDiu4PeEIFtcbTOaRFEn1wfAo0uCj1hmIO+IMTGKUC6
         wr+Z684NcMQvuiI6t9Qjabm59XfZzTJxSL33YmvtlQfP6IeVPTKDKWkCW4QrIWUxDd89
         7NUdmbwqz77O4MNY/fcDaGtzv/JUdHgKTjE91cJpR8puiBXRkMJt/jJfB09SuGzyNQ5J
         E366dDVpQa/D9X23yHPQ1+J3DQuWpQqYw3b0f184sCshj3n6i5a1vQft/Gnml5ccRsiq
         hgAg==
X-Forwarded-Encrypted: i=1; AHgh+Ro6t/JMQ7fzAI8FturHIzKRP6iZvBH6LxNTY+qmt2m5dBQsCElibSiLyVSDR0WVHofeiBuA//PeZzh2@vger.kernel.org
X-Gm-Message-State: AOJu0YwcXvuWodiOpHPCcq+i1wzFA2erQQLyJ5EwumvYx5oaDCypM/tN
	pQCUGU3WK2Zm2Hjmn26e0uQRq/Df9uLLKVyaT9DXKdhS+2/9YgLqHDcjCKVvsDCWzEbRuxHNimR
	PXbqs1oFUR88NlyQJyywPXiU9Fx8feb4CE3EN9UwR3zfL00ttDriUdE3LtFhMY5FXGfQWf2mHF6
	rccuS0fy6gY5b8uvmV8cFiA+6anYn0JXT5nlae2aQzsX+yInU=
X-Gm-Gg: AR+sD11bgkl8m1Q70SNGbot2/7KoJrEoOzPeioJbN7vuuOr+ubyb0xAC7tdBKY/TxEh
	4ybN1t+7L4xz49TJm+8IZzifxYZ6WQc095IO+8cdkfwhjjUNSqRCwz0d34xw9pt+yTieUA5Tsql
	rC7IAWqBZLmW4FHlqdMOj/cc0SZ072L47KuPaUfslUP9sIQn+Im5S9mH6vMz/uVMfYCUAF1Ya2c
	eNp/L0Sz23dfxb9W9I=
X-Received: by 2002:a05:690c:b02:b0:81c:e8ab:c4dd with SMTP id 00721157ae682-81fb8a6095dmr10935617b3.33.1785402903868;
        Thu, 30 Jul 2026 02:15:03 -0700 (PDT)
X-Received: by 2002:a05:690c:b02:b0:81c:e8ab:c4dd with SMTP id
 00721157ae682-81fb8a6095dmr10935407b3.33.1785402903419; Thu, 30 Jul 2026
 02:15:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ff58b01c-3f5e-4d55-be82-609d2faaf12e@sirena.org.uk>
In-Reply-To: <ff58b01c-3f5e-4d55-be82-609d2faaf12e@sirena.org.uk>
From: Mykyta Yatsenko <yatsenko@meta.com>
Date: Thu, 30 Jul 2026 10:14:51 +0100
X-Gm-Features: AUfX_myAwTJKtg8diy3JUJmcXcmxwejvzkpUC2GkJXZQ6NKniyNChRKHrEuQG14
Message-ID: <CAFsYEOKqFo-S3XHq+eJmpeBmarOjQTSm-z0hAzsOm+AGO0m35w@mail.gmail.com>
Subject: Re: linux-next: build failure in final build
To: Mark Brown <broonie@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA2NyBTYWx0ZWRfX5J/cN7aXB6V5
 xN9R89a8TVou9osThZOUuCW760fsKbbTc/8nurv/0uY2s9yr19DXSSxhklCljAsgqSMVxNJm1uR
 GhM9HTNfb6c3C2xVKeIoGZk5sOnNzA3lyMyDKVl3JzlkQCgBWterQXvCRXQsG48Ev7Tr2py/BY8
 GBejk2GedeV2iMW1UpXLvHFgwrP7e1G3l+tx8ZaWmjoUXEczvt3djj1aBWv0xGA2rqDSvSFIu+5
 AzivM3N4uCVmuN3nSHFbd+PjWwtzY0k0nIxUZJXOcKF/QXFf9Je3QyHHlGVRfoTQYVL4FCTGE8m
 M24cr5X8Tqb3LIUo/8QnBFtQqpzeDKg3LINSZOhpb34QsTVHjpuDyGY0thaXVYFBQxNYxPDj7HY
 yxWXRQW0zQPsq6HtsFhYdmz3qFqOqjV61qjERmLNSlYs4/Er+sDKPWg5S0jO0q+NHFrb989VHkQ
 bmvnoFXbRnJWHer37vQ==
X-Proofpoint-ORIG-GUID: kBHU8ogLAXTvvJHU2SSSHdKrK-LRHpSw
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA2NyBTYWx0ZWRfX/QP3lGN3FBSE
 GGPTR39V23At0+wYTGAYVQ89yyUeJE/NRVHkdxWNfS3xRgNRhx8Q/XlHZPgjxA4uXNkaOenf2Uf
 ecH2tMXQZI56BylYqGWipENPFpNTbtU=
X-Authority-Analysis: v=2.4 cv=B+2JFutM c=1 sm=1 tr=0 ts=6a6b1618 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=wpfVPzegXHpEFt3DAXn9:22
 a=VwQbUJbxAAAA:8 a=EZN1DsTIAR6ZSkQplvIA:9 a=QEXdDO2ut3YA:10
 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-GUID: kBHU8ogLAXTvvJHU2SSSHdKrK-LRHpSw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_02,2026-07-29_01,2025-10-01_01

On Wed, Jul 29, 2026 at 4:34=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> Hi all,
>
> After in the final build, today's linux-next build (arm64 allyesconfig)
> failed like this:
>
> ld: drivers/net/wireless/mediatek/mt76/usb_trace.o:(.bss+0x40): multiple =
definition of `__bpf_trace_btf_ids_dev_reg_evt'; drivers/net/wireless/media=
tek/mt76/trace.o:(.bss+0x80): first defined here
> ld: drivers/media/platform/nvidia/tegra-vde/vde.o:(.bss+0x180): multiple =
definition of `__bpf_trace_btf_ids_register_access'; drivers/gpu/drm/tegra/=
trace.o:(.bss+0x0): first defined here
>
> Caused by commit
>
>    eadc0725ab8d3 (tracing: Expose tracepoint BTF ids via tracefs)
>
> which I have reverted for today.

Thanks, I'll investigate.
