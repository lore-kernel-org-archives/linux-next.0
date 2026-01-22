Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73879331A70
	for <linux-next@vger.kernel.org>; Thu, 22 Jan 2026 15:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769096573; cv=none; b=dKXWJrD7i6fwKAZZLyYREQ1EgH6cboU/0VePjSMTW/ePxeepjsiqfL0v71NPvgvp2wJQCnY7wPRGM2cefJnNsHR3DqZPpDVFp8P03UNSYendeWiD1QElMZMQogpwCFWVNEcaRla5hgwUtrdypfCMTOCpS05x48hncDNfWxu0cgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769096573; c=relaxed/simple;
	bh=QG5leBreepomJMj1lhP96Y7/vXZdiqlEUBIS0x/lw1g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=lUOSy0spdPzz7X1pdLs+CUzWI9pi5uA7m79i6vB2Szb6X8CgO62e9FauNy+589+nqwAQmdnpccJoHj6DGD/iyR40gj2xAc03S07dY5gepnlaGthVGtxbudwayPpHX0HXv5d4X0AIAh8vF4VbAsAWMxF6wiNotwmTqZBnxwj5kBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=KaNCiFYJ; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="KaNCiFYJ"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 07DFAC21AA7;
	Thu, 22 Jan 2026 15:42:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1CD54606B6;
	Thu, 22 Jan 2026 15:42:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 92E8E119B81CB;
	Thu, 22 Jan 2026 16:42:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769096566; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=SOmGscFs7r5NB2UVLTaTgcueAVuDgMlOIx/P2QDY7y0=;
	b=KaNCiFYJSef5NhdRUS2zUwtd4cSOOd1nYa/SsIeWrUvyOYEymZCR9QqaRBTv5b0JsgwCnP
	bBuu8P5AKt4OyUARwS6MsW5Pctbu/vFWAptsfR9bn33W5593dwAAKUho+fPRnwuzIkl0mA
	wRIHZ0oLmlO7xCikn7R3V1hjr78wXlGqqwy3v7AuO6wP9q4ftuXaB/Pi5RJr7IVerafJNU
	y+uIN3XJsxHVVHMcH0zLEqvE2mYPBKhWBjb2HbTtIXqkL7Ig5kmHDcGzA4Xoqx7EfUskYF
	KjK1l/9m3Au6gFNBUb4qo9ZOYs9CkMiAVj0Qe1TlOTyamFHNBEjlUlASqIwJDQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Cc: Richard Weinberger <richard.weinberger@gmail.com>,  Linus Walleij
 <linusw@kernel.org>,  Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>,  Linux Next Mailing List
 <linux-next@vger.kernel.org>,  Rob Herring <robh@kernel.org>
Subject: Re: linux-next: manual merge of the mtd tree with the origin tree
In-Reply-To: <aXJCtrMEK8vhp7wc@sirena.org.uk> (Mark Brown's message of "Thu,
	22 Jan 2026 15:31:02 +0000")
References: <aXJCtrMEK8vhp7wc@sirena.org.uk>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Thu, 22 Jan 2026 16:42:44 +0100
Message-ID: <87sebxodqj.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hello,

On 22/01/2026 at 15:31:02 GMT, Mark Brown <broonie@kernel.org> wrote:

> Hi all,
>
> Today's linux-next merge of the mtd tree got a conflict in:
>
>   Documentation/devicetree/bindings/mtd/partitions/seama.yaml
>
> between commit:
>
>   54de247a0efa4 ("dt-bindings: Updates Linus Walleij's mail address")
>
> from the origin tree and commit:
>
>   125981ffa1674 ("dt-bindings: mtd: partitions: Combine simple partition =
bindings")
>
> from the mtd tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>
> [Dropped the removed file]

This is indeed the correct fix, as brought up by Rob already. I use to
avoid these cases but for this one it is apparently trivial enough so I
decided to pick the series as-is.

Miqu=C3=A8l
