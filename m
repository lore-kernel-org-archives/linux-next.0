Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794908415;
	b=aRv6ZfEy5dvR9ormkhl3gTv/2fs9gZMmzpCX9gE0Qrh880ONE04/Ji42Twi2ExspJit4
	 OlMckU9wCWKIYTdqkIIgFeiqQOU24+l0IZj168Xmu3s/8LQyEp99FFGSKPOomc+AY3Nsk
	 dkeFfhLOtfmaIMhFG3LbVJn7QBA3aCxt03OH+GhEsdYm9/AqoBbZnrndxKllfuUaRYND6
	 iM7L2I7Y7KcSkrzYZtWbccQaHThe3lMq/SauvWxBnWJXFVX731eTpFT8Ja/Gst9f3eDVi
	 fIRCK7Pytt0gxKcoy7TuuAU1y3EtqaNfT53Uj0hOuykoUeuSZDjnt1zzUqDYgD2+DsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908415;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=y0zlRMJNOStWz5trUd7/tfb0kv4utMHpqM2nmh7nLPc=;
	b=2sT++KYmPthYaGnacl38WxCjG9UfOGIcm6xVCcAzFfCnbfVfvNNewa+HXyqFYdveN1Hn
	 B2+QtdN5d3Wj9lZjFzeKxjr/lBsjLAW50nZLMtBEyKRpuU6OacxlpqeaJrOWAFFBqMbYQ
	 EZCM6Dyxpf1+2XNP9LPxpnK/Kdtzqw1+uysG/p5dkhaYIgVwWY2ZLUr6RW/gkmEAPGH7e
	 XKGcDqDwYtRvL92d0r7mJ8cCazOa7XnEsWBm0ciLPsGmkdiIwTMfPNiYid3eHKx2msAP2
	 NgcQH2Dtkg0nsnu3jGCymLn/OSx33zoNBzrgFrqCiGAoGD2FKUdHdRU/S2zXfu8zNcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.48
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC3A606A31C
	for <linux-next@vger.kernel.org>; Tue, 17 Nov 2026 09:40:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AC3A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-9906a5410f5so566443241.0
        for <linux-next@vger.kernel.org>; Tue, 17 Nov 2026 01:40:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794908414; x=1795513214;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=y0zlRMJNOStWz5trUd7/tfb0kv4utMHpqM2nmh7nLPc=;
        b=hYoYxI5H2gC5STpj47al/3phEXDFjjxi73FhTjCW57zhNIjBZSBQUse5VNWFkRYdh4
         uASiaZIozwHCpkLGSqfr+Xoc9RK5QGxXFE+t/aoHgCUbm6xAbve5csGljtvva+DmUd2P
         Iq0qoRMZ5OUVWIn6l99DV1lXefmQrqto7YYFkg5y8qiL/0n++OmIe5NMJHnMcl12EbaU
         9RN8+xeRx1NQQadfNPZK56/c6BGI/ZUOcWsg7cA3ispCbQCkeOkqQEoCXxq6ejrLEm7A
         nbpVXWg+LA5sCLqBpdQEnDqUx/v2xq3WSZ/YhXorglG0wGLGMxQsEICODSY253HWxCRu
         v28w==
X-Forwarded-Encrypted: i=1; AL+hErF35nuQsabMShIXPgxLpzPgCLNS/E4+pbcmmKQ3rg29DDk1gDKjFEC7ilkgw11pAlJQMYO/jH1ky3dP@vger.kernel.org
X-Gm-Message-State: APuU4Z+IBK8qr0nTuE/rlPl7K+fiOnLPTdpbZ7S9p0ZNced60Ep/o0Qq
	5td+gxKgnhSoVQV9HQiCGliKXX3haUD4lIyTpCiwl1fp3JZB6lxcZa9FDpZ0gede
X-Gm-Gg: AYBFou1yhPRPFlBuIZzUpjxsbx6pXQNHavMcjEXCN1i0JegsByfQty1dEUW00d+Vf02
	IW1vFDgEshya3susMlmv52Si7v7HL7cR2rGwln6HM1VHyAgd18L7StHb5UKnr0Zefu3289yBj26
	8Ta+Z9QTw9AFiW98ACm0+aybjhppSUOTJgBaB+4Fmo4FC93RMRNp5oxpckKE8/eEPRuGh1er6nm
	rcpDtYxrZIGVPvBo+wktHb//SIro927SzamMFKG4pbETMozxFnhaJ94mOZf8uDJbDkw+u7gBo+Q
	twcpkCLRG3N0/ZnWMKJ2ld0j/ECCbc/XVFC08wmo4h/MxRK+fju6q1BxyXMPm+ivsAJ9piI+7pV
	w4SaGlDQ2SOa1B4TfOA7XBkMdZkZX0h/m7oPXuX546dTkPSWQ5TB+pocqugdATWkH0FKAls1/ub
	K7pIavpw59NL74rqKioPiydyd6Jdwf63LF38IlBgG+AsKkYKB3HaOmqGRZcrZx9fn3kVdQItjlT
	bRZvZYMVyiqnkw84u1pUJMeifp/q93CwcfAp0r5aTbD/XlOoDXlL08V4Pvt1JE3f71IA258hXmD
	XUpThYWQESIYXwk1+4iUa59IsWhBwAOQCF8BwLmQQHCtR57CivAbSZNW/RQOzA0lJPE=
X-Received: by 2002:a05:6102:50ac:b0:7af:efe6:2bbe with SMTP id ada2fe7eead31-7d69f7b4e1fmr524639137.16.1794908413992;
        Tue, 17 Nov 2026 01:40:13 -0800 (PST)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99e33989bb3sm1807265241.11.2026.11.17.01.40.13
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 01:40:13 -0800 (PST)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-78fb1fb9508so530115137.1
        for <linux-next@vger.kernel.org>; Tue, 17 Nov 2026 01:40:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGIvchg3scHvUjwZh0LbtsgRvzQxG/gf6XtAolSWSCVmhZpG1KygXtiTobo0wGr7TXJWbCFk+aA/ze3@vger.kernel.org
X-Received: by 2002:a05:6102:4455:b0:7aa:d0a9:c5aa with SMTP id
 ada2fe7eead31-7d69f7b5db6mr367348137.18.1794908413358; Tue, 17 Nov 2026
 01:40:13 -0800 (PST)
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <aunvPGXM2F_VOMzx@sirena.org.uk>
In-Reply-To: <aunvPGXM2F_VOMzx@sirena.org.uk>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Nov 2026 10:40:01 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWjaqsXLUD6mT6PKDdozYew1wG30jp=ZtYGXtohiSFOxA@mail.gmail.com>
X-Gm-Features: Aa3M54qLzQogK-o6VgT_Lzi03rZSvOrS4193DJeETFJaFv9tSO3EDuIMtxMm7x8
Message-ID: <CAMuHMdWjaqsXLUD6mT6PKDdozYew1wG30jp=ZtYGXtohiSFOxA@mail.gmail.com>
Subject: Re: linux-next: manual merge of the iio tree with the iio-fixes tree
To: Mark Brown <broonie@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>, Christopher Hoover <ch@murgatroid.com>, 
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Sanjay Chitroda <sanjayembeddedse@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Mark,

On Tue, 3 Nov 2026 at 17:24, Mark Brown <broonie@kernel.org> wrote:
> Today's linux-next merge of the iio tree got a conflict in:
>
>   drivers/iio/humidity/hid-sensor-humidity.c
>
> between commit:
>
>   340d44bdf9db0 ("iio: humidity: hid-sensor-humidity: Use per-instance callbacks")
>
> from the iio-fixes tree and commit:
>
>   5ee5d306f1bd1 ("iio: humidity: hid-sensor-humidity: convert probe and teardown to devm-managed resources")
>
> from the iio tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks for your resolution!

> --- a/drivers/iio/humidity/hid-sensor-humidity.c
> +++ b/drivers/iio/humidity/hid-sensor-humidity.c
> @@@ -236,39 -241,13 +237,17 @@@ static int hid_humidity_probe(struct pl
>
>         platform_set_drvdata(pdev, indio_dev);
>
>  -      humidity_callbacks.pdev = pdev;
>  +      humid_st->callbacks = (struct hid_sensor_hub_callbacks) {
>  +              .send_event = humidity_proc_event,
>  +              .capture_sample = humidity_capture_sample,
>  +              .pdev = pdev,
>  +      };
> -       ret = sensor_hub_register_callback(hsdev, HID_USAGE_SENSOR_HUMIDITY,
> +       ret = devm_sensor_hub_register_callback(dev, hsdev, HID_USAGE_SENSOR_HUMIDITY,
>  -                                              &humidity_callbacks);
>  +                                         &humid_st->callbacks);

The continuation is now misaligned.

>         if (ret)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
