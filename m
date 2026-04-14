Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7403A3839
	for <linux-next@vger.kernel.org>; Tue, 14 Apr 2026 08:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776155196; cv=none; b=kUTT31aCK+lY+E5mHMcdB8Hl52r41q8I7la7he2KphDjLs2WlEi/+tkc2uLIkbQ7cmKOnqGdRRp4fBY+L0LWn0uUGMVm9/mqj05Jg/Nyjm3D6xYccG8EfI2Q6pMYwTwd7znZFn7aqH/xTQrP6ThLOYuNGfk7+atnNV/5ir1xDrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776155196; c=relaxed/simple;
	bh=Ox3/Oq+xaTk35aBbrAVarT5qZLw8CMLuQnTfVPzzdAk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jIFEWlVYMUFASE1A9/ZiGQ350c+mfDBFlod/T1RjYo4utQ+e0tr4f1xydXVKY7c/eLIaWiBeE023yw4HRz0ILy6gh3UlFUUDCIR7SlcNG4JvkTaQf6iZQpScVeRV0F9ccNpP5xPJFFrSn+dse9kks4RD/kVF9IKxKyyGZwMYeXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-9568f5c81c5so222586241.1
        for <linux-next@vger.kernel.org>; Tue, 14 Apr 2026 01:26:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776155194; x=1776759994;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N9FX6F8QX9Dp2AfKCRB4U2HJiolvMePu9bItxWiNqmY=;
        b=el74+P+U2mBik4Qy489zD78bFWtTM4ZzKQ1aVITaheA4Sy+iETsWwrmauUK4MQb3oc
         8gpps/GLUtdr+7cedalE39oi4wPidnnj3hDbU0cQFKV6J0mi22iplxGOhIvjQCZlVt3Y
         FRAjdncKnAxyzu4e3W6EpY35EztyRzwpaUfWYXYaLGx7j06cmr0DpzPjplht+yfq7qlD
         4bz9nMc7h+boLfMSQHOTIOJg7aIkMB0c1v/bCtJhNw47kYSLS3tHiFk5bLvHIu+FY9h9
         H9X5EnyQey8DyHUd5k5SsFuiidGzLyRBwAOz2U004gFteXRwXgbcMH4F7XcN1simyatM
         t4Tg==
X-Forwarded-Encrypted: i=1; AFNElJ9v2eUgKuh+6R//OFlg1+x91Dre6ZSKO0thAQKxjp8R2iKAOKb43tDogu3xQKhYt4mcylbWzrvekFTu@vger.kernel.org
X-Gm-Message-State: AOJu0YyootZ+UfACa2GQP2HJBQzTqWAy+OhGrtQ4eRT8pd5tayuSgM8T
	Ufv2FNHEDB2WCMTa3r2e6ZTcG+YeILpFFIOSP1wLw3lujH79akBHZcJzNXGPiMtN
X-Gm-Gg: AeBDieteVsCNPBsgtb82DUqV6yEVpJSroigvhyiXboT6FByxnjw85XO4zcA4QWBtIC2
	du9yvSrxdvD9R9PdRMLw75+eIoCTjp9T3gtyWsSvPo14rHGR+yvT49LKtTB12JcjJwmyNuG+6cH
	81v2mCGwACpahEIbtHUs+PwfW6nMhy7vEDcZBolnU9fXwktwEf7CIRhcBO6ApS+/z9AHAzibwqi
	g+5IGhQZvlb+1+5hcxaSf463rR+3+NkR8E3xuHhcwlj5zr2P7FVFkEhSGtZNFRLV4FUGrniK0s8
	esqz2T4h1cYPTt3EvkZGFEhbzI3Z6HP16H2osZbQAJbjlOu5FeH5QBS4jsJr65hEBOUUbi+GcN8
	aHednJnY7WzSAxKF8KVNw+fVVqe6A1wbu2GZ18YzJSMR+pRvdk0/zKJ5YjJyFE2SpiBlUh55U3f
	BAb3ON4xK3Rn6wzyn3aCOG8o6BWfnrXWmPKu2vtGeXzy1lwKl8yxB5EmPhGPtWU/w1Wj+IHhQ=
X-Received: by 2002:a05:6102:cce:b0:605:7a45:c7c5 with SMTP id ada2fe7eead31-609ff1c747dmr6327847137.14.1776155193775;
        Tue, 14 Apr 2026 01:26:33 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-6117929d940sm432213137.1.2026.04.14.01.26.33
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 01:26:33 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-605def5b80cso1643413137.2
        for <linux-next@vger.kernel.org>; Tue, 14 Apr 2026 01:26:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9COXXZT7aZhsMqLtwvsErYCF+Y4jXNmobN77/P1eXYxRKrVsC9ExsrhsQZ5cARJ0ZSNmGLO39pQmVm@vger.kernel.org
X-Received: by 2002:a05:6102:4a93:b0:611:61d3:819c with SMTP id
 ada2fe7eead31-61161d38f95mr352807137.10.1776155193308; Tue, 14 Apr 2026
 01:26:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <adZi-3jHeX0UhURc@sirena.org.uk>
In-Reply-To: <adZi-3jHeX0UhURc@sirena.org.uk>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 14 Apr 2026 10:26:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUytpYFJueU_3mbGZM1NGZjV2kcxo-vhh48BpauzTJNRg@mail.gmail.com>
X-Gm-Features: AQROBzAOsqBTUQA7Gm-ngTiF1OE7_MGub2Y72WamymSZvAHYz1mSidwGwV3Kacg
Message-ID: <CAMuHMdUytpYFJueU_3mbGZM1NGZjV2kcxo-vhh48BpauzTJNRg@mail.gmail.com>
Subject: Re: linux-next: manual merge of the audit tree with the arm-soc tree
To: Mark Brown <broonie@kernel.org>
Cc: Paul Moore <paul@paul-moore.com>, Bjorn Andersson <andersson@kernel.org>, 
	Janne Grunau <j@jannau.net>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Rob Herring <robh@kernel.org>, 
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

Hi Mark,

On Wed, 8 Apr 2026 at 16:15, Mark Brown <broonie@kernel.org> wrote:
> Today's linux-next merge of the audit tree got a conflict in:
>
>   Documentation/devicetree/bindings/arm/cpus.yaml
>
> between commit:
>
>   96e71f817b02c ("dt-bindings: arm: cpus: Extend Qualcomm Oryon compatibles")
>
> from the arm-soc tree and commits:
>
>   0220405d7e099 ("dt-bindings: arm: cpus: Deprecate Qualcomm generic compatibles")
>   d08082a872f08 ("dt-bindings: arm: cpus: Add Apple M3 CPU core compatibles")
>
> from the audit tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>
> diff --cc Documentation/devicetree/bindings/arm/cpus.yaml
> index 07f3c6a525541,6f189ea3fdfa9..0000000000000
> --- a/Documentation/devicetree/bindings/arm/cpus.yaml
> +++ b/Documentation/devicetree/bindings/arm/cpus.yaml

[...]

> -       - qcom,kryo780
> -       - qcom,oryon
> -       - qcom,oryon-1-1
> -       - qcom,oryon-1-2
> -       - qcom,oryon-1-3
> -       - qcom,oryon-1-4
> -       - qcom,oryon-2-1
> -       - qcom,oryon-2-2
> -       - qcom,oryon-2-3
> -       - qcom,scorpion
> -       - samsung,mongoose-m2

[...]

> +           - qcom,kryo780
> ++          - qcom,oryon-1-1
> ++          - qcom,oryon-1-2
> ++          - qcom,oryon-1-3

You have lost qcom,oryon-1-4.

> ++          - qcom,oryon-2-1
> ++          - qcom,oryon-2-2
> ++          - qcom,oryon-2-3
> +           - qcom,scorpion
> +           - samsung,mongoose-m2

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
