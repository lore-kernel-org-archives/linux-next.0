Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591C2305E1F
	for <linux-next@vger.kernel.org>; Tue,  5 May 2026 00:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777942611; cv=pass; b=YP3DHhe7Axd1KAYAOwkJeEasJPjD9HGI7vpNqNqiFDhZlXkRTo/rblEWFcHuSjqJ5y2fRdCprsS6//CMoQymJbeaRxUxU2tHG73YCa5ZrLIPbvRtraTfP2inEOPC4ITEv3D42IiCmbhrsnZqWjR969IbGkJagW8eabzLiEwW3Bw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777942611; c=relaxed/simple;
	bh=IeCugNOF/0VrIrRyZUIejh0Dfm8yCouMQlcG/pruqFI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=grZTKh51gkNr2YS/YvQm5yv5PKrKmHfCravnMbpKQXf6UoAIWgS3cqxjTd5OJ6v6QiZb/3zFrSjStAOv1kpHdATOZw4YK4JWFbb6yCulFBfIqOMAhGyzu2ZSbaZruCGP3qEQhGVvN+FpHCYuDBLxAsR11vGgDL2qmKb9hiRMteo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DbGdpx84; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DbGdpx84"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-67c4aaf76ecso2972401a12.3
        for <linux-next@vger.kernel.org>; Mon, 04 May 2026 17:56:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777942608; cv=none;
        d=google.com; s=arc-20240605;
        b=IowMQbmPmCH9aEEy9vhm+bNRE03Lzhy/PvMTy8UPgDSi31E4RLtUs0TcZVXQVTKcfk
         yFngi+l6rMZJ8kaV5trzbewETo5LfWI1vqs1v6dL/sztDBt5LSTHSBVec8pJpjIQloWS
         M1MUVPXuNGCA6c22t0I6WhszasxX0JZbdW4hTnUon5NR44WsbGcGr1yOIy/JuECmd56Q
         AoJQele6/J3Y+fkq5cR5CKunLDBuDJChX7VGxoxe/oMHm1wftJocuOc+dbTmCRqhHrwV
         buDI//Mds+t9moCFvg2Aw7FlhBrGLb8yGsK4W5V7LhCehrpSUJQMUsfJv5f979tsirSM
         6C8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=z9uROoH6g0nKwqBk6jm0NS5lhsKYzLExzLhwk9caFeM=;
        fh=I+8MBPdgGPEnq01UD69os8H9PYkhgaCfJaxpwuw26/w=;
        b=g1YwIy31GtNynaYHZJPqCZC1UJuMLnCt8rLof4vpAgfqnDmIykB9q3kv6KtFz/SXNs
         pa6gxwroORx17hF3ukYqj1is26tzg+Fi6znmNMmO3yxPdPfB+i/H5ZAC720cS38DPDvd
         AhQVJP+EEDDyh5jhhofibr/bJWoVy6FWM0n/Gy8lZgZfaSALH+KbAgHvZCbISHiyLmj+
         L3Gn4Gl76cmEUtmYm9x0L0/U1k+2b2wxDlPnYS0XUAvv8KKwil2gLyVV4cwRuQV7s8jb
         Y+xulBblbwVuz6aOjZInz0Et+dCeax9BocbIOBM0ZzzBsmtvCah+ar4axMjJ97QmNYoF
         9L4A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777942608; x=1778547408; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z9uROoH6g0nKwqBk6jm0NS5lhsKYzLExzLhwk9caFeM=;
        b=DbGdpx84/Zku7yO3zleNnDMgxZce+rYS2jwB9m2YQb+xFifsVkkUNwRMbGe5TNTnr0
         gVqBQg9xCjgxBO0Qho/3GA54KMXnM5xhZ0T7A3bBRNbI7pCKCFUnVTGtt9Q3L1LQoiB4
         En2hiKhD/AZObswq1E1D3YlgcFp35YCFak7/L7mKJgwMzyQr+8OsDLABLQS1kEf3eAsT
         P+56h01dVDlWF96k+NmBTY0HzVslE8SRjduyUCQ52un/sVIiO7WlCcsXRJ25M1ZmiYik
         cZrh0VTRuUFS304kR5tbb0bteNv8+sZa7pqUJBt77VlwKZj0F1hpm+FfiO+CELt/v+MB
         Aumg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777942608; x=1778547408;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z9uROoH6g0nKwqBk6jm0NS5lhsKYzLExzLhwk9caFeM=;
        b=n5Peer41Y/qW4vdPpJb1Q6k5iIYC848niSTyJI8qTGFyHP3HS2RhWVlnOZJ+/ESPK/
         SoyYPZDmNDpKvEVlhSXm/LeXQYvnAKF3n1nQ3QBLJiz5oSj9FDyf3VLs5fHeuaBsHik9
         YLxA2prW2e6D2UHbjKFz3l4F/n/h0xJGJtNGfAa7VGli7CsFX5V6zDtUUEddGR7LfjYZ
         B99Wz+wz3brew3SYzKnWz7E9a7A3p/fJo4uLAVvhmWhY1vAEM5H1ryvI3YDs9ERu3rHY
         7jf5rZRltuiIK4VT0NVYR14psWXCP8ZvByK/VEu37g/+KU0USWOvKm+BQCtaBcuAjkrb
         sQIw==
X-Forwarded-Encrypted: i=1; AFNElJ87trqpUw11U1cvTgTR0cA8oaedScUh4uvI6jOPckW+Yyni+z1nL5TxI4+RRYso9ltGXoX4eQStv/7l@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8CBUMZ7ww8UrACVFNYjy39aUSSuwPC6B7Wi1Fx9pfMU0uInkC
	Pfox9xICeT233cZjdKUfZHk3LIR3+r7MroIW294k5xaS2sPl6DfCeV+iMN8fg6L9R8q8fJ1FvyN
	uNB0xYkYA96RISwJlO1lE1JjyLaTpcLs=
X-Gm-Gg: AeBDiesdj9ik9A1dmDwLht4uKL2sIU395UlvYbpyQiKDZjI2Tqm/DxjTlcO8Q0x1aQz
	bnF7XKPiqu7vMemyo4rnKpbnU/U22BagfiHykLuJMcKme/oEyTx8a/tB+wLlhRUH9rWeIFkToMJ
	nywspKzWR+Qv5jiAtlhJCMeeCZxr3Ho+EKI3YLRK9vziXIx5eg23DsiWgHNztDopMp0WjoVvqAd
	ZX1wdz68HUyaCv0p1U+pTOsOPeysYnTEVFA4rfcW+e8zrLyzUHdwcBu6+/ID8iKXTaXevIuYZYC
	t9oR8v25I55EWlx0RmChetEcahEcPOmqE7RDJI/f3aDmTcyACuE8UnVj4D8Dv1Hf5l+0eDJpJ0H
	ZjH1phaffhh55K3wIV/H2Zal25M8DP7lIfWBYWf8YWRvvdSgOaZE4iVQ5sUrT4kFqFSlZ
X-Received: by 2002:a05:6402:796:b0:678:a507:e837 with SMTP id
 4fb4d7f45d1cf-67c17e27044mr3972403a12.1.1777942608385; Mon, 04 May 2026
 17:56:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <177793914437.2560.9287713196857718000@997d03828cfd> <0a8be4da-73f4-42cc-b026-c3ac031f3268@infradead.org>
In-Reply-To: <0a8be4da-73f4-42cc-b026-c3ac031f3268@infradead.org>
From: Rosen Penev <rosenp@gmail.com>
Date: Mon, 4 May 2026 17:56:35 -0700
X-Gm-Features: AVHnY4IKrnDSsi15lQasC7pxxX_wLSKZMiIfF54CrEwOmOtvnCw9EXINHRwtjj0
Message-ID: <CAKxU2N9WxA9tg0EqDQ0bzxpB79Sa+zh7HgGs_u-witFcuCsQew@mail.gmail.com>
Subject: Re: [REGRESSION] next/master: (build) variable 'num_ports' is
 uninitialized when used here [-Werror,-Wun...
To: Randy Dunlap <rdunlap@infradead.org>
Cc: kernelci@lists.linux.dev, kernelci-results@groups.io, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, regressions@lists.linux.dev, 
	gus@collabora.com, linux-next@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 4, 2026 at 5:18=E2=80=AFPM Randy Dunlap <rdunlap@infradead.org>=
 wrote:
>
> [add more people/list]
>
> commit 8bdb0b3830ea
> Author: Rosen Penev <rosenp@gmail.com>
> Date:   Fri Apr 24 18:42:01 2026 -0700
>     usb: typec: intel_pmc_mux: combine kzalloc + kcalloc
>
>
> On 5/4/26 4:59 PM, KernelCI bot wrote:
> >
> >
> >
> >
> > Hello,
> >
> > New build issue found on next/master:
> >
> > ---
> >  variable 'num_ports' is uninitialized when used here [-Werror,-Wuninit=
ialized] in drivers/usb/typec/mux/intel_pmc_mux.o (drivers/usb/typec/mux/in=
tel_pmc_mux.c) [logspec:kbuild,kbuild.compiler.error]
> > ---
> >
> > - dashboard: https://d.kernelci.org/i/maestro:4c562376c15477320ad9a138b=
83a5256431b57cb
> > - giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-ne=
xt.git
> > - commit HEAD:  9d0d467c3572e93c5faa2e5906a8bbcd70b24efd
> > - tags: next-20260504
> >
> > Please include the KernelCI tag when submitting a fix:
> >
> > Reported-by: kernelci.org bot <bot@kernelci.org>
> >
> >
> > Log excerpt:
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> > /tmp/kci/linux/drivers/usb/typec/mux/intel_pmc_mux.c:740:3: error: vari=
able 'num_ports' is uninitialized when used here [-Werror,-Wuninitialized]
> >   740 |                 num_ports++;
> >       |                 ^~~~~~~~~
> > /tmp/kci/linux/drivers/usb/typec/mux/intel_pmc_mux.c:735:14: note: init=
ialize the variable 'num_ports' to silence this warning
> >   735 |         u8 num_ports;
> >       |                     ^
> >       |                      =3D '\0'
That =3D 0 is correct and was an oversight on my part. The original code
initialized to 0 because of kzalloc.
> > 1 error generated.
> >
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> >
> >
> > # Builds where the incident occurred:
> >
> > ## x86_64_defconfig+kselftest+x86-board on (x86_64):
> > - compiler: clang-21
> > - config: None
> > - dashboard: https://d.kernelci.org/build/maestro:69f922810e4ee292cbd1a=
001
> >
> >
> > #kernelci issue maestro:4c562376c15477320ad9a138b83a5256431b57cb
> >
> > --
> > This is an experimental report format. Please send feedback in!
> > Talk to us at kernelci@lists.linux.dev
> >
> > Made with love by the KernelCI team - https://kernelci.org
> >
>
> --
> ~Randy
>
