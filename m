Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79A53B3C15
	for <linux-next@vger.kernel.org>; Tue, 21 Jul 2026 08:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784621910; cv=none; b=c23jr4dOTjnEmLgFfEjr4vahZ3+ctvtCOjIMzs7luU8MmrIioq4ElsIF+bhao2S6b3bmNO+ev3NrEj4VwtSTYq5+9drd3NhWxyw0RAbmpmfF7axii5aepZO6YxBk8ZGv8rW+3XQi6JpdT5fNVddrPwCaAUv9cxS6/T0RX/DraYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784621910; c=relaxed/simple;
	bh=OEVPDWxUO/PC2nc7mXqBgJ3EOv3rlQSbj+pmRcA6XbA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=nYM6JJv8Ia8oHqTSfI+ou4rT2ZO+hWqJsh1HhiZWbVThgVGMInWUO6Vy0maKrEbXuoksxG8l2ANLcQNMBGHnfV0SieC8Wy96sj3MHnC4R7xe9+TPK1cT7J6x0gj0dQYBpQJykGBWXyc13U7qdpXZVHYGoYM+mdI3JVjsnw79r1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HjWWraRL; arc=none smtp.client-ip=209.85.128.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HjWWraRL"
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-492488f8583so146909605e9.2
        for <linux-next@vger.kernel.org>; Tue, 21 Jul 2026 01:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784621907; x=1785226707; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EX47CtHtVua/zLvCCj6IPuCyfzl61wiCQVRHCwB4fbU=;
        b=HjWWraRLXgrORyBj4fW1ObAKAJyQgVdlt1ChQRFQcC+FQXmm8KOiq40qEqnmQNwq8u
         bo8yxri+E9aar06HOJmjLEHF0PGAysMB6O/r3eB3HNr2BsNRFZeGMzinE+p2ukZIAarn
         UjixEWBbMIQoMlAQAnY5wFpaZAjV3QSA+dt++KOsrHHJ7u67r1oD9+R4cp/PHLihrXeR
         LzCIHAVs+EJgiMTDdo46Lqmo/XEVMAQBhaQu7GY+00Ovd6y0gUDIRteHed3QVY3C9Ecu
         iq7gHO2SFfuY+/+SybrtLcAaM5tBl66I2sexu/ZS+PQaax6DBnU2tXJFQqG7H7PVnk3y
         d6ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784621907; x=1785226707;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EX47CtHtVua/zLvCCj6IPuCyfzl61wiCQVRHCwB4fbU=;
        b=gycwd+89R9gjWYrCU3EtI9XtjzxKIy5m0lfSxYkig/cWQFvCa1ajYKH2iGo2uspeu6
         2TImLu1ZN4DcTjF5zIcY9LV5nLA51r0cqY7QlbFE/Czp7N572RtgPRhOFvLjifv88+Pp
         SxvDKXMT7AlzFBb/B2QJmF+QPT7TAwOcdhpsl9g18QVzmnXzihiUZTxX7qlCSP6VywgA
         SggW+r1cW4mAtcyvzyrBzOcW2TuO209Y60Tl87xjuqugfC6KVaf8X5MbA+Y17VhNalac
         IDQRRZZgAq9yX2n8h8aQWO0v8ofB3oTpVEfO/qnPeYohW+QorbXkwu9gBscKMnGAhbOG
         adDA==
X-Forwarded-Encrypted: i=1; AHgh+RrB6SdRhvPOqqR4iCO6MVT5OQnFypSFOtXolGCHTYz4uUwqO4I2L5wsDGt/BOqHAdgJKO1T9yJOmB7D@vger.kernel.org
X-Gm-Message-State: AOJu0YyDLW6qtepRsqOvsJ9VplNSjN/M+bWSTuRwwm7KSzvkYRxL0Ym9
	AyMCLHG7aBvaXMIYiu3uf68KV2+u9q2pgtKaQWKcwJNJFpHjfkvVawzVsUTHRaHHuOSEWCubXD1
	tZzpgWhljzIDZMAn+bg==
X-Received: from wmbjq16.prod.google.com ([2002:a05:600c:55d0:b0:493:91ce:9325])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:580d:b0:495:4598:6e14 with SMTP id 5b1f17b1804b1-4954a4060demr145564905e9.24.1784621906798;
 Tue, 21 Jul 2026 01:18:26 -0700 (PDT)
Date: Tue, 21 Jul 2026 08:18:25 +0000
In-Reply-To: <CAHC9VhQAYWzzcd6KnbCg+nNAfSHVBetgOnzd5axnL2_6E+wL5g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <al41SRxNtHYU5coA@sirena.org.uk> <CAHC9VhQAYWzzcd6KnbCg+nNAfSHVBetgOnzd5axnL2_6E+wL5g@mail.gmail.com>
Message-ID: <al8rUe1Jh4CMGTpu@google.com>
Subject: Re: linux-next: manual merge of the char-misc tree with the security tree
From: Alice Ryhl <aliceryhl@google.com>
To: Paul Moore <paul@paul-moore.com>
Cc: Mark Brown <broonie@kernel.org>, Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jahnavi MN <jahnavimn@google.com>, 
	Jann Horn <jannh@google.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 20, 2026 at 06:45:23PM -0400, Paul Moore wrote:
> On Mon, Jul 20, 2026 at 10:48=E2=80=AFAM Mark Brown <broonie@kernel.org> =
wrote:
> >
> > Hi all,
> >
> > Today's linux-next merge of the char-misc tree got a conflict in:
> >
> >   rust/kernel/task.rs
> >
> > between commits:
> >
> >   ef2d3e4635761 ("rust: task: clarify comments on task UID accessors")
> >   15c1f17979712 ("cred: delete task_euid()")
> >
> > from the security tree and commit:
> >
> >   2847d9ab088bb ("rust_binder: Add dynamic debug logging mask")
> >
> > from the char-misc tree.
> >
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tre=
e
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularl=
y
> > complex conflicts.
> >
> > diff --cc rust/kernel/task.rs
> > index c2b3457b700c1,1b290c61714db..0000000000000
> > --- a/rust/kernel/task.rs
> > +++ b/rust/kernel/task.rs
> > @@@ -210,7 -210,14 +210,14 @@@ impl Task
> >           unsafe { *ptr::addr_of!((*self.as_ptr()).pid) }
> >       }
> >
> > +     /// Returns the TGID (Thread Group ID / Process ID) of the given =
task.
> > +     pub fn tgid(&self) -> Pid {
> > +         // SAFETY: The tgid of a task never changes after initializat=
ion, so reading this field is
> > +         // not a data race.
> > +         unsafe { *ptr::addr_of!((*self.as_ptr()).tgid) }
> > +     }
> > +
> >  -    /// Returns the UID of the given task.
> >  +    /// Returns the objective real UID of the given task.
> >       #[inline]
> >       pub fn uid(&self) -> Kuid {
> >           // SAFETY: It's always safe to call `task_uid` on a valid tas=
k.
>=20
> Thanks Mark, that fixup looks reasonable to me.

Looks good to me as well.

Alice
