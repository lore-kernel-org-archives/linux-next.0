Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0985F365A0C
	for <linux-next@vger.kernel.org>; Fri, 30 Jan 2026 23:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769814029; cv=pass; b=ffLSkncXITMqaocvaaK33TT6hr3wb8y+VwosjKtZMvORYmp1yz6dyW52+3p8LfZsNxpwUPpmHRpbh5lfNmZSrYVwuwCuC97DJ9t3dC4pP0f6eDAkcMafD1/03kk3DvIOnGyGIZWoLJ9qVNkbbjLOxpjEHBl9SvSq4q0t+droas4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769814029; c=relaxed/simple;
	bh=b0/Gen12rggPEC5sLWg6a8eu7WwNMstDOZsLiSVA94c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bed1xWaOdPn3JGBkTOzqLyfzX/0goTgOAoPxogJyz2HpD3WbvmfsZHZlVsxXpE9NLNs+Qg2okHalQ0VHQUHbljyLKosUZB9nmSPfBKfE/dYlcGOvLXi9PyBtbOWxh1sk1u5MUnW6YscFSrlbdBwEFIeJ5H5iTgfVOCvsuFuCvK4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=u17zQlwG; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="u17zQlwG"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-64baa44df99so1554a12.0
        for <linux-next@vger.kernel.org>; Fri, 30 Jan 2026 15:00:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769814026; cv=none;
        d=google.com; s=arc-20240605;
        b=a0IjdqgAIp1fX1uXlRx9LMh33pnlsgWQU2ISvaWdEoJRd3RtbKCopWmh41YdgHJ1Aa
         wjEQX7GJ7rck2JA9LO4h4u4w7RnzOGJssPS/Fo7PQU1NeV3Zj+GyHm2tASOUOwh3mSXl
         kzHy37HUNAnUvRFHcifKk2YxPM53um1hJStt5vIA335uBkCCY1QOz6iboz+T3+x+LfeI
         hYjQ9mdcsLNJaZP9ly2H+K128fduXPsbvrDpaCzH15W45Et5W+llr1nmoq/py11+gb65
         4JS4tGjq3w+1V2SSxxXGCikn7tjT6lsD3fo+xc8TmOR8mALfEJwsPppbPRaJ5+92y8Fe
         bSSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=b0/Gen12rggPEC5sLWg6a8eu7WwNMstDOZsLiSVA94c=;
        fh=6Q02jkYQfMT7fNt51DAZZtfmWrliXnxgLx0QJQqeIWQ=;
        b=cIEz4qbQgroe3Ma5eZ2GECo4FLWEqI5ca0EUdAU86alTs9SBnLp519XNIF1a0S/mow
         tQg8gbc6gdfGUkG3Ns1LkBmKw2AJ11S7IPgYyk8isa2T9+nDIqJTYBckLXOGkzSjji73
         ygaTCqysynGzRkVI5YN2mjugExOnl6wk3gYgXz3fEV+KuiAk6RUC2ac98wSSWgDTBAxK
         0hXq++OMjLN9ECCaDrOPOdAKf9bvI0qFlmbR4JnyCKMuNek5DwWdhMEdUkMYPTDtJjxs
         xCY0rXbT2dinouXzZf5mPn3uUuKR7Xb0d2uh+XMlADO+MY/pEpyc60c87koD4ud+rSWa
         tEIQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769814026; x=1770418826; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b0/Gen12rggPEC5sLWg6a8eu7WwNMstDOZsLiSVA94c=;
        b=u17zQlwGnZFh10TyBdM1/KBZ8vhKpo9V8/YfipkXJ/p1306Z9YVVm1y6GoJOqc2Daz
         RxPCOM9UWPMSEzchuyiyN2o8dP13ZLeGU8zpn6y/DNhv/Nx/pX+ZnRcRFUavNFzW6OGw
         CsWD7V4Or8z/gLicY64bypLevta3ALEvysxD2mYR8oGKv85dxhSyTpu83k2dHRWQ0x0Z
         M6smMRBz3mMjPrSv2HadopKQbvhiSSHVKxe037/UQnQ91m8jKfwspeWRMm4lXBuhi7Pv
         qGrDdMpaXf9kaYMl2Nsr6hx3O9W8IC0g0/Dzx2kT0EY9AOMQwW4jZ0jIe6DDwxQ2b7h2
         WNFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769814026; x=1770418826;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b0/Gen12rggPEC5sLWg6a8eu7WwNMstDOZsLiSVA94c=;
        b=UDvbor175BhWdHkwGFy0iusz9HQ0nQd7XPYBhrVNaP8eugpRYfOZw6AQj22cPnlBTZ
         RzZbV+2q07UKFOUSluDaq7+AXBtEW4blEHRJQgbBUvZR4AyLstZzwNlF8rpUjptaBymU
         VgCJ2bz6e6YNqkaT3d06xKmQPYnyQ4gpMdMUlHJNNBppD7Mql1ZPnQ1vCzF0NiCXObf8
         UD/eqIDQDbQe3k7b1yNNKJy9J5CtdYMoerhJuu3oMvKV/UO/wAn9IhMPswEYPVFVSvXb
         UannubdqXnrASlPp3mYma9NhVVkxeeSB2zF/MglDIgvxFG7vSF0mzm1GOPbYdf4pEWTT
         ty1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUjJN56urAZNQRJ+k+nUG2rM8DuD6yvkyn39qu8O51xH2eBFgNRKB6kQOKtxAgSLCs3YW/Tjv8k9kS5@vger.kernel.org
X-Gm-Message-State: AOJu0YwMZZ7zSvdlXh88AoLLWMJXjIyoXdg5qzn6SxeWgKYuFN/ThIds
	uoleuIf31xPvkwycvlAdfbJkinTpbddc3CPHNF1SieZtusoLTK9VxliyvllPt7ubUDTEMc+Pj2l
	rVWmK2WzszABLQVUWvHc0m8D9OcnwvrB8O4vgMmqT
X-Gm-Gg: AZuq6aKgD21tl1B9FA7+b8SJPbk5+/nt1SlmN1Kt90EVB5CuR1ZVAtrX6vBTunoJCkU
	pTc3hVZ4WX9uRaFEHc8TtJ+IXdH3Ucc9KV1WIc+nenw10OiIAhnF6uNNB5bwrkQ+3hCEO34MJXi
	F5Y5Oka0QEMHL3VgHWy11MH4A1tgkqL9hKBwctRIxr/LOKJBSvyqYtkyhhp7blWOSYF4BDp0pXV
	t7830EvHenjxbruBQeTkTtGHpie4t7VE+wvq5/9qQxirCB8VG/QcbEgN93LTpMIfz4+
X-Received: by 2002:a05:6402:208b:10b0:655:cf98:d07c with SMTP id
 4fb4d7f45d1cf-658fa27dfc7mr3777a12.3.1769814026335; Fri, 30 Jan 2026 15:00:26
 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aXzoSci8NPhIwDf-@sirena.org.uk> <CABCJKueCeHDpu+KMTT9z_iNP2Ljipt6r4KkJ-8h4ysoTRoCW4A@mail.gmail.com>
 <2274419.1769795849@warthog.procyon.org.uk> <CABCJKuf10mJnunp0gt0r-5Jnumss5LS1VjN51WQmJgnggE+BGA@mail.gmail.com>
 <2281244.1769810219@warthog.procyon.org.uk>
In-Reply-To: <2281244.1769810219@warthog.procyon.org.uk>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Fri, 30 Jan 2026 14:59:50 -0800
X-Gm-Features: AZwV_QgzXGNLU14VlKQYQJoqtUUV9IRKtlj1bNNPKBVXLGmEkjDB83OvbsD0HxE
Message-ID: <CABCJKufJFgnDAuK+n37rha6L9OZugyviVJNrZOCsSnAckHp1ag@mail.gmail.com>
Subject: Re: linux-next: manual merge of the keys-next tree with the modules tree
To: David Howells <dhowells@redhat.com>
Cc: Mark Brown <broonie@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Petr Pavlu <petr.pavlu@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 30, 2026 at 1:57=E2=80=AFPM David Howells <dhowells@redhat.com>=
 wrote:
>
> Sami Tolvanen <samitolvanen@google.com> wrote:
>
> > > Wouldn't that mean having to rebase before sending to Linus?
> >
> > Do you plan to send these to Linus for 7.0-rc1?
>
> Yes, hopefully.

Ah, OK. I initially thought these might not be for the next release
yet. In that case, it's probably just best to include the suggested
resolution in the pull request and let Linus handle the conflict.
Mark's changes looked correct to me.

Sami
