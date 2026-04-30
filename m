Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A790B3845D1;
	Thu, 30 Apr 2026 07:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777532601; cv=none; b=iJCHXx098knpfDTWjtAclP9/XY/tCAk/FLHIqft9YrXJiQPFtoI0pCjsJtJAm7gluhXtI+qUii5lOzzg6OQHVUi0KK6pY6cZPV9aeLhrIBzhLYAUc+aOQQ2cxIWk63cCdkPWcyFZSj34Qjh0YaG1XGKFqqhvKiWCILIEKCpXN5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777532601; c=relaxed/simple;
	bh=fZHysPltegC8tVe6lT6GThq98qQ7uWzmPj/8/Kjrbj0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mgD/k5EAYT3ow9SkODiz5EKLZQ0hVE6Uk3hSI/HE/f2EG9OaGRMVEfnn8mjpTZCQZ9WiyzFq6vEFw9sWJ/O7SJliDBpFdED220DaAaw7sIT+FtwnysjEPX5wxYikPlbUxfvUTrek9ChiMUne7e4O+fXmr3Ihv1vGsN3BGUJjRSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YdboeQ70; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YdboeQ70"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5485C2BCB4;
	Thu, 30 Apr 2026 07:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777532601;
	bh=fZHysPltegC8tVe6lT6GThq98qQ7uWzmPj/8/Kjrbj0=;
	h=From:To:Cc:Subject:Date:From;
	b=YdboeQ70YRbLvrSI23RushsqmKwmH5XMo0nulJrc57RNY1Ne8+RsMXyRg+kkCDLWq
	 LVI5nc15QSiEnGtfGFN6+eeDLnuKXsIfO8qsX27IQ3NI51FiLBqv92HJOpE8td7L1k
	 KusOAeag/xPU8cDH8x5Xw7USR5PUw5FXG3ipSTaLZThQzmPY80gkhjxXaN+91BYdJa
	 wl7nv3TW4erx0Ti3ZAhJ+14FaZ7FJLaCjJGmEEwl1XIpXqyBxgrjdzsuEDuRgDyjBF
	 YM6BSd98tvPoA+4v318qKnb94qVymD6YqImYyQ44IYlGfmNU9v9yksb0hkY64aQSBz
	 XdL1ChEO+c9Lw==
From: Thierry Reding <thierry.reding@kernel.org>
To: Yury Norov <yury.norov@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org
Subject: Missing signoff in the bitmap tree
Date: Thu, 30 Apr 2026 09:03:14 +0200
Message-ID: <20260430070315.4041731-1-thierry.reding@kernel.org>
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

are missing a Signed-off-by from their authors
