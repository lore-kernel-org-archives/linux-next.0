Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECEDC3806DA
	for <linux-next@vger.kernel.org>; Wed,  8 Apr 2026 12:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775651312; cv=none; b=nKQFXYd/bNZXpbIw1R3MGaPvA934ZENWezrLX3FISXRGSTHnsTu8JfCIPe9ZdxUL0/erjDEzN+FNK3aZX+iNVK2wR2lv4Pq4dz4Aq07pgCGirpIX18oxSq1IAWHkorcl4GvKrCVu1/DwSyoV07RJ+cqhDy9s941zPO3d7hSFhbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775651312; c=relaxed/simple;
	bh=7wQvQnZ1RCG9fLwh6vJjFXGtoVNr/Imk7LzuErmTzJU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=PBCAEGWu3O4A24/Un6uiXpj76Ln/YwNOhKZsGtctf8KyyjW0+q6NzK/NEB+VgtaNxjxS7G6AKaQDhoewUMKtnks7JRjTKzvS6kH1stOoON36VnSk/b3puCQa1AVKmtr2YJRJ0qS11M+tB16O03Hi3TmsebZ16skFytH3S0GW7LM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AYEoi+Iw; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AYEoi+Iw"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-482f454be5bso10144655e9.0
        for <linux-next@vger.kernel.org>; Wed, 08 Apr 2026 05:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775651309; x=1776256109; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XZtxaIIvVbKBw9zJhcvQDlid9NMdEub+7MpQvJy6g0Q=;
        b=AYEoi+IwY3Zg/Vpu/J/RyRzmuRhoAnK+BHr8UnP4ZEaxk8kMBKa2vMobYdP95bZQx7
         sz9G5EBWHiCsUAlMjTfMXdwOZ62RcS2jyarj61e9/yGw0cYeFsWPE5feS/HIpJ55Txlh
         4HbJJnmli5AJ44zzl10PO1Z369QQs7MprigK/+JixDqrf+NG0oTAtx5uC9LuipsDCyeC
         gpNJ8hJ+sbn7+MlnR1fdLzAjzLS2mpGclV+RW7Cha1i7vZS82VDN3nQT/+luWE9uJ9E7
         C88TzFOd55itAztEGbRhTUYxA1PARWK7XXmUQHflwTo/09GRGf4iLMhVmuFEqAbqhVd6
         uTog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775651309; x=1776256109;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XZtxaIIvVbKBw9zJhcvQDlid9NMdEub+7MpQvJy6g0Q=;
        b=AbFZzJnFo2kqWVTNSxtDICA3Kk3CR3jFrsK86PlHgCl91GLDhpW+1hPDjgYRo/H6em
         FKsJyv9hY2eM/kHJvCZMg3Wrdaz9gn7qdj8mAkaRA8VEDQ782LaK0jIv1c8YDDEAUnM7
         Q7y9ENpGBLmXiyKamnuljyfddsFZJEmbwBmhG5RyskDZGWIVMLMiTWtE1b7vfTea06xv
         jGRKubngj3a2RU84eRliPSk1WoW9nkFQOQCWaWyfxR39+y71sky5bwKcrMEC5/vgg9Vt
         SPvud7wthJ5hdwFh2D2WvdtDDMJu9OIyOD0AvvQdL39I933P8fvWRqYYBnj+JaJWQsOe
         zJxA==
X-Forwarded-Encrypted: i=1; AJvYcCV6a8P9dWWXqMlEmUaDsNKOmRB7dKRSkcurL8QKydAVrybD+Lp77VdsO8V7z1VZovOyXmI/9bWWHe6R@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz1pvHKEBPUzV76t7L0lQVhakZt7i7NWU3u573EHbN8vm5crhQ
	aS1KAeCKpcP1mEYLiLkLYJHJMZJZqh6nwV/fYA+797cmItv3qENukiHcxr9DbvGcdKQ=
X-Gm-Gg: AeBDievtOGq/2OQuxhHEkRi4Jls7+sucO5xB8G/pNl0MNjIjTJM3Wqo/pBDdcVYrMQr
	UUb1Tf+PldPyQ5Q5XEzKXT1m2J9AvmgIeE0l+9TvInnzsoRCLWH8i2xB+vwOVDE6LqFUbXhvgLm
	FVzozck6jdbLCRiPYi1RzrTLRHffTAESZH94d5MD4fc7hUYxH1zyU4NBne23pOdCo4LaRiVCAj/
	z3+6a4OfW9GYopznz8UQCfKjgUBvm4xJxByGpHdFJuBK4yCEsfMDMKyP6Q++hVlgej0cqrGjKnM
	SlPjwbwmiqMbD9a6rWa9nyR5yPdetos0oRW9DJXQuRp1d2zog15V/ZX+CmQKJ8A1m4N+C3x+iQ6
	c9iV7VAxfo0jW9/BMFbwve/XdVSjtDIiDmwiJBuPhc8X7ryBHN24DfyZBTXqUL5dyTtfyMEl9fL
	BXOwCWpQiNoEtM7hgGpRnNQQCHsAy/4rRellGNHtdSzGE/hmJL2lu/92zJYoGAdsC8b1KLqdiRo
	Tua2Dw=
X-Received: by 2002:a5d:5d0a:0:b0:43c:fac5:d382 with SMTP id ffacd0b85a97d-43d2118dc50mr36554056f8f.12.1775651309172;
        Wed, 08 Apr 2026 05:28:29 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:d6d6:c397:9229:b35c? ([2a01:e0a:106d:1080:d6d6:c397:9229:b35c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2c50a7sm57755473f8f.15.2026.04.08.05.28.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 05:28:28 -0700 (PDT)
Message-ID: <60ef34d5-05e8-4469-b623-85cedf728f18@linaro.org>
Date: Wed, 8 Apr 2026 14:28:28 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: Missing signoff in the amlogic tree
To: Mark Brown <broonie@kernel.org>, Kevin Hilman <khilman@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
References: <adYrYHY4Vn4JbEt4@sirena.org.uk>
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
In-Reply-To: <adYrYHY4Vn4JbEt4@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 4/8/26 12:18, Mark Brown wrote:
> Commit
> 
>    98da3e91a6157 ("arm64: dts: amlogic: t7: Fix missing required reset property")
> 
> is missing a Signed-off-by from its committer


Fixed

Thanks,
Neil

