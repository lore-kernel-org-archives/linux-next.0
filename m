Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0EA34EF1C
	for <linux-next@vger.kernel.org>; Wed, 21 Jan 2026 17:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769015902; cv=pass; b=tivYdPWlTe2p7+BUpMB1XiQtaNH7hH8W5zbn3u5LIVSbDmcsciedumHkMWK+9zfJYr2meXrbbDFjI4OvaVZL81NrB/rs4xk8XRShjMFsW7POJxtVqJz2usm1Ng8rRqKWq+OxderO+JUzrKmpHzCWjPxWC7p/yUHlytfDqF5/z1Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769015902; c=relaxed/simple;
	bh=+olwDGsKVMGv2+3g/Z97PswZ6s+jmvjmZ9c7FPnp/T0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fnMrjFmMKTw8VUxgfZ65c6iG/i8iEGVIXq9ASQPBqQNkScdW9i1exhSM+jtlOYMTuCgWpUS4ZrC1sy1gFLqMREJthDDGLj5jjSUTTMGabIzcJUJhihFpXVB76u0RLPV7XwFJ0qulVZI9G4ugf5kbvLHP47tdVdEbPdOcFoivhfw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JGQQewQY; arc=pass smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JGQQewQY"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1233ad1b4cdso17812c88.0
        for <linux-next@vger.kernel.org>; Wed, 21 Jan 2026 09:18:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769015900; cv=none;
        d=google.com; s=arc-20240605;
        b=WOYyyv5bOeQEfvb6mgbId8E+Tl0oNL2H/kX2NQXPpRi/Ln4UmE1b+TPAcaFHiOE405
         2P+M3b2QCGLzXKEUD+jQz8+WbiJly2hBbLK+DrnqVg0EJvfNOyXTp2wYJNf3kFIK48ag
         S39vkWLuN42+M/Ck+V09a0lQC91MlQvXQF/0SXzQHuBmZ0d1UlZFHCMzv57zLQjWiGMU
         viEH3iBJ/5FzzZtdchq1vu4K/WSC+27zDwH1hO7CYn2TEwSkAveTM6AfSDZDespnEd7a
         rAHX7wMQaWbjHdIpXSIKgCwUxxDa95UlWhy/r58yetYDz5BB5VfrvpvWO63iCXGs5Wvz
         IJTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mH57UL3zKxPP/ZQWpo2MhyriPEJ2ZtuEOOhE9DVapFI=;
        fh=CsvTRHMceVuekUNQXu2J45TCZD+NItPyoIU+/mi6eow=;
        b=N1uhtGDsFY/99Y/DczDzx6bHEELifmphFOtwxUtd+8HN2fo8rx7d9XDZ2CjwpXxRMO
         dBV7Ou2UHZL1qOx0ZApgG8+yVWh6R+e1kFYNy0eI3J7k1jLmhxjyrVEqirPxsJDNcygq
         y2ItHYiUGIW0JxiWYusJsBLhRU3WIz4A1WNjCSpzawRP1kQm6pcOokaK00usNiKSnmzr
         MR1sqYNmYVyMPkG3izb7dR1mrsylvQP7qzBxOtU0PQ/gX4GnpfrzRqE4Cm2EE7EiJVnm
         ZiGBM/SczUmT9pyaKkDJjJJ5+BnRE/N5X8Je/YxPjmK/3ekrDvDtx6y+saORHF1dX5ok
         7MqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769015900; x=1769620700; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mH57UL3zKxPP/ZQWpo2MhyriPEJ2ZtuEOOhE9DVapFI=;
        b=JGQQewQYfxvN3zpqD3exBnJ+opne1t/vIWU4KXPzbWnHO4JC3Wb1A5ONLXQLnxFLOx
         tf28F6keAa3XH+eE7LOWf9rFU4CUXnbO6+FWlUpwNGNBTTE+LmnC/9xtlZuGAmJpNPP1
         4n49wgt2c97iin94dv73MRtOkyyryA6PzxvL6wHhOzoHOwfal7Ij9L0msZhZ3W8HShcc
         feL2a3kvfQymDbOdIQd7GKBxO7QtoD7/vBNW7UsPOI+bDOdo/1LFfoHbXxQ7CkjSMhsw
         Lb0Dx9RVm1M46vpw/WdebPFAgeEkzB2aPuwRO7CkLFmkH0OgA0wH+pNGVq0MdE2lFjlJ
         DYfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769015900; x=1769620700;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mH57UL3zKxPP/ZQWpo2MhyriPEJ2ZtuEOOhE9DVapFI=;
        b=pMCFC2i7VAhyM3XBo2IDKnqhCOzwVVE1hAL0T5H2r0wOAuXw0gLXqbxqxqMzBKkzyI
         1DWdCzNWZSTGa2HCEhxMP/B4mvF78BXS3PJ23Vvhrf7kdcM7Fui9tdc7lT7gjVItBNLu
         +2/IeKqrCVCIKSL/ZGV7nNqp+ppyMT0TKXZ0ak67QMYJqF+rOilFJTV919bq3XhATFmC
         2O+A11BwPajEQ9XRoZYosq5vzWpSYRCCJFaFGzP9caQkkcvyMplMaQY3RtjJvMEZLm2M
         E1Iffym+ZW0GjQIhjyavivo58hryPua1loTQckm2sbiyXryk/a9/t5Y3xh89R4wtpYG9
         Br+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUeTT0QPAdNkHHikczsnvyxXTh1JzlLMqif9wJWlJCgv/WNgMp6hcwXZKcSDkorBzVwwdF+Q+MC9In0@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5DssCwJftI+lm1J+YUOcptguoH1/4eLJXhJmv+gy8yoG8ZVo/
	8dBZ5oW53jYcWihRKq2dRL54AWMzP8xXsbMiKWbXZvd05G3rQqBAR18nRbYgEbg6NXRzk3BNwUG
	W6sELK15R1OyLQd3W5zxQtFIKqsE5rz4=
X-Gm-Gg: AZuq6aIoabaeilyPwHSZBvDxkUNNAXb7TVjvWISyS5M/SX4J4Cp8Qv+541rfaPO6mZL
	lqJLhyOU0rlI7umR5uokuUhUUUGjgBI3gZKEeEkkDhhKsHcdYtqZVmW0lSxpFGey2FNBtu9XAeS
	7TnGeoFusUGrk7MYODEo/SgJoGtkp9x//c4zfKIHAizFKDdus9vOI1mpLLWnFqE+ElNo2jFVZLf
	BaFFHi303Gh8R+fPHz+32+Rzz+C0D/buxmelAdLrxYywb3qQj+6zGdfL2emAnL5tSLYyl+vC6+H
	31d0h5Kol7P4NZsaf+H3Umz5FoBYAYN3Hwu7dRS7bxPOBB6DCEccvqTsMPs09e8yzvhgrtRsoBT
	G8ZoZNgMUOa+g3fbw43w9n+Q=
X-Received: by 2002:a05:7301:1113:b0:2b7:24a1:865d with SMTP id
 5a478bee46e88-2b724a18855mr16833eec.3.1769015899955; Wed, 21 Jan 2026
 09:18:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aXEJZ88g0Ng2dIQ4@sirena.org.uk>
In-Reply-To: <aXEJZ88g0Ng2dIQ4@sirena.org.uk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 21 Jan 2026 18:18:06 +0100
X-Gm-Features: AZwV_QjLdoLDvIoyc0fUNRDlw_EGT_j5-XRbcOnjanm9VuIEHDq6Fc-hjQhyKs0
Message-ID: <CANiq72nC3-k07aGpw8Bp-sbJcYa432yvtXwxrqNgNj8aFuvR1g@mail.gmail.com>
Subject: Re: linux-next: build failure in the final build
To: Mark Brown <broonie@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Beata Michalska <beata.michalska@arm.com>, 
	Carsten Haitzler <carsten.haitzler@foss.arm.com>, Rob Herring <robh@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 21, 2026 at 6:14=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> After the final merge today's linux-next build (arm64 allyesconfig)
> failed like this, the same issue will be present in mainline:

> Caused by commit
>
>    cf4fd52e32360 (rust: drm: Introduce the Tyr driver for Arm Mali GPUs)
>
> I am continuing to mark the driver as BROKEN.

Cc'ing Daniel as maintainer of Tyr and author of the commit -- somehow
he wasn't Cc'd?

Thanks Mark!

Cheers,
Miguel
