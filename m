Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795017753;
	b=Cf31C8vLHQIyPlK2VwFFKZEPelcGZG7uqULND37QKLT+qTjwuIQs6sW1pLiwK8VKrE/P
	 NT6Dds0+9DIM58U4dfRqu9d7LYV9UUMGFXAkhgxHhxNgPtIzZWpnbdMPQ3hzMlAyA/Rg7
	 0w5nymKLaBiWf3j9KCFkAv56//wBUA39jaQ1FS2wcZXOIWBbMdOMAB7u33OdfludsOFfl
	 5bzhowJ2W6XeQBUfs4A+8YElTgujEXPiaswe8uTwyyY0DF7DY15cJKZImQcpTKIZNsDpL
	 TYPreoC8jRlJsbqf0zuPKWh71N8RJeNN8XosBiPzQBRNlGkt4gMutSFfq7J3TrYYIJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795017753;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=4GTSb01MmOhA2XPo9Xkd5dYWZ81pB0r37/OWJT3zMpI=;
	b=exeVy55vQ1LH1/BFGymHIfsdDAeDyopfJTcfzPW5i8MyD6Rd3xhJ5EY+PkwJfj9Z6Wmo
	 9EBBeGmzqwe2EDHFrhWf0s++JnuYvcmamOttufXLRFsIRQs9ZF7XjNmOtt5i9cam7eGqc
	 YlYWCZehSh6EWg+dAofIiHh2UucAdfADajekJDRn+5s7Ld/qR7DZIBd8xOif2ajURZzgt
	 6DACTZ6pZNXvQbRyd4RHT874i3NdXodTJWLV8Wki85V4GqJ1eGEUtAu6FXCM61w6K+mxb
	 p/wNlpjERG/yIwy4xuolIH1k2vw+niK40zidpAAVNegVqLs+sLa13CKOxrUwHm+eK0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=d2AMEmgS;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433D9606A333
	for <linux-next@vger.kernel.org>; Wed, 18 Nov 2026 16:02:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 433D9606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=d2AMEmgS
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id EB2F0C79A9F;
	Wed, 18 Nov 2026 16:02:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 131845FE9B;
	Wed, 18 Nov 2026 16:02:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 997C011BC2660;
	Wed, 18 Nov 2026 17:02:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795017746; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=4GTSb01MmOhA2XPo9Xkd5dYWZ81pB0r37/OWJT3zMpI=;
	b=d2AMEmgS9kekaFUie2VHKKBhxApfscNozpOI1gqktKKg99lBoZluEawtDKaRV64cxbRhGe
	ShIDcbwJhGrWQ8t+6rX3Tdyjqi6xLtzuSOdIXdCazIMX6BP8ghwqfe4OrdzLqIp7yCRB8U
	TMRWqXGOuDPRh3vBHtrfLKJogsuhReydnIsUJR7UvqpBq7fkysapc1ig2s5YPgvLVBxai1
	DNtuI9kKBgjm14/DOrfzcx0wDy3emMfP1v/bjUiB4jFFag89FwgdM8ByqQlyCNwJkzR3lm
	WhfBkI7h0AHZOfXb6zmFZqJgcYn30nBBzH5UFCw0gqoPLXjJoGStYd0LdKXeqg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Cc: Richard Weinberger <richard.weinberger@gmail.com>,  Kees Cook
 <kees@kernel.org>,  Kees Cook <kees+treewide@kernel.org>,  Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>,  Linux Next Mailing List
 <linux-next@vger.kernel.org>,  Simon Wunderlich <sw@simonwunderlich.de>
Subject: Re: linux-next: manual merge of the mtd tree with the origin tree
In-Reply-To: <av24MbMORkbY00UX@sirena.org.uk> (Mark Brown's message of "Wed,
	18 Nov 2026 14:37:37 +0000")
References: <av24MbMORkbY00UX@sirena.org.uk>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Wed, 18 Nov 2026 17:02:24 +0100
Message-ID: <877biagmb3.fsf@bootlin.com>
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

On 18/11/2026 at 14:37:37 GMT, Mark Brown <broonie@kernel.org> wrote:

> Hi all,
>
> Today's linux-next merge of the mtd tree got a conflict in:
>
>   drivers/mtd/maps/lantiq-flash.c
>
> between commit:
>
>   4dd10fbbeb9c3 ("treewide: Convert devm_kmalloc() family to the devm_kma=
lloc_obj() family")
>
> from the origin tree and commit:
>
>   fd1cc5b1dc4f2 ("mtd: maps: lantiq-flash: fix NULL pointer dereference o=
n probe")
>
> from the mtd tree.
>
> I fixed it up (see below) and can carry the fix as necessary.

Mmmh, I discover this mess only now. I rebased my branches on top of
-rc2 and fixed the conflict so your fix should not longer be
necessary. I hope you told Linus how painful it was for everybody to
handle such late introduction :)

Thanks for the heads up,
Miqu=C3=A8l
