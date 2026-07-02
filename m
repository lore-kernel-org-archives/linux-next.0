Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C88433E9D
	for <linux-next@vger.kernel.org>; Thu,  2 Jul 2026 15:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783005631; cv=pass; b=ewZ7K4sOgQeJYVoFpyTfrQFtCrRAVcQPLW03yaccJ1gEAg4pp67cuUNAUcWAh97f4AtiVoeITcD6aHxvOgcNcPle/nXeV0XohHuTmrpUpG7nSg+ex0rNZrg5+om1KPqWqA+wkdocsEhGWX+gRwRYhhRw8HyrYKn+Wgr5CF9mU7Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783005631; c=relaxed/simple;
	bh=LfkR7z5GKlEymmQuQGzsYo2+I2yg/kwME9xaxpWNwbU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=huUvs1Yb1/W++aRL/QV7a4cqQrx1qSuD65dLyyosD/eZj03sxXX6BcqDmIletEYRreTXAopQa26UBv1OKIZ2+yl4ZgA8MjB0Ev5WhewIDuuGrgDjagTEwO3PM25UA7W0I+11n051ZIgklkupOBwgJRFJ+rPi09LgSSDfRRXNv1Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=CK05V2p1; arc=pass smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="CK05V2p1"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2c82538b6b0so15853015ad.1
        for <linux-next@vger.kernel.org>; Thu, 02 Jul 2026 08:20:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783005630; cv=none;
        d=google.com; s=arc-20260327;
        b=st/a3CUeFWhVwI8qBETbK6qsc13/6irIcKwkV6NTk30h3F2d/atxeMOOcPh3za5dMj
         ULhSNtVL9SFOVXnIssdurBEzWZzwWDZiVSzzPGsD2Wv+u8+a12X9IgvaibSSeYChVGVZ
         7uPgYOjgbXCBOTczrkCCg2OFF6nF74nJ+x8hhcWlQ3pkmPaZqRuEwgK2yL4nXpP0+YuX
         3DKi3TChkdgNIIWKfgaH2+E/ByYFqj7zCyNinNtrwQSx/mQ4w9aNg7+ilr0tyQzHonoG
         5b56cHZorisNFrrwDd9+lGmhIl3XJpwQ0NsE2E9QVFC0cdjBiA9vtAGNuqilY7XYH3Io
         MHDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jarQxhZ7wTyGY94Pw1Oivnn4EwhkqMATYedFNk0XA2E=;
        fh=ZgWSEFutdTnUNW490Sq1U7eOytSOhNfMAPWm1Kx/oEE=;
        b=NoXhd3F51fhSk4hW3ZfT9sLnTYiisgHGLoUDcIH6AK4iSjLhAJpGOhSS4hGNk1alzM
         pcvGberZeCi+mCyyV5Ww0TjhUHYvIuAkDGJtsP7D6jHKrm9YWfeU60oKu3bJYPiCJ3Ws
         /DR58bWYsLnNWaWlV8hClzU3S5AUm0yn21hzS47bSIIBH4FfSpDQkMpY3i4tkSnN1fx4
         CpxQwbHz4+i0c1KswIdBVMWk0vjKzBycDnl1qXKzKDZA03MV8PLlCNJOnCETocQ14Or1
         RN/A+FqFAViV6CkHZB69UeqxkK7zt33rGReX2TPAl/cjexCvDJaPP7hem9nbrAOqoYtG
         CJRQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1783005630; x=1783610430; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jarQxhZ7wTyGY94Pw1Oivnn4EwhkqMATYedFNk0XA2E=;
        b=CK05V2p1uS+d/aMijryIU5AylfSoBqwD/kABV6MMm65AsQ/5FSsKpi3JDfHS9hUsIM
         FTRtta1BmUWIwO1M+g30K1LeIU84BDsabPu4y4W0IN8n1iUAmM4lKD/bGe5caO5771+9
         7OJ6VQFTmPxWAoG1FCQUPYNEMnSJr8/6jdIXhFYMiSGlOl/I+PXsh7A8PgKMXg1egkQ/
         +FD/KIasEXs0zVDavqzMDzspIJ9Y6ArpnyFBNDjCnURrdh2iUf+a2BPINJQlU1jnPuVJ
         VUzCIg/w4RuRL0WwGabXdvva8bB2LypHyGL4YsMW8848TtZ8SGo/MGjMqMU0Yapo95Sm
         v7eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783005630; x=1783610430;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jarQxhZ7wTyGY94Pw1Oivnn4EwhkqMATYedFNk0XA2E=;
        b=DFAM2a2QWglB8UbkV4TGBPAd7k1L1LmOaOwww4e3LSPCKIrNyz269QIm01C/WtHTsy
         HK0IiqCQDqSmFnW7kf96/iFiN3h12XURGDb1xrk1cV5h+PE0NAo5C5xlRwUG00W/pH6W
         yU/qaDUVUyK6IfZEvH4jGUullH5jnazpmVGS/JUgQA5Mb4om7JVcbj87icioiE6XzGOD
         mJ7g5Absjs2vx1qoyrIIgYl4vTas5fVbbsFwoKQJvC/1cyhzrMEn1WU6eCtYfws+TJdN
         sgEy9LxVdC8HI36ZuatV7NxKIbFrOfpN37A6MyvaDXhDk4rrsbmXR4F632DlKJkkvgbA
         Oecg==
X-Forwarded-Encrypted: i=1; AHgh+RrtAaMzIV5afKMlAcW4cZIejZPi9Ydw9/mnmOeXoFJnh0Oy91qokqEdpI5Tm0DOZKAW+daVED6FozEW@vger.kernel.org
X-Gm-Message-State: AOJu0YyS32g0oZqo3iqGIiEL1an0AokS0YVNYntxvvPDiPSXnPlY1EO2
	PJWXrRj+41KBkZt0qOnkhpNnbsWTiCksLfFrzockFbX62PE1nvN0JvuZb3XpNRULvK45iNksqR9
	gapm75P+4Js1Ce5WIjw6BPd2d2CF5t0E/9xmfDADD
X-Gm-Gg: AfdE7ck1X7cYBfmDaOkeLeJxJrUg61n6pYcRXYQ7pz2OA6KDsbYmjHdBIKcJ1m6HCas
	R+dSPhtimGUj5yCE8Ib1W6pM6hjW16gKZjlKevF84WLCVeFfBaL//cAFq4MCwmzS3UqUhtiUJyd
	TVnqTpG8rkYzXnno81QscgbC/r9d9KFbJqEFC1t9eVQF7h3UMQSLN+GjvJ7X0DfOYwRdvADy91N
	I0I5VfIezVYb9Pz8pTxnaKhE+ZwV19zJkox7sIa9cjM67iFh3InysgPFm1qZW1P5Cbaz830
X-Received: by 2002:a17:903:26c8:b0:2c0:b932:866e with SMTP id
 d9443c01a7336-2ca7e8c38b5mr67804025ad.27.1783005629637; Thu, 02 Jul 2026
 08:20:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <akZv2JkwJhqantRf@sirena.org.uk>
In-Reply-To: <akZv2JkwJhqantRf@sirena.org.uk>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 2 Jul 2026 11:20:17 -0400
X-Gm-Features: AVVi8CdZwgOr59ionG4B8aYfOyAfKLbRGP1ifmX_Jf5hMeeY17NGKBMkcIo_nlc
Message-ID: <CAHC9VhRpS0Mf8rdow6jJA6ErK1krORFPZ1PSyrKau+j4+=gsJA@mail.gmail.com>
Subject: Re: Missing signoff in the selinux tree
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 2, 2026 at 10:04=E2=80=AFAM Mark Brown <broonie@kernel.org> wro=
te:
>
> Commit
>
>   99ecde22ef1c9 ("selinux: drop unnecessary goto and label from avc_alloc=
_node()")
>
> is missing a Signed-off-by from its committer

Fixed.  Thanks Mark.

--=20
paul-moore.com
