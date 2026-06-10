Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931D335E950
	for <linux-next@vger.kernel.org>; Wed, 10 Jun 2026 12:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781096309; cv=none; b=pABesdGl6wJanZ7oBzZX/D2+S7d3zFSkP8tfWevegm/Qj1HhvgpOLdPIOvtHz/LOtqtyIaNy0ExYQfbYvB0NMBbOENu4c0rDAWKcJxh8Hu9FiiKXw3d+/gKit7CKLBG+R3CIzSemcPV7VWqGosZ8mUUZbk0qN0oZlynxEqAbq0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781096309; c=relaxed/simple;
	bh=Nfz2yj3MSm3buLcptZAFjVGuJmga0zSh5Po+PBh0HIg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CRli2aU+bmo7J3GCTX/wv1Uv1JzS3yA6v8bSdsdRwb3MdK3oh0HIXUCXL6ZOpxOCzYIeDrcwKYYv7z6M21XxfPmvSQ69Tb/8KicrbmANMw43KArH7t6F6DJLVG7F486qHy5dDrU+M+btz9VuSY0OblwVMi/7E2yh6A5FaVQq/1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UFxrBN88; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UFxrBN88"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8422a92b6d6so3546345b3a.1
        for <linux-next@vger.kernel.org>; Wed, 10 Jun 2026 05:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781096308; x=1781701108; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=vRH1y6KyvJbGmzlZx8by88ize35seT2DmaAeYYj5V80=;
        b=UFxrBN88taC7zsUFLwBTDZX9Slk3Mul5VGw/j8wrELO2B9y863F2b3+KtE7GJmJ9Kk
         xWmMskIMMz96/OAhLUT4Cyc2ErHC7y0xigu9EqaA63Mo85DOpGChAFa/QyhVcp7HcafI
         gEgqRSQA5rtuyl8zcbFJQr4QwV+M9Dgthh4mUoSxNh0zIw7pt3osTswRgL3eGzGXhR4/
         +4FiOae/76kZSCp7i7X/aLFy/htoEEtL9yPg5tuKIs5TF8MMFmPN9exc/sFgI/+fc2Vy
         vdVpey1RlIr9vtKMOzIgKdpFJ+SZMVFXK+0WBFTMFZt7VTB2prBvjTyNN1p5ycNzRJJX
         s98g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781096308; x=1781701108;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vRH1y6KyvJbGmzlZx8by88ize35seT2DmaAeYYj5V80=;
        b=Pqjf3qq/QguIPZZEzJv+Sz7VIgBC4X+iG3CqC2wNsUELNLicE4DpUqmpJOCGzy9y6I
         lV9aS5cAE+YZGAUB0+lJjIsENVnUHm5jSzkiKFW6henEH6bHSM3CQI9DGylwV+vLS33o
         ZdIQKZwKcxA9V4iRThZmGmEElsHryI6eKbLwXHt1Fhvb9NQAt33RKjFXMIRJzLGi+4AI
         4cDIq35GnEaQLzuKY3CHqNCioVxV8V9iw8Mn6Jg5ZBHpQ58KISi9VRgj95//9bU9RngO
         vMq+I3gu/MfBTsBGXXfVx/nQAEWIZlGUjHogv9zP3PYK3nqgi4jK6UQkauOs6pa3WjxI
         zkqg==
X-Forwarded-Encrypted: i=1; AFNElJ8Kg789Vj6dv/qdeCV+//kNKJfF1P0jwGXua+vkVu0hy2zavPCqEaiZFWNB7XXISgRzBm0C9eSaUsqZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwatfX4pIZVrmVzvABilmnD8WCztnijKDNcEwvUEK7n7wC2NW2g
	fnLmuA7MIORTQdjcv9+d2sCUH6KBJI3M8Qtet4aEkduo6Pr+fUXp8CtAJYSjom+d
X-Gm-Gg: Acq92OHkPJRKsRPsomd6HAcHjhN1jfhR30POqdTsN0v7EIHKvXbNfNC0ih9O2k3Cx8q
	ovOn6PuTCIb0zZJ41Up0SEN758VomU1eeWUMV59h7NTM1ZDDbYMtjSr9FgtgptVpdDkDAcXbi4m
	Qh87pHI9gJmTiyx+PKkaoRQFQ1x/4IAIqVzHWAf1UXi4caGSRi/2TYfsJWhgJu/Cv+aZIXLKk/h
	c0jXO+ddI9KDJ155fR7LExLygEv0hlfx+zFd2m+iIpSKCeP1EV1xFg81OW9VvgOv2rGyfkMZxoU
	ew9VZRfMOl2/qY6kIM4TqHfqhNDvf8qEi8nIxTYbnb6wRh7fqV1xEqaiMffSDw+zZUn0x6wuOk3
	XSdWeMmWatBR2CBIJgDgU4QuttdLGWNbwu/y/jepZelNv+RFIDfDT4tHTqkJjfdVtw1kK2PFHQ6
	kCtC3/4XGvmQdQpWBaTjBFRN8KF5+ItyA0Z3DfQXPhu/no1q7m99DVM25cmIvJH8DEdYTdkDmwB
	GbFePXF/ET/HuAZDppt1Q==
X-Received: by 2002:a05:6a00:3ccd:b0:829:b08f:7353 with SMTP id d2e1a72fcca58-842b66a21ecmr19172859b3a.7.1781096307795;
        Wed, 10 Jun 2026 05:58:27 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428221c3e4sm25512542b3a.5.2026.06.10.05.58.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 05:58:27 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <0ac3d760-4b39-490d-b8aa-42fcc7b747a4@roeck-us.net>
Date: Wed, 10 Jun 2026 05:58:26 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the hwmon-staging tree
To: Mark Brown <broonie@kernel.org>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?=
 <linux@weissschuh.net>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <ailOQWxDxXkd1dKK@sirena.co.uk>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <ailOQWxDxXkd1dKK@sirena.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/10/26 04:45, Mark Brown wrote:
> Hi all,
> 
> After merging the hwmon-staging tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> /tmp/next/build/drivers/hwmon/cros_ec_hwmon.c:173:13: error: unused function 'cros_ec_hwmon_millicelsius_to_kelvin' [-Werror,-Wunused-function]
>    173 | static long cros_ec_hwmon_millicelsius_to_kelvin(long t)
>        |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Caused by commit
> 
>     4a1140942f92a3 (hwmon: (cros_ec) Implement custom kelvin to celsius conversions)
> 
> I have used the tree from next-2060609 instead.

Thomas,

All patches of a series need to be compileable. Only introduce new static
functions where actually used.

I had to drop the series.

Guenter

