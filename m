Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F283090F5
	for <linux-next@vger.kernel.org>; Tue,  4 Aug 2026 10:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785837686; cv=pass; b=AVKtI7FDLqg4zGQHZKUgRL7iKfRM8+3PAmCZKSIqNpwVF+Qq7fHA1waUjFCcy1jmLeXVNSa5EM3ie39z2MOC5uXS/h5+zW3MeDxYjziC5HlwWJ5Uf7WDylItTErl226X570d16xFLeUDZqSHYynuF4GBtcmR6FPG01dOxsQ47jY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785837686; c=relaxed/simple;
	bh=MpiparRynDL8bOnNRDewCX4M9DVokqBeUZ2vacAuqTs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=twAF1FVwUMWDt7URg8HY0HrlmFM8tlUZf+nxdOU7VYSLsz47cEZTESL00Ryq4iJpyS1xXcOjnVMD0hRS9meMpvPlUDFzAuk52wADjfD3wkjQc4mqc3lbdO7STq5vxNlphxWfVE02NAgGDI+k8RyPY8e+xCc9ri8tRAB+KRXF0mY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S4lKg3f+; arc=pass smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S4lKg3f+"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cf49dc28ccso5601775ad.0
        for <linux-next@vger.kernel.org>; Tue, 04 Aug 2026 03:01:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785837684; cv=none;
        d=google.com; s=arc-20260327;
        b=sqHSZcSXunlO/ebx2jQ0XM5eGZwjz3sxr+dmOlX2pKU96sCH45JxVg5KbNvdmTN6up
         5Tq6EfCT8mk2LjJ+Dautn1bc4d41owiGVHT5+r9BWW/3DofRAxXMonhyVWFiaNLgf7ni
         V1wHTIwKbSSXglZ8VJmaNYu3D/9TYYhWpGCV/I6kXyh4vskeGQaJQGubB1igGT8ntm07
         0ljdXRX1KhbU6UtU+gHKJEEEv6ZMfDyXL+Et2te9YDTjZMorkzi72ASJtcofd30gKOT5
         mH7qv+qh7g66dil7bhpjUWXiS89SjO1wt0dTi0p0GbAdAIK/5P2SKebHWUFVmNiTNBXF
         CnFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MpiparRynDL8bOnNRDewCX4M9DVokqBeUZ2vacAuqTs=;
        fh=jT6qeqKIKd1xANvnVohTIetFk5VfS70KtTdJ5eZ6QiM=;
        b=CtiG8yCKxtxwdNxK3dOIb2WB2L5tkpbggQPyCrzm32HNEZqSHBMvWN3RbNL+IKj0do
         5QaYUx1ph8J0hSo+X19fopOu4T0Vtvfx5UtLculQQDVCB71WUVDunbBqKSCXEwzoG5v5
         Gng4QnpWayAyHIJTTwJ1GdrlouGcPePNgyy8q3nADDUB0nFPeAc1TLg76mDJP0c0f2sd
         dgQU/nOSm3aROrJ8Ai6I6OCDlldSqLpfMkbVlomcgxb1p55bJ13pBpeBeEaE87LYZcwG
         jJK1ABstSMIOFAGBc7XsTQPW/9Es7KtiQc5N687mD9xjj7zbiowAvqGb13GDxBwCnABY
         OasQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785837684; x=1786442484; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MpiparRynDL8bOnNRDewCX4M9DVokqBeUZ2vacAuqTs=;
        b=S4lKg3f+7tEHQ7JIBeUIJcQpqnddv0gSjBmYFsgbZn73LfdGHNBHGcHLkd02Jc1/rM
         4ZybSjC2kZrH/MpHpUiulI9/y/A6+JPglF07xW+HTiKyI+uKcEOz66MHznXbubsI2Q7u
         jVEqcRhumCvCzchJMlp5bqS/bPVZ735u+Rtl08Wgf+825jpQosNOcuH3cXa96Ayj5w9A
         QEEO9LHWd58FLg6PEvNdAOl9fRG0z+hZKzZUa1VkPWkTyDKMhEQzEoAPt0Tc5mxtQjaL
         H7xgUU24GUIhgCXV3gMTC9L/XCnjMMogFGXfDAgxERWDWitNjcXA1g3AAUdaKBZiey5m
         45wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785837684; x=1786442484;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MpiparRynDL8bOnNRDewCX4M9DVokqBeUZ2vacAuqTs=;
        b=aTT7ohVDEzglKMBbK15nfi2SfJ6QXj37BLr9V3f2sWVuZp3eawvpP1GtcgqgzwdBqp
         no846Ew5/Ce2QE/QJFt+p8jQkNVaoM+qv3unloSqCtNvdOkGzuAOVQBvi+dFaqJRDu94
         Mm+3kTKMlhQwrAcKFPsb22Yb+rd8362hG+b3g3Wdb95Uz03VhTfWF1lbQQOlXn1c6REa
         s6Sj2ySa+EUtkNsUBU6l6hYWAk8DTtn/VHjDAGj5dl6Gkiu+27o+AvZXQENn9aXxBE9N
         DuNr+VnR+H7+yZe6qWY7UhpSWesO30VGMGajC/iGwJYcr293h1gakim8SC0gZ6LcryVz
         METw==
X-Forwarded-Encrypted: i=1; AHgh+Rpp/t28FkizS4TJJM6GoApCWp7T8UWk3ksDm3JKrlrC4Q/PQcuTNAlwZdBgglJ1KJm0u12zkIYztgY+@vger.kernel.org
X-Gm-Message-State: AOJu0YyWwyXCzsXRqQTNzdNo/KIACd4SKxJfDEdsoT/dnBk41LMy9Wi8
	vX3NQ0/yYOLw3bvwWlCTtASLqTjCBUhdpvctFL6/g1dY5Llp2XoBvGNVuLvhNJZVlc6fkk/EUv2
	hBu72mH0IN4iTDNgReQAiUvItn3kyzdI=
X-Gm-Gg: AR+sD11pbcS3fjYM3i9y0CjBsuqvQTzL41cVF3iNtcpstapYqVye5WsnzHNfFpjm1dS
	Gis5XlfOL3E7Hhddva6L7OFhlqLCsjpQr+qc+a240X5JFQL1c5MQQ2iNju/LszjmrZCb5CrdYz8
	DWpWCczCupw+k2rymTLUXnWlEK8v82Wodij8y9TR7P5AFRj8za5GBJ5ACRpoffz1+XTyc2Di0Br
	AsbxD/NDZiGaz5YiwKAU1ne+1tckTRvJZZFzNyN9A2SIjwsD1P9F1SSsM6l78zN1bjO9+DOiAK7
	rcOHVfp7UbhnnThWschzhJSmoLROc9sLA0PB5Ii4TZHolC6d1KWEJkz12/LW15WDucEuDWucESk
	DbPgAHF3Tc5GQvxQCGc7El/r4qJgsmg2Wks5cqwFcbpS2UpITW/b/V0OPLWfR
X-Received: by 2002:a17:902:f607:b0:2ca:de3:15eb with SMTP id
 d9443c01a7336-2d05209f863mr173441555ad.0.1785837683994; Tue, 04 Aug 2026
 03:01:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <amth-CMf3Xz5hR32@sirena.org.uk> <20260731075644.20215-1-ojeda@kernel.org>
 <am0AjzHc0m03CLVa@tardis.local> <CAH5fLggke1Yvv8btJSMFr5tEquydvKev8_7G4gSO5MvoAJUE3A@mail.gmail.com>
 <20260731220137.GA3307698@ax162> <anGiIkvkDfYogBlu@google.com> <2827aefd-30f6-424d-8bf5-aa46b97ee5eb@kernel.org>
In-Reply-To: <2827aefd-30f6-424d-8bf5-aa46b97ee5eb@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 4 Aug 2026 12:01:10 +0200
X-Gm-Features: AUfX_mx2sTzKJJHvs0Mk4OYjdTAQTr-8ipldoaWejpivb7JAkLDWHWwnJ210Dg0
Message-ID: <CANiq72nZM6ANY4ThdiRd8hGaXfE2Cd-3MfKcA9RQP39x8mgv5g@mail.gmail.com>
Subject: Re: linux-next: manual merge of the slab tree with the rcu tree
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, broonie@kernel.org, 
	harry@kernel.org, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, 
	paulmck@kernel.org, puranjay@kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Bert Karwatzki <spasswolf@web.de>, 
	Gary Guo <gary@garyguo.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 4, 2026 at 10:44=E2=80=AFAM Vlastimil Babka (SUSE)
<vbabka@kernel.org> wrote:
>
> With Gary's suggestion [1] CONFIG_KVFREE_RCU_BATCHED will go out of the
> picture completely anyway. What remains is an unconditional change of the
> parameter. Can it be "resolved in advance" or only in the merge commit?
>
> https://lore.kernel.org/all/11a8bf75-8fc1-4d32-a350-6bf8156dd8ab@kernel.o=
rg/

Hmm... I am not sure I follow why we are trying to resolve these
things in advance.

Semantic conflicts can be painful because they can be easily forgotten
about, but as long as it is warned about when doing the pull (and
making sure linux-next has the wanted resolution), it should be fine
-- branches can still be independent.

Now, if for some reason one really wants to solve the conflict on one
of the sides, then one can do a merge commit and justify it well. The
diffs proposed here seem small, so I am not sure why we would want
that. Usually what Linus prefers is to give him that merge in another
branch for reference, rather than sending the merge itself.

What I would avoid is adding a workaround that requires knowing about
the "future" (like depending on an unknown `cfg`, assuming it was
unknown). Sometimes we do that (e.g. when building features), but it
isn't really the case here...

Cheers,
Miguel
