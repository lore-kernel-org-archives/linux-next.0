Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E7341DDC1D;
	Wed, 29 Apr 2026 17:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777484878; cv=none; b=tCNUGeLOThvM27EYW03HgQJmGTNaKURW9Qy1uCneXDQpxvdsbYcLCoTfN3CH2noh4S0T+8S1knzxWZH/oj6YWBryulXMSmHBGgxt4VULU7lNT9b5ni/iV4BdyGeacjvdH/RMJuzDPTar0ieb3JSuF353ZJQEA2UMmCZcNuZkQyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777484878; c=relaxed/simple;
	bh=JCuqw8tc5VhwQWEXMYwdtttK+a3zqWu+ypwz5hoBXpM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ZYtB7F+aLYKQie19bh2DoD+vEVtdtwF1YISQFhvGJlmjW1F/d+HvhfoqOnbn5QK/qAKsfVY9STkzHOm64vquxQIw8FW7mjTjFnnMvk5YbwLc8CkS/Hm4UpcNXrDxgStdknOUpcGSKJmF2jSobL76WT9rXNVfn6uKgO0Pv//U3tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=229VsUUC; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="229VsUUC"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 021B4C5CD5D;
	Wed, 29 Apr 2026 17:48:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A0ADC5FD43;
	Wed, 29 Apr 2026 17:47:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D227C1072B14E;
	Wed, 29 Apr 2026 19:47:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777484873; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=JCuqw8tc5VhwQWEXMYwdtttK+a3zqWu+ypwz5hoBXpM=;
	b=229VsUUClTIIoYShi3957WWWkP1vOKbEIN9d2TIWaWEoYHqsRL9VZJvRijAGhJ3PpAdBG+
	FtwUu6W8hJXmb0P5SE5TkeT1sOwosts9brUyJ36um7DYuJGAKXhGo1/6FqW8dVBgzhvc9o
	Gi4/Zcn5vomdlRpM+ZCGd21T8J57NGbg7Lm1bPJvisgE7z3veT6YH9XDs01Exupngxlx1T
	PMIKuPaQXPK1kzYjDtjbkr1WHUbwFSx+mDl3dr8Cbq9a3bi0CLW4HsHrO85Oha2fksdplj
	ZGXZK75Y7fzELkiwcddtOHW8bu7N65v10mDIRdUIJ818v+WxjZJmJVygD1mwqg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,  Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>,  Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the nand tree
In-Reply-To: <20260429100752.3983097-1-thierry.reding@kernel.org> (Thierry
	Reding's message of "Wed, 29 Apr 2026 12:07:50 +0200")
References: <20260429100752.3983097-1-thierry.reding@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 29 Apr 2026 19:47:54 +0200
Message-ID: <874iktd5f9.fsf@bootlin.com>
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

On 29/04/2026 at 12:07:50 +02, Thierry Reding <thierry.reding@kernel.org> w=
rote:

> Hi all,
>
> After merging the nand tree, today's linux-next build (all of them)
> failed like this:

I've dropped the series which will require another version to handle all
spi bits.

Thanks,
Miqu=C3=A8l
