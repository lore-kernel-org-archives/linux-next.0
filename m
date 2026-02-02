Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0BE1DF987;
	Mon,  2 Feb 2026 08:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770022052; cv=none; b=W8Uh0CpZyggKvvYZOK9KZyWflOlSNfqWiAaJPAwRhLtk7pqtmag0VKEU7l3/VhrzKp6uoyd3m4Wb6lFW7anIx00x/7DtJK7rNbA7SnDtL2xXZ3F40HOSyJu3ejCfg4wdJgAu6CjJEQqOm8qpt0F+MpXREtup8TP67OX+b64XxQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770022052; c=relaxed/simple;
	bh=6mRUGNMEDMzBfg/CfDSO1kvMVbDMb7p7BXnKWH6uwKQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=mQyNTVZv505nxrvRW6p6vQWgKHOj5kd+YtH9vOirBDClU2TyQ9zRST+Zw9prbo4h1WUOKQzTGQ42pvUBEDzFxIdE/ldBEKuUDhp287RkrG8ctpzF1/oNiY2MQOzgoUUeYAg+5p0JMxqAN97ZCrmL8lHIQj+DykE+LI9jktr9QJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=y+38oE9q; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="y+38oE9q"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B60C8C237D5;
	Mon,  2 Feb 2026 08:47:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0729960767;
	Mon,  2 Feb 2026 08:47:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 68DAE119A8891;
	Mon,  2 Feb 2026 09:47:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770022047; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=8DNuIAe1kj3PzrgGQvoj1f5HRITp+2dedYbsCU7xDQw=;
	b=y+38oE9qlw4jKr2ys3OTihZT9T+uE1hIunwa7mw5yj35ICH1cIMlLMhXw2kBSODSvNoDEF
	qE4iQTCDDpPS+hKHlw5h0G7X6BQ4xEcM2W5qFr564VcY8nd8u2GCHm5Wd5vrCS37AD3wgh
	tdffoL9VnuINV5PuJdBqXJkjxM7VL/jh7OAagbgVPeHdOW9me+wITBYsUcSTUWdL/ysWo/
	NE3pF6L1ilssDzA32B9PNTTWG/o1IaK6qg0/XOKcuuj2cc+AOqH8C+FfO89tXo6FIhHl2A
	DHuZsrzn00DfJMHlr0uAPYtqpeirywi0ORaAXNaUDL81cKmJGPLgGvQdEXSWsQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Cc: Richard Weinberger <richard.weinberger@gmail.com>,  Bernhard
 Frauendienst <kernel@nospam.obeliks.de>,  Amit Kumar Mahapatra
 <amit.kumar-mahapatra@amd.com>,  Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>,  Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the mtd tree
In-Reply-To: <aXzSe9_CZr7x8Qqg@sirena.org.uk> (Mark Brown's message of "Fri,
	30 Jan 2026 15:47:07 +0000")
References: <aXzSe9_CZr7x8Qqg@sirena.org.uk>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Mon, 02 Feb 2026 09:47:25 +0100
Message-ID: <875x8filb6.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hi,

On 30/01/2026 at 15:47:07 GMT, Mark Brown <broonie@kernel.org> wrote:

> Hi all,
>
> After merging the mtd tree, today's linux-next build (arm64 defconfig)
> failed like this:
>
> ld: Unexpected GOT/PLT entries detected!
> ld: Unexpected run-time procedure linkages detected!
> ld: drivers/mtd/mtdcore.o: in function `cleanup_mtd':
> /tmp/next/build/drivers/mtd/mtdcore.c:2641:(.exit.text+0x18): undefined r=
eference to `mtd_virt_concat_destroy_joins'
> ld: /tmp/next/build/drivers/mtd/mtdcore.c:2642:(.exit.text+0x1c): undefin=
ed reference to `mtd_virt_concat_destroy_items'
>
> Caused by commit
>
>   285871f1ff3c2 (mtd: Add driver for concatenating devices)
>
> I have used the version from next-20260129 instead.

Sorry for that, I believe I removed it on Thursday evening due to some
robot report, but it already reached -next.

Cheers,
Miqu=C3=A8l
