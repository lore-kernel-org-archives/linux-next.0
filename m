Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637223A8744
	for <linux-next@vger.kernel.org>; Wed,  8 Apr 2026 14:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775658016; cv=pass; b=H6wds+8MMk9scDeIpaLAN2a7HI0yoFzesR41aGBYrE4lXxaEzd2nPsxkKNWV6apT79kyXpEI7/8pAhOIt0onFr3dg1sfXegBhUVDdQin/CmYgdUpoSosjdGhmD4BelgeZwk1YZ95Kecl0Ug+XKRvBB011XaG4XymvLtnUrWLUQs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775658016; c=relaxed/simple;
	bh=Q1y+smlCqz6n1PMoDlj18aKIGcOgfg0UvI/ylZY44Cc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TPWwur2YA+/Ki+rTdU1pMzrnFw3cwI/CPtK7zidWeDDSXxn90a/i6lZ7zoluH/YVgqghTuQA2THIcZjwyPNSYD5+6aBkRhRZ2/yq/I9EA1mPFBBxwU80ShvISlndukT2BNiVl1FNeNg3ypO+UtD2wZw9AbOck6JDapTydw5U0pA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=akCh4Ok0; arc=pass smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="akCh4Ok0"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1273c690e5bso541113c88.2
        for <linux-next@vger.kernel.org>; Wed, 08 Apr 2026 07:20:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775658014; cv=none;
        d=google.com; s=arc-20240605;
        b=FR0p92dLcGnrCnCYgMOThoP9GanRn60O7wGZ6Y0XBXCuVPL5X+UaaLzc0/F38lPNv8
         Xp5+YCM/Ad/a0s/EzQVrhQswF5d9mIaiftRH3LQvwX03Zn8pms9SQcWqtlhKDAXA1JqB
         g7oyVp72Ab3Rl5U9CTqAGlyau3x7uKJKoy9C0LWB8oAk0fTZTDk1mLJvQ86VL+1Jnjo1
         9vqFCGK327q7kqsHAQuXq/kNgZphvdAtQqRg45zsxIlcJYcbHG9x4gAsNlVct+yctKfJ
         6ZFyWvaregIBHZqagtcBbc0v5xyk8QGYKz2hEXopRF0KAfOkBXwNyAF0NJRAmPwrKb/t
         dpMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q1y+smlCqz6n1PMoDlj18aKIGcOgfg0UvI/ylZY44Cc=;
        fh=OKi9bcFeIBjEW0vyTP1sh79naWlSYmkVyRVTie7PcOA=;
        b=iEvv4oszGAf+Ydg5Pp1itZ0AfpICO/GagZZ76wwa9AVAkxlHMEvo8n1EQHxGd9KY9c
         IZdLVcOfV/mP0zXrAA5O8fGsJA+SV6xIv4aAlHcZ8LVRy1STpUPfgRmY2l2swnK+sOjd
         R9xf8DbCijHL6hoa5kQ+CWnBIzPD1MbWze/HMZH19xiZk4K2lpAWSFPafVbc7KTjQLba
         kdL2vi8jULZr7nDHgtkNUy/y7/DmL/E2WeMb7FHJPpPMybF01+hq9IsndCOItSEfs1OU
         yYMlfjMCC4J+PVTgjJjOFqcyHJ/YbpS9zOAi7JIsCE3BB8gwAjR4wz3Y+gfSOLTrvjt8
         iUGw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775658014; x=1776262814; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q1y+smlCqz6n1PMoDlj18aKIGcOgfg0UvI/ylZY44Cc=;
        b=akCh4Ok0MdpCL2tAwAiYZVe3CLBgbpp/csAneaFiPAJ2LBd1yujKT5x5bcH2MK1sRN
         lt2EMc3zAxC14ccOskb6lA5k8gV1A4Kyx3mn98Ql7pb+SWwEsZodbwgFa+jB5i1FSEvS
         tonvvQtsf0lFmgE6QIzwWO90RUiGWBiW2UNSanPlzlgKWzPhOHpd/SMYcpVdhJYVwas3
         gmjDD8cN1gVOs7Hyp7QXyFAyQenqX7blQmU8BUUfDVZ6mtYzXgphuBrmWui7AgEojX7j
         SRZ3j5UKy62CyE0bhw1ydJeOfk+8XYqpMUQdSIjSB6u1Mw56VXzH2iq/iielcpmfA7N9
         9ZRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775658014; x=1776262814;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q1y+smlCqz6n1PMoDlj18aKIGcOgfg0UvI/ylZY44Cc=;
        b=cnbZpVTjhbRUmjbp62wkNM5una/Kh/cOm45sEBmkjHLsJ+VXNk5L0XyyE9+IJ8k5S9
         HDWM0Fm2vXLfLCFsKCGi1QRynsLHwzvqBauH/jh2gQtfWyDYzcSlwa0NY5DsO375Ks1H
         BXALtcZ6x0H2sWd43dUKDR+/60bDYmqAfWkzxflR24ydDDl75SbCSWEngab6FOtOv8bM
         cDY63UqTLcyUOtVVi07urikgxGxKfTHfD0nm4eDKhMOoUE3QXzPz/mx7u14zcEYPG3mM
         fhTlzYlIt7M957qtlM4S14c+LbbscstPpEqc/SG0v108ozp3IxDjxjix6rG8u6wMx/xu
         2rwA==
X-Forwarded-Encrypted: i=1; AJvYcCXV711O5VMEnYreaw9Olpcl8coHE3/ScI1evIve9BZm1hENP4M/44JA/MjGAniTklXPiswLOPufZpD9@vger.kernel.org
X-Gm-Message-State: AOJu0Yyazq2PYRM/NetzSvISPy0BwmKPuUfSuzvngPw+KUMCWmvsi/o8
	Rqnp08MdrCXWP5bOFzwSq6KF/fi4lUqAZF+d01ch//bcs5wWBshu2YGZ+a1/snBhMc1zB2IbMGR
	qY8rqp9liby28n4v6VKqo8CoeC4sy7d0=
X-Gm-Gg: AeBDietH566FygWBDnBCb0SCxE4iRv78Xk2DukUy96gYdSz1b71pniqsEAFTcGWzftr
	zG1JnqZbjSGM7Z0iaXwy58HCN3JcRAf/0j53aLrcU0lVKdMnJ8Hv5NB004pwm13c+YTxB4aOTYL
	batf3GNNrewdEZUael5xIuBCTbd5zdRtYOIwSb+lV014JWVAyZOL4ynNU+rSGIW+OnZkhYT1jbZ
	+8QRnJVWSRx1VSiJW4L7cH24890MkyeQ8ZqrVEYwY+qJ5vBEFXUe2J7/f1fgRYqswAnpKN3Kqaj
	mDYaBiiSoFU9nQjvzABp3ljxq2c0/CZiCWRbjxUDjWvOf3yDKrYpWkSZL2QCb8KUASAc7zykIor
	xfaEhJc6FQeAIG+1HX5IACU8=
X-Received: by 2002:a05:7300:cb15:b0:2bd:d8e6:90a0 with SMTP id
 5a478bee46e88-2d2a3326e32mr848566eec.3.1775658014213; Wed, 08 Apr 2026
 07:20:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <adZhzvTbFS_usXsX@sirena.org.uk>
In-Reply-To: <adZhzvTbFS_usXsX@sirena.org.uk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 8 Apr 2026 16:20:01 +0200
X-Gm-Features: AQROBzAiXlALOfRiF_JjMpOGPv21CFKTBddIthBewffEZSTj_YnbCtPNzasCLqg
Message-ID: <CANiq72n6OWKLPomKTcbg=KXWMfkJgowWLAT264kSBwVwSvuz-Q@mail.gmail.com>
Subject: Re: linux-next: manual merge of the drm tree with the rust tree
To: Mark Brown <broonie@kernel.org>
Cc: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, Asahi Lina <lina+kernel@asahilina.net>, 
	Danilo Krummrich <dakr@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 8, 2026 at 4:10=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
>
> I fixed it up (see below) and can carry the fix as necessary.

Looks good, thanks!

Cheers,
Miguel
