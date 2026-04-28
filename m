Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B91A1A9FB7
	for <linux-next@vger.kernel.org>; Tue, 28 Apr 2026 12:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777381104; cv=pass; b=HoF1bBive6et3ZaLI+u9eCXxwi2XCl+s2iPeInxCZouBpHBHntmPhXnFK1HzyxaAr8CoAwX0yymvZv/Hdn9W7Nm2lYdgZ/e9MNx4HzqbpiVbm3LWSnUdFGBsGQ77QMym9cc1sHpN2QK8CMymz11uPJLu/KuA624k5LDrA0oTNS4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777381104; c=relaxed/simple;
	bh=OdjP6b1PtqzgJ5D4uwN1JYksfka/sQMVOf6UPdz/bWU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i3pVOepPf/bWBNp68bqhFdnYQ7zaTBH/3gUlEB4mfC9JMuSs9hd4mC8dzfyLTh0L47RK9eEjjybXHs3GRyMRvxo2nxJfKt2gS/fzD6K6dBx3LhoyoyG0B83KqeE+Lc0Q/CmwqVmGmo1ojYSCHI5AR7sQ74h5hgjkgT2GM4cp6S8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hdKygD2J; arc=pass smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hdKygD2J"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-12736a0147cso749053c88.1
        for <linux-next@vger.kernel.org>; Tue, 28 Apr 2026 05:58:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777381098; cv=none;
        d=google.com; s=arc-20240605;
        b=Bf5qKha8tkrgomtOn893q1WJ87YF+l50/m21ZCzZv2KiBdFcYSUFEHfUlIl3Nz45Rb
         Js3QdTWRq6N/UfmENGkKKusoVGG0dBSiO+6jLnfmarye4/WpUCIt5bFS+fZXA1rL9nyS
         Iv8v6Q3LSop4Ee5u5p9pxSqBqO1Qogp2WKKDfB8p4iv+8v3gSATswVzJ7b30Wik+oXZh
         /dV9L4pYfQADB83oOCK59SPurlTAP/u25cnvuBzS3/Tty3a+5dEZ2etnkTxLf7t+r7+n
         HoMZUPFK6aaKWj4aigISZBZw4+x/BiLEs3vTYjMoH+gQpatiXgcpJ3aWTbY2l4Iu9lJg
         iVNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BdMccuozhAatnL9uzFxJflIeI93nklbA+9rQgir/dZ0=;
        fh=mcL8/4pSCKJnP3sCpcOADPDaf1fdSOAnr3WGaKUyhUk=;
        b=Za/i0i+Tg26liLvOLc0wGi6p1SmfBT0Hvm+mVlhp9uyxZndil0NCME7I830OUSx/u1
         bPeQHabiCxBddcRadybffjQo2yDtVu4LFRQFQF8954qRSHoZk08cNr8aqF8OAwlkuwBo
         BBf7MtAhUR1LwRBnfZmZAUfoFfKNKCXXjaDY7KRZuDCT7jXMm/1mGul73twTlMwQI+d7
         GitYDL5pT3yqPUdPvIegcNsD9D3LCDWSSLGz6OnlbB5dPURDNzAxPaH088AkwZ4SYFP8
         gbJ620PJPmDe2jucqgIw8Ep6vKmjGb9hTPQrrVfPDF2B4tQWCIMZikgr4zmz/JX6VKu7
         Xs3A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777381098; x=1777985898; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BdMccuozhAatnL9uzFxJflIeI93nklbA+9rQgir/dZ0=;
        b=hdKygD2JL5wrDBik89LDIDz3TqJ0QLIY8s0+MXiqCKVBPMX6xigfOFmYCB+c9sBYq3
         PBz0ukcSRpxtJxyOx85EnR/0Cjm2rywd6d8gaWbSz8LCvFLSN+uZ3FNTh1Aw0qv6xaP5
         /nX3KfzYPr7MEQXF3o5rxFAK3SRLRjTzWZpNnHvlh7ce2XVW6Br4Q0+O7JzhaGs8516P
         N9knqDDoXY/RnZ8toKDscLYskbafInnxZrW1+6epWxhZYBt55IjWZFbYUKiqYtTfNCMH
         UnLlOzYpWtnForCuEAPFBpUWkucLnsczpBqTHEAj5nyyG1yHFTnXNvRhjyV05bLapHAB
         EvNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777381098; x=1777985898;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BdMccuozhAatnL9uzFxJflIeI93nklbA+9rQgir/dZ0=;
        b=q/8nuRJ7H5WE6Ubrpc5A1wHV8DYiYuQq4R7F0QoX9Gr8GcyRLHIzkTOeOMzKyEbZ8F
         azvi7F0sFPl1JLzbHUtsNzUP6jeL0SMCIVAFRermPjyPjRnimIoyto4HfC9ybXZLm+XG
         JX0P+3xpFZrzOgK5Ps84AlcjdykWyz3LE5EKiIR7XoaEkns/7DluTAulGDiJCw8bP0J6
         DEXAuRHmLiuAKo8IHT3Kl+SkvMn8iM+R8WixZjdvnmDptaeG/lVTU5A10LObg1kIAnsE
         zXNDvNalAjRWq7UhD6utl0nVpu68VTse18HktQELudv2eNNs/m9ArkiUZknKcPKhO+58
         Vfmw==
X-Forwarded-Encrypted: i=1; AFNElJ8OzJxn7nRhmSEpYwlYP9gOxj5ekjET2oa/rzxQa4yrwSRvgg+6tJ7cHzhjvwQoq2YUPFPTrwRGE5Lr@vger.kernel.org
X-Gm-Message-State: AOJu0YxcRqN3uyfyxgpvRVBce7NysCubVvzZtdJDxXA2ekO3hgIaySq9
	qJAFInFruZ5SDx9LXfTq4Cj5MOAXAULyNxfojdB2sQBlfJmeU9KPQFtiAN1GyidyHYWkwKwZzve
	klZo55e88YZ234Iy2XDTI3KhXZvZPAKo=
X-Gm-Gg: AeBDieuV6IlsQw0MI6ulTC9m6F6FDd+Y/kfxC49fpwuQbE9B7niqzJgpHRzGk54stJ0
	1bvszvpzKU/aMYOcRaqpBZbKSoy6fDShsDZmKwLRJ0GLT1jzI78UVyvp0NRISmKllS2P8X1g/U0
	C3Qy30gOrA89SlMLwu9rPCMtpm7cYuqg6Ym83NLGpD51TxQaNPOBEcwH1GJnKUUCUU6o4W9vJGm
	tMuUevGEDImgkZHzElGqDpf6Utkwx5JvdaRNV1Q48Wz74smyVS4hYlPdAJ/c0Fi1/C7R7tUv3xd
	4JagAHgSTgkklggTYecmXtYvWTpDxFSvfg7ymfURgnUNZH1cEdjTut40G+P8cIU1vDmBtcPouYa
	SbVWUaZ08w70gIGQ=
X-Received: by 2002:a05:7022:220a:b0:12c:3ef2:ef0b with SMTP id
 a92af1059eb24-12ddd551936mr655293c88.6.1777381098180; Tue, 28 Apr 2026
 05:58:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428125654.3911280-1-thierry.reding@kernel.org>
In-Reply-To: <20260428125654.3911280-1-thierry.reding@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 28 Apr 2026 08:58:06 -0400
X-Gm-Features: AVHnY4IMwmdoNpo02ASuMB3ELFP5Woz2Bz_n7e3WIQLfjaME56CCD92OHGfX8T0
Message-ID: <CADnq5_NRN+uxeACSX89cFtFKXVnp0VkKNeqHv0Q-Cek_YPW-DA@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the kthread tree
To: Thierry Reding <thierry.reding@kernel.org>, "Wentland, Harry" <Harry.Wentland@amd.com>, 
	"Leo (Sunpeng) Li" <Sunpeng.Li@amd.com>
Cc: DRI <dri-devel@lists.freedesktop.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

+ Harry, Leo

On Tue, Apr 28, 2026 at 8:56=E2=80=AFAM Thierry Reding
<thierry.reding@kernel.org> wrote:
>
> Hi all,
>
> After merging the amdgpu tree, today's linux-next build (arm64 allyesconf=
ig)
> failed like this:
>
>     /srv/kbuild/next/linux.git/drivers/gpu/drm/amd/amdgpu/../display/dc/d=
ml/dcn21/display_mode_vba_21.c: In function 'dml21_ModeSupportAndSystemConf=
igurationFull':
>     /srv/kbuild/next/linux.git/drivers/gpu/drm/amd/amdgpu/../display/dc/d=
ml/dcn21/display_mode_vba_21.c:5244:1: error: the frame size of 3232 bytes =
is larger than 3072 bytes [-Werror=3Dframe-larger-than=3D]
>      5244 | }
>           | ^
>     cc1: all warnings being treated as errors
>     make[7]: *** [/srv/kbuild/next/linux.git/scripts/Makefile.build:289: =
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.o] E=
rror 1
>     make[7]: *** Waiting for unfinished jobs....
>     /srv/kbuild/next/linux.git/drivers/gpu/drm/amd/amdgpu/../display/dc/d=
ml/dcn30/display_mode_vba_30.c: In function 'dml30_ModeSupportAndSystemConf=
igurationFull':
>     /srv/kbuild/next/linux.git/drivers/gpu/drm/amd/amdgpu/../display/dc/d=
ml/dcn30/display_mode_vba_30.c:4961:1: error: the frame size of 3360 bytes =
is larger than 3072 bytes [-Werror=3Dframe-larger-than=3D]
>      4961 | }
>           | ^
>     cc1: all warnings being treated as errors
>     make[7]: *** [/srv/kbuild/next/linux.git/scripts/Makefile.build:289: =
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.o] E=
rror 1
>     /srv/kbuild/next/linux.git/drivers/gpu/drm/amd/amdgpu/../display/dc/d=
ml/dcn32/display_mode_vba_32.c: In function 'dml32_ModeSupportAndSystemConf=
igurationFull':
>     /srv/kbuild/next/linux.git/drivers/gpu/drm/amd/amdgpu/../display/dc/d=
ml/dcn32/display_mode_vba_32.c:3762:1: error: the frame size of 3968 bytes =
is larger than 3072 bytes [-Werror=3Dframe-larger-than=3D]
>      3762 | } // ModeSupportAndSystemConfigurationFull
>           | ^
>     cc1: all warnings being treated as errors
>
> It's not clear to me what commit caused this, and looking at the mailing
> lists it seems like this may have existed for a while and for different
> configurations. I don't know if there any plans to try and fix this.
>
> Thierry
