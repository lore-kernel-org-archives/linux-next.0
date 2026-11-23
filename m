Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795469196;
	b=gm2yVt8cLQC2woysDFv8mMBzJFxWwjRrBPNe18nIlmJS5KFx+2vwS3mc55Nn+d8ccuJe
	 adQ4W82P6Lq4D9cNvWEUxh2GvaOucVrqdwXwsnL950i1oxzcOpsyDc++bIHPkW6AAIx9h
	 nRFHUykMQ3xhGcjWsWK451dusA+zkNAD9L7ZwvsaGM5srLFEWIP2/LYg+cskR3fwVBSNE
	 wYZ+pynI7GRiueQtOeNtYhvG9w6hxU2Y6OZK0tvHIHYcesQxVAD6klf8y0UtnR9wnoppa
	 9ojCW9R2Dh6kIAqVzbTabE4yXJnuD6ZqZkXjDIvGLHmpvx4VpdnJnGZP4EmYMllal4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795469196;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=n/WCGzaIaGx4yqucDjys6t5mpX2+KO/sE65etnvEMUo=;
	b=W7YllKJ19qyYYutogDAF4nCJJia2CuTVXqnY1SlXrkcm4u6OTPQ+adGrF6qQeWIA12sz
	 CrLKUsX3UO6K8+zFea6vyR1fD56nJkdyhbCyxcIOmm+8Daoeu7DfDeeWRBSob3E0OQ3W4
	 HW+e+/vt5MElGxfkEMXiJWmqWWltlNelUXuKGkovVs9umXhNjxV8zPBxdF/W7bHqwYTBs
	 HPuD760cDk0UJ4bdEr+QZ+1xQF53k1I9cfDfyXzCFnnLzhTJb1oo++HJujGBLXepC50wP
	 oDszAhmBUH3ppiVShWSQRiY2eca3RLh/tlVxpJdTlxkupqgfdfFrx40UrSWLRBIzm6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LsdBE3ho;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5167E606A33F;
	Mon, 23 Nov 2026 21:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LsdBE3ho
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06DB51F0089E;
	Mon, 23 Nov 2026 21:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795469195;
	bh=n/WCGzaIaGx4yqucDjys6t5mpX2+KO/sE65etnvEMUo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LsdBE3ho4FGr48OyKCgJcupgVtgiP88fGDiAz8U2szVkGhp0AjAdNSd+1HcXoZTo0
	 ci7erL4ioE3IV1cXcWSm/noVUIpWxL9hh3Apo8/5I87FAsaQ2XN/f7FUMo38ZmtJIy
	 AAwjkU5Sgs8F16Ee3vO0nimJsnmJ75KEIpI95izvh2m4pGrp788eqdcoZvsHVmt99g
	 Ye/90fQ0EY7sq6553XuRZxSLaejsKLt82MUmE81PrThuF4RrM8MyyKtBJGVbdB71SA
	 IMfccvcWxvUSxqgHkdfdU58PjCmKM+CIM5fe+ZM0rAIATVJOly95U0IQ7u6nbzPrkZ
	 F+H9M8D6m/ojA==
From: Sasha Levin <sashal@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>,
	Namjae Jeon <linkinjeon@kernel.org>,
	Chi Zhiling <chizhiling@kylinos.cn>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH linux-next] exfat: check the emergency state in exfat_writeback_range()
Date: Mon, 23 Nov 2026 16:26:33 -0500
Message-ID: <20261123212633.1204021-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261120003508.2135492-1-sashal@kernel.org>
References: <av2mOPyANz3H59F5@sirena.org.uk> <20261120003508.2135492-1-sashal@kernel.org>
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ping. next-20261123 still calls exfat_forced_shutdown() in
exfat_writeback_range(), so the emergency state check is still lost.
The patch still applies.

-- 
Thanks,
Sasha
