Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B83633FE0A;
	Tue, 31 Mar 2026 13:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774962938; cv=none; b=Vkw8zmyrAympydeylmyGtY+UzbRx7hr2g+BlflvOnPvps/tnpPDHQfKscqT4ExFLiZlH55zlaUXdGE7pB1eHwnbtCzbqrBbzSN1uryGQz2LEJHMlEQP2YW/53ytYU8kQJX0XuGP2lTWB8UBs/poRounMEqQJJLNF3f8eEwXPpqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774962938; c=relaxed/simple;
	bh=i9x3w7PhH5PAUAoTqgMAyr4C7HwdocGM4T8ebXd7O9I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=GIHTKD5Gr5+oNd0DekT/JS5xGG2+DmNqc2Xd2NN1g9g9rfE5sL/wmel4r30JKwdz5CTNRzvbPO4Y/Awr4xXL1dSLX84etXWMAh+JaY+EYjBTQQF94q5E24v8n5OQaxATt4Aoiu59gHGBIktIzC7ZBfisi00RG7Ezj1L7+d1NAWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=nvcKeqW1; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="nvcKeqW1"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 70ACC411E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1774962936; bh=ERtyHu4sqqawOrskjRQolQPPRJJINIwoGWegvoWxAFY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=nvcKeqW1Q/eW36DXv395icSGPO+mb7nnIug4FWtgv/9uFlVH26tFMjy1kLdThvsZF
	 ntqtq8AreJLhDpsYSZ30PcDNzQ+aNW4inn6T5e+TGQDtrqohyjzRHYHvag5p5VNHGs
	 bhjorO0+ReGa0uUPN3HAMC21Akx7XlfSYl6PkeyrMjnNLE23eEJhZPF4uhNI1tdNCB
	 gS1BREp+/JSim50BYt1ugNdOpTtoeSubnD4Cp6G3Qb+mBl0kpnzLSfz9Q6Rwjm20qI
	 Ov2fBjiM44GG4acG4J6R60qkuIhIutajpR6JxXcnQMbs1zkl8wkqr3c6AbfAn2vrxE
	 dwzOSMlS1eI6Q==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 70ACC411E5;
	Tue, 31 Mar 2026 13:15:36 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mark Brown <broonie@kernel.org>
Cc: Alex Hung <alex.hung@amd.com>, Andrew Morton
 <akpm@linux-foundation.org>, Harry Wentland <harry.wentland@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Sasha Levin <sashal@kernel.org>
Subject: Re: linux-next: manual merge of the jc_docs tree with the
 mm-nomm-stable tree
In-Reply-To: <acu9nEoNNDLSiu6i@sirena.org.uk>
References: <acu9nEoNNDLSiu6i@sirena.org.uk>
Date: Tue, 31 Mar 2026 07:15:35 -0600
Message-ID: <87341gm96w.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Mark Brown <broonie@kernel.org> writes:

> Hi all,
>
> Today's linux-next merge of the jc_docs tree got a conflict in:
>
>   scripts/checkpatch.pl
>
> between commit:
>
>   d1db4118489ff ("checkpatch: add support for Assisted-by tag")
>
> from the mm-nomm-stable tree and commit:
>
>   8545d9bc4bd08 ("scripts/checkpatch: add Assisted-by: tag validation")
>
> from the jc_docs tree.

Ah...I didn't realize that somebody had already addressed that problem.
Certainly we don't need two of them.  I can drop mine.

Thanks,

jon
