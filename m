Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795801737;
	b=s/cp8CiNlhFJbKPtwpl9WDpdcRfrJWjtFrcf9eHoFdNVvX1NQc+SFalGzHGClmDPvYZ4
	 2SdjibM4/XRuYKIxFwfMxYWSNr+5+FogyzEXl+ei/4hE8Y4vCU8VSGzIyYBWEw4xGzPV5
	 rLjIe9KBQhc1VorEmz4DBlkxFdzNdYS/jG609tSpvEuSRFbxFDCtyBSEf/0nn0k0zhppN
	 X4BMrE08z4BhnG/rEALz49P5Lb7ayTBHML/ZmoBOX0vBv3DTvhpjDAOTZbkx5vBBlTREU
	 KdudtyTDpJFe4oD/DL0sPEFgH2B+d4+0iergklRrWLbDgdxrPeQYCTsPyM4m5gMdzfQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795801737;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=oCGsqbc4EUn+9zhrL6hfaY/khq6281uIeRFRcBB+k8c=;
	b=UmlWCkpx+DgG3RiTycQSzDYRdmNIgwm7gmHywFjxzLkiytw74ZzYkrGfmBa3MR1CN/H9
	 Ks2sPWSFkxdcAfEtQc9Bb7GRJRMjnsa025XFEejIoFpxfwtoYWk/RcHW4Bi4Yh7ShPY4P
	 7BY7huxtm1GIDvaZzRck0slzIdnZcpCHC+qfDGw2VWn+7EWFcapXm94udk8ybJxLB9HFj
	 62ltov12R2AttQ/GNn/6Pm5O771BJTU5h/LB/gW4xcs13VpnK/ezViCmMUUNjnsp2FL/5
	 pxagEO7JA0RGzqnSrxvoZkNube9+uz+5nTT0813y/l/9s1U9CmzIErrXuMNLmY8RLUQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ObDmtb8M;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F22F606A31C
	for <linux-next@vger.kernel.org>; Fri, 27 Nov 2026 17:48:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F22F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ObDmtb8M
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b8627e0eb2so10769502a12.2
        for <linux-next@vger.kernel.org>; Fri, 27 Nov 2026 09:48:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795801736; cv=none;
        d=google.com; s=arc-20260327;
        b=LuiFTwojfjo/+1+8K3x3rnCIpI9uDGaqSBQ7NsALAyA0aWgQAraAeZ9vnuFKmrS9Kw
         s471ohEqdjknnvY0p0x3H5pb5bIySfHY1W89GorflHvsqL+iGLoGj3vzwteGfSajC/bE
         bFQFePQ5Tr63ajRss2g+R3VOyPovC/mgQgkuExOvA67t5zuL7dPB7FFagpOOm3XIe7sq
         TcPbN9rPFl0ug3u7fJWwBJRIEslL7fuaVhpWwl7JV2lTgPMEK/EGDCMJXmNSqW4r33cz
         mkTaffR4SVyTClq7ztmGzwCADcSgba6qZ5HtH5sZwCEElIpSVF+gWusjoeZqUPccvhq9
         ZO5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=oCGsqbc4EUn+9zhrL6hfaY/khq6281uIeRFRcBB+k8c=;
        fh=T7hFz1hiuoey2EALzxOhUfaCWnSEczsp+94A4XEdsN0=;
        b=dJKK9B2kTj+BWHIOPdZvG/euVqbRupSLfBdbgK+P+jdl4gRQ7glW7aIldWg/Q0rgaT
         Xxlhkr0dJVuVdb6V4D0qGN6+x80uQC/IGiBupjOwEx0sWJER/GDzoE+ozO3ATtp1H4PD
         WEIw75Iz2gF/wNYTV5qQ5heaIHCWN1fhkT5I7qWSLT3nvXk0Rl0k+o09MA0aQ7o2xBuW
         F3Cuczcl6mYVQNzA2xGOCQO1vi00oaIKXIFUg5bLG1yg6wECipupHXmgLlUb4wjWxXxa
         wXkZI6AYDm2ra0SZ80aSJHDwfhLcOEHeia7Agl3rrmmLThkqnX/W0LkFOnCD+riulnti
         MH9g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795801736; x=1796406536; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oCGsqbc4EUn+9zhrL6hfaY/khq6281uIeRFRcBB+k8c=;
        b=ObDmtb8Maaa/F+8cgBo86ZsCoRwZqfP39NuG8RyCwLe6mazescjF2A6IaDpQlWm/d2
         jpJUfS/fpwab4Q26zLeuPU4iNn2MJFwYC93XtsZEKICB+TSh4O3S/jZ6plvfOFHy+wVa
         HrKQ1Rbylnv9txQpDp8x6P6Sy1DOv0mtmcvPdSYPRBUrYRLGGN/aN1yuu30CzqcIIQIT
         nqAQSBIOMtcd63E8yYeQLn0tK8kv2GQu1csqlVtAxLxZTy9qqpSNURYRTECxQE6lCMSU
         9SH9u52Kw6A4gJTMjWRGXyquCRUZZBorUtODjIOXKAdcw3vZ/M/cVq+V1p1cRejcDGLT
         kKNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795801736; x=1796406536;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=oCGsqbc4EUn+9zhrL6hfaY/khq6281uIeRFRcBB+k8c=;
        b=rhAJwmtqOMAdYVm77RMJHPj8QsoY7MK2FExSogPOIHeL3Zz/EbEqT8ZkOngoj3eppg
         bw+xb5eJtPorYemGaepwcI+Gm7FBjAosmICgdBdtV5jN8IFpAPVkR9yhxTM1dA6ZhAzZ
         swZGBpRK/qnzZ7mjGy4ytLbIZo0iRQaOitjzYRLcbn/a1hP6MT1jGfWzTXOCBwkpIcF7
         W70/IeyxQZOoS3xWNedaM31+6LYro56hp4ArpaZeTQSluhN1cTAAY0bf89JKmdN8oDMq
         f2GV327nf+6yvhjZjHgitpdno+xtm7bI8wxNGYXdxX9dPqcQWhA7W9FRSqyerVt74/jT
         cIBQ==
X-Gm-Message-State: APuU4Z86Qc4/ZCkRrQwS1eiA+dzrBT42lmo6HSFVKJdVoIsmSKyV+FBA
	RQMixJGvbse/4Axp6rODQfdhCAwe6N01zlqJc5Hx6SgoEbf4YgjV1OOXdiMsHJhMYY8AJ+o2+0m
	8eDiwktWqwPIeCuvFJB35gtx2QFPpvrE=
X-Gm-Gg: AZFdTZcXshcnDHnkggPBSRgsXNJSmnU2hwB4vOlpHDZsacceLL/hIWHc6ad7eUBureL
	sBbtw5diqcKbZpf8B1U1WEusDbTA3NGw+m0QM/f0++HZPoJSx4l/o3Ths7w/HTG+Cfl3aTWggsD
	nxPIDRwy6Im7kK9cFiks3NTDL4H9AEtZ7Mhw4//PkB5xH0qDR3hUmqzvBsPhob+7WwepImO8mzE
	JOaowiNGhOLnZJeeMydPy1lvWcHEa1b/Db/hNZqhxSwxXoT3lxetq+kGENIwejyr8SYaOZyVzaj
	m2x3aK7+1Pk3js7AdOoVbaqNCrtQC8ysOTygLQRO7JwONbPlJ6+ZSmAlaW0kHkgnr92egz714T0
	zOpYWJqaa5kEAbLLef/ZKl3ChFVpfS5MTJnxKtYoAeBsnHiu11OX3MEyEaUeWnAV+/lS/h17p7e
	cK9EDi+YNyf3BelEBcfr76Lg==
X-Received: by 2002:a05:6402:1603:b0:6b9:f00b:6553 with SMTP id
 4fb4d7f45d1cf-6ba37d6289cmr14755206a12.11.1795801735722; Fri, 27 Nov 2026
 09:48:55 -0800 (PST)
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Magnus Lindholm <linmag7@gmail.com>
Date: Fri, 27 Nov 2026 18:48:44 +0100
X-Gm-Features: Aa3M54qQ2GGUUN16sYeD7afsR8nQhRTqXL9dSmuwZIvdn_esqKqPu1p9DPxFS-s
Message-ID: <CA+=Fv5TFkNnRrYRfJUrnABEqyWtLrcGFgqHgWZP9yS05eM=P0A@mail.gmail.com>
Subject: linux-next: rebase of alpha-lindholm for-next
To: Mark Brown <broonie@kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Jakub Kicinski <kuba@kernel.org>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Matt Turner <mattst88@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Mark,

I'll update alpha-lindholm, for-next branch, with a non-fast-forward push,
rebasing the Alpha queue onto Marek's stable
dma_alloc_coherent_node_api tag at 31f7e12d621b.

This follows coordination with Marek, Jakub and Uwe. The Alpha CMA
commit now uses the new DMA API, so no separate linux-next fixup
for that caller should be needed. The CMA series is posted as v4.

https://lore.kernel.org/linux-alpha/20261127165626.1352471-1-linmag7@gmail.com/

The new for-next tip will be:
995ba4c89dd73910a175208c98e201d5c55c3589

Thanks,
Magnus
