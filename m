Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1102DCF61
	for <linux-next@vger.kernel.org>; Mon,  2 Feb 2026 19:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770061898; cv=none; b=a0Bi5EUB3YyqXv+ZfoO2S8DXIRkuRvnTPxuPd6sKGdijXOiQqzBJeFJluhERVV8cr+bsxuxXep7M0AucTG+CXKn/yCuvXQOO1SvgrCXGdWeZTebtzNpPqILVmytETk4oBr7T5V1nYO8yY0844GQba89RJ0PvcfapyGPnRQ7e7ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770061898; c=relaxed/simple;
	bh=3D1iSmSfGYtUcqQvAzQU8zYRtaNDe5SjyDYoqUWEnBc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L2f4/AOhFPOH0I5mkcWgX/Zj5cAtuMZwJBe7DR7z8e0VNLODHFhxMjaUfDYcyG8ph31jtG20mibWP3ABR5/p0uhKzFKQXHWhS6k8w2uARxU1WQF62GrQhDhsXJupuuOSJYUgoQu1wBDVS/4rImzZLqHd7e05Cx5ljZjQt38gwZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b=gioJe2WJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="gioJe2WJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEEA0C116C6
	for <linux-next@vger.kernel.org>; Mon,  2 Feb 2026 19:51:37 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="gioJe2WJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1770061895;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3D1iSmSfGYtUcqQvAzQU8zYRtaNDe5SjyDYoqUWEnBc=;
	b=gioJe2WJN53PZV/ks3LwmyPYgtlQqE/QXRUnRMbzzI2/1fiPMzVV1GUc+l5UWlhrLWTD+E
	0QuOnqo8X0m1gBKQByrasgA352IzmtCBMuC9X1EQE8G65WLA20QDmGLjsd6wTDeHFxrti0
	4rG1STeFLogxqrnkrYAopOOqNJ5V3ww=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id bf04dc5e (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
	for <linux-next@vger.kernel.org>;
	Mon, 2 Feb 2026 19:51:35 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7d196a2334fso86532a34.1
        for <linux-next@vger.kernel.org>; Mon, 02 Feb 2026 11:51:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXUj/11IAz8u6KN2Nhl3SN/6SSQZGA9m9RfhE5DHl93KhEdJDaNZMw6LmmEOrUm67AQuPuGkM2yRv2I@vger.kernel.org
X-Gm-Message-State: AOJu0YzXn0bvjRPRJCCaVWomlb8q9m/18q+iNRJngT6OxtDLsPZUiMfH
	VXiOM3gzBBudV9GacGPgTyDDYHKM+ay40HEitBA51YDe0L68hmDmsyPIghKOjCzcWLJ/1DqwBIw
	5QAWlAi+VTabkO5Gqv4vf6vN3WNbl8FE=
X-Received: by 2002:a05:6830:830f:b0:7c7:48b7:640a with SMTP id
 46e09a7af769-7d439e4d2e7mr234138a34.7.1770061894536; Mon, 02 Feb 2026
 11:51:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aXPso7beaFvlUYiP@sirena.org.uk> <7bad538d-5b90-4741-9bf9-b4f6f708048c@sirena.org.uk>
 <aYDgGTtXCN8GMVI8@smile.fi.intel.com>
In-Reply-To: <aYDgGTtXCN8GMVI8@smile.fi.intel.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 2 Feb 2026 20:51:22 +0100
X-Gmail-Original-Message-ID: <CAHmME9qhEZOiyu7JfP6uouuhuZO7XRaVdrC=hh88bVzZaeKasQ@mail.gmail.com>
X-Gm-Features: AZwV_QhAAylAWiST602emiVG3f01e7dA2aB2-N8jFL57z-XXysFv1SYYkGApNLY
Message-ID: <CAHmME9qhEZOiyu7JfP6uouuhuZO7XRaVdrC=hh88bVzZaeKasQ@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the random tree
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mark Brown <broonie@kernel.org>, "Theodore Ts'o" <tytso@mit.edu>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 2, 2026 at 6:34=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, Feb 02, 2026 at 03:22:44PM +0000, Mark Brown wrote:
> > On Fri, Jan 23, 2026 at 09:48:19PM +0000, Mark Brown wrote:
> > >
> > > After merging the random tree, today's linux-next build (arm
> > > multi_v7_defconfig) failed like this:
> >
> > This regression is still present in today's -next.
>
> Please, revert this patch, as it shows more work is needed on arm (and ma=
ybe
> other) side. Meanwhile I installed compiler for ARM and I see some issues=
 even
> after I fixed quite a few by the proposed changes (in this email thread).

Reverted.
