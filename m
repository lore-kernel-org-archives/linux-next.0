Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 543523F65EF
	for <linux-next@vger.kernel.org>; Tue, 17 Mar 2026 17:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773767372; cv=none; b=ZZn9+Z6ilDxBoZydv+miKtsZuEoWsM48FhVW9mBuFIE/5GpO/bxTjKFkki/FxprneuxFJ/XPtpNGBxZj+zQhCcUfxdrhvjCumQYIb8BxbJSP3rznQGwbtxc+B7LuPljkJ/2KJofHmbuxkpMqeU7Iy8W8O3Wu+8WAO3214PXwxIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773767372; c=relaxed/simple;
	bh=VBWB0vY4JS2sLOHt0jh6fkwX4x9BN8/CvIaeQm2Z78U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lPWozvKOtkWCPGhGOixfLjxAAlhSw3cF9vtDTfbyCp/QsNNTWwtqSUXZQBGsJEfaazSt+3fPV8FntVXMQ8njIFv3XAQ7Or7tMz3HxwuXnQKr71LtPdYSA6tzsw4fdwGWHSKmJXK2VaTwreFfsBKWH+PT2EkG8t3BY7ILvWo32PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-660a293515fso11373394a12.1
        for <linux-next@vger.kernel.org>; Tue, 17 Mar 2026 10:09:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773767370; x=1774372170;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QDz1hKdtZW899tGj4E5RgMLDw7Ke8fce+mMW0iMSVaE=;
        b=qe8VHBOuMl9GU6MMXjt0Cj82FdOgDQoTWCUdTBXhKpWQbJOdTMXeqR2kgqRo1gGNFI
         QXGb2mkRCXbrOQREz5QAlH2x+3d/Rlfmk3iPqlJnsrFEFaR9Cge3/0+6du2XLTKkX5UP
         iYe7mhYR2w3QsZLCQTIiyQ0rzgIV1C7GHCNBQqQ0b4J+IYlGLCaUu9n0YaJ/arwCwAhi
         OlZGJJV5VkphJtYouDdBwWv2X9xccwm0yQple9s/PGdLHvvpmKKpfWpfpPSmZGNzIlxU
         ALd1Nj13JuCS7g0BqHQC5pXeM+utqDCeJMrnxQ33ZraJ0jJFPuSiMnqWU9zK29dXmt/k
         Rmhw==
X-Forwarded-Encrypted: i=1; AJvYcCWjtKpeOgUGOo6BeR5b5jLW9bMN0Wyz0oJ1TwZBsnrhMvDFfj7Pr8v6WtvBvRPXm0UQ3hcimb1DO/nb@vger.kernel.org
X-Gm-Message-State: AOJu0YwKRnftW9JMyCDuR6nb69Kj9llFcIbU4xnRFKVY8ZK0b3BBIt2k
	9uW9cUrTlP1e6NM89tSJKNCyoL9GC2wFcJ8EAJgQGjazfOZzRrq3q/OQXjetBOmHrJc=
X-Gm-Gg: ATEYQzz9xjNurK9wL2tQTp0f/QLmLK9k7lscVvPu5Z2cHhvHZ1IRYlLw7/GAT115RlJ
	1c7vQORr5SuKmZJp9zIgXMjuNWATHmnoFnyQKhU0ZEJxQDDMx3aKsQMbveKvL//ioUXOh4YIcIN
	i2hXiFn1eozQAbkv2Q7pBKBAoAcM635BUGbBwFGmi838P5/5wCZ0t68HUCfhmC9wfrR5f7+Tak7
	lqORbKdW4fgLBJKXvOQpD7c6eafWIIAYNKqtFmF15swJLfe9f36gqk3YXvkHx1uqObsJUTp9Kvb
	/Ld5eKJc3sjwprQZGUc3ods16hzsrovZCzAwxu0tDCe+a7EHhoGllVn4ZOLOBJuqsIgqXdwr3qR
	bfL0GlXtYq/r8aQsInqqTJKXNLsYsT2QzTmeP4URK3fuUS3GyEJtelv1gNAHJ2KSpcdFT0kr2+1
	GZTWe8lMgi86fnZdcMjO7mn4MC3/L8h9zp2cP1zGUxjh60xNwsDwr3/M3WkuZ8
X-Received: by 2002:a17:906:f407:b0:b96:f0a0:c791 with SMTP id a640c23a62f3a-b9764f76b38mr939674166b.9.1773767369288;
        Tue, 17 Mar 2026 10:09:29 -0700 (PDT)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-667b0eb986esm177903a12.17.2026.03.17.10.09.25
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 10:09:28 -0700 (PDT)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b976e181895so697560466b.1
        for <linux-next@vger.kernel.org>; Tue, 17 Mar 2026 10:09:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW62b+r4k3drgKURYQjA3/ZFqQEuuQLQVsG401ibTZZrIPL8t9TMdsU2bMWSqXopzSdaeznOMEqiEKp@vger.kernel.org
X-Received: by 2002:a17:907:3f8b:b0:b97:d55a:cd6b with SMTP id
 a640c23a62f3a-b97d55ad291mr337821466b.29.1773767365162; Tue, 17 Mar 2026
 10:09:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <abl--dSMoQ1FiQz1@sirena.org.uk>
In-Reply-To: <abl--dSMoQ1FiQz1@sirena.org.uk>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Mar 2026 18:09:11 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXh6W54tovpAm3KmchUHFTME5HYUsYR-3nwmyHEJR5Dmw@mail.gmail.com>
X-Gm-Features: AaiRm532HcmhBhH9WdhioTPOkXdP5-0LtQDtut93CiGQkZWYtYgqkW17a2qQG8k
Message-ID: <CAMuHMdXh6W54tovpAm3KmchUHFTME5HYUsYR-3nwmyHEJR5Dmw@mail.gmail.com>
Subject: Re: linux-next: manual merge of the devicetree tree with the qcom tree
To: Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

Hi Mark,

CC bartosz,

On Tue, 17 Mar 2026 at 17:19, Mark Brown <broonie@kernel.org> wrote:
> Today's linux-next merge of the devicetree tree got a conflict in:
>
>   drivers/soc/qcom/qcom_pd_mapper.c
>
> between commit:
>
>   cdf0e445ee211 ("soc: qcom: pd-mapper: Simplify code using of_root to get root device tree node")

Hmm, obviously not all qcom people were aware a qcom person was
removing direct accesses to of_root ;-)

"[PATCH v2 0/9] soc: remove direct accesses to of_root from drivers/soc/"
https://lore.kernel.org/20260223-soc-of-root-v2-0-b45da45903c8@oss.qualcomm.com/

>
> from the qcom tree and commit:
>
>   3ee3d8a44976a ("soc: qcom: pd-mapper: Convert to of_machine_get_match()")
>
> from the devicetree tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks, the resolution LGTM.

>
> diff --combined drivers/soc/qcom/qcom_pd_mapper.c
> index 21e4dd594295b,8a1a18f8c8594..0000000000000
> --- a/drivers/soc/qcom/qcom_pd_mapper.c
> +++ b/drivers/soc/qcom/qcom_pd_mapper.c
> @@@ -401,16 -401,6 +401,16 @@@ static const struct qcom_pdm_domain_dat
>         NULL,
>   };
>
>  +static const struct qcom_pdm_domain_data *qcs615_domains[] = {
>  +      &adsp_audio_pd,
>  +      &adsp_root_pd,
>  +      &adsp_sensor_pd,
>  +      &cdsp_root_pd,
>  +      &mpss_root_pd,
>  +      &mpss_wlan_pd,
>  +      NULL,
>  +};
>  +
>   static const struct qcom_pdm_domain_data *sc7180_domains[] = {
>         &adsp_audio_pd,
>         &adsp_root_pd_pdr,
> @@@ -582,7 -572,6 +582,7 @@@ static const struct of_device_id qcom_p
>         { .compatible = "qcom,qcm2290", .data = qcm2290_domains, },
>         { .compatible = "qcom,qcm6490", .data = sc7280_domains, },
>         { .compatible = "qcom,qcs404", .data = qcs404_domains, },
>  +      { .compatible = "qcom,qcs615", .data = qcs615_domains, },
>         { .compatible = "qcom,sc7180", .data = sc7180_domains, },
>         { .compatible = "qcom,sc7280", .data = sc7280_domains, },
>         { .compatible = "qcom,sc8180x", .data = sc8180x_domains, },
> @@@ -628,7 -617,7 +628,7 @@@ static struct qcom_pdm_data *qcom_pdm_s
>         struct qcom_pdm_data *data;
>         int ret, i;
>
> -       match = of_match_node(qcom_pdm_domains, of_root);
> +       match = of_machine_get_match(qcom_pdm_domains);
>         if (!match) {
>                 pr_notice("PDM: no support for the platform, userspace daemon might be required.\n");
>                 return ERR_PTR(-ENODEV);
> @@@ -661,7 -650,7 +661,7 @@@
>                         goto err_stop;
>         }
>
>  -      ret = qmi_add_server(&data->handle, SERVREG_LOCATOR_SERVICE,
>  +      ret = qmi_add_server(&data->handle, QMI_SERVICE_ID_SERVREG_LOC,
>                              SERVREG_QMI_VERSION, SERVREG_QMI_INSTANCE);
>         if (ret) {
>                 pr_err("PDM: error adding server %d\n", ret);



--
Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
