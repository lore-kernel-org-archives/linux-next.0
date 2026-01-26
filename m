Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C340C239E80
	for <linux-next@vger.kernel.org>; Mon, 26 Jan 2026 14:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769437918; cv=pass; b=KWYyfM/Qae/6Q7aT+6HvjRjnmLuz+dLbSdaeFadQ4SlmE3vZ/Xbta11ji55E2seh0oHRVvHfITCN5W0EcDEQyzTcbKqsEhZWFx8Jj/pXWNqh7xRkV1dcYLyoAOeWCCPGVR1TyIyctz3hBoOy1WaslhHl/QJEibiCRXex8j4DfrQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769437918; c=relaxed/simple;
	bh=xi++//p9mPgCpqvLhDy3ZiOM7NuFTZ1rJLnz2axqRFc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h8msFJW44t8uFfSCnp4TOsMDD4rm7FYg6+wabCwmH3CwVg7iYuqFF5U4lngTrUXPt89c24vCcSPGSABZ+1+XLNtn7YRdwpnpZAulqCx7J17hksBAMNsBHLT/xq4msAjGoSRK5zMjvvOyVxQ1OabqgqgPyA4XDTe6qbn+dBq1HXY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eXKUevzw; arc=pass smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eXKUevzw"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2b718524994so209902eec.1
        for <linux-next@vger.kernel.org>; Mon, 26 Jan 2026 06:31:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769437916; cv=none;
        d=google.com; s=arc-20240605;
        b=c7xRomEMRZIE5DuYhIjudjZurxaEBABw8pUnEYeA8DydK1hF1orSErBp/d5da9IBTL
         pSr/ZSeR/WmjgCHiZa3m1+2RtQnYnx2weTvfXB/VpePZgwUfFHkC5Dc1KW+B1nEUn4XQ
         mxkCM+DBJgbQSumstTQxLIgOPBFYRorgWERrC4GaocOPOVHl1MANhqAKaEsxCrMK7ZNU
         XGsJZr2GZ3vZUsDWOPdptW3z203s85UK3+5XiWFVP6F6RfPHmMda3G3H3obDlN84BNcd
         KG2S7hIz9JGHE0XEXZhHeS+qGopLDh5mo8W6ESukdvSFCL3gpc9M8jEYQTgg0TVsXdCu
         8F6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xi++//p9mPgCpqvLhDy3ZiOM7NuFTZ1rJLnz2axqRFc=;
        fh=8QVfzxcm24vprt6cVVOkov7CblmXwAVygyjrGju2pJU=;
        b=IWBCVfY+iB56M1I2xTLrkvX4JOhL4rY+Z/+k05XRdN5Ek3/OQhnQsxxi5YPmBFJGcW
         HYGBHTldakcdXEtX+NvVaFRY2KuvsjdMmhlM4iYMVIr2+cOQyMlU4UnQRRKemM+xbHkG
         LHo4NgTVrQ4Q/qGOtuKxa/fxNAQdQyHsypf2eLekA53VlZnU3HAow6E9hQfaHeB+7ZRG
         a+agD7KZc8hzegNFv0gN984aEO45FFconaajI1LFGjhmbSQAmMuyQ7nHeKLPuUe5mbhF
         KTRqt2PRFKkktgY7z/KFewusSo8f7YJEQgiyzT248Rt+/ybI+DTVn6OlQxeet8jew5K7
         Jt8A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769437916; x=1770042716; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xi++//p9mPgCpqvLhDy3ZiOM7NuFTZ1rJLnz2axqRFc=;
        b=eXKUevzwdoAicv7M+hOqijDOLWs5dkDxldHf3ENyVVMzn5EHps+SPwcFwq0y0smZGT
         RLDJCd6KbG+v2YPFZD6oclAOH/G0EgStHMyy7fGqVY34VEcbsDrerN1SdziKMWu4Hj/I
         avFfuGW0h01vqGLBBHqmSuyNHXJXbzpsGOO1ELFO4ez2lrPQIaWVD2j9a+gMYgNt/fyS
         rh73Nug1t+Md1IVwrpFH3wiYcRSNVbNcEJAkZnPr+o+8++GWFNavaohKPyOKEhxCKxDG
         Lbauv9I89tF20pAN7eCml/TjD3c560haE00rOuAt+7/HPSzZ4T4Xlg+picBKqYlvcnf1
         EBgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769437916; x=1770042716;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xi++//p9mPgCpqvLhDy3ZiOM7NuFTZ1rJLnz2axqRFc=;
        b=hzkJOV8+RRiLbHt5fWAYRUaXhhoW77CBkeDFwGCh1+8PJPnWYVZGt0TdHT2VWC4GaH
         VrCE+CBIlguHsduIS1pUUMyE257616IcSW9OGDVAHCTfbPMiwb8wdugpcN01A3ATZJEI
         Sh5WNFm3IG5MUj94dmlpQlyl+dqLn/+7IzAnGLEUYc5i5cFOksLCdg/+amJYJD6jaIZN
         dPCY3/6O1r5gavbcmwJ2ChWES3QG/G2sXtsghktblt97QGZd+Co7i33u7P+zWEbnLmuz
         YQ8dVVxGm5rzOBnITb76ViINE+V+y0ubpOe84QuHyzMISd7fv3vedQO95Gn5mKCod/ut
         n/tw==
X-Forwarded-Encrypted: i=1; AJvYcCV7TotxcuwP7DYOtAOujaOCB33Sp5ZZ3sso2orM2H/i/0Fp9QrZasEsbDFQa3gfKxXxCTYsfNbtaTpW@vger.kernel.org
X-Gm-Message-State: AOJu0YyDmGOTsUwy6MI6o979ycNHOEPx6OgY/VlsV6AJPvr0Z4tCac7B
	pyU0edy+mAW8lJZ6NbFVsqZ/cJ7togf51YGOuD+FGZK8GrTxbvrAs7cjAsHXHEoswvRLgWybJ9+
	KCWcpo5AJ8VZyQARmugnH0+uYJ93Wzwc=
X-Gm-Gg: AZuq6aJqNZnhkGGzZVlXk5eG4fUKsc37Ag4kkUVk0U4L/YrvA/cnFmGGJVIJgzP2VGD
	6z/sShVFbabClQZpbP8YkFaUH5acmBwDvBKyDoM4z2Q/lUtqbBe/mLRs88L95KkCLHjR1Lvwien
	rLT6TQTYFOefjevgF69tPEX7Lh4gNKuL1SGo+OKHVgFhVahtkDmyrEUOwTSKmioWpKgGgEodecp
	g16GaTvIX1uOlO6KN8g73eIezO7jbSOIxw/7uwrGnBuzuaHnh95UsJGTJYSedBezBhlq28Mupem
	KVUnY7pV5We15NO2+iHBfCEJcQzoLU/lXOsvDyqaAlHAouABaLh5nyWaFeiBwAeeRCeaZD9sJmi
	UQwbLYuzvcBraRh1LFJ0YPi0=
X-Received: by 2002:a05:7300:730c:b0:2b7:103a:7697 with SMTP id
 5a478bee46e88-2b764828e58mr1098566eec.5.1769437915831; Mon, 26 Jan 2026
 06:31:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aW5xqLq7gatOy1DV@sirena.org.uk> <fc855e76-5f3a-458e-82f9-f43c7d23932e@sirena.org.uk>
 <CAJ-ks9=V_JmzEaXUrHPm6K-DyTgkxEhrPCW=2ZgDJpc+4Z83_A@mail.gmail.com>
 <27b562ca-d79b-4f80-be71-ebf5e26ed9ab@sirena.org.uk> <CANiq72nS94wv50XyOJq5CeiVQvb0+3mNdWxJpFy_+2FH1x4RYQ@mail.gmail.com>
 <aa4bc767-8128-440c-a2a2-81fbb6992a8d@sirena.org.uk> <CANiq72njSUPt2CvjBiNyKw1KHSgnMdcBnXNL_pHV4iURYL1n6g@mail.gmail.com>
 <b17da8b5-6640-46ea-ba73-d2f4a08e246c@sirena.org.uk> <CANiq72kT9ThJcr5W0OhBmbwKZCpULjUehNjijTt8W09yB0CxSg@mail.gmail.com>
 <CABVgOS=DHdF6XmVUKH1zTML3kV7ozy8BG4o1dyd07BnngpYx4A@mail.gmail.com>
In-Reply-To: <CABVgOS=DHdF6XmVUKH1zTML3kV7ozy8BG4o1dyd07BnngpYx4A@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 26 Jan 2026 15:31:42 +0100
X-Gm-Features: AZwV_QgGEyw9CJb-uZGi9661oycpowA5WWyOeY0XaeNPcbQBd660gLmJIyINtH4
Message-ID: <CANiq72n7EspYnQ-8WLhVAdqsPk1B6=gVmMiWdoCwMxkHC-boKA@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the block tree
To: David Gow <davidgow@google.com>
Cc: Mark Brown <broonie@kernel.org>, Tamir Duberstein <tamird@gmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Jens Axboe <axboe@kernel.dk>, Miguel Ojeda <ojeda@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 22, 2026 at 7:36=E2=80=AFAM David Gow <davidgow@google.com> wro=
te:
>
> The UML Rust support is pretty stable for the core Rust bits, KUnit
> tests, etc. It can get a little broken from time to time with new
> drivers, gcc-based builds (instead of LLVM=3D1), or 32-bit builds.
> Ideally, those will work as well --- everything seems fine at the
> moment --- and you shouldn't have any problems with just running:
>
> ./tools/testing/kunit/kunit.py run --kconfig_add CONFIG_RUST=3Dy
> --make_options LLVM=3D1
>
> But do let me know if anything is broken.

Thanks David!

Cheers,
Miguel
