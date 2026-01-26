Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355AF23EAB0
	for <linux-next@vger.kernel.org>; Mon, 26 Jan 2026 14:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769438656; cv=pass; b=biy9hUQrXcD8o9BSu95/2IUL1fQKwaEUH/+deSgYKS3T4UmuwyRaY9MHD4kBmLLlFsSRbEbz292ZigjDMkIa2/sIyAzFosXBzP2fMRPeFXCfwXs7bEfXKrMLhP4oxuDZ43YrU3wnCVi9GG9s/DW0zxVM6XYQ23avRpc3w98oWac=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769438656; c=relaxed/simple;
	bh=LJh0QQhVWuL5mMofb+0u1T7nrTT1zf5DiT8JEavO5Jg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iueTMlXK+MZTuhzaxq9dcDtAXQ/XFFjoeRiZ+wNdwLXWoFMEwCNCXllKqLn9Vi8rSrVM2rl1njlrtEXn3oDHV6dEyOTItCHd4NRacrd277fB2+1VdN0dVZM6jWVyeOQAPb7C3DikXmLEfDeiO9MoGyyvEWXMW7Nw0+k9R6bXRps=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FRU4VpCr; arc=pass smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FRU4VpCr"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2ae5283dae8so292468eec.2
        for <linux-next@vger.kernel.org>; Mon, 26 Jan 2026 06:44:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769438654; cv=none;
        d=google.com; s=arc-20240605;
        b=Cn3AnkXOq0r+PYzDSQU/ToyyihL+aqs0jwtBRMztB76QeckBm9/5CAH7Mjm80b9Iu7
         9mQFWv8tg5N83ZmK9FEG76jEOrdGWnymD/7uqKGgmEnlPSXLdB9miiFFg5wiBjAH1A9Q
         gxvQxq5khpcSysijtyjyEyUlJV+/Zt9K2Htx3iPYUny19fDE2644hyatS+rD9N5/INCQ
         88lGGNmnwPBe5a+GL78P0J3a2/PlqVvOLQ74DenzcN1Fw1HMZsOxrk+lIxSTICx3xhHZ
         l0TWagdSydmZegqXcoQOLgyXly2GfT9h7yMs6gJAov7uYk8jpinELp5hkVr9pWnCYlIk
         RecA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3voJ36VQ7H+1J7+hgsJ0Y8uFrYQ1/j+5BjmXKDJ/9y4=;
        fh=zumd6+gxHdpmIe3hNkDitKlxtqTDi286fS/mueHE2Jk=;
        b=J6BMEfxge4AbRH9n68rSPKCiS/AD3LXSdNeTAzt2kF29rzsOguODNCiu5NlJhTj0pX
         8o7CgNcsDxzJ4N5nVkZZ3viwsxtgZeRf8SXe0zCUGTGeFV4UCvEZXBgoY74Ns6fDPH0Y
         CZpTGHiPZitZAhtiLc2PS5rTimAe8gkplbntjeei8gQpkLErYMs4Oy1UJS+Pf8NHJ4SZ
         seI5HsE5hbjQgJM7ld/LLcP40B7ZSC/GwvXOu2iDTxx6hch10zF+heSG6tGzjfBZqn3k
         mDQJiTyNA9CaXgAlt6FKYXJE2RkKsAysg3m1ki72aoq44YgxZUixdeUmz6yUuLb+mrD8
         8eAg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769438654; x=1770043454; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3voJ36VQ7H+1J7+hgsJ0Y8uFrYQ1/j+5BjmXKDJ/9y4=;
        b=FRU4VpCr8aeOZKNXGCpAQlKchOpgNPoxH/w+F0ndX/kfgixqqxdMsgbbb9RQcuZv1n
         on4KLVixIseg9fCTekb3oC/lY2LV7qSce91UkwxxUABWoq7VMcaHzSZQCRy5EXX53Pa1
         ztHVCtFQNiCNLwIcq4ENG3hYbljDBC7IKVtpTT6rlFN2HJotyiG5vQZTfRTHAbL90kRA
         IfU6YVOWI0krLG2SShQvToa/tg5dlizv1MdVYlKNpr6C+BjTfZstQyIOJ2gEtqBmX4+T
         Snt4A/jDD6Lb7GJkb4bITczP69LwKCK9bHxUi1c2zms4ETb8PnDszbRD00GFreo7yzUC
         Rqkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769438654; x=1770043454;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3voJ36VQ7H+1J7+hgsJ0Y8uFrYQ1/j+5BjmXKDJ/9y4=;
        b=GhbMt45vKoARisiEWPVLAHXmYLgCcj3Pr8GQXhB0OL6F+NxhBAGZLW6lm5ntN6s40o
         3eNVjcPv6hQbsK1VS8WaiFm2QZwHq2U4QD8iG/EohdXpu/kqk9YxAjaf2jVT4udxGddl
         /mzlc+76avOVlUEH5MOsOxEihQwTLsv97DEga0iXDJZ/iq2R3Z6gmN9t7BN1QjBCUuCP
         f1WosIPnD2oa4T97sC64SSAy3URiRQTUyy9/sAGb6Vxc7mzIsNrAyuyrBqf5BdQ7PQ2R
         bjH9nK6QEygNxaar1JGDwOgPTh65+ZgJDx4NUZS/pjro9UvrNTEQEJIbXRwU9ecl/bAJ
         n9tQ==
X-Forwarded-Encrypted: i=1; AJvYcCXyvF1uC5VdgynhXB0UyzuW7cpOm25Z36nkRkBdZq29FAACRxkKyqwC7wdodQdM9/OPqa2s4WqK4v0u@vger.kernel.org
X-Gm-Message-State: AOJu0YyAfIE376WLGW41/USaW1V5Rotc9nheI1HvuprLJpnjVenz4sVz
	Br7yY1txc8Sqq9ZF0Pdl5ooI1sr0QfgAM1YLgoltk2HnXj/UDR/rfUDyDH+tij+XamtArHyY8Hl
	Ld060DnOryYbxatICG8IXi8It29024iE=
X-Gm-Gg: AZuq6aKUrmhSCScSvajVJWpwFiVW1o5VghfashYpeAqT+7BSiLeRudyqS75U441w+pJ
	MZtKEc9snwK/NcJ0up7m/0Qc3hfLJVjaIOm3SJVjQWPwIWGgpWiDWpvyISH8PGBgLv0dZPSH0q2
	aJYMNYUChyBJAieFSNAyiG8ToUWk/a5jmKU7+g4YrJ6gEZqUc99pN5hvq5p8qx9shlyQLDQcoPY
	Iy4VaW4vFpZlnwqLkR/rACabqq/kovURmWd3BtTv1axeqA9cqx8ZkIhEQGle+581iFZB51wq5qZ
	F+22ilKK8eUCzH6JHhsWrU3tv/CaiGNYe0wFNXIGqe2C6yYYPK2EDxHm6xO/AmgsKWbDarA53eb
	7aFFnbbI3dNXg
X-Received: by 2002:a05:7301:1f14:b0:2b7:3835:21f0 with SMTP id
 5a478bee46e88-2b76420a89amr1320783eec.2.1769438652774; Mon, 26 Jan 2026
 06:44:12 -0800 (PST)
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
 <8cc01720-427d-4cec-b4d0-721b22c47552@sirena.org.uk>
In-Reply-To: <8cc01720-427d-4cec-b4d0-721b22c47552@sirena.org.uk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 26 Jan 2026 15:44:00 +0100
X-Gm-Features: AZwV_Qidl8ty2AScb3KSrTRKYFxtLK_Fh3mcXtu073HjEZStpDba9YnG3wE_bxM
Message-ID: <CANiq72nX8UHAjz51skA9r6gKxc1BCUxkBsVRqoMrnsMNYjp_5g@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the block tree
To: Mark Brown <broonie@kernel.org>
Cc: David Gow <davidgow@google.com>, Tamir Duberstein <tamird@gmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Jens Axboe <axboe@kernel.dk>, Miguel Ojeda <ojeda@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 22, 2026 at 1:13=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> I was asking because you were mentioning checking git status and since
> we are doing out of tree builds there should be nothing changing in the
> source at all.  I think with the way we get trees to the build machine
> it won't make a difference in the end though if no new files are
> created so it'll actually be fine...

Ah, I see.

I would recommend the `rustfmtcheck` target, since it will not change
any files (i.e. it will work in a read-only srctree).

> I've been seeing people saying "oh, just ignore the warnings" on the Tyr
> issues so it wasn't clear to me that people were expecting things to be
> clean.  If things are generally clean that's fine, and I can hold the
> trees back in -next if they introduce errors like I would with anything
> else that does that.

Hmm... If someone said that, then that is definitely wrong (and I and
others would see it sooner or later in CI).

The build log should be clean of warnings (all compiler, `rustdoc` and
Clippy ones).

Perhaps they were referring to "ignoring" as in using local
`#[allow(...)]` (or `expect`) attributes in the source file? That is
fine (where reasonable), since it is very localized (less than
file-scope, like the GCC/Clang diagnostic pragma but less verbose and
better integrated). It is also why we can be a bit more liberal in
enabling lints that may have a few false positives compared to the C
side.

> Ah, great.  I got confused by the make rule just having a plain
> redirect to rust-project.json with no irectory prefix.

Yeah, it is because it is invoked from the objtree, so it appears
there, not in the srctree.

> My current initial plan is:
>
>     ./tools/testing/kunit/kunit.py run --alltests --build_dir ../kunit --=
arch arm64
>
> but I didn't actually turn that on, I want to write a wrapper that
> reports any failures in a mail ready format.  I'm not seeing rust in
> tools/testing/kunit/configs/all_tests.config though so Rust wouldn't get
> enabled?

Yeah, you would need the `--kconfig_add CONFIG_RUST=3Dy` that David
mentioned, e.g. this seems to enable in the config the Rust ones for
me in a x86_64 host:

    ./tools/testing/kunit/kunit.py run --alltests --build_dir ../kunit
--arch x86_64 --kconfig_add CONFIG_RUST=3Dy

The Rust ones get enabled even without `--alltests`.

I am not sure what the policies are around `all_tests.config` though,
e.g. the file says it is meant for UML, and I also see a recent revert
in that file due to unmet dependencies:

    ERROR:root:Not all Kconfig options selected in kunitconfig were in
the generated .config.
    This is probably due to unsatisfied dependencies.
    Missing: CONFIG_INIT_STACK_ALL_PATTERN=3Dy

And indeed if I add `CONFIG_RUST=3Dy` to the file, and run without a
Rust toolchain available, then it breaks similarly.

But if it is fine somehow to add `CONFIG_RUST=3Dy` there even if people
do not have Rust available etc., then great.

David can probably say more about this.

Cheers,
Miguel
