Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57FD5397E8B;
	Thu, 30 Apr 2026 07:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777532611; cv=none; b=HxwnNHO8l5zuLe9XAPEHNX4tPayrKLeVUH7qCQoRN19eqyaMq/H178Ebs7e0hoEFcnS4n4NNOe5t10XpDieV0KbbfSndAoKPxI6kd5KsN0Xfi8PViQROvBeYCtL74bDm6SjlECMeVyIpoK/5vNCydPAb7WHCevLcbozRFtfifMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777532611; c=relaxed/simple;
	bh=4x26zqPFROKd80i41WKByphGpOW9i+xjT6ZR9GRccHk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ly4N11Obup0CNMtTt85HuYuhyR0ud9xldb53o8SSMqYIjm/Hzh1OVy9SqzGPU7ezHBTssbch1chvmqIH5Roqan1bYx2YZvibqXqY4YYxHTjCqi+uwEkPBcnIRP2Wso7GWXteHLLqYGI5tNK1fEvh73VwU70fG3/Cx8e9JTRnN2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GoQQSj6p; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GoQQSj6p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC4D6C2BCF4;
	Thu, 30 Apr 2026 07:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777532611;
	bh=4x26zqPFROKd80i41WKByphGpOW9i+xjT6ZR9GRccHk=;
	h=From:To:Cc:Subject:Date:From;
	b=GoQQSj6pC/T+ANRjBrw4yUKtU8P1gomz6qlZ4Duy2VxHpwa+548C+aP7z2e+NGDfA
	 K48MzAVym0CyAi7oSrgyZZ0jK2P05fceCWQsel/7g1T48rERPuE6qGW5VrDtGeUIzk
	 joioO7xGKPUtRhSBfBzTPS6EI14WEYjtW1fiP4lXFe9lw7JPMAHuVdPJPH5SY4YSkq
	 XaQeoud/Oty5E+3En/Lpe1bX1pHmi1YyPqppKGakyUtEoegxH4O2x4vzUwb67qWvQx
	 wux6NAnJ8H3y162JYawaSUo2BkEgS9qwHHqMEIaxS0EqshoDf6Cc0qKnfV4ozIB11l
	 pX5mnEVW0XLYA==
From: Thierry Reding <thierry.reding@kernel.org>
To: Yury Norov <yury.norov@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org
Subject: Missing signoff in the bitmap tree
Date: Thu, 30 Apr 2026 09:03:27 +0200
Message-ID: <20260430070328.4041988-1-thierry.reding@kernel.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commits

  aa92c8e0486b ("MAINTAINERS: BITOPS: include bitrev.[ch]")
  3f50d37ae736 ("lib: compile generic bitrev.c conditionally on the proper option")

are missing a Signed-off-by from their committers
