Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 318D3357D13
	for <linux-next@vger.kernel.org>; Tue, 18 Aug 2026 20:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787085251; cv=pass; b=tnKLTk1YZsBkUenOBzIN9ZYSl1+rltUOhESfKphSOfXCzlGjE96vvhlwzRd+pk7RPe8zP9DwrkZzfTmUJcI6ffzL7jEGxxaBM7y+/6HkEHE2OpRVmCai6BSG4zNtmCtCEZPjTGsOjrOI4JrIHgmRNthQ/VScBqLv448W2ccrJPo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787085251; c=relaxed/simple;
	bh=N/01I3arb0JvYOAS7rcKtSWOMLBmF1heG9rgEhAN/T0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PWDJ6vxknpZBWxeakDKMroNaGkxGWZdPJLzIHNT9Gzdm3ms9lhMBR8a3ZwZFZuoCiGSWiNThtGjcBl8pH/7TLfBfH5AJvUqGMNh0Z110KTgIk894JTWUAV8Q3Md4TDvkTN/n5Y14emo15lc1oivqNzbrS2zcUS74uU5vAyrtGCA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g/Dbrtp+; arc=pass smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g/Dbrtp+"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2d5862bc921so764485ad.1
        for <linux-next@vger.kernel.org>; Tue, 18 Aug 2026 13:34:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787085249; cv=none;
        d=google.com; s=arc-20260327;
        b=ZODjyDNQj6Gf7DSXcH6V/o9keYHmEi6OCOPHGqtc3fksQQ7XpD/LyoD0JqpZtQNl3f
         vGA/Ka6XPT6QgMTNbgQrjdSTk62DTPlTgc5QhclZqKslvT9ATt/cNNtjpYoON26FzYeD
         IcMwUw0OpXUKmBfymVnO5e5hh/2NMx0/06IMn6HszoiXT23+rRYhsx25GkUgwnsVXs55
         SUJbniBLa3kcVIX82acAMsz/yKpz4XFPlD4b2D8T0YWa11EnqgN1La3XxakIYSCKaKZS
         HXsJQBtWyTsAiOIsiSaODXFZR6aaVTu2SAtF9yyzLNri0OJ2P/dy8LuzC1wzSnTkDuUw
         VDAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wejPKdrPUvNJPxSOuhkO+cKcFWDhbqdCYzUyKCfy1WY=;
        fh=DdnrlbiGehqOP1Veu/5kMGfSinipyZrRcMHC9v4aOEc=;
        b=fq0lh8cZs7zDtmZ72iUbCbNnr29h/j2ijrWt4M9+u7EynIAf/IOLU4Zrk7Ixc28R+a
         eOBMvDy0Xl8Z4EA+A5iaJGD/l8DIWg6PAVDd97NKE96emJgkwgDJHEkdw+lq8hQUAX24
         4BRsiaz2H7kCQ3Uj8msbKjl5K0RRX3cZaKcvGIuzpf7K1rrmGXAEsG5FmMgsOzgV+N/9
         b4+Zmw07lVc12hqoyj2OHm70ZchdITS4UQwbU7cOdoQgJF+CzlIF4kwx1wNmMbcNy/xT
         96xp23n7gJc15A9yLk2ae7FASr8VMlmYulDjJdj+AkG59XbDNAN8TKr6rjJG82b9/+U7
         tj0Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787085249; x=1787690049; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wejPKdrPUvNJPxSOuhkO+cKcFWDhbqdCYzUyKCfy1WY=;
        b=g/Dbrtp+AfxjbVulbu9yVJa4DFlLoOPD9FXd9vNQwWZxaGG05s+eXAzz4z7uoLKy4y
         TqzVEDk3tsEQlQzqpSOeUhArx+Adv3EU4WSwkUKlHfYFVv9mGTtYKuLp+gobgBtfuHfL
         cnrJrgrH0m264VHi7tbqBIwovLmoIn3HV+BcnNWljjren2vBQBwrzb6816MejNzQ1zKL
         Ig8BC9yc8MqYUhRmf0MqFIIw/7g/vwUh6fR7HLNiJup2N52z8ZBwrIYa8KiHeHVqkud9
         jTyo8BY2qawX0/lvK7Ksxj18S3e/cbiYkYLZHJnKUd+DsKKuElKHPbZpAC+KVNtkVj4J
         wsEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787085249; x=1787690049;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wejPKdrPUvNJPxSOuhkO+cKcFWDhbqdCYzUyKCfy1WY=;
        b=BkITTt8OxeInoW+v7g7R/NMk5rw5xd7sb0uUR0nc252hRP7oJE0COwz2ZLjF06iMzy
         jb1/8A+omqn+4zBegsKY+ucx2t/VUfM9nxXq5hsjKbVHTz3aPhLHHxRQB13MlvLwPBOF
         XE1QIWSa+BA+BITn0LsKjruFhhqer3TkGdVtc67Yzk8tFsc8UZNyaVpXfcpmZtVpD9/M
         vWfujbrhbFtUmNwi9AaY9FAe6Cvw+4WsOyGwpm/2GFCWHYR0bbQH0vAvRTSKy9KvDVVz
         vNAtHuKFAYqgPIOBMpBOwY1+NkXIqne2VuyUuqhUY1FnYFGURnVbU4qOWrIjwrXY9FLF
         MN8g==
X-Forwarded-Encrypted: i=1; AHgh+RpTB6y5gE7CktkuH1Q/YYDeDh0VFjIEHvat1rePiv/Vx17YT8Mygw7+pHk/y5847CK6hQ0Z8yO8OTE/@vger.kernel.org
X-Gm-Message-State: AOJu0Yxiw3zqt9Yo/vWijWi7plnFiVQt1t4CWrzuJU6zr9Rp7pbHUObX
	NkV3HbFue3EIktzVK+AtznLGdcI1dcWHOPCDC+emQSbO/Xg863FOyjDLNwzxGKHh7IWxBGnRgMu
	ugrPmdXhNm8JuG98RRL3SNVVl6iNVLu0=
X-Gm-Gg: AR+sD12v5moFLZARoVGyOJ9NnfoYsKIJsabnMXnYC2Oo8bSiJ3J+b06YlAPPcaw3b3W
	LKODODWWxd8NsvqHRNgMdyw76LaPjWyyYAwRQUh6pXQYbB1iCY46ysweYFWCnzcHChA/gdRbD58
	yn0FUXnycBIEMMXvIT/+71jHloe1U08z/rapZSl8thZ299nlZPyjhm+Um88mIq5HrEr0rd3e8Do
	V96Serd4/ZGsdqSzfC6xHt7P0x81zgLzJ84x9VBa5+/JJCeaylTZJFTIRJF1TRNC0ojuDWSsLg1
	rHeXLuuHxtWMa241ePiJMgOAN4b8xmtdtwDoM1laD7KqS7JsquWMIz3DFHvOkflIgJ5xZi3Af2r
	qXoHZDdvuH2rp3nb3YTRheEruGHRmEctNxh7zRPTr30sBTM/VQBXDC6rc9xpA
X-Received: by 2002:a17:903:3c70:b0:2c9:ed4a:c3a4 with SMTP id
 d9443c01a7336-2d5f690a7f0mr4953075ad.0.1787085249513; Tue, 18 Aug 2026
 13:34:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260818105350.361218-1-ojeda@kernel.org> <20260818125558.GB5432@nvidia.com>
In-Reply-To: <20260818125558.GB5432@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 18 Aug 2026 22:33:57 +0200
X-Gm-Features: AcwNN1XP-VtoOv-Bd7VIXi2fonKPLOID_bFjP-ajOtYy7n3DsuJ1tYHSHyvOurg
Message-ID: <CANiq72=V2EK_mt9w+7wvMws_=8bowjxtGALzA-k308gegyWDTQ@mail.gmail.com>
Subject: Re: [PATCH -next] rust: fwctl: replace `__pinned_init` with `raw_try_init`
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Dave Jiang <dave.jiang@intel.com>, Saeed Mahameed <saeedm@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>, linux-next@vger.kernel.org, 
	Jonathan Cameron <jic23@kernel.org>, rust-for-linux@vger.kernel.org, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 18, 2026 at 2:56=E2=80=AFPM Jason Gunthorpe <jgg@nvidia.com> wr=
ote:
>
> Linus will have to fix this as a merge conflict.

Yeah, I also warned Linus when I sent the patch:

  https://lore.kernel.org/rust-for-linux/CANiq72=3DXMeKaO09PhYkwHwxXO6uv0dV=
pcxi3tAOLzrmnvA=3DEgA@mail.gmail.com/

He already merged the Rust PR earlier today, so if you can remind him,
even better -- though I expect he is tracking the conflicts list I
gave him since we have other unrelated semantic conflicts this time
around.

Thanks!

Cheers,
Miguel
