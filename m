Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E347B37FF41
	for <linux-next@vger.kernel.org>; Fri, 29 May 2026 17:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780075216; cv=pass; b=Uq/izWBeJ6yRsJlWtbfhpBhAQykeOgPXZIGZE6ahqAVRgxEsw5O1LFnSQ0wi8XwJq1B8lPYmb6hCaHmGphKWQVNZyBrEyp3ipL3p//FvsooCFgfnVoZtpGtd4Mw9oK+kiSZSkY4Iiv7HVKuD1Ci6m0n6sO6jQ/zEocy7y6t75wY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780075216; c=relaxed/simple;
	bh=ynZ2XBdbslE1WoArPNQQVVLJB+hS3g1ZlbeqlJR3SQc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=heoXYKVHz/k1Ui/vvuiHTUobMaQBxmpE71hsR0xj3wZNp6awdQIGVXv/TRETJ+pJErCFAGzrOo6qynyrPXjCsrH87j4ORb6+commmcUOmjE1pIaWr7z16NXEvrl0krCJ3ABdiIxOJHKa/EnMpdngR+4z4r/9QV8V/DrZbKo4M44=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZBF+E4qN; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZBF+E4qN"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-bd4d7f4fa02so2407954266b.3
        for <linux-next@vger.kernel.org>; Fri, 29 May 2026 10:20:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780075213; cv=none;
        d=google.com; s=arc-20240605;
        b=NWIgcqnw872tU9GkqEoArvRta+kmelAJdb2R9JcT/2e21jdsWDxkyl0Ndo2wkoFcFJ
         bk3Jeu/i77qsLBY5BVL2dKY/qtpky7NhENw+Qx1TEmFSCCdfL4VmIH1vf4FTgaPA9wQr
         52FE/H+5TCaBCelZZM55hLq1ye1fbFLl35qL1wCbdoKAUWTk979r2TwXbCksiVbAiU4c
         weZ+zUMM+tQ/GeDDhySj+jLsAUEokqmZX9g6l8gpsPFxzIkx+u2JfVKegNyEmn4hvBeD
         hnTf9NWZEdd93JbrhrZJyJfFRLtCp/v2QCvid7DEf4nCdtMfjPCSfVqCbBwGOH+8JOxi
         fUrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ynZ2XBdbslE1WoArPNQQVVLJB+hS3g1ZlbeqlJR3SQc=;
        fh=FxDm6xYUNqV32gpvgBqNtGlqWT5HG9ZNKZBeVWRjKk4=;
        b=i5lV+bpXNxThAAMZPuBdbVntL6CVbg6F7B35LuO1HNxIGBnNXSqYypOAkShoy+RYJL
         lHkomWw89lZxotKfTSGyj6iryWwaQ31JkUT1HYc68xo9hX+gHYPGVaZrf4ngALSAVkqb
         xtXHA7qu752j59vT/8gWXYUNfmWs4fg8npu670dRw0C4xzHG+RgWVTOj8gyoHl5RANDY
         Y0E1omg1gOjX5kGLe9ZL9muj65IR1p636P4AEHllOvhWZJKe/lw4DUm04FTiL2glEkpk
         DSHPbFB5KT7XO2jQLhGGcdNIvF5RyW4scyYBJ+MM/mYnuyP2+NNP1fBwrynkZskNnO97
         6U7A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780075213; x=1780680013; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ynZ2XBdbslE1WoArPNQQVVLJB+hS3g1ZlbeqlJR3SQc=;
        b=ZBF+E4qNQjBF7tdz5XmYiAB2vJW/NSs0RStxA1oVuU9x5FIn+ctBf64izDCzWSuxyQ
         Y46zQ+lhkoffzWzmZ6Gii/7+nbduBSfhMxICMi+W/4CUFYVgWmfyFn3dKWMK1NzLaUOc
         N/Obp18jFP6EdyXjWnXgzsYwylDiX2/KZjS6XvjLvKWhrywbSBPw+spZNUqEBGRSlPzG
         5q6+27Ul0g/hdNTnR9C6lz94U/TbxgcDewn8Q1zISxzYV5GhTAU2JpGNWavKH2PELArq
         zvHmQdVcvK5v1ZltXHgdfzoD3q124JlDpoIjS+b0U4tbol48O7XtStF6tgbDlf4SaR0M
         7FJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780075213; x=1780680013;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ynZ2XBdbslE1WoArPNQQVVLJB+hS3g1ZlbeqlJR3SQc=;
        b=Qa0r4qgHUHuUYla0i2ei5JNOQkggVgp6jSf+/rPwqjrKlBC4Y7VBPajiBRTLtBGP7B
         b2+27TtdT/NqELaqipjKq6qREv7ob9HCThTY69/rj22yAjr5zjy+YQN2Pl5vTOqeXJ55
         5APNNuFnUlcDfj2XAg4R9cY/J/Kwi2pXKaC4kkSbWRh967MjGPGWthkYEF5N6ILYLkqS
         OtWPtTWmpZqYJoJLipI8IOkIKzcDVudJj+23r5m5SNaXcufdaFrCg/KXl6q/hmadWKao
         nlllkqoUU/piXTy0yPu+blI4ICt8FX+pgijqZTNJ/qDvGIFjNL4PkhPpPDsYGpcF/02X
         GNYw==
X-Forwarded-Encrypted: i=1; AFNElJ+td0V3W+KFscwUXlEaaF0Na/HTynuLUrsXZLAKkUZ5BFOZQtBocb44j/tIRc0+2Q3oxCZ7eVKzBoqq@vger.kernel.org
X-Gm-Message-State: AOJu0YxHylKurE619+0sLQO3PSWSYdu/jSOP+wjBpu5pBQZPFBr2qqjt
	a6rdEnUOUMVmxaR3y4tgRLVIM/BM1Tu716P+YUKbC7USkSAkjjdiaMoObNiQfzthdHeaGpMFGod
	qTbOfdrfKrU8kP7VTIAsivCJcxF0F9pM=
X-Gm-Gg: Acq92OHP7boXNOdr9Axh9ScH+0OKd3dnO8zra1vcVTL1MFX5foNYXgJ7AEU2yjp0juO
	1xjniPY+KIeVdaf60Q3I7Un1EsCiicedYG0gEwi3vtTePa51ZdZoe7QyOYVxHiLPxCLBE8661hP
	nC/TOiK4+sQmAyaJRgeqOYyzfaZbwS0h8F1YHiCuggGdTzhqPwqkd/h3p/HwaGEd/h20jZRvVjZ
	20jkrkEC5+d6ErjZgtWX6K/PPllsDG+7wbNgda4+ax3JxC1G3FSSv4k+qdjHhl8//jqozggtmCg
	gNFcdk6WuQhTjQCkiDs7MLOqGTnaS+ZlJAJVxs6ebyq7MWZRsg==
X-Received: by 2002:a17:907:9282:b0:bd4:6da5:d5b2 with SMTP id
 a640c23a62f3a-beab0dd8aecmr26412166b.1.1780075213265; Fri, 29 May 2026
 10:20:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260520225245.2962-1-spasswolf@web.de> <fnrz73n5jojl2wlbgrsjdtu5zuwykwbcjzznaijbquuovpoand@i6ihdqn7a6zv>
 <s7cu3dpioidx6mepmai6eyj2pxjs4skbw7v534zbzs6g2fwcis@cvokidcxy3xa>
 <4f548d61b2dd12e01f401ce4b8c865f238f7b23c.camel@web.de> <878q9dvzh0.ffs@tglx>
 <50e5e76bc13256e3f5b3301e92f159957c3d6762.camel@web.de> <CAGudoHGk1CP3gRQLCV85AFHKx6vBEyKySOn4J+AZVAP2FkrN3g@mail.gmail.com>
 <70676dae700e6a40989315bf31ea269a509ddc0f.camel@web.de> <CAGudoHEX=Su_ehV8nNP_6Onfh=hB6uiyTTCojR7nSOkEj6zh4Q@mail.gmail.com>
 <7e8f3a515208583d06c9b5ca18a3e007a8c6b692.camel@web.de>
In-Reply-To: <7e8f3a515208583d06c9b5ca18a3e007a8c6b692.camel@web.de>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Fri, 29 May 2026 19:20:00 +0200
X-Gm-Features: AVHnY4LcAg9EMC0vBy9pozkVNxhEfZnN5xmOlqt1ph5yPNhhQZBBmhxfALKw18o
Message-ID: <CAGudoHFPXP+i3q4HsZqmZaRxw-UjXX_RiUosteVESO2uv-qhew@mail.gmail.com>
Subject: Re: context switch within RCU read-side critical section in
 next-20260518+ with PREEMPT_RT
To: Bert Karwatzki <spasswolf@web.de>
Cc: Thomas Gleixner <tglx@linutronix.de>, Christian Brauner <brauner@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-next@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, adobriyan@gmail.com, jack@suse.cz, 
	viro@zeniv.linux.org.uk, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 28, 2026 at 7:59=E2=80=AFPM Bert Karwatzki <spasswolf@web.de> w=
rote:
>
> Am Donnerstag, dem 21.05.2026 um 14:01 +0200 schrieb Mateusz Guzik:
> >
> > So overall I think we are done here.
> >
> > Thank you for testing and sorry for the breakage.
>
> Just as a reminder, this has not been fixed in linux-next, yet,
> up to version next-20260528.
>

I sent a v4 of the patchset with some extra touch ups:
https://lore.kernel.org/linux-fsdevel/20260529171840.2576445-1-mjguzik@gmai=
l.com/T/#t
