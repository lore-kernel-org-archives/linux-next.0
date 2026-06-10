Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43622772D
	for <linux-next@vger.kernel.org>; Wed, 10 Jun 2026 16:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781110044; cv=pass; b=gpHGghi7TYqZ4HA0xdqg1Hh2w0l/5HIISORaMh/otSz4YNh5nMr/891ovu5LXkKSPauTYhu5ySoNEIN8j6fg8TTfKc641Kxzl56GRz3oleuBMkhcf5zlPYIY16rnteXzSmcOj7vA4GZ+daeKXqgiydO/15u+kedKqJ9KXdBYCNA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781110044; c=relaxed/simple;
	bh=bJPMK+n9kNs9VYtlCdZG4ar/fZCsZa1rLt7V1RUmUs4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GJXNyDi1FD2PYZURwscWEjysC33aUI7jbkru+citoMClNAo9ZTzKP7uUXGG1r1cFg5FT2lWCKk69A5a6JGzyKCU8KnZTOQ7S9hha5sXIFGHoIMC+NDOp3+R2CV+UItupCs74pU2yP7mUkOgyPZZIIfhkTmEVMHjYQuoFiwlEsXQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=S8xgl81P; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=J0Pjd44y; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="S8xgl81P";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="J0Pjd44y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781110036;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aDu+e1AMetHMPsQqz45LnWNPVV4QUsimvh589qwi2Gk=;
	b=S8xgl81PrIB0r7JamNvlmoR02Ip8lQM5PgVaAfELJj5QLQzEC7I74SM+kqKcRup8ioRQSM
	3D6hPaQP5efbbdLrYRJjQZC7b/MC9i0JckQpK3afh9EqwJ3m6QTfOYX1l2gBL8Ko1Hqvkt
	7jE/HpiggTW7iTp/c7lNiPPUmlA9ZWI=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-552-SMqX83KaNWa5FctLNF9zuw-1; Wed, 10 Jun 2026 12:47:14 -0400
X-MC-Unique: SMqX83KaNWa5FctLNF9zuw-1
X-Mimecast-MFC-AGG-ID: SMqX83KaNWa5FctLNF9zuw_1781110033
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-bef47d1593cso654341566b.2
        for <linux-next@vger.kernel.org>; Wed, 10 Jun 2026 09:47:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781110033; cv=none;
        d=google.com; s=arc-20240605;
        b=GLMaQI7D5VHMnElk8HM4KpXDq7Pkn6y0eSmvMhFY5qX5lWnnNLcr2NEi2LdtXVDKuT
         4dF9iDGtUuEVuYs4lzKxiAPUCVKAD1ksx7wqtHMtnSZHOT4O04BSwBx/cCZ0SqKU60bU
         GCRbfdHvQmrolKF/2UA+bTMRfgpgA1dbwy2OcdSp4APr2kYLgPE4jeuvQ1CgDRa+ycpc
         iYBQO6zHUkkcfnTCZ2kIbSqRNqeLIMiPnM9zWiXvvRy93jaRFLjlaSF1eO9NHPQnz/UW
         00AvkpeJuYejaUqL3XPxxdMFKz/hE0B5hUbK8+Y39QP2mygdrzyDWPKEkpdpHtDFTg2w
         E3Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aDu+e1AMetHMPsQqz45LnWNPVV4QUsimvh589qwi2Gk=;
        fh=KMvxfTPk61BBzPBFMyceB8MaGJwyT4+eNyzNIT19ZA0=;
        b=h+pgHtuoOIXv8q4mxXV2NfRTfvQKYEK2NHN3w0OdWK0rV4JN/UPZ1CQj+Mp7DF5G5c
         hq3xmunwu/be6fHQMbidzaTNJrECr+yJORMvHUvFuOQDNxbW41aLPf0/9jbyqQknkU9n
         OOq82itwO9bTwoet0dr0LLApbko462BkaPVtrdqM6vKwr8QDEUUZt9iHr5HKqki96odI
         quFrKQWWNARzzdN+NCJ+gNl8+u+1CeHOyQ27QUff+So/Z4fvWfQjwnj8YV5C0EAn401j
         KhWtWiiQNNNpAgCMYdSjVGcFvPUccaIsZFK5Ij49Gsfhk6ehKV99zBIaStTsyWrieB2L
         VejQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1781110033; x=1781714833; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aDu+e1AMetHMPsQqz45LnWNPVV4QUsimvh589qwi2Gk=;
        b=J0Pjd44yELh0ApGArukATvbrI7CaQqN0U7aQGbMA1k+EL9ujDKanSLWqEGvfjhfSt3
         ANF8GQixh5Uvlw6LWou303seMnEaBV5fsZibxwapjzW+3P4D+2I7OiciYFX/okSAGktD
         TB0EELDcx7m63pO1tvJ55VRFd2O426146j/LcB95H0NJj01WS7PPfaVtmgE6PxF0HpbZ
         mcaOwaePN8h9KlP2vMWpwaSvq8JawOh0EYo1KKxgff23Sjv1KyQAt+PBeh69g/pBdRZ9
         H8NhJmeet7HuV6c8hTy2YEOVS/3R9N9z7Ly4ba5tINBtP1yZamiuu4GpbKwqz9hP6KcV
         augQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781110033; x=1781714833;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aDu+e1AMetHMPsQqz45LnWNPVV4QUsimvh589qwi2Gk=;
        b=qxaLIA7A71QEGQH2eDwy97KW0vXY1CC5xcnxKMTD4X94ICkzq16YNaxQPobQgJ3wXY
         hLe42Kgiu+RNKoV3vSi2u2lfxB+IXwkAHdMoLnBefOgPq2y+LVn78Ik0o4bR+llFTDYD
         ufF1b/F0Ve/0FmFw23vCRLPtaFE31E+MBKRPxsY+SEVKEGINGQSaUcaHjksCT4wx7dDh
         v6XLyWWKzBmWHP55GIcp/Wdraf7x0Xatg2u32wxxLUSQBpFP0oiaIa4DEiFwdD8Rmq23
         4KHT+eR7zNfc1W7mTjnp7JacpCQ+P2VqGY/MwMcoQ0PwK1IlzgD7yRhDZJSA4h8GAimX
         sJ9A==
X-Forwarded-Encrypted: i=1; AFNElJ/zDDZiFJLF7g795y3XggbT85BnCabJXWjHr+2dN5qjenbjKGCIeh3pAC9mk/Uht1hIO+AwAF7tY9a7@vger.kernel.org
X-Gm-Message-State: AOJu0YxODdo1xeUel8Q9KkTBXVjUevPFMBvJgvj1kMiFswRUv7/vh0MS
	xNYFP9mjVnxAS9CCoi/YjkPW1nBkK7IFnIRkJaAEp+baURTFqB94hwa++8x9ygem0LlKOmq5dj2
	vGzlWtYqHwZ7OENDClJMD7eGR60bvrbGTj69pizJzRWNRbWrVqY2fR5k6WWdHkkd7nstM0c774i
	bCwK4VS0DORQziILl1o+rWRFFiMONJ7X49zlFEBw==
X-Gm-Gg: Acq92OG05UBEfdGTyyDYNN9dtJwF3iU6cAZKdEsqcPsLbzzVy2x1lXSEkPaLnn0DPRh
	V//6uwnRR4nCVG9GEEvQu+eoHSfYdfdQelp8LyL0oXIiBVUcYr7RrcGelmgeyfmu+TJeCvFg3HH
	t7OSYqapHglU1mCH/hkNhMbkD1CVmG5L4jGzg1QiUE2iXFCrw6/KuQaixOEP8QJr5j48MTjB2+h
	e6sKiCWcCre8dKYDcze/pziS2xR3H/bvK+6m60POA7ptSQ=
X-Received: by 2002:a17:907:94cc:b0:bd5:7c2:7622 with SMTP id a640c23a62f3a-bf373afc3a1mr1403258166b.49.1781110033353;
        Wed, 10 Jun 2026 09:47:13 -0700 (PDT)
X-Received: by 2002:a17:907:94cc:b0:bd5:7c2:7622 with SMTP id
 a640c23a62f3a-bf373afc3a1mr1403256066b.49.1781110032856; Wed, 10 Jun 2026
 09:47:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aimDwlNq_RRLjg6X@sirena.co.uk>
In-Reply-To: <aimDwlNq_RRLjg6X@sirena.co.uk>
From: Tomas Glozar <tglozar@redhat.com>
Date: Wed, 10 Jun 2026 18:47:00 +0200
X-Gm-Features: AVVi8CciGMcd0SmAZbMWTTKth-zqEBd-lJXxbAnZPfnqJo9YOeGu2lO-HtmrjkA
Message-ID: <CAP4=nvRRmvRKgwedXdNf+XrBq11YDepA_34BSUZBN4SLwgEwgQ@mail.gmail.com>
Subject: Re: linux-next: manual merge of the ftrace tree with the tip-fixes tree
To: Mark Brown <broonie@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Costa Shulyupin <costa.shul@redhat.com>, Crystal Wood <crwood@redhat.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

st 10. 6. 2026 v 17:43 odes=C3=ADlatel Mark Brown <broonie@kernel.org> naps=
al:
>
> Hi all,
>
> Today's linux-next merge of the ftrace tree got conflicts in:
>
>   tools/tracing/rtla/src/common.c
>   tools/tracing/rtla/src/common.h
>   tools/tracing/rtla/src/osnoise_hist.c
>   tools/tracing/rtla/src/osnoise_top.c
>   tools/tracing/rtla/src/timerlat_hist.c
>   tools/tracing/rtla/src/timerlat_top.c
>
> between commit:
>
>   e9e41d3035032e ("rtla: Fix parsing of multi-character short options")
>
> from the tip-fixes tree and commits:
>
>   704fe8f3d97bba ("tools/rtla: Fix --dump-tasks usage in timerlat")
>   f03a59f949176c ("rtla: Stop the record trace on interrupt")
>   5d9af63e80b5a2 ("rtla: Parse cmdline using libsubcmd")
>   03d745b9843560 ("rtla/timerlat: Add -A/--aligned CLI option")
>
> from the ftrace tree.

Good catch. It's actually a fix for 7.1 from our tree
(linux-trace/tools-fixes) and 7.2 queued patches from another of our
trees (linux-trace/tools-for-next). It appears that tip-fixes is based
on master, which is where the tools-fixes commit came from.

>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>

The conflict was because I fixed a regression in 7.0/7.1 in code that
will be removed in 7.2. So it only needs at most a note to the pull
request in the 7.2 merge window, I think.

> [truncated huge diff]

Looks correct:

$ git diff rtla-v7.2 next/master tools/tracing/rtla
$

Tests pass on linux-next/master. Thanks!

Tomas

