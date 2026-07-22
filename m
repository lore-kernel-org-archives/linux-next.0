Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1186E48097E
	for <linux-next@vger.kernel.org>; Wed, 22 Jul 2026 08:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784709874; cv=none; b=LIonlMLidq9EZC9a7odBp4AM+y3sQXXVBm0wffD4LClsJzb2U+NcGQO2ON56Q26v9Ht3BPDNHJlDLdPslBcrFZTXYRutxgdTCYDRM8n6VuY5VjWpK2lV5L4KFQ8egAkVjWURNl0l/Sf8hvOeY0HexgEqUXUzGBKpLntDUgoK9jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784709874; c=relaxed/simple;
	bh=OmMDRLZkj2aNhVXwQInABlFcyZsqC/YE6Mj6uTLeh1I=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=PRB6FXBZ3KYU5bgY1qQ91MNBKZdH47pjZZSv/Nx70XyI+YAV1gHoolqV/Quw+Yg7YS1+WUr6nxxn30Bw8P3XEIvDbw2L76zUmp5KizsasdSPr3qq0uPh/UgemvC8VxaP5d6HPlKo9eHnRgmAXAJSTYdTnXtzx/pCEJV0gZYgpPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aCKAWsyO; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aCKAWsyO"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4954d383e64so27955925e9.1
        for <linux-next@vger.kernel.org>; Wed, 22 Jul 2026 01:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784709866; x=1785314666; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KZbMg7OWzH2Pfs+sNXHx2gTTU8EfG65c8RR7+jDMp2Q=;
        b=aCKAWsyOigrd1Wkb1KZJEjgt/hizjlRDualnOg7kn6nDIifJIwq/BCldRT4KAVRfYh
         fxoP+I4VZHHAS9nTWTz/ZKCFeDF2pnSqEk5zjsaMgKX0XCMt1EDKZFj8gvJNUQHs2Fsy
         glFw5CG3aHoA+pUVBb/4skgRXMQQdphGQJyVo/GFgh/iRebDkxD9A6Ujf4HRdtxyubnU
         y1B07tZVl6JTe6Ah1I983cVS3i1vPgVp4zyEXOG6Ng/+CgrQ3qCpoX4p9kMSUizOa8Uz
         XZS8EZP9iCNqBm6GkT/j6JKAkarLf0sxKNrkx9keWWXJge16JyZ7OUv/AljrhduJrxOO
         kVmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784709866; x=1785314666;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KZbMg7OWzH2Pfs+sNXHx2gTTU8EfG65c8RR7+jDMp2Q=;
        b=BA1jRJeu56f/weWd3m12uHXL0ZlECmH3GRumgQPYnMCISwK62SBZZg50eD1VMcSH5v
         mNByKGddxt3bj260+lDxQ4ZjzSi4HXuvnRqsV5rs9NaG4h966nptm583TZ5d2aHUazK5
         cQ2iaz6dgT8b5JqAb1beiuGDjnELVzDair2kb3ZoIicBKD5rTpqoL34yOXtYps/xqVzi
         CPm0jhWbPjqGBJLBwCx1NaCMNv5sLx9hO2usrgUAHVradngtaZC0sj05FNi7q6qSGaBP
         u6YGSqGk5VM7745Cg+L3Dce2fucvGuBKLm97ktLLBefTQt8Txwsb7hMlf24AZXcG/MRQ
         aHRg==
X-Forwarded-Encrypted: i=1; AHgh+Rpffso1Qx06yrz91Kt5BBu7Ck3kp/ptsZjqX71u+ACmtrPKgqBCLycSMll8yTib/PxJ+unh9jOK8ImT@vger.kernel.org
X-Gm-Message-State: AOJu0YwnvforI2Tz6XgXjaazFl3wDUwEo+3fDxZCDVQZLIkVEZ8I2jNM
	yVrDMBhN7ziEeTLW/aLu6+Rf+/rmnh7f+uJSsRoPCe3fWrm9iwhwGugQ4/F7BbbHPaU=
X-Gm-Gg: AR+sD13+Pfo539p7jIymPhG6rCgiV3Pzl1ymptDboG5flQ5cpYTbLam2YgDUgdKQQmu
	50BkWPl3niy50ufwAKPAG8fAU0ncW9EmjVKPkEICXrlMYxZpQPCVqa6FJj2pBdYSg+Ffz3rdYR1
	BCIhpv8vbTvZ78e1gZvWzTxHuVVvJg1KNXn6VZ3wcmLsR2BlYtuA+f0uRQu3h2qfEZW7SOKuGQF
	YJUmBb6RTk8CWhFi34vCwhuQDJmbwIaYxPEOXewCUvmJALG3BS0Ke8VTqF8OuT5RDLtW/to2awq
	QvFIcxPdfFI4PDHmqjperF6neuEhDwsGHeAlFZCX5h5KYM7ZV7iDtCm7jTj0FD2G7pFafZyhrLn
	pAFhHF03+q/CSeZKf3LHM+gaqoZ9R1vidXXHZjyjRSBiGGV1Q//gF9kZ0fTrZDjB7zMlSYwdiQ4
	jGEtpFLkhjJpdC3CufM1iSyMLh+k3KgDdGgiZZvP3HjWxlrBt9ZDYB5bM=
X-Received: by 2002:a05:600c:4687:b0:495:4df2:7412 with SMTP id 5b1f17b1804b1-4954df27450mr222563655e9.32.1784709866272;
        Wed, 22 Jul 2026 01:44:26 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:51c:217c:79fe:1b0c? ([2a01:e0a:106d:1080:51c:217c:79fe:1b0c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495653731b2sm130709575e9.4.2026.07.22.01.44.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 01:44:25 -0700 (PDT)
Message-ID: <64ed7a3e-fc9e-4b42-ba41-7928a7117221@linaro.org>
Date: Wed, 22 Jul 2026 10:44:25 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
To: Mark Brown <broonie@kernel.org>, Simona Vetter <simona.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>, Maxime Ripard <mripard@kernel.org>,
 Albert Esteve <aesteve@redhat.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <al987knJq4h66FcJ@sirena.org.uk>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <al987knJq4h66FcJ@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Mark,

On 7/21/26 16:06, Mark Brown wrote:
> Hi all,
> 
> After merging the drm-misc tree, today's linux-next build
> (arm64 defconfig) failed like this:
> 
> /tmp/next/build/drivers/gpu/drm/imx/dcss/dcss-kms.c: In function 'dcss_kms_bridge_connector_init':
> /tmp/next/build/drivers/gpu/drm/imx/dcss/dcss-kms.c:81:17: error: implicit declaration of function 'drm_panel_put'; did you mean 'drm_dev_put'? [-Wimplicit-function-declaration]
>     81 |                 drm_panel_put(panel);
>        |                 ^~~~~~~~~~~~~
>        |                 drm_dev_put
> make[8]: *** [/tmp/next/build/scripts/Makefile.build:289: drivers/gpu/drm/imx/dcss/dcss-kms.o] Error 1
> make[7]: *** [/tmp/next/build/scripts/Makefile.build:549: drivers/gpu/drm/imx/dcss] Error 2
> make[6]: *** [/tmp/next/build/scripts/Makefile.build:549: drivers/gpu/drm/imx] Error 2
> make[6]: *** Waiting for unfinished jobs....
> /tmp/next/build/drivers/gpu/drm/mxsfb/mxsfb_drv.c: In function 'mxsfb_attach_bridge':
> /tmp/next/build/drivers/gpu/drm/mxsfb/mxsfb_drv.c:130:17: error: implicit declaration of function 'drm_panel_put'; did you mean 'drm_dev_put'? [-Wimplicit-function-declaration]
>    130 |                 drm_panel_put(panel);
>        |                 ^~~~~~~~~~~~~
>        |                 drm_dev_put
> 
> Caused by commit
> 
>     b71a623598d31 (drm/panel: of_drm_find_panel() return a counted reference)
>     
> I have used the version from next-20260720 instead.

Seems the patch hasn't been properly build tested, I'll send a fix today.

Thanks,
Neil
