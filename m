Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E95D431A44
	for <linux-next@vger.kernel.org>; Tue,  1 Sep 2026 15:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788276465; cv=pass; b=BqxeLh9Ef5USWTSaS1ZVqz/1cyjrkZWW7UyMTVmerSWHt7Rg8GMHIggANAi4oa2ZW2rTt8FZxKiGG6xIUUbJRDDGT99PnFLdQG+vVcvd60qwnXtPq/KY0GR30OtaTNYPdCfbA76gyuzGEjuXY7FxVmZ3BLn3tUES3MY7vFVOFxA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788276465; c=relaxed/simple;
	bh=4lqu9gWlS0n7RIQuOa0OikwNpJC9qcg8pW3SWLxdotE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k4pt0VrIxvsntBIic+yVwo9nMuBAVlMQUu4YNh/koZqkmN1vvyIpXyZzXno/gClXyl5LTnjQyy713mZRKjRG4BFo0tlpuERxEisJGJ1p9FNN7OZt9HRFeFwXlVwyQZ0yW2MMJuotuI3VFHl8QAdzS9M2Dc0SyVZ7+EUlvVNkyFE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=JBvqoVPt; arc=pass smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="JBvqoVPt"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cbedd5aece4so978332a12.0
        for <linux-next@vger.kernel.org>; Tue, 01 Sep 2026 08:27:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788276463; cv=none;
        d=google.com; s=arc-20260327;
        b=nGJOR9GTkuV+gfjONWxmGXTGTXqHl8e0ogtPx3DW1hLmbC5gQ3el2cM6lusp8AdlAv
         qTt/VX1atjQzMu8/ecnuN2m7CaTKiaRAWpL3uncDftb/2tohVFiN2dZFlZJBV0u4gJEe
         i+hKXNX+CfI87Wi7QOkVt55JXK6A2WNgdlHB6NmdmgV8jqaN4iQXbsNehxJ9aC7B68Gm
         TgXwJ9WhiEqySk4fF3RFgljEGnd/aMOJLvDH214VGc4AGviVtYyicdYQi6JTRGV3fZKL
         KDy8l6va1TSlzCG6E6VOOIaT+P09qgpCOBqyTEZhglUxDQtW3u1F4dr9l5uxuOjZ+MK2
         NlQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=H2oOeplF/9Pvz963Pn9pPnOoBzf1I6bdaQ4cw9nB6sQ=;
        fh=oIwyXNFfJsbR9TBkL4XbG8NV4Y4+QGuwRlAFxE+zF9I=;
        b=IF9GScA7yrDu8AU0KBFphxtPBBbwNdXXYqzDowBymaouVvb9O4AMcNnsBV4yqvGztM
         flORzDio0ewbKuqdGybUebFUZEo8BVT4fJlMiy069ePO1KoFB8IvlDcUHYjRpeUfHuqU
         vaJtBB0t7roA2eSXdZLfp8mvWgWx1itmrBaNAuET9Q+Q1ula+pTc/AJ8PIJcciw3WM3x
         V+qCaRWc/osfUvcUtxPoQo81Zi2z0XEIs8I/nx8LznAHUm4KPaLGIM2P38SHUFqk8Dcz
         2TGoJep+brNUqj3M8Xexrkblg/ISu6VTo45JE7rlPTSsKUtofthqhQdyvmQLITJCj1El
         Mb+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1788276463; x=1788881263; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=H2oOeplF/9Pvz963Pn9pPnOoBzf1I6bdaQ4cw9nB6sQ=;
        b=JBvqoVPtP8JZaSLZkPqvggmaVtKs1wDnOMuETZBC1BmqIh1dCLz74GV6AzyiR06ZeU
         MzqFr8CF+7DmWTMmIkvAXwDTwDHpEA32w7Za+n8y4st6GdvAMz6uTpOnjWTK6kVuV+zT
         6heItjDyuBpFv0zSGUIwMQR6VZRkqJiTkz4EMDaxM9U9w036XSJvT3p2rdEF0tBi4x+G
         fyJsGIEx4W6PFUKG1RNg8vQIIu9tSBKD7mgiJ5T0eJwU4zYnm52qsD4G8M1qIN5RLAN6
         skUDu3HHz5iAIGsfdhxk0zhlOkhJtAXGGaGBebhB0QghIk492GaOsmaJOUZTTK0tkLuQ
         skUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788276463; x=1788881263;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H2oOeplF/9Pvz963Pn9pPnOoBzf1I6bdaQ4cw9nB6sQ=;
        b=Tl8x8HufCg+SyZ3HXjf408F+Okw7hYhEdYA0Mpro7NYSbo/GURQSvFwAzEDatu1wZS
         9i47/8EUGIA3Ix1xT0KUwcstEcMmJCp7ObHVNuVLMG9GfT7/e61oVQjG1N6kkXmmEf62
         QkG/MhLLqsW6/H9qSEPMEEeS3ECFHehf+7WucC8mbhNQwBT63UrI6DDZNRetbCL+Kz0s
         lLximAs0TdeIRNXx012QIoQCGvWWSWevc1csV3XE+8HkmDYPf3cbIc6JeRXIHME9bDkr
         Xp2qiu0nkYbQqWIf1S3XF1GVrTFVwYYpFOoiVpxADR/cvk3xxmo8tLuCgul2ZxdJqHwK
         JmQQ==
X-Forwarded-Encrypted: i=1; AKwUvBwHEA9+CIYa1QSD/amYAq0gZiwEgOGDDj4VCpKvPBNFzhlVQbxYwq+nEw3gKXRGoG7vfK/mfmn5JP4M@vger.kernel.org
X-Gm-Message-State: AFuF++mVgjCvlrYRRBzSxd3DZeU67IVKoOHP4CeWKPHpVa7v0HZLSTaN
	JglbvrmAnfLvtg4zw/LgxFV6J1ciWK8CvvCMhzzxiZn5ipe9eAex2o91t/Hbstcd+FfPuYtc1f5
	x4ROMyOKergBimxE70TdD6MiF3VWtqh3A5xb24Ayr
X-Gm-Gg: AYBFou2hg+CgQaXLa+VSk9lpH5XPUUl6O2TXBpczWylTjv5kAQW6xxXi9ByvusGXYx3
	yXZYS6WmycJXHwlwP5xx20E7gPeqPb4w8Vnl+hT+y8862VjAqPQ4yi0A8BWtPE1vQi/x5SOebbL
	/2lTh5xUgLgCGU1ElNLwGJ1Vn3mmS/G2/T73lgjXg687Cv4qIpEvMWspllI9xB/Izan+6PckbVL
	2OliLPqPa/LrpecMN1mdqmeloxyb1PotbQyS5bFC0ZscMSK6Q9337NKPyAAAkMmGBps/0AIkHyZ
	HBYyzDABRw6O/Cl6zc4rInOPLsK/f0RpAH0kImANnErvgw==
X-Received: by 2002:a17:90b:2dcd:b0:398:9bd3:d6d2 with SMTP id
 98e67ed59e1d1-3990f85e07fmr5272363a91.12.1788276463399; Tue, 01 Sep 2026
 08:27:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <apa4DlzuPqZi72gp@sirena.org.uk>
In-Reply-To: <apa4DlzuPqZi72gp@sirena.org.uk>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 1 Sep 2026 11:27:31 -0400
X-Gm-Features: AcwNN1XnoIQhddvDbZmKovnMpLgo1ZPfjGgnaFz791sMCGU_Z8cHC_adkH7DUCc
Message-ID: <CAHC9VhSQYmtS69OuVpA53q7x0PgTACG5YvdQ-mqj821Bjdp-eA@mail.gmail.com>
Subject: Re: Missing signoff in the security tree
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 7:33=E2=80=AFAM Mark Brown <broonie@kernel.org> wrot=
e:
>
> Commit
>
>   5598cab53f535 ("lsm: don't call security_backing_file_free() multiple t=
imes")
>
> is missing a Signed-off-by from its committer

My apologies, this is now fixed in the LSM tree.  Thanks for the heads up M=
ark.

--=20
paul-moore.com
