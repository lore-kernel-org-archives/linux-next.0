Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793283896;
	b=U8lhSeL7cribmpJhgUmF0HEnn3tktiyZ857MFJ6wbCSeYROBP+Kf3DRYjWpkFMQbFY7Y
	 /q8k9/fJYgU0SP+cjHoPMiMt+yA5gYP9rz1NCaP4knRTmlaWl9qWeV1rHpdb7ENNWixkJ
	 NNvazvxnVLcNPHnmtCDXpyqmjKOdiKYJX5xgEqm2yR09tVzJ+hrwRL2jsomjxIG+JPuqQ
	 w0JmE5e8O/e5bFKT9+KiLVQzILwAYUyew4twYLklMc1CV590j+JFA9EUDHidghNkL7n/V
	 qg6AcUejTJe/IpcDhiElHaNTIbR7Ce7xjAtpN9vsTOWbhuBqy/WvWpUYuDzCdaIKtMA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793283896;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=b1HUff2KBmgxmH6yjfASlYTd1KUp0LIqOs90e6k8hDs=;
	b=g0RYGNDgMhv85OCLO+UNbC7u+uOQdEeTCRGlr5qLtMEq7EBSK+BE7WKNjeG0+Uf6QYdU
	 dhGz9C+w82mjnpizMzrV7dWthhyKJJAvEzUsIwH1BQUfllM1cTQk47T+gkIA/+fSNErRK
	 4h0KDix+u9hVUAKrIZmtfYtlrfldJYzi8RqmD9Lu6wrt8WyHkvx3mfFnyajpwCKcLC0GR
	 6gef7ePgkil3ra6tY1402EZo7yS1UApKTqbSGRh+DRuy1BKj03Wss85Ff07mtVuoPJRgY
	 CFLzz5Dei0ZvyFApiizwnOGrFxGT3AEqdtNippz5Xm8l2IM4BS9rsq3GOxS+pjd2UyQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wPMV2lYJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7580606A31C
	for <linux-next@vger.kernel.org>; Thu, 29 Oct 2026 14:24:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7580606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wPMV2lYJ
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36a1865cfdcso217125eec.2
        for <linux-next@vger.kernel.org>; Thu, 29 Oct 2026 07:24:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793283895; cv=none;
        d=google.com; s=arc-20260327;
        b=dnO8OQe44/dw8oQqT0kqd/Ph338YI+NbcGPlxN0jC6WcAxash3bqe5nI/uC4VzWlOL
         5CE85k5vWOLEDUEqIxU7RP9aOadtR9DgKYQosKiv2H3UMsXuHUU81ygQxox5Vknhq9m+
         4TJVQ2r4FDHqT4a3vDZ79iRFHPl+eK4HQ0MIpbwinr3Xkw8IE7M/dryWx91OqMFah+nc
         QIGIIcEWOyu7XwgMcGjsPM7DaxScrZj7MAtC4iwTV9Cd9h1H+iuVWB1FRChon0h8n5Go
         6aPjBPmbAz0UUw0BymgpYKKtomWqzpZfYZSgaMst99F3o7J1uVr0AaI063YnA4pLRkfp
         Anmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=b1HUff2KBmgxmH6yjfASlYTd1KUp0LIqOs90e6k8hDs=;
        fh=WvnJuiptvsn1EshLEjs0T9JEG8HtrXWNLntMNPVmfBM=;
        b=KSu/glJrAfb1GNBDXDKax1j3lt3bMfeLJszxTUOg/9u3Y+b0onAe7/ZUTPFRSeAS7H
         DZdwMQ8HfyiNPDprY/62xwKxJW/kbXkZxMzJ4o/h0p5IH6zrglKMfPjplIlSao/H1Mpg
         NB++iKHKu8kigkPiEG0S3vhFCjit4hAIdEr/6yihg8/Z6CvN9szBFUF9TxxTIzb+wMp0
         JkOsnmcP/95mAJ1Ekxvp/2oM04dzz50scViK0Hc3kLvH8z3AE6kK7L8rf5UpwDHa1aw7
         HoxcwM9R7nGyWBjRIIZ5s9I8AIkBJOO7RwI7faJczaRND5ztETpVk+aykYoj9n1KZDhc
         xGFQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793283895; x=1793888695; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=b1HUff2KBmgxmH6yjfASlYTd1KUp0LIqOs90e6k8hDs=;
        b=wPMV2lYJzWa0tpgECLtiR4xSA7Ib9NyOpFFaHjQLw1kdLghJaZo5jp5oSPzBBe/YJH
         mWo9SGKH49rwasYjhlRQOv66FeIAKjsSlpmGFNZtV/O5plIxPy3TFHaop1vitWNw0/yW
         ELheEJ8R7OV6Sge965L0jI/KRKWwuZvILBncPo72h6FwqNzg97DmilTO01VUViJuNou9
         CpS+HFZlkJCYEFLWE9VSxkxFhcuJu6BlwNRfyhuCUqjGtQacHikin5+Nt5D8Lk8xV4WQ
         0PhW8SkWrSSeddonWFjrhWuQMGuMvhvkb3VnigBOLojJM22dRDKu4PvjgCkkE9YqBxCX
         C4Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793283895; x=1793888695;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b1HUff2KBmgxmH6yjfASlYTd1KUp0LIqOs90e6k8hDs=;
        b=mmyuKv5Y5mAXY4y4qrSfG90Jlk7KXEAV5sFeY8ecmNkGbLg9X3kcC7e4C8OkhTHhh0
         +Ui/ZD07yyiOHVjUh9RFS1AbxCkmv7L0p625epDN4ImyMZ/qdvclM3PCDosbMMs0OFJf
         59/SSOseX32+EH4Z3JUDo9Y2nXrQBANP+lLD77VM+hkBkePYL7ZzQLtwq6afC/nXfF5W
         gc9bT8Luz1NcmxBQpd4YlM5PhMO/E6/nlElwUMuChdGLOFjQVxnt7RTiI36lcyfxsRww
         qe/Yel/Vpu7f+eLMu5d2VG1HZ/9SrAApAaOd/zPz9idNbEncecPFiB4r4whTXyMaxChP
         UoRg==
X-Forwarded-Encrypted: i=1; AKwUvBwUlF2R9f0QgF4UKqjytPkFBTlxT2NnmFjtukg025E5aI6i6PLXmUNtmXwvv0yxs+0FchCtdHDsOxKJ@vger.kernel.org
X-Gm-Message-State: AFq9FYKLJnh0dCsuxsGCpSNloIH5+Ccjk4Lm4CHbQFTp73/pPx5v4/kk
	jj+qeWdikPef2PRkU/FY9aNT5ixuzCWpV5ozo7gu3kHIJ+rpdJdPsoJ66DRoYcQ69/2AZ2EYC1j
	+XKILfLH8r3sQEAMsHLCbCi/014gL2cpvU7yVpFg=
X-Gm-Gg: AYBFou1RLW/XGTweIHa0RjgcCEhxSPnD9fS5vbiOw/uXxgooqfVUBDiVTareuXo6n6F
	h8oo7gZZJM5ov2J2Tifkyvm0bKDVPqcc4k+8FuCfWR0Qr34zL3trvdSLaapEe4ID+5hjHAqW8nl
	FG50Ut9sdVaIGeXjgylhHAia/SM+taBaiIwchtRNcS/Bls7RGjzRM2gU9Hs04ztWnZ+P+jU4Kmh
	wRYOkTEWttQrkhS7IPYdBOcs2y9v2HC4XjThzTZD2E9ayuxqgodUh6SH7ti7/WG4bYhkbvZttJe
	forpwCZeiB8B4E6BKpiYpKaoGUT/3xCq7DhrARJjnT0gmCRQkb5pybzSCwft8LaMd8T6hJVOB0v
	dvNhvrc4ubL5tUiLn4R+2fKb2UbNCtZvlIR/0qapQSf+SY7gYj4LJpuMsoD0URRrVqLKKR7MpOj
	/GMXf5z/Bai9tNkciExpxjPuM4T4r8UA==
X-Received: by 2002:a05:701b:2803:b0:16b:4f52:a08 with SMTP id
 a92af1059eb24-1a6c26adc43mr10411808c88.0.1793283894754; Thu, 29 Oct 2026
 07:24:54 -0700 (PDT)
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <auNVlhF6DGyFYx10@sirena.org.uk>
In-Reply-To: <auNVlhF6DGyFYx10@sirena.org.uk>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 29 Oct 2026 10:24:43 -0400
X-Gm-Features: AclHuK_UPbQmPV7BBnSvAVPIEEtQb5W89rkm229lBE0fVYRMBexHzxOVe-By28Y
Message-ID: <CADnq5_N=r+BDQbEo7EeX6oYMuBUe8QGNTz_QWSUHKZLZOC=GHg@mail.gmail.com>
Subject: Re: linux-next: manual merge of the amdgpu tree with the origin tree
To: Mark Brown <broonie@kernel.org>
Cc: Alex Deucher <alexander.deucher@amd.com>, Kenneth Feng <kenneth.feng@amd.com>, 
	Kevin Wang <kevin.wang@amd.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 10:18=E2=80=AFAM Mark Brown <broonie@kernel.org> wr=
ote:
>
> Hi all,
>
> Today's linux-next merge of the amdgpu tree got a conflict in:
>
>   drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c
>
> between commits:
>
>   a2eae9f4fa1b0 ("drm/amd/pm: add zero fan stop temperature support on sm=
u 14.0.2")
>   44d0d3031e479 ("drm/amd/pm:restate all customized OD features on every =
table upload for smu 13.0.0/smu 14.0.2")
>   af52c8fd45fbd ("drm/amd/pm: add zero fan stop temperature support on sm=
u 14.0.2")
>   9b0890e72d19b ("drm/amd/pm: preserve committed OD features for SMU 14.0=
.2")
>
> from the origin tree and commits:
>
>   f990c94a2633d ("drm/amd/pm: add zero fan stop temperature support on sm=
u 14.0.2")
>   1b63bb397db20 ("drm/amd/pm:restate all customized OD features on every =
table upload for smu 13.0.0/smu 14.0.2")
>   d2c1e98658b6c ("drm/amd/pm: report smu energy accumulator updates")
>   8d4ce79aff1cd ("drm/amd/pm: preserve committed OD features for SMU 14.0=
.2")
>
> from the amdgpu tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>
> diff --combined drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c
> index dda435f19ca66,62f16d17e22bc..0000000000000
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c
> @@@ -2277,8 -2277,11 +2277,11 @@@ static ssize_t smu_v14_0_2_get_gpu_metr
>                                                metrics->Vcn1ActivityPerce=
ntage);
>
>         gpu_metrics->average_socket_power =3D metrics->AverageSocketPower=
;
> -       if (mp1_ver =3D=3D IP_VERSION(14, 0, 3) && smu->smc_fw_version >=
=3D 0x00685000)
> -           gpu_metrics->energy_accumulator =3D metrics->EnergyAccumulato=
r;
> +       if ((mp1_ver =3D=3D IP_VERSION(14, 0, 2) &&
> +            smu->smc_fw_version >=3D 0x00664800) ||
> +           (mp1_ver =3D=3D IP_VERSION(14, 0, 3) &&
> +            smu->smc_fw_version >=3D 0x00685000))
> +               gpu_metrics->energy_accumulator =3D metrics->EnergyAccumu=
lator;
>
>         if (metrics->AverageGfxActivity <=3D SMU_14_0_2_BUSY_THRESHOLD)
>                 gpu_metrics->average_gfxclk_frequency =3D metrics->Averag=
eGfxclkFrequencyPostDs;
> @@@ -2600,14 -2603,9 +2603,10 @@@ static int smu_v14_0_2_od_restore_table
>                 od_table->OverDriveTable.FanZeroRpmEnable =3D
>                                         boot_overdrive_table->OverDriveTa=
ble.FanZeroRpmEnable;
>                 break;
> -       case PP_OD_EDIT_FAN_ZERO_RPM_STOP_TEMP:
> -               od_table->OverDriveTable.FanZeroRpmStopTemp =3D
> -                                       boot_overdrive_table->OverDriveTa=
ble.FanZeroRpmStopTemp;
> -               break;
>         case PP_OD_EDIT_FAN_ZERO_RPM_STOP_TEMP:
>                 od_table->OverDriveTable.FanZeroRpmStopTemp =3D
>                                         boot_overdrive_table->OverDriveTa=
ble.FanZeroRpmStopTemp;
>  +              od_table->OverDriveTable.FeatureCtrlMask |=3D BIT(PP_OD_F=
EATURE_ZERO_FAN_BIT);

I believe this should be dropped.  The FeatureCtrlMask updates are
handled in smu_v14_0_2_od_edit_dpm_table() now.

Thanks,

Alex

>                 break;
>         case PP_OD_EDIT_ACOUSTIC_LIMIT:
>                 od_table->OverDriveTable.AcousticLimitRpmThreshold =3D
