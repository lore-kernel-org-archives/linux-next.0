Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85FF23D410E
	for <linux-next@vger.kernel.org>; Tue, 20 Jan 2026 22:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768946942; cv=pass; b=jLqsX+Y5ie+Ytc9nT3cMBw5BWGukrvHX6d008Dcryn0gC6BEDtfSn2OV/5LfmmQCVFLjsRoHw1K4Jy/NXqMjKUOwkn0rgivWvrY04Og4ai7ueGxPL0K5cm+qrQvuyo2m0Bqp58U2sIoTis0UeWrQ2LJ76pHhINik7z3RvOZkCCk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768946942; c=relaxed/simple;
	bh=z1bB8kSjZa9JR9hWpCGXZYW8uom6DdNyXKm2SLrmLeM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jYnXrfvglxfYV70cpq7ecw5xfEBLNJS8SUMntaztCJPP4zUIVUA1ykl7raq4mu81u4MiuDSLdLkS4/pgddVsyGtFX48znDg4M7WTWuWwuHBc6BDmV9RxHO+Ozja7lqrEg/40IEVLY6BGsUbJbaL2OMbmBSy8QQrtN2Vp8h0pMKI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CJUow7EV; arc=pass smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CJUow7EV"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1233608c7e9so407085c88.2
        for <linux-next@vger.kernel.org>; Tue, 20 Jan 2026 14:08:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768946935; cv=none;
        d=google.com; s=arc-20240605;
        b=VbrM1r85Qi38Ga/Co5agtnMbdcla0IHnzDEJ5neTWD7c1K/uP45TICrh18L8ErWt2C
         rcuYC8dbGrhQ4p2DdqIQStayUHj/TycjUd6LjmJoOGW1fEUOHyT+cjfunAxwlcXWQhEK
         J9QJed/uHOaIe9oc5rcC/uajyn7w5uxu8Z7YIw3a4NO/mEVyOcEY2sSPMUn2+KIYOJtd
         N2kTQwibzhsb5N4lcdvrPsVoS/pRxTVnQkywIbQUCyxeQkn5Bks+LS3bxL5KwIiG1ZZ5
         wMjRT6e0Kzy7Hv/rlONQ1HEAj6TZpXPgAmJ6+Djj2kCIYtq1U9S755rFFgbTU+5m3tKX
         Tgjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=z7bY4pt0TpwLdWyK3UcQIm5nIRWEvAUNKg7Ktb/sGrs=;
        fh=C2sBImAtLhpQTGUaEiUfh5pZqDgjcRXxBY6fDduizOY=;
        b=A5hfm/zlwbm3nwOC2J9HtXKfw5GqI+vo1PcxRA1FYrhVYKRnhpZOHYzhLMy9ieUZKD
         9teYpbfmW2PoyH8zeZ59c5YTYCZ+6REL/3n842S8Cwv6LQnyx3+sTrnGWpDJ0vR5rWkh
         7nbbrIIlxalb1FlSMQQV1/5G33YOfFn57b5vo5UGtgxP7WMPnnATG8Mlk88yk3FFphFE
         bHwNFHDaFCjxcmIoHUUWoGFhxLbBdkDJUFJkI7w+x8zMkLy89foQUXlXPch9kgyBKEMd
         b+z77Tzpg0wLQe0XE43gJMvZrFFtE9oIAZBka3iKC4qXzr5lRJmxtUiayQrkxoDgD1oQ
         Jrlw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768946935; x=1769551735; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z7bY4pt0TpwLdWyK3UcQIm5nIRWEvAUNKg7Ktb/sGrs=;
        b=CJUow7EVN/kPlCTOpu+1fLLR2gmtefuIwCw/PtedUQFYVL40RaGyG9KfwZNyLOSdzp
         YWbn/ACOkusWRk/DlLEeZANf9i6PNC6U+E9hQk8AaYhw3gB9JgGv37yorvZpArQb7I+Q
         BqKhKwbXVw1q7Mo2LdEChE1mwR3GHfbj+eoYs5sqS9BmOZ5EKljTpbg8HEbA20KlsIL3
         YtuYzne42Vd9ZyoqjFX3TFwkbnskyPgELh8WQFPlBiTtPw6HFC/PJukkM7W3mz8j2GYS
         vMtXAJ+QW8vtCL0OxvS5k9Mbo+X0iEvalZfWMYagR8u9NTD4ILiL9dbcXOZID35bCvgx
         QXRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768946935; x=1769551735;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z7bY4pt0TpwLdWyK3UcQIm5nIRWEvAUNKg7Ktb/sGrs=;
        b=tRh18PDpld+mrYbveAjy7JsweS8ds/5P/iCTcug1hssflyaBDsUr8ohsqy5Ee3E31V
         EJgjCPvUHdSAoPSzMyfedSpBTX988IGceBubF/ruZTyPkNBO4wrMis3sM49SKLjeNAHc
         BP9vKQmjBBeMlRgVPby3W8HpL9aO1mRKMv5qrtEE+mG3oQyElgumfN92VvfW4oJXBizG
         V4MSyYJXVK4QQk5i5oJh30uKQIyD5F9JxaTu6QKK/HaHuE3KUubDactwGvzYHBA11/9C
         S3t0nbWnJssAPilILSzQWmlREzLi/6Hr94UQkrD4bilxMSocL6TIwdvdiZCY8jir22jo
         FlTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdLP4fXVSAe2yE9rV2fEj3cI8gMHv1ihP2eo0k4sWV5aL/JXOOVxcJ4+2rraUyWahVDtK5Y1GsDjk3@vger.kernel.org
X-Gm-Message-State: AOJu0YyAbvvpBzVvZCcd/4hsYE5iTPDmQLJxJHGQ6/ZCAdCb2OCnXYCN
	MG0bO+1bSxVHOiFGMOhFql/7h8xG9t+6jUWS6WldWKvc1HBMeTZ6C+OQdMgC/F4xXT0hgPgj7H6
	0RDVAbZJ4x2QSZU6N0WE/x6mYBJbB8tE=
X-Gm-Gg: AZuq6aKqJ6FcrLZgh5UM3aV0MVp11B/zE0yBCWYBPXBPlaldJV+1k9r7wn8HsUUwI13
	wJB/mXwQZnun1eHm+73KJ58dsVQ7V5Cxpw6cQSnNddryw+90jPFCGo7O97VULWNMaKHE5bZMCqd
	oNAgEg9Y2CgjR7FW+adUF7D7DjkxdO52iNP+AGsqUjbTtUUUSGJTizk7eRm6U4HKWoHaXpzjpwv
	icAJgtbhyjiGJcP3I/TmWTs+j+UOCsrjxAutr2RxXb5EU4thu7KYTkFtZdGgJhNDLUPgt4IMwIV
	fPabTvOqZO6BGt3/uSlHahKsmssBAAvoZ1BRx+4HlspU+wpSfAw2m4Xxe2WaT2ulR4pmZjpfZ2s
	K3N59u/EoKNfC
X-Received: by 2002:a05:7301:4196:b0:2ae:5b23:1601 with SMTP id
 5a478bee46e88-2b6b380ec2fmr6526477eec.0.1768946933909; Tue, 20 Jan 2026
 14:08:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aW5xqLq7gatOy1DV@sirena.org.uk> <fc855e76-5f3a-458e-82f9-f43c7d23932e@sirena.org.uk>
 <CAJ-ks9=V_JmzEaXUrHPm6K-DyTgkxEhrPCW=2ZgDJpc+4Z83_A@mail.gmail.com>
 <27b562ca-d79b-4f80-be71-ebf5e26ed9ab@sirena.org.uk> <CANiq72nS94wv50XyOJq5CeiVQvb0+3mNdWxJpFy_+2FH1x4RYQ@mail.gmail.com>
 <aa4bc767-8128-440c-a2a2-81fbb6992a8d@sirena.org.uk>
In-Reply-To: <aa4bc767-8128-440c-a2a2-81fbb6992a8d@sirena.org.uk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 20 Jan 2026 23:08:40 +0100
X-Gm-Features: AZwV_QjLtYDILmpKHWe3iMB1h0JQyHghHH-t9TiUCmEBYDe7OUkU46R4cUv7SAQ
Message-ID: <CANiq72njSUPt2CvjBiNyKw1KHSgnMdcBnXNL_pHV4iURYL1n6g@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the block tree
To: Mark Brown <broonie@kernel.org>
Cc: Tamir Duberstein <tamird@gmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Jens Axboe <axboe@kernel.dk>, Miguel Ojeda <ojeda@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 19, 2026 at 8:05=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> :) What I have figured out ready for deployment (I'm introducing one
> thing per day, today is kselftest) is:
>
>   ./scripts/config --file foo/.config --enable RUST
>   make LLVM=3D1 rustdoc rusftmt
>
> though it looks like allmodconfig has actually picked up CONFIG_RUST so
> I might just be able to add the rustdoc/fmt to that.  I might split the
> two makes for ease of reporting.

That is great, thanks!

`rustfmt` + `rustdoc` already cover the most important bits, indeed. I
definitely recommend separating them.

Are you checking the `git status` after `make ... rustfmt` or similar?
Otherwise, you may want to use `rustfmtcheck` instead.

Apart from those, the other main one is adding `CLIPPY=3D1` to your main
`make` line (i.e. not as a new line or command, but in the normal
build one -- the reason is it would otherwise rebuild all the Rust
code constantly if you set/unset it back and forth).

`CLIPPY=3D1` will catch stuff that we want to keep clean, i.e. if there
is a positive, then it should be fixed, thus it would be great if it
is run on linux-next integration. It will break the build with
`WERROR=3Dy` (it just adds more warnings to the compiler), so I think
you should be able to just reuse your workflow/automation.

There are others, but they are not really important compared to that one.

More details on what I told Linus back then:

    https://lore.kernel.org/rust-for-linux/CANiq72kkjGVAtWNZjz5VGen4xoVLfRa=
+Wv399PUO=3DEfcA4TEfQ@mail.gmail.com/

Thanks Mark!

Cheers,
Miguel
