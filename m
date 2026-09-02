Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E694547ECF2
	for <linux-next@vger.kernel.org>; Wed,  2 Sep 2026 12:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788352587; cv=pass; b=l9hWRuNy4kGiFRkaZl1MauApsNwqmF4tajgeXhZGY0w/Ht/RsnhjZmv0TwZHlAhD+GOs+8BxcyfdYuT2zPXf/aLTt87cvtAA/QytnZhWsgACECcfX0NE1rTDCTIU7OIQyV0F7yTLJM+HjA2Jk9lsOabH7JbmIyCdtDlvSqxp2vE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788352587; c=relaxed/simple;
	bh=l4Av1tnk1DJx0lSAkYYujTq4Pm3LS+q9DUKaEcW0p0k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J+qmYNBm4YRDNDfiSzM8KDl+SvQ5nTr5mlTQT8ViADFhaw91ELhPITXAAFeJi3euVMfTwdt7frK1Aj5M2nZdyRjYVs6EbRU+D0xJRm7e+lXwxByJQ30OEq0z4bmRI3WWFz/Ah08PWFXSzLdhxLnMdm8CQ8f5c2rpj3Jl5tbUGK4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=icBZMDs6; arc=pass smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="icBZMDs6"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so898227a91.0
        for <linux-next@vger.kernel.org>; Wed, 02 Sep 2026 05:36:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788352585; cv=none;
        d=google.com; s=arc-20260327;
        b=q1amTfrAMz9j2DE7/blNKSfdCNzCszEJr88P21CtKV5j6C4XFREAeghFIIJ+ZeKjMy
         8/jnVVUrnw6iNKYiRopH1cudIsCEm85OShrLK0906uHLT5MpR2ZUCx6IDIzmj4Cnqba8
         /pritNvoFJICG/mtNHhCyS4/+BJpgKomPDPoRX2mv3xCI4aHvO8Rqf8EAq80u1tZs5ZM
         oDyfIIP6MYBYQfn6aiBZDtB1905cu4kpEI42hkdmaO59JQv4WiKICnnmPqrCTowlw1eL
         /AJlwKSbqDJYE75P+HIC67jWq6rUr4RwWZ4i8cbjmLhxrx/WYyxWtppO5XoUlDnnPn+S
         6lbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=AKF+zPcaGnIjcBYSYaoawLCl82XfK40W4BF+GG+bvXE=;
        fh=N5bBprHIWIkEp56pMl2rVelIPbKQnDAqjll2PUCNQtE=;
        b=p2J7UAo4wyAKoZdZzzLDXR500E1+Ydi8Gfsx4B4503NmPP4IWfe72rE+d1hHBCX2Lx
         +1BE/JZ6texQc1Ovnh9d61r9fQeCVnYKyH2XIxws7E8gkDC9Jdba7c1+PwbTVZWm9lme
         XeMJCVpvm86+0HbDKjb2G3rhRZTLv4qcqPDHEnuM8G6M1xg+p9RdKEciPCk6mfgNRHSM
         D/HR9tLMNI/PV3f/xSHMpClrwSorNmhC/lFSYHIAYI+VjJQtvR/GEdBYdsk5qk/7GTeg
         cgtdyLXERti8HEynHgIpINcrmmlJM8SACOSLyypsbgaQ4FQA8fbitu1wsScKCgH+CM6M
         lomg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788352585; x=1788957385; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AKF+zPcaGnIjcBYSYaoawLCl82XfK40W4BF+GG+bvXE=;
        b=icBZMDs6gdGThp9mnSjY93nd4DczNlmpeEcj75C33xVyZEn/RjDNuZNkK9bhRlnsCw
         rQ3C24Z2fnBv6y1ylf/Hd4yM4p2oURSuHsorEQasIJujska7orqkl1SG3ll84ixBYOrc
         cxw+paPBljTpEg1vIh27Wm0zfcaZMTLQkZZ3iW3cLK7+5t9zqD5bjMUzi5y34otFLu55
         pIEyo2ga/mwgI6ulhrG4y9MQWZ6qA40ra6w0QlCcS8vRsp3eQhP6jqkxiTEpRdr+MPpO
         K5Cw3Kn8r/G+kzpl1xP8XAU3Pf1SYHxle4cP83GY1fnlUeJWw8qndvRqD+Tbv0L76a//
         Royg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788352585; x=1788957385;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AKF+zPcaGnIjcBYSYaoawLCl82XfK40W4BF+GG+bvXE=;
        b=fOULV6Qa9415LxA1nscLGx1G7HOZ1OOUPxbFP5o86Yuuc7zuElSWZOM7ZSq4PJybP1
         9O3HUPxJ0aYMRgBFL/RCW1ih8of2SjwrUFkdAmxF26KSTA41eInw3nzT+zEGu+gClhoY
         yUj4bd6FXKpMXRU4wXYSN8xufoOtKo/Cx1s68nUC+J6ejXrlL2gYS2m3iaW/zgTpr9Fx
         awZHb8XZYyERjNclkvZWUPnSXUpk5GJdupy+B0pGlBI+U1OYIAIw+gpWtndxPFQizTVs
         NwYGiCNR9d2UB2Ytth/FSpLWGOrf8OfNWk3omr6diJZTJ4+haZ7I73wy9COQwNlnv4G2
         yObQ==
X-Forwarded-Encrypted: i=1; AKwUvBzwl9QZD0HvrrjWeWy64I2nZT5QmhqpL2bLbJy3xIWuunG4Sh837cyu1OUd+gzRI4wrp2+e20xQMXMF@vger.kernel.org
X-Gm-Message-State: AFuF++n5QuS/FvbrxSeIcBQ12jXznKkvUkBUQY/28epegYPGeurABsij
	eAKGPNVWlTYERIPLCuHjmJ2P9pdfBFV9VDD1y9e9SuhZEJ8wqeuWmVloDtDgcKJhjPR4hU0Sem1
	c/dIGGiQ8LhMtBWTQDc16ZHpxFHLKTNA=
X-Gm-Gg: AYBFou3apK8+BojEQSN6LdUzw3oHic1YKpU3IKvTUlclKa2T0m/v+P9XRTuzDoMGQQQ
	yl7rfygry5H8fscpSXNaZbfKTEKQ4s9t3oEOb1CAYwGo9Ie7pyO4fkVG3l+I4wGotdtg5YoMl/0
	wrN3gwOdukckLQFztdsHxv4JMebnC1P4sLP/3Lbf4lSmcQEoIi2YDo5HLeXanRnqQBSN//6m+R8
	DqqgAV+l/j413BMwmaenXM/P38RUq8eY2T5SQKjaExShhj2IIIBz8Gu0AgHfs9fRU+dbKdR6HN8
	6wULue55+KrDMGvoKN9VOinhGadf7cLt3NySTB/fjN3H4+nBhMjLwaAPo80JdCMhoP2aIA5+1ow
	FwBgtGfRgBaN0flBRulJDekKofdYNK0KDtuGuaNPm9aLmX1H8gY9Y4Bo8
X-Received: by 2002:a17:90b:2b8b:b0:398:ba9e:75ff with SMTP id
 98e67ed59e1d1-39aee12c707mr7182503a91.21.1788352584935; Wed, 02 Sep 2026
 05:36:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <apgNYDiSiPmNZspF@sirena.org.uk>
In-Reply-To: <apgNYDiSiPmNZspF@sirena.org.uk>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 2 Sep 2026 19:36:11 +0700
X-Gm-Features: AcwNN1Vtr0Lsg-kbSWCKKSOZOMM-LcknKctZC3VLEs2BTvZp3shOSfxe4zqP398
Message-ID: <CAABR9nFEbNxQ_oWCvZobOJnmCBdhAdTYfrm=sMzygh28CMFFtA@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the gpio-brgl tree
To: Mark Brown <broonie@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Mark,

Thanks for the report.

>
> /tmp/next/build/drivers/gpio/gpio-altera.c: In function 'altera_gpio_probe':
> /tmp/next/build/drivers/gpio/gpio-altera.c:224:21: error: 'irq' undeclared (first use in this function); did you mean 'girq'?
>   224 |                 if (irq != -ENXIO)
>       |                     ^~~
>       |                     girq
>

This was my mistake.
This issue was caused by using 'irq' instead of 'mapped_irq' in
altera_gpio_probe().
I haven't encountered this situation before. Should I send a v2 with this fix,
or should I send a separate patch to fix it?

Best regards,
Phuc
