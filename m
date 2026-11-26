Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795705767;
	b=cr/IeccV0uJBkuZVud7QkndtMNHjiabUJ4y8eaR9mFIWYXnA9sQTUcrkUQjsAKYcnpcE
	 6jtiC+F2uMjFSFgB42drA84qpUZI0vl9qtpt6ZBDZxi9/JUMYgLXubf+zkcGWpAHaEWfU
	 TqlMbMqU+hTyjUIYDS2g/CPI8nQErO6lMQbFWzFmbrFsIFiZYngVlEJEYWBBBzyo6fyqU
	 XZs9DC2RFf2y/nOWpSf7H+VQYOy+osl78Y/CCvUlBzIbwIuKzRMYZojAQDM2GTJCSXPfj
	 SjeHQ1SegwWNCpwMbkVpcclUsvv9CfhPe85r6zyg7PGU319f8TWsADBIvfHcnJCCyHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795705767;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1MQmSQf0FS54ims9l1A+SvUP4EmsVJhYKSAxitHEx2Q=;
	b=xTKXFjxEKOUTle8Hwpjh40IOAjQsGjbEdQ1OtkBj1JQKG3FMKSzfzS8FcBtdsJDUtK7v
	 mhLfebB9TVbeYogdc1aQoV77i/Iey4LRWPPIYdHWzG4sj3c+ZLyDKOTQib7zQ9yaJnOVc
	 mmqWd0dXzEPJeC8DuNY5/UrvISKvouIp5gjo/nvHxcy+wg/yv08UuibrSlrbb+gYKuEwN
	 GIWZO8zOJvNnRnnXqsOMsJ/OpB9099SQiFz74xKoogp9Ttle2pQ/QzDCCkP6DfFPs+G4D
	 D0KHYUJsYWQY7WgSmjLp5H78KaKbLOzY6NxOOEtcCzr9hh5rOyieCpAsdcxSClaLPFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Kafx2l+j;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85AD606A326;
	Thu, 26 Nov 2026 15:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Kafx2l+j
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA2C81F000C6;
	Thu, 26 Nov 2026 15:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795705767;
	bh=1MQmSQf0FS54ims9l1A+SvUP4EmsVJhYKSAxitHEx2Q=;
	h=From:To:Cc:Subject:Date;
	b=Kafx2l+jOd3Ii9wwAxneKeTh8sOjka6hqAe3+5YrBdeMz+Qa9cbQY606LiPHBmOxm
	 Hs8FFZ+ErMvOD6zp9EtSa3r2jd2q3Bm+QsagA9TGg0zeQrSaKcu7aaKyaDxZnHX85j
	 d+yLkZjOZnnWglP+h5JLvKtDjhdQPP2Htfzji6i0yNConkTJs+bg25HyfbuLj/IIiU
	 o+7eB6r781hOhKFIOKZByFmkcopk7oxeQBs8fdvag0rMs5726zRHv5wdKW2gjZRJAc
	 v34D5j2yWqWZPHBRixDXrij6LKCcSI6mLXWKsx7IkZKMPPGDRz18y+htsVT3HXyQDO
	 NvAFCoFeJLjPw==
From: Sasha Levin <sashal@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>,
	linux-next@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Please drop the kapi tree from linux-next
Date: Thu, 26 Nov 2026 10:09:24 -0500
Message-ID: <20261126150925.2347325-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
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

Hi Mark,

Could you please drop the kapi tree from linux-next:

  https://git.kernel.org/pub/scm/linux/kernel/git/sashal/kapi.git spec

Linus didn't pull it, and it isn't going in the way it is now.

--
Thanks,
Sasha
