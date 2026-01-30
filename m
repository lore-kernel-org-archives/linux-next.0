Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA6336C0C4
	for <linux-next@vger.kernel.org>; Fri, 30 Jan 2026 18:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769796861; cv=pass; b=Tc5l1b1+EP7yVw53tpBRsNAgX5lmygRqCtho38ACQVx81EYD1gLEXn6QV2RWiR43ghCR963jhOibRJvxR+PUpzXHHhHNcKbhxgp8S1lS2qzm7XHMYSQhyMWhjFM1hNqZLqzZBZ1leKnBhixuZDioxSmQU6WhcxUhIgPMGjoadfE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769796861; c=relaxed/simple;
	bh=p30r3pZVSEzGVwwHSYvgMTXyeQyN97pSATsnhhwMSBk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WIvA9dtA5lOjJwpsaWXrl84E0Hz3ylEO68zOr1Ie6WDA9L9g/bp9wSxlvSQfoclBcbnaXZ0G++y6RC2pWLcYF7sQCFUzjiksVP5eXiB/CEm88vj3iMfqxEEKCBNPZ/1FX0H8NCMc6UCari6JPuZVqtjPWWNs7INzyLyZxxMe2NU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gxtJt5p4; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gxtJt5p4"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-64baa44df99so562a12.0
        for <linux-next@vger.kernel.org>; Fri, 30 Jan 2026 10:14:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769796858; cv=none;
        d=google.com; s=arc-20240605;
        b=SpYi40p2K4tvYA6gKZL++sS5gD6d/qAHap2O8qVWsaMr748yjjSDPgLR66+AuwtjSS
         uetT8FDuMiv1vP/7R5Z8B9HXODTCy23OUiV6xjtmS+R2hT3nQFP2NOIYBSHryDRz1LlM
         MjXiW7OzkjPXShBt0QJJSSSeHbnFQMSvYvoAgkmOczusg/cBkxcDO8rtBr4fPlVHbTwV
         Z/+LlF7Vfdsz/bAbG7YPyiHhPiA3qMDogBP3boNdl0M/O0Ik52dwxsfMMYNbPJFDvw+7
         cv977CVxSodM5PlOznoPqUn4rSimxLXjAcMhreNj0iwgLMaELwsKrFlJ5d99PopT1DTJ
         9/uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YeiDwldSlxEmZa2fxXdN2Rp+VIUojp6ZguLqVE2yOVA=;
        fh=neK8DRzz4jzyPIB+Wjz5jq0NQabSstabKUzVnU9QYZw=;
        b=h5Zmrh/E79WMMoy05KitHkWeZdci1gB+HUZqwgD5gg6HY5Jgt4n7zXQdZKCsPUnbcQ
         686LNaHTB2tE4QVv2C+UdeJeeaaz6I5GSEEkMYqfmOGCPqL9vMaP29pFg8i49XIpBgU3
         R8s/5Ilobp5ThtBCtq9ydTkoYbmoucgYGWsHFwOzd3eKawbRDUNV+4SnPTD3be2tRIu7
         94x+B5RegeQw+BzbcHttLwiZeIGeNbrnU8G4/bfdEhyr2LPzWNR3964yG7d0QrkTDnOZ
         YQUmo4b0DF6rhzhSMCjt5avyVI+nL6rfS/m3tSdKtwZJ5Ue66/j7RJLtzbWGJnf4HAWr
         sx2w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769796858; x=1770401658; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YeiDwldSlxEmZa2fxXdN2Rp+VIUojp6ZguLqVE2yOVA=;
        b=gxtJt5p4SkOp3C3FDN+2DxeyGnrzPTM/zOptYpIcZfCuoo/zzr0UoI4hiWPYD+CJ6T
         mNulW8eNg+HX7yLz3UdgoRu1pOYa4OsbwvTZgR9jbml79MaEqaxQgdPLiidXPn1E07z7
         sdzHEjUCqplHeAePsn0SpWM2cho0NAB4hp15KA7YdOOU+CXz7sK4GVZqfd8tL5T2jVh1
         +EdLE1NhGiAc8G32Lj8dxOTUjPaG2sUuqTYFOFWCEg7T9g+bVrs5QnPQNfaMxQc+x7F/
         63gfKbBuFM/TefPAS5sdmPm4/sdTq2QUdDWBjHHMvJ930+RZiCcVSi8ZiTsjjhQFDtVw
         GKJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769796858; x=1770401658;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YeiDwldSlxEmZa2fxXdN2Rp+VIUojp6ZguLqVE2yOVA=;
        b=ZZyLiTdDtak/kaG5PGITRgt9o74d7K91r14hBLn4/v7OXfC4nPyInoDGoPBldwJ/Xv
         SVFucJBvLTpL7/nEBnDoR6Ha7eCXA3p1AloyEFshAnuq9nM7kSxN74I1JJJeuHGfY5Ue
         DtRdToGnvbQxkZEUQVdltb//h8qyx55VdlNZg3mJ+usJcVDDnuG9GwXb25qWPRBQWP1c
         D9M0zynGhghrdjqgJM6wongtxTKaYLlq+40wY9PwnKkHeDiQshxUCHju7RJH/XFPpwjL
         OD5XnE8JxNKlidS730ET0FxwaH45Yqvfbi9W9V0T4s8scsLTkPlvkbq8H2VYzrVng1mm
         wY1g==
X-Forwarded-Encrypted: i=1; AJvYcCXiljCQ1lqCm+tFVVgAAVIw945+jS+y0sh08JFec01p4CcCOdU10VmtnSBS/75q6Jljx3HIFFuGSYJg@vger.kernel.org
X-Gm-Message-State: AOJu0YyUvh6ZWt7t5ArMX5NdbQfYDG4EJrvnyl4zPRGPzYkYGeOJu0Te
	61Sax4/SOfQF+IfrpaweBKmGTmZZdYYlhSmAs7BDbhd+S+ertXCDk/bZxyQWYj4LRGPY5erBeRM
	Or2k3aRN3k9tOPRouYD5S37WgTfnhZ13QEnAzNQGt
X-Gm-Gg: AZuq6aL+D2lVGtIs15Kvyeb5Qkbh2ph3yI4qOtCVOpbxpBOWJEqCVogfTcoW24PikeS
	CHesACy/f6OMUHTkpFXgatMV0xqnXIztrj3L47aNnM9N8mP18OEFVFuEdqOhGkLlY66sO09G5yl
	KuIPZGOBqNpxmIMIA0RZ0NbD7o+aySTJ0SWL5afY3Y714twlfBOGaT7JP4qpV3ZcaWuZSXbOSFM
	aQmp7my4cyLZWVdQWFFWFIbEOvVUGN6TvM84YThUnSNvb4KBaPsWeB5N3wVpIRIW+nujVNNqNKj
	OdE=
X-Received: by 2002:a05:6402:40ca:b0:655:cf98:d07c with SMTP id
 4fb4d7f45d1cf-658f7d08d74mr970a12.3.1769796858189; Fri, 30 Jan 2026 10:14:18
 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aXzoSci8NPhIwDf-@sirena.org.uk> <c80f3db9-168f-4e05-b7a1-b1d4f702e9f0@sirena.org.uk>
In-Reply-To: <c80f3db9-168f-4e05-b7a1-b1d4f702e9f0@sirena.org.uk>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Fri, 30 Jan 2026 10:13:42 -0800
X-Gm-Features: AZwV_QifRs4w9z_Q3V4-0qqCon-tqL0v9wVC7GToRu99QshooJJlCULa8_JlOqA
Message-ID: <CABCJKuckAwav8bg20mz+SwgGb==pX09G1dhGV_3_URyMCGGTQw@mail.gmail.com>
Subject: Re: linux-next: manual merge of the keys-next tree with the modules tree
To: Mark Brown <broonie@kernel.org>
Cc: David Howells <dhowells@redhat.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Petr Pavlu <petr.pavlu@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 30, 2026 at 10:12=E2=80=AFAM Mark Brown <broonie@kernel.org> wr=
ote:
>
> On Fri, Jan 30, 2026 at 05:20:09PM +0000, Mark Brown wrote:
>
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tre=
e
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularl=
y
> > complex conflicts.
>
> Also needs this (or something):
>
> From 6d9a82fe703a084c1dc0d5a1d184bea787aa7d9a Mon Sep 17 00:00:00 2001
> From: Mark Brown <broonie@kernel.org>
> Date: Fri, 30 Jan 2026 17:56:06 +0000
> Subject: [PATCH] keys: Merge fixup
>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  scripts/sign-file.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/scripts/sign-file.c b/scripts/sign-file.c
> index a65c3e0c40b66..ef8a33ba9c529 100644
> --- a/scripts/sign-file.c
> +++ b/scripts/sign-file.c
> @@ -206,6 +206,7 @@ int main(int argc, char **argv)
>         bool raw_sig =3D false;
>         unsigned char buf[4096];
>         unsigned long module_size, sig_size;
> +       unsigned int use_signed_attrs =3D PKCS7_NOATTR;

This should be initialized to CMS_NOATTR.

Sami
