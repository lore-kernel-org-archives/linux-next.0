Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9914968FE
	for <linux-next@vger.kernel.org>; Thu, 13 Aug 2026 17:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786640757; cv=pass; b=Pg/5vFXOX1wLDKwytzaMJPzKBxpctjO3C44KVt8SlwTylMWQ2g70Wdd8HlFcTg4TDyHpqbNQJoD0cVtDdCKd2WwpoHBUfAMjT9hlQCQTIAL4TXepUC7+dMsIREEsfSDzBPx+bQZcENDl0ipbtmRhGOlKnNnp3RGT8yy/dkowrng=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786640757; c=relaxed/simple;
	bh=/FobEjU8guTellrxNe6IZRoFv44S9rWM4H5UbUpJahM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KcmNVLUJe6SCmjk3h56O0s3qH3BS5/uOAXBuA/mkQJ7UIE9PH5ONjdthIgxxhKDvFHq1G5ytImEVBMywF9l49ZCe9E0RyzYwktS1G10y+Kb26V9MrQVfRdBYxCOltjahTp/IWXTxyOxSxNMJ1MIyD4GZpLQ4aAVAValOoYPZPiY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N0daqiEx; arc=pass smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N0daqiEx"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2d319b84213so308085ad.1
        for <linux-next@vger.kernel.org>; Thu, 13 Aug 2026 10:05:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786640755; cv=none;
        d=google.com; s=arc-20260327;
        b=duGVMHTeHya3kczz307MNrOLMwRRaTX4K+wQ1Kv7AewQ6IJaPt68k0MxLzrmP1Gij5
         CZUWsiBhNdRcZo8Hx6iPFQDvhsmuU8oU/OcA4m4G7aCRVGXqE8+M/SkMHQL+08583PZa
         JC3E7E/zeEubXN0izXlqS9hXJFEZbUXhcilrLAtXnbE8ZfiaVxIE5hi91gDY4qaLkBVy
         kLrc6fd65ts4XDJy7mfrOrj70O8J1rYchzA6WEZ1Uu/cqFFO4JqzhtgTPbHiZMZV95Di
         UN0d4dIWLL/fghGXrjbmN0CB0XcHHzQMB7uo7OVWhFFvOn3DBGzNTpMszgLX9ZfejLDb
         pROg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/FobEjU8guTellrxNe6IZRoFv44S9rWM4H5UbUpJahM=;
        fh=jXn8+6TaCa4La01BJd83glhm8d9Fc8LS+SUWZyWSmFk=;
        b=XQLYLlSLANeV3sJnO4a8+cbHSfXVlj58aJXTt11CHj86Ks8YHaIoe/ieP2kWvSOyMO
         DbTSYpoj6Bl/LgJERsBm6Q4Sr8GekDzmev/8YWJD4zZPOJ/U0ij3eyA1kY3KncgWwGFp
         Tbp7xkZ/BvXeHJRLN2VtcLuguYyB3AVLy8/T3jMtgiEAqC6e07Emi2g37e3rJyXiMD6G
         XiBbOaGrEZp9XU9sg31Q9dFpuLgfXDqupXrLQFChxUROmQN8BfzS7G8mVm6KSk5blOEj
         bqv6ZyGMFphX37HgPN2SkSuYvSCTb4/vA0RcckNPrv0s5lwVdqO0bPg7CaArDSLLDOSi
         uicA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786640755; x=1787245555; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/FobEjU8guTellrxNe6IZRoFv44S9rWM4H5UbUpJahM=;
        b=N0daqiExJaRR5G4CRXB3X9aHjyt7m17kgpiTw2uRop56klegeJcykE9Eb8Dlqk5k9H
         o6FvQYoJjlOjrJIqjNo+8xh60abrCduyu+DMeyiUrhaCpOKq3Pir3YIKZs9xo9MK7TSw
         SIuHRK210RfnP+3pB1bHhdUG5wGOKhnLdX/MaFIYz30OxQ1dQANGXx8C2rHWDFuUYdRL
         p7/btST94UmycVMPX1g3Y+A5tZrDZZICfTuwMdhxYtpBIchzDf/qtPT053n7jaATN/eN
         cCyW9IfoHjmJVQ1xTyaLDeTC9650mUpurYBQpqeaU1ZSZopK5XBFWOPEIkRQGuFnl15m
         2EGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786640755; x=1787245555;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/FobEjU8guTellrxNe6IZRoFv44S9rWM4H5UbUpJahM=;
        b=ELmtlnuRIh1MzQiV/9FG4E/arTH1zxXyPiMQwzhMzIGbaEV1DCd/8ReefrCzqfM4WD
         LfXTKnO/JwKh7TCSVdyIkvRTBK6N+jdY/PaSiOZxK9PtSglA14H/qSY087DhNqzF75BC
         TjDs8L248SwfHNNs/09LE5ztf/Kgq5wBfX1lTDthDRm26rqVKIqbJ0f5MER/bIBxqMho
         sOteQNOt0jEACs+cZI0CBeQREEmVM/mQWrOf7vgaWLaUtyuaNZcL5oqsZfDqOlQutMHa
         gqOR5JpKb2XpqC0UxkYUW6r42F0P3L8VXlhg8wrsDJFa9/UWhb0BrwMjIEx+DvWR3/8o
         tDGA==
X-Forwarded-Encrypted: i=1; AHgh+RqSegM2B8tRfbjVYcLy+EQfeaSb7B7jlCDjR48OiEwnmsBsWT5hkLZF/iM8s8aakFpcseeG9kNQJacf@vger.kernel.org
X-Gm-Message-State: AOJu0YyR8/2Pcf7Cfp9KTPJc1LXwIwRRxQ74lelUQR1E+ARL/c20WFyo
	GtzjXXfhRyY5sEU8jrZoqa8FNeOUbkXynrYvje9HNtSYdXJiyGcMB8I3clo1J+5BQzmwdG0cHaq
	DAlqaaOVs3d/Ow8tqjFIi95qBTgFdPS8=
X-Gm-Gg: AR+sD12g6I13Jnx/R0AeKykd0vht0OnabcaLyCcCtoeqwH8T+t3XvUf/nZNTkgPPyFA
	Nhu52xaSgp0dOMugXxjKFFrMFl2+FtuwgUKIYJVrC+j3E2UcsjSM1GctXrSyKOD8xmj2IN3nVO8
	rfzjwJk9tmhhaYZeY2z2nkj0ZAP8V0h8VlF4+iKMqct+ApD9FrSws/jIcokns6VcG3N8go+mCFM
	CWgaN1NwudetU9Qfaa7RPzILKOo6YedHPWcc+T1sFqtQtsNtcTc67Dp6H3lPy3uVVuFV9Evcc2X
	smJVdRdvv0xsdwb+zZxZfSSI+lzrG3r98MFS0YuRvgxUWgMDLLo3UJP3/LSBAuHM8K+lMSA1pYk
	9f+9HxnXcfSz7yOiw4iT+RXlN5gOcTuMrTAAK0DMT4USojRSqDZFYrtzjJuuE
X-Received: by 2002:a17:902:d4c1:b0:2d2:a952:2628 with SMTP id
 d9443c01a7336-2d389a366b2mr49581025ad.2.1786640755042; Thu, 13 Aug 2026
 10:05:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260813163951.1102583-1-gary@kernel.org>
In-Reply-To: <20260813163951.1102583-1-gary@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 13 Aug 2026 19:05:42 +0200
X-Gm-Features: AUfX_myJHF_5LSmYH-kRYlFZT_KoS0gQcDzZRYrk0iiteBAvYhXUy-yTToKQj1c
Message-ID: <CANiq72=LQj=f+mdH8FoWZ4X8nyk_crnTUaXZpGP-6sh1CE52zA@mail.gmail.com>
Subject: Re: [PATCH -next] rust_binder: use `LocalModule` for `THIS_MODULE`
To: Gary Guo <gary@garyguo.net>
Cc: Mark Brown <broonie@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	linux-next@vger.kernel.org, Alvin Sun <alvin.sun@linux.dev>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 13, 2026 at 6:40=E2=80=AFPM Gary Guo <gary@kernel.org> wrote:
>
> From: Gary Guo <gary@garyguo.net>
>
> Replace the `THIS_MODULE` static reference in the binder netlink code wit=
h
> `this_module::<LocalModule>()`, consistent with the move of `THIS_MODULE`
> into the `ModuleMetadata` trait.
>
> Cc: Alvin Sun <alvin.sun@linux.dev>
> Signed-off-by: Gary Guo <gary@garyguo.net>
> ---
> This is to resolve the semantic conflict between rust-next and
> char-misc-next.

Thanks Gary!

Cheers,
Miguel
