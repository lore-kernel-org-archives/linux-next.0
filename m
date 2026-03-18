Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63DFA29B8CF
	for <linux-next@vger.kernel.org>; Wed, 18 Mar 2026 03:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773803623; cv=none; b=rE77nRXWCITY7KCiEpdAwOm6ltR4nTJRr6Euj6erBTnOjsj9M0Hyz+XLypySSUUaQVJ4EMEEdIn27mlqe85jReD9s+3MVIvxleMYK4RyvkfMMbqI4el156gswPa34X3MBBUWuG902+ON1dAy0BP6g8/wa0jIeic77qGtPXO0xfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773803623; c=relaxed/simple;
	bh=CGVoJ7/mw0CojrRZ8H6VM2kQeK9ko6CvVEDR9iKqurE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GBxJFwCQCRSzDuujQa5Yihi0XE19hS8sVDUBT0R2pj+RGGrtfpio2py3j+/oyKn3S0pbbr8QbhCzBBtNAtrcU4/Tjs+rTu45pydlZ6qdKqf6tlENYY0KXQM5mfGfvX0eCbSbDcqwegUVnnGZ9ut6Z3ciKLgepc3VInyV4XR4p80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hLuV/QG6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hLuV/QG6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 177EAC2BC86
	for <linux-next@vger.kernel.org>; Wed, 18 Mar 2026 03:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773803623;
	bh=CGVoJ7/mw0CojrRZ8H6VM2kQeK9ko6CvVEDR9iKqurE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hLuV/QG66uhve3lTeaYvZ0rTqleB/D9N0Vr+xiZJrClSZ3B9Vw2zJo5TSZ7xKfzEJ
	 7bwFPxkSpMWOO0WZAsc0mZ71Qd9R1szbIKBAfv6MiI8NQ4oiQKNpc91aeNxJAHhJh8
	 KYU8cc3JCSKdeuHLz0+9tAYlua/Ht3JwixXA/OghXlpN9EeLwR8a2lWnKbpoZB5YGm
	 D3J5rgJ+vYHPhAgA95VP9y5/lbej4fgq7fNQj9t/+U3MvtM5uLvJnsmHVlUcmzoO71
	 vQ4Em6TcE3zoD7A2brdyUs5X4Ku3J+t2XXcr/ewTzPIZ1crmOwjpHOKcPu2Rdod6Vg
	 YJMUoSRntUbgA==
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6655469237aso4991210a12.0
        for <linux-next@vger.kernel.org>; Tue, 17 Mar 2026 20:13:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUPiaMz0KL1tWzA+xY3XDfgi14+p06VaTahmdTQhmFprKLplDFAe6iwGDY2Vp0SBtrX3VeUXyPDFaqe@vger.kernel.org
X-Gm-Message-State: AOJu0YwrleDRSoaGpop00oPUrT6T3lKk4TIwLegXao/9jDH8a1LUcTRL
	/4syw6PAW/VzHqfHfdJ61T51pauUrMCdhAr7k3eI8RJh+LLbEKzme8g16wApprSCq+Q2FUGwJGi
	xeHoREu2LeY7EQXnAVMjDTf2y0Ok/ReY=
X-Received: by 2002:a05:6402:2806:b0:65f:7f90:fb89 with SMTP id
 4fb4d7f45d1cf-667b27223c1mr1366868a12.17.1773803621928; Tue, 17 Mar 2026
 20:13:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <abFMR6ep2r2CxlMr@sirena.org.uk>
In-Reply-To: <abFMR6ep2r2CxlMr@sirena.org.uk>
From: Len Brown <lenb@kernel.org>
Date: Tue, 17 Mar 2026 23:13:30 -0400
X-Gmail-Original-Message-ID: <CAJvTdK=oNnTJzXj93okrBqGsyx-HdHJ_gMtGfBX5uXjwSuWDYw@mail.gmail.com>
X-Gm-Features: AaiRm50NnC1aU-qkbOheKP3HdbWavObFrctb3nA1rnSzjNsThWko_cRhhX-BDzo
Message-ID: <CAJvTdK=oNnTJzXj93okrBqGsyx-HdHJ_gMtGfBX5uXjwSuWDYw@mail.gmail.com>
Subject: Re: Fixes tags need work in the turbostat tree
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Interesting.

I truncated that subject manually on a whim, because I thought it was
unnecessarily verbose, and IIR checkpatch complained about long lines
in commit messages...
Didn't realize that tools were checking for an exact match...  Okay.

-L

On Wed, Mar 11, 2026 at 7:04=E2=80=AFAM Mark Brown <broonie@kernel.org> wro=
te:
>
> In commit
>
>   04486a0f831ea ("tools/power turbostat: Fix swidle header vs data displa=
y")
>
> Fixes tag
>
>   Fixes: 1a23ba6a1ba2 ("Print wide names only for RAW 64-bit columns")
>
> has these problem(s):
>
>   - Subject does not match target commit subject
>     Just use
>         git log -1 --format=3D'Fixes: %h ("%s")'



--=20
Len Brown, Intel Open Source Technology Center
