Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA9938DC58
	for <linux-next@vger.kernel.org>; Fri,  7 Aug 2026 07:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786089100; cv=pass; b=RaGy8liVZ64o8rn7ESvqbCLi+I8Nuji+N3raBtlMC5frFVApxNxzof/jGq64Is5YQPmZ1Hn/GyQb9YMs4NoGJPDqtT4XKO56MmSK8hluZc3V24l+d+IQQTb9gYGrTLmWasjsW5aaX+Zk7Xk//meTxWFCYWfF8UC+RveS1TGaQeA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786089100; c=relaxed/simple;
	bh=egIrnyP8nideDOsLCuz1AMPteQiUYBHGrUa0X/zOY18=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t87//TBQmWWTRwJvUG0CBA6uC7mtnp87wMHhXlAhMRwyhlYM7Z007LkHCWRZkYmj1NV7lMoPSLgEWKjAB8xj2HlpQFsi85qUulcVTaAeZux4zStLDSlM864NFdtHep0XFA0DDQy+t1puhVEsmTugywZuk9qn6Jy7jLRBmamimp4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DC5vvdwc; arc=pass smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DC5vvdwc"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cb20b0a387bso321351a12.0
        for <linux-next@vger.kernel.org>; Fri, 07 Aug 2026 00:51:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786089098; cv=none;
        d=google.com; s=arc-20260327;
        b=B4OVxoOLZi5PW05sAFK9VmuSi4p3HdNU9eHnnVwfkZfXxYMYDsk0FZ1w3yfDwZFrf+
         1FqH4C2ofqTs0yVVX8a5tJGLULRyjOByMyJl4vzc7ux5FRgr9ZxK3J5XaHd2/ADUa7KI
         0CHIYJDaupIYupRYmSXwvHBVInlbKp1OedvNQOSjwmANX21PSxc7Xf9mwQy3BavhMpen
         zgOGOPbqNFbwNo45NuoFjF2vJQJlBqCr7PTr5kTfTb1ZI7UyF+Eyqx3F9vilSsFrCZ2b
         Anf2HERXA7Qst4EFYDCV95YPr1IQAHZFxat3tJfrnOZ8G7qkLGwuykslELP9qn8o85Yj
         J8XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4dbt5Ccr112sjavAehr6ouepSyHDIPtG/xMCYhfgEAg=;
        fh=JI7h+sVjcsjDcFj42u+D748VTwr4oVl6j/ix2F1TXdQ=;
        b=PXQOstmnScCJ0bmof15wPRK4A77ihzvY111t7dcFzdg3lcqJkRarfvPApk5R7z6sWk
         YigZaaavTjpxJ65xc/VSq/uSTcCr8VP0yqkMLiCWd6Fw2STi7Su6DcYXbCDZppKtIoy1
         biUCExPHXJ1FvW96nrkfriKWqFZWGJHOX9NecgCrtBGVxzdHwBYlAXiyZdqgwEDpX+q0
         8yiRxd/79sHPh2Z/Vw/EYPv6RxsqqNRPGaNQg96QFTYLzQJHrHoqzld7rmuQJgHdmp8g
         jgY81yMUf9n6Kq6p7QOiwrKxwWGqA1loQ3x0/be0T695hJ1W2ZV+SYAfYyI4lcxGZkKG
         Xyog==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786089098; x=1786693898; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4dbt5Ccr112sjavAehr6ouepSyHDIPtG/xMCYhfgEAg=;
        b=DC5vvdwc0hxYnYPcydmosrREluH509Yp3zex6muJBnQNeU4HxuQ2NfsWaR2+Khaewd
         BhZRGv5z1kkRMMEuArX9UcyMEpeui0wmo6hZBsRdADFblZyA6DJvVKWHepPigK+yvZZh
         Rmp6oXPeWjRUF5yzvScCKDAvMTROlQ5/iu4Mr1Qwei+PJ2S1o7Wfn4gJ9x1i2RC/O5QL
         8FOeOGGByw5GulqDb7yl+GS/6dp2eD3WwFXw+pleFbzD/g8jQW6GJkqwUUOIjrwH8Kuf
         op0YAJ/64246iIm344KSfbSIIvMPHWW6UST9H+NXIVopRwR2prOd+5Vyn7ModfBqrNpC
         taCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786089098; x=1786693898;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4dbt5Ccr112sjavAehr6ouepSyHDIPtG/xMCYhfgEAg=;
        b=iaSwye5rWbpCZxNnNcNCwZMfDYmrb5sV3pEGZ4iqmrwGg46sS7AXxdSiS6b1RaZ4Yl
         WDec1tsSFvBH4GiLGNz/nwCPeUJ9FsCKc8c2iCYqhKOo1EFTfhnqOux7nZ2VrBHUc9KY
         PAeH+Uu6dHj5Xr68nmfoNMkYcBJ+iSlAuif8NrT4fMSpfdClpF/vFx9OwYmjSug2wFIH
         4z0h25Uxt6uLIdDGoWXD1QVHXsPX1q5BSL42ieRE3I0bYSMhQUwmjIiwTuY9WNDcYSEY
         kS3shezhOZn9GiEOeWV+9qXBBKKmyFf0snM30QHMzXquLp1gTB+DFpQ/PRjbxMhc+y5o
         GYHw==
X-Forwarded-Encrypted: i=1; AHgh+RqS8UTOySGcvP1L086cZOTuBLHNvvedOgGatUAIZJMPL06iu3ApCtmAcS8eatJrIP8CDqoLtkyIsWba@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq8RoHEGn1O8NJ9bh1l9MW+2St7zr3kj6SjanPa3IjqtJUgDii
	QsvufrivwfSo1TcqmbDx8/nM0H8tKECX3hSSVfo+5OnLSjwEe3ZIQyscPhhPFpTPAtmAtbzIZCB
	rPeCZMA9ZzB8ayYpRWYCIV4jodlxBm5Y=
X-Gm-Gg: AR+sD12mc4fthhzQJMXPfedjYXgZD+Ey4MGWnZS5yqN5oBsFCvbA+bsmD2hq4C7zUWq
	LVUxzHlYgi1JHqGdVj7z8atgmPTC0b690HX5xvRD/OZ+Bdjca2Hq615oAJgr2Gd78mTi5W0Xatb
	Sv+Jr4Za3Px22nvu32txMErzvCiAEpRc2PuTAhCOoSbtaOBFej4PWzjG8Yn4INb30ApVKSWoAk2
	UeuiTYHPdBui6bymeFnGXaDhG2SYWKucH7hz9KRX1GC31zp7F98iQQzf/CIgpSL5oF4+VZQalqJ
	twKfP0KQsN4ZOw2EMBo4/7YOA5t7NmnYOiVu7aDl4zxWw9NjF4sybgem4BJV5MC2XfDsmfvJRu2
	M0H9dVtuWMyciBBWbHnEICw1teWc+rt0s373lYz1lasag74zAhDxe/GiCgEtf
X-Received: by 2002:a17:902:ec8a:b0:2c9:ed4a:c3a4 with SMTP id
 d9443c01a7336-2d0ca1658f2mr183275295ad.0.1786089098173; Fri, 07 Aug 2026
 00:51:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260805190012.2934907-1-gary@kernel.org> <20260806170101.67544-1-ojeda@kernel.org>
 <ace18b0e-bda1-417b-adb2-2ba7c36f1c1c@sirena.org.uk> <CANiq72k9hzdU8QF32HEdvpaz9K7JxE2vxfyRFVjaePciyzgnTg@mail.gmail.com>
 <d743e4e9-94ea-482b-984f-cfb1a3b60393@sirena.org.uk> <CANiq72mzVuEfaf0xuDLMy1M25Xu+G2WvEVC-E8Xna52hPTn9Pg@mail.gmail.com>
 <5ce12a15-3f1e-4279-9b1a-57d6b2faf7c9@sirena.org.uk>
In-Reply-To: <5ce12a15-3f1e-4279-9b1a-57d6b2faf7c9@sirena.org.uk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 7 Aug 2026 09:51:23 +0200
X-Gm-Features: AUfX_mzdHTjbGANECZACYbi_K1BQh4EHOE9vha6ZJCQ1RuHN0-F4tdgIfZJao7Y
Message-ID: <CANiq72k1Q0a2R6AmYm2ZDWH4AmP__uFCAVXswX7RQOdnP76dVw@mail.gmail.com>
Subject: Re: [GIT PULL] pin-init changes for v7.3-rc1
To: Mark Brown <broonie@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, gary@kernel.org, linux-next@vger.kernel.org, 
	a.hindborg@kernel.org, acourbot@nvidia.com, aliceryhl@google.com, 
	bjorn3_gh@protonmail.com, boqun@kernel.org, dakr@kernel.org, 
	daniel.almeida@collabora.com, gary@garyguo.net, lossin@kernel.org, 
	rust-for-linux@vger.kernel.org, tamird@kernel.org, tmgross@umich.edu, 
	work@onurozkan.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 6, 2026 at 8:21=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
>
> In general that's going to be easier and more reliable than copying me
> into the middle of a thread with a patch buried in the middle of it,
> there's a chance that if a subject line isn't obviously relevant I might
> just drop an email unread.  I get copies on *lots* of stuff.

Yeah, I can imagine -- sent now:

  https://lore.kernel.org/linux-next/20260807074729.108159-1-ojeda@kernel.o=
rg/

Thanks!

(I think you may want `-next` inside the brackets -- I can do that)

Cheers,
Miguel
