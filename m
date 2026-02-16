Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D7EF1B532F;
	Mon, 16 Feb 2026 21:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771276902; cv=none; b=cJx1QEKE14ql1VTXpLAh0QfDH0RPgxcA393uRQxuYcq3dSGe3uexqSp9zqsY5MMqWnFWmvGJ1ASjfRMYp94qCepxBpIqkSGcHoOaUEg0p/9HUaEcCF4sYo8hI/xasSxdFCO3T+Fp4k8L45XbJsNqt8YI+Z0mW+57ruyvKfb8krI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771276902; c=relaxed/simple;
	bh=KFwMfW3MCWBsvAz43GZgtiAEpcHGbdapB5mE1y+8U08=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cjqm/r7RL8WkHrZ0jfSVkUq0M8I3XcK9Z5FE+MbgAgYY1BESpS5jcYvPV/XidlVTADId0RvEiVc6CxIhDZgAv2J5Z8FCUj95SbE6BjZsiZDce6R1hh/gMYPPg5SJndzND4CTT7BEmGcxvZrb4OgPPEwSij0uXHdWOSkgCnmkikE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TBhMDiu7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TBhMDiu7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98872C116C6;
	Mon, 16 Feb 2026 21:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771276901;
	bh=KFwMfW3MCWBsvAz43GZgtiAEpcHGbdapB5mE1y+8U08=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TBhMDiu7uxKgRz+HFl2JekVhHcW7YU/4SSnmbo8CjlBRQOiTHs9+txSr9xXCDIkj2
	 BdYcgMeeIsTVkwHoxAAmlPFIkujGSmlEnQ/N5USvGEBtDxmiSK0ZnCijUfXM+bemyb
	 Vi+TVmjcSLxY7RQZ8/EAMH0uBWrn2D5431FK2AVHw9ta90Q44sHBnE3Eh/NHKm0kAR
	 jpAQvchzzMqUYMKgCN0a4PGnjQrUSQxykycnTogEQ1h2066fw0CWWfyVN4lR9oVCwI
	 g2zruFdsYwxyDxDHkarhaPtYVy6+4grXglK4fucDcX6f4IZ6YKWANxT1kBBae6OnVL
	 qjbuEd6O9BuGg==
From: SeongJae Park <sj@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: SeongJae Park <sj@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org
Subject: Re: [PATCH] CREDITS: Add -next to Stephen Rothwell's entry
Date: Mon, 16 Feb 2026 13:21:39 -0800
Message-ID: <20260216212139.68258-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260216-credits-sfr-next-v1-1-5b6563b29234@kernel.org>
References: 
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 16 Feb 2026 17:28:22 +0000 Mark Brown <broonie@kernel.org> wrote:

> Stephen retired and stepped back from -next maintainership, update his
> entry in CREDITS to recognise his 18 years of hard work making it what
> it is today and all the impact it's had on our development process.

Huge thanks to Stephen for the great work!

> 
> Signed-off-by: Mark Brown <broonie@kernel.org>

Acked-by: SeongJae Park <sj@kernel.org>


Thanks,
SJ

[...]
