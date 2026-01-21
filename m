Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99776356A27
	for <linux-next@vger.kernel.org>; Wed, 21 Jan 2026 18:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769018860; cv=pass; b=EwfoJk8AmCWjhGT+ZuWeouV9Z1hF7zXiH+Z785rjvKBpKUix2+iHccsbejrcVOrDcL0+XbvWs+nAAE2FFv0z3NYCKaKFKCOSdhMCcYrt8X/sbwETP6VhQMBqyXYlcNTuqa0fC1e6bHdMBip8uOWfrOsZ0Ldi3eq4G6lBe7o5vPw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769018860; c=relaxed/simple;
	bh=X91SW+9iyUZegWEkc7iGgxMHtECtiXV+q5oPcB+dhdI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=T+KPpn2FRpsl552hPZFUFo6D+iIIl5NH49qQNvGefgBgIkgy8bmCN62qNJnz5feLcEqF9lZFaK90UpNA8CGZVuDTOWEi4SfsTxMS6k63lsycAhEcwoqv//JWNERE9/BjuBBuLw1+B2gtkt3Hr8htEqsWjvZYbDplA60f4kZjJVg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YfwsxnSG; arc=pass smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YfwsxnSG"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1232c98f98cso15577c88.3
        for <linux-next@vger.kernel.org>; Wed, 21 Jan 2026 10:07:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769018857; cv=none;
        d=google.com; s=arc-20240605;
        b=Cfs1aXPdP+iXQz7iQtaYKch8bfSjcmEoS4CQ7+/Md9cvK0SwQW6ZI3gNxBtTioSIzE
         5Cm3gzYw0xNNvc5vk+z60TmtW51FtyfhCjQPZUUWyCgUqBkiNVU/a5Mbgrq9yaSPRr/l
         yi/MuIWrdDrtPk1ikvIKucb/B21+Fz5MGFuShFNv01go3OzSWpVavYskf6MJXE+LNL5y
         R8GnGuhERBP2M4+78toTH1aw9FxXLA1FrPflBcltr+k4AILiEPmmVheGw0hGmpohs5DO
         zhqAD10UF5Eluq9zpALmM1bFYl/gngwm4NoOQKyAZGfVeFWlc3xWAd8sVgZDk3+xziRe
         szLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=eKOwdG55kf3gC4fatCORW5h39+BPkhbU4hpVpJ0Seow=;
        fh=9lNKE8OJu0xkn+i0H8r1CcJBL0RBQCWGWbbZeX0Kjqc=;
        b=lk+T0WufC5240bIdwlLk1KqWAvoR1JlkyPGZuVPD4K0rJOGSe6hq7Hkkabmoq9xS3j
         2GagVbTKTlzDwPW2Iuq5Gi4MUlPCy+pE2LIV+djfBY/LnonzDPQpadjDm0FCD+Uiljjg
         4DFaPm2Y7wtkGYlsdVflFKdYD4P5LZcyrywZR+XE3jiA3jYw+oRddjXJFuskAwOF+kw1
         ebtK9A9oWwLx70CY6HhyUQzkeAWyfCMaQ4aBcdpft7nD3dSeYh98zpVI7/2ElnEdWW1M
         TZkpPvgzKUds/Q7JNYzLqywa8miecbKFu02lmxXoxafnmBhBiwTLdTFDdNG7iU/VNlIy
         rO3A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769018857; x=1769623657; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eKOwdG55kf3gC4fatCORW5h39+BPkhbU4hpVpJ0Seow=;
        b=YfwsxnSGUPxuZlRFR6iaQQx0o15P1pzDkCbrMtBncIfwkwY9sSA8c7J/av3U3zW9OX
         gmmCxzAUsULDES7aF7joqVYUQNd48yGXD3dWIq0jGJ5XfoKL4IuAhYye28C3WbpjPVaK
         EuMJqEh2uZfzd42ITl5GTQ+0YQLW542Kl49/V61Hl9rmvIYqx5B/Ggx5inuSJzmWQXD6
         u2U2LIilrqC8Dz9/2SnIeKXJi6RVJ2AHkMl+oWZ4vJPiYHf5WphQ3lEZ+y0eAt4earmy
         Np+m6s3Tk9TeHqfuqdMICyhxyieXt+3bt7V7jjGFSILyHYIcszIU6G1jHEFN2/0Jtf+w
         W47Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769018857; x=1769623657;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eKOwdG55kf3gC4fatCORW5h39+BPkhbU4hpVpJ0Seow=;
        b=MM658hWzDZXrQNou7IAAWmGo8i9ZfcX6N4RNlj4KJxn6/56C5zCEW+FdyDrAKOITCC
         EQS+KZB3cgsotmxBUxs8HLZVSbmgpD0nDsVHkEw6XZk3wMBYa5bFUyWPYt/0O9cRF/fp
         Z9K3OaMX5qtTrGW4E922nz7LiCc64I0ld4VHtafrOur9cdB0dSbpakPoJHWVCtk6M86k
         nafkI9i4X+Dts/dyAvJX8iNz2/udIHrTWrFOasCzBurMFp8UtMKjkny4W27AqThjc3nE
         LtrF2wHyxM3wtSw0JyoM8NG/9qG7WigyjJ/0HjV6PbrhRtQqA6iU1HdT7vVJY+kpixs8
         VflQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8xHOxt9l7dfKRk2MFj0XWKH7NsUaALqNrx+H//iHbmDq1JJqqcq8Uw/2vOoARbWVW6cfkR9gCTmRN@vger.kernel.org
X-Gm-Message-State: AOJu0YxPbeSw67iTVp1yCL68zPM/pMZb39g8ujMlL7PXwZg848XLypGh
	KNb1sW91Iw2lYzRqW7WbvX/YrZLVsIb0w8iF4ORZWlHx9uRPygGcGR+ApJKTcuSFCHusaXtZsbs
	7VeUa2fVB2Q/n5DFxa5FssATno5ASpTM=
X-Gm-Gg: AZuq6aI0dHXYCFTKdWlKyAdCnbGlMVLTPRL1sXfKIx+ZnqjbU2FzeCqR7NM/b33Y8yJ
	tUDRyhgBnuJRvHzztjFTXqeeXbWiCbCa2TnDAIGuha06dJaPoD7jPV4xnvslm2JvlsC+NF+/DbO
	Yf96e6Hx/eOfqQL4bPTp9/RwyweGVOY3FX4HNlk35kohHVpwZucd19zDu8yMCUayzG/B6OPWMrl
	jEnQ0QUKRxCG4UIRE5TB8D+0DFLBSB8ZdH1ICvqKyn47kgScdcyNUlJeNJLdteSmQcAwcLvGTBJ
	dbY0AehNnXJb/oj9vn9OJi+4//uLkxuayFOzxsLuKZUaDvInX0UqB2yakjOItayuhIerFkPofwj
	6ZY49cnX4gmKT
X-Received: by 2002:a05:7022:4185:b0:119:e56a:4fff with SMTP id
 a92af1059eb24-1246956d899mr2418057c88.4.1769018857100; Wed, 21 Jan 2026
 10:07:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 21 Jan 2026 19:07:22 +0100
X-Gm-Features: AZwV_QiseqhTeH3EBj1muywLFlNQwQxlxlv0CTHuvPva-Rov9foivcF-QK7usc0
Message-ID: <CANiq72mRp62foTCstQxYhVBdh6y_W27wEjWSRX9_kqShuueaSQ@mail.gmail.com>
Subject: panel-ilitek-ili9882t.c:95:16: error: initializer overrides prior initialization
To: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, 
	Linux-Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

With LLVM 21.1.8, I am seeing in an `allmodconfig` for next-20260121:

    drivers/gpu/drm/panel/panel-ilitek-ili9882t.c:95:16: error:
initializer overrides prior initialization of this subobject
[-Werror,-Winitializer-overrides]
       95 |         .vbr_enable = 0,
          |                       ^
    drivers/gpu/drm/panel/panel-ilitek-ili9882t.c:90:16: note:
previous initialization is here
       90 |         .vbr_enable = false,
          |                       ^~~~~
    drivers/gpu/drm/panel/panel-ilitek-ili9882t.c:97:19: error:
initializer overrides prior initialization of this subobject
[-Werror,-Winitializer-overrides]
       97 |         .rc_model_size = DSC_RC_MODEL_SIZE_CONST,
          |                          ^~~~~~~~~~~~~~~~~~~~~~~
    ./include/drm/display/drm_dsc.h:22:38: note: expanded from macro
'DSC_RC_MODEL_SIZE_CONST'
       22 | #define DSC_RC_MODEL_SIZE_CONST             8192
          |                                             ^~~~
    drivers/gpu/drm/panel/panel-ilitek-ili9882t.c:91:19: note:
previous initialization is here
       91 |         .rc_model_size = DSC_RC_MODEL_SIZE_CONST,
          |                          ^~~~~~~~~~~~~~~~~~~~~~~
    ./include/drm/display/drm_dsc.h:22:38: note: expanded from macro
'DSC_RC_MODEL_SIZE_CONST'
       22 | #define DSC_RC_MODEL_SIZE_CONST             8192
          |                                             ^~~~
    drivers/gpu/drm/panel/panel-ilitek-ili9882t.c:132:25: error:
initializer overrides prior initialization of this subobject
[-Werror,-Winitializer-overrides]
      132 |         .initial_scale_value = 32,
          |                                ^~
    drivers/gpu/drm/panel/panel-ilitek-ili9882t.c:126:25: note:
previous initialization is here
      126 |         .initial_scale_value = 32,
          |                                ^~
    drivers/gpu/drm/panel/panel-ilitek-ili9882t.c:133:20: error:
initializer overrides prior initialization of this subobject
[-Werror,-Winitializer-overrides]
      133 |         .nfl_bpg_offset = 3511,
          |                           ^~~~
    drivers/gpu/drm/panel/panel-ilitek-ili9882t.c:108:20: note:
previous initialization is here
      108 |         .nfl_bpg_offset = 1402,
          |                           ^~~~

It seems that indeed the variables are duplicated -- something seems
off with commit

    65ce1f5834e9 ("drm/panel: ilitek-ili9882t: Switch Tianma
TL121BVMS07 to DSC 120Hz mode")

Thanks!

Cheers,
Miguel
