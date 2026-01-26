Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A289733B96A
	for <linux-next@vger.kernel.org>; Mon, 26 Jan 2026 15:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769440814; cv=none; b=udwKDbIOm2/Cx+3QtTOTaObDe/A1E43yAhwH6ZuZIzNcpgP7IRJli5Uh8x7ry/N9LlzUMEqaouttPO4hDij8aYzBM9oPT6C5P7atwJCs3+ZVbK9tCAXJMJSe5V4SckA07+5jfHEvuf+Eh9/6cxlIN97sDMQiLM1K7UADfZfG24w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769440814; c=relaxed/simple;
	bh=i0Z8aInK1DBg0UpuHNInNo0aGSAk3uGsUc+Y82Ww7GE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bF73tpAIvfJD+bYIAftroQz5lmYjbZbNewFkxZfc5R/zAD2+QHuvTbMcle8wjuXwzXx+0CIWywcMlKcoBMlvkwMkM2dDQ8a8YtynZ6HmeTGEffRojnA9Rih3szaBiBmo6KU7IgJ3Pb7fjYis3sxyzE3wOO0aUAfiNgV4D+NA7Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VfYJdcEx; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VfYJdcEx"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4801d1daf53so50766635e9.2
        for <linux-next@vger.kernel.org>; Mon, 26 Jan 2026 07:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769440811; x=1770045611; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YQ6xHf85Yzmzu+IjT+JoUMZR5+Yu4MjuJZK1iWpROi4=;
        b=VfYJdcExU7VCUJ6VnD3JvDWcIs/AnmDGXwzSFwz7gTAMZ9lgktogeNR2CG08hCVgs+
         RkKetTR3LUdnSHrOX67j0lx7Xc4ncKjJG912grk0EVlWDDnLOnGx2ViBlf8PNvfBQXVX
         ziosUQN8ZWDekwmKHc+eeh0Z+IcUnxRU35VyqXA/nZxhk3Vk52ddFiKIPTsxmwugWQSc
         tlKuLhDyfv67JtNgBMOwbnqNdEAah8q+PrSXXX8ZSLkcwLzhQghlX0VVWL+rQrOcImft
         T2WtvlS/+ljY1eFuvWLFqLzSyaX/gIbEmY4UIQv0cke6/+wY4h+k7x1qyfJBd6P13vos
         IlAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769440811; x=1770045611;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YQ6xHf85Yzmzu+IjT+JoUMZR5+Yu4MjuJZK1iWpROi4=;
        b=gxqsi966Jo55UV/G8ojCkFjDs4Q4guASL7ALe1MuIqJuZUOatnzssVfYIBvAtZpvBm
         RbqkWPxwxcxzlqDvOBfjWaHi78Nj4+G1oVx7/mIqdv6t6CRNt3IlvmZOtLnI12HaXfbO
         fA3+VIrZUWfvRm/PFZ10RgDgUV/gWy7WJejPguhmt8VO4PNU/tga2m1OCUPo7B8Y3CfH
         NhhkpvUo5SeHOFe/q2+YJFHwY/L0m9x5zkd0qlrUmakw+LllwHMtDcJGOHGG2IVLNEFi
         PZjIFW70pIx5EjJCowU3KShIKNI1IyRkiOyIjdluH8U9sapGoA8S0Fkojia5v3ge0M3f
         o0jg==
X-Forwarded-Encrypted: i=1; AJvYcCVveOo12x/3N8u0qD+Gnx4/0oEnsxM0EHJOIOAVzcyjprwtyh+6y8UV92tLVdYEUu+o+zQk4f637htI@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6K9yMfgDm+ShAKepyVCkbJNmifi285jmdcXGkCeCBmLfAkvyX
	hkiVUZMmkncnkeOp1pUO1XzSJz7yUJn1JFNYE7d+1C6DZddTBOmOLTuCDQwMCEC2+CU=
X-Gm-Gg: AZuq6aLFRoVr+hiOWBSodU+NIrpZOFeLZQY9MOZu0G6k4kIX1vXmjH2jq8kA55KMhhc
	/xWcvYDEnoe2lwlf89KD02r3XFn/UPD0ne73mcry1GkVNdrj2Pn21AFBOahQS1oDJqVbzDWYTon
	NMa0c/NhdGVZ9maGNEtvoaNvUN47PVIUL39nJs/yXaLeF+Hb2863Vkmb+5gFNcbEBl8UsRYozA7
	nry/4ZsiXCz9TOmaGShh4C81LJt+K/C2tPm0BxUTkggVkPK21FgDajphNgD+EmGRsE7ItHK/i9p
	Nn9vs3EzNynxfZAbnsPNb7wUgaTS9xUfR0ZQKDYY9KAOW4LOg6x30rn0BJRl5KWbD4prXabZ4CA
	wjus7t57FgFWdhtUCu74MNGbtzS5X1fvE+fiBlhx42sAw2HhNQsxLNOomuYjvNu58pyRrqS4KYI
	qXAKwIiDGJzskxPWTK
X-Received: by 2002:a05:600c:821a:b0:480:1d0b:2d32 with SMTP id 5b1f17b1804b1-4805ce40046mr85419115e9.12.1769440810901;
        Mon, 26 Jan 2026 07:20:10 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-480470287c3sm373285315e9.3.2026.01.26.07.20.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 07:20:10 -0800 (PST)
Message-ID: <da30690e-c20c-40b1-9fa7-14d221a7914e@linaro.org>
Date: Mon, 26 Jan 2026 15:20:09 +0000
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the perf tree
To: Mark Brown <broonie@kernel.org>,
 Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>,
 Namhyung Kim <namhyung@kernel.org>
Cc: Leo Yan <leo.yan@arm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <aW5XSAo88_LBPSYI@sirena.org.uk>
 <27e9bfa1-4fc7-4e94-9cd3-3e661588563d@sirena.org.uk>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <27e9bfa1-4fc7-4e94-9cd3-3e661588563d@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 26/01/2026 3:13 pm, Mark Brown wrote:
> On Mon, Jan 19, 2026 at 04:09:44PM +0000, Mark Brown wrote:
>> Hi all,
>>
>> After merging the perf tree, today's linux-next build (arm64 perf)
>> failed like this:
>>
>> Exception processing /tmp/next/perf/pmu-events/arch/arm64/arm/cortex-a510/pmu.json
>> Traceback (most recent call last):
> 
> ...
> 
>> Caused by commit
>>
>>     a66f6242fbf52 (perf vendor events arm64: Remove uncountable events)
>>
>> I have used the perf tree from 20260116 instead.
> 
> This issue is still present in today's -next.

Hi Arnaldo,

Did you see [1]? If it looks ok you should be able to apply it.

[1]: 
https://lore.kernel.org/linux-perf-users/20260121-james-perf-json-delete-fix-v2-1-2e10f895bfd7@linaro.org/

Thanks
James

