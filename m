Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 489CB382398
	for <linux-next@vger.kernel.org>; Wed, 29 Apr 2026 17:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777482755; cv=none; b=Q19E6tgPUtmwRXWmVrIGsf57PdZez+eBIrHlV24/clCqnJQNeJVl7C2Hccd41t/xL+Xd5sAIQ0kIZ68T39bzFY2EOEc1bqAyL7GTBunpVOBjg4l8yfov6ChzilfW90MeHlhHnNKlkgdUcwAqTDMAo4vdR/MTVOAXam6nch+0xQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777482755; c=relaxed/simple;
	bh=XJFgbyWeEN2mnH2BfNZG39u/uJZWK0Xuo3aevh1GrZ0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=tLAhwMxCGWBWlsUBCFFPInFNL9hv7XMB7XhPuYWORmBOVGIZPB3GPT/lyoRgiIesXD05Fw+JWRWJr5uXYAOZ0/3mH6qRZLR4361wfmCGRh3za5dPQe6grLl+yFU1OIJSuhGOh+Zt8W7xFIU0Kl44ChSufrF38DpPaup41JgZ+PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=mrrOxjWp; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="mrrOxjWp"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id BCA3C1A33F4;
	Wed, 29 Apr 2026 17:12:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7893E601DF;
	Wed, 29 Apr 2026 17:12:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2444B1072B0F5;
	Wed, 29 Apr 2026 19:12:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777482750; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=6FFUVmCvFv0g3QJHxJe9Pgz0PIUfIPqS5+RjJHAeKhQ=;
	b=mrrOxjWpKbb5xBwGZbQYF7yuEmERHw56ZLtlUfHK0cRJhYGK+6syOpb3fzqjz/dz1HMmuh
	jANtEODQ/CEgduwavjlT3XtjFy+hX/+m/F/S1+pdDSkKi3WPEUXj4mpsmkJEv0qDuHeoEc
	MWu04xgJxiGe9qarH4PeMyLIdQ7HK3Kuac4dc8cHf/BtrxHGSE5I3iQVpywX0zdlEv57rm
	356/cEkTIF/UrKOD422oMS+1fawMRczPqPuVWhcKbOe9hPUhJH5hm031hktCpunBkc91Xa
	immKFmH48N5/ImuLHTuvAb44jQD9qQYPAV3nlYD0lj7z+9C9+vTWF1GQXBh6Fw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,  Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>,  Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the nand tree with the
 mtd-fixes/mtd/fixes tree
In-Reply-To: <20260429100717.3982889-1-thierry.reding@kernel.org> (Thierry
	Reding's message of "Wed, 29 Apr 2026 12:07:16 +0200")
References: <20260429100717.3982889-1-thierry.reding@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 29 Apr 2026 19:12:31 +0200
Message-ID: <87a4uld728.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hi Thierry,

On 29/04/2026 at 12:07:16 +02, Thierry Reding <thierry.reding@kernel.org> w=
rote:

> Hi all,
>
> Today's linux-next merge of the nand tree got a conflict in:
>
>   drivers/mtd/nand/spi/winbond.c
>
> between commit:
>
>   8d655748aba1 ("mtd: spinand: winbond: Set the packed page read flag to =
W35N02/04JW")
>
> from the mtd-fixes/mtd/fixes tree and commits:
>
>   9980ff0d528f ("mtd: spinand: winbond: Add support for continuous reads =
on W35NxxJW")
>   a211bd1ecc0b ("mtd: spinand: winbond: Ensure chips are ordered by densi=
ty")

I forgot this would obviously break linux-next. I've rebased -next on
top of -fixes for now, I will include the -rc that receives these
patches later. Merge should be smooth tomorrow.

Thanks,
Miqu=C3=A8l
