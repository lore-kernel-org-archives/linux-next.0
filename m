Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228C8374A1D
	for <linux-next@vger.kernel.org>; Fri, 31 Jul 2026 20:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785531103; cv=pass; b=BWGaOpE19wbcqzZaWXgHGKz6nKmHQpz3pa6KHaBI5x6Jh2Qj3eeh2kbQz2b6RebJnJJHshRBl5tiPgCynYzvdvgS4VYN5ofss2so+YRtErD7+gzU9k7dM4PUK7UmsGQzepbP1rABVQGwVQqmwlKFnHKtJNLphMHHYQh6WStXWwo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785531103; c=relaxed/simple;
	bh=OxbuOqBUDf0zEq2+sdz0xSOwBTc4dGh/77CekjBC2Ac=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pNWbIC5HR4l8aBoi41iyDO53yCAgF16KQAmusMS7EXaszysvTXwelLJU61A1prI6hjDWaCEMFr1DHFW6A7P4GKEfY6YDbtfOxz6y/pL3xFbd4DXVsNskAgs3reV1N6ZPHXNDaZvTdUwwKEYYJ47R4Wo0Axyf9TRJT2ec9SkhUO8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U4QWfDGK; arc=pass smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U4QWfDGK"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2cc8311c6ddso1058505ad.0
        for <linux-next@vger.kernel.org>; Fri, 31 Jul 2026 13:51:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785531101; cv=none;
        d=google.com; s=arc-20260327;
        b=KTlO0uPOi6+P0a42D4Tc+DqeI9Vn+tTpotn8rGQjYn6KQfdBbBr78+JH3fv10zZQCu
         7Hzdqc59Elje8dvY9SEF3+6UlRyTlxL8jYpo6i7+EgalY+bEaAz77BVtEg0lOgJNWb/X
         Yx1wcR/skGJkpo9mGfVKYcTWaxehTnEW9zVjf51e7bJMNIFSvdTpgoEQTxu8x5npgoOO
         Nj7l2i9PVTD0K0Tzv2rJk59ezeaCTMkpTG7E8bSIg9FHkI8Em3JVOJwob4jsY4pmm8A6
         L+vrYdR2i7mUgvUXOI6oIfP8a8+nONv/IUavvAXFW8M64kYIwVxcSZNbYmhY4ECnp2TI
         p1Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CAHO93+TuSaVjWdABjEBhboCfEUfTIMzn4UFc/rE7b0=;
        fh=oTQzFHK4fnk4U0g9UUUo7Lu8jQkak6BElY6VmkGouDk=;
        b=DLH1ghfPVjLhb8rxQaXR950fYj1tDmSpDHCM0dER2hUvW3NV4ywt3VgJW13hsGPK9e
         lBr4AikFZdBp6uppAbhUZ4yw+Whm+53hlBbrTKk9p4cIPoKOAq2Np6MCSyWdxkX3CIIA
         RT4ZICrq0TzZ3aspjr/4g8Bk6Tpn08e0Qrh4fEvu9YWPijShWWHS8zx2Cfq5UIIj3Zvx
         bWucW8Flr3Tbf/AH1HvlHx91V/vF0CKFJxs1UdYDXsed/TIKCqKC6DJKtCuDr3Zwn46y
         VJrisQUAjwB3rvu6OWHdiMhMaJGFDLy7/7h2aWp9Uk0nyh1ytxloPWlApXnxM94+FARt
         jhCw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785531101; x=1786135901; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CAHO93+TuSaVjWdABjEBhboCfEUfTIMzn4UFc/rE7b0=;
        b=U4QWfDGKChVzbmns0CT5U5xXnukRA9Cg257QlMb/xv3+2fKrtE71WgwN8nQPQAnbJI
         gpAKOwsuDIQz87xxrBXPg754J6x/8iA7fJst028KcWCZMh7etkqSvQus3lFhkL3cBYxM
         1UaVBAxICNBHPum3qKWXiCUIVwSBHGNhglvYP61gtKfcGVBbvDV+5rAWhwwamHmVLQ0x
         VOs8wRqNyWFRBWf7TeU547Y+H2Z9ORrqqs4f6lEDiiQUb9+VbsxUApau+HR391zJFjyg
         RDqx9ndiA6CErB5dzbvbbVGPabTHPNNqNHvQ/9SwYFOps9JBD1vsn3MNo5tAYdJivr7o
         Ietw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785531101; x=1786135901;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CAHO93+TuSaVjWdABjEBhboCfEUfTIMzn4UFc/rE7b0=;
        b=H+uS+S2lHNSI9JLk9aNHZuNeTVzNQCj3ioFcGoR+cjvdOYFZkFLlpn5K9QdACbHKuJ
         ejAkb5Laq1tshKE/fnB13WeCmyKSWs3K9N4xJ0l23aVUCTcW+l4oV2N3GOrcQc9CWZrq
         XCAshrq0BsbK95RR2d3DuV+kc/AGe9LOST+WniaSLUAnR2azUo5RinT1rgvaouh0DOcr
         PGIOYm9/eujagAnZqjSeszTN2wFjHtmzSqHMO9/h1aL+me7W4iTLXIlheE3OlpV/nhXJ
         TGypLITEZzmBCcCnT0Z0qlG0ilirE0m2hUB4lZHpMQS44Y6WmMsKhMNCjDjhzRRlFhG+
         rc5Q==
X-Forwarded-Encrypted: i=1; AHgh+RqTeUfjP7YTjnbw3DlOHSCtUOMsiRfdFtWNMfmrkY6EuLLvM8GZtXpXHJ0c7qSP+6Qz770QSF5IwLWT@vger.kernel.org
X-Gm-Message-State: AOJu0YzS9eDs03KqDjHajgdsZeyvVfctIR4Xte5vaQzfHDiXPErlo6Pj
	fm18UgP+8QwTLC48dvcwAEOcer9tRvkSUp4je3xtD9fjl1M3/4i36a3P+nE8UTPTA7vJz1Qz0y4
	yChi152YGWgekPxEpO77RO1uJrL+JYYk=
X-Gm-Gg: AR+sD115gE7C02YKeSyTuqs6T1aGOrtC8JjO17zO7lyBCqy/IaUYhj2o/iSxk0tbUI1
	nyEPvWyra1z/pYVPYoGs6DY8otYjcyy4gf1MR2uQWBPpnMhHrCUWgNBhjCMNGnDigD7KWxaHOqs
	FV0p2RFPRucT672I/wy+ex7kMkl4qR7FCWWziCb/ua6pwMp4x/kwdjV2lrcIYW4M/X7qGB7ytRY
	YNQMcWxa0qIx+05CcLhFLkh8e1SX77uqpIrGrvJm3Bv+hC6uMVV59hp5pykE5CoUYKHHxPqF7q6
	IaDXIRxlwII6cuphZ1tjIujJMZa8ZvIwf2mMl3aCCdr6UBTPN3BAs1AikNltEiMvaO5DN/KoCOQ
	+aKRl6eEVqQCTRUCYD3BwXjOzudYRy92H1rEwIt+RbzMZ4Q4uX0dZmQEOsn/WE007W+koPAk=
X-Received: by 2002:a17:903:1a24:b0:2ca:ecf6:9105 with SMTP id
 d9443c01a7336-2d0521bd8a0mr17962065ad.1.1785531101357; Fri, 31 Jul 2026
 13:51:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <amth-CMf3Xz5hR32@sirena.org.uk> <20260731075644.20215-1-ojeda@kernel.org>
 <am0AjzHc0m03CLVa@tardis.local>
In-Reply-To: <am0AjzHc0m03CLVa@tardis.local>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 31 Jul 2026 22:51:28 +0200
X-Gm-Features: AUfX_mxl0TkTB6z9m_YRa1AG5A4iTSZPQXDapGjb7m1rxYpxgZ3XxZIp7LqWkOM
Message-ID: <CANiq72=Lw7kTRuSTs5H+4fshGK74dJvwO1Mof3HCmXsAyEMJ=w@mail.gmail.com>
Subject: Re: linux-next: manual merge of the slab tree with the rcu tree
To: Boqun Feng <boqun@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, broonie@kernel.org, harry@kernel.org, 
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, paulmck@kernel.org, 
	puranjay@kernel.org, vbabka@kernel.org, vbabka@suse.cz, 
	Alice Ryhl <aliceryhl@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Nathan Chancellor <nathan@kernel.org>, Bert Karwatzki <spasswolf@web.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 31, 2026 at 10:07=E2=80=AFPM Boqun Feng <boqun@kernel.org> wrot=
e:
>
> Cc Nathan & Bert because of:
>
>         https://lore.kernel.org/rust-for-linux/20260731192522.GA1014697@a=
x162/
>
> I actually prefer Nathan's fix, since it's more explicit about the
> kvfree_rcu_head requirement. Alice & Miguel, thoughts?

I like having the right types as a general principle, but I guess it
depends on whether the maintainers prefer a solution closer in spirit
to the cast in the C macro and whether the plan is indeed to have
later more invasive changes / user-visible changes etc.

Another solution could be to have C helpers on the more public facing
API, but I assume there was a reason not to even before this change,
e.g. expensive.

Cheers,
Miguel
