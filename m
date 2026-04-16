Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A0B39DBDB
	for <linux-next@vger.kernel.org>; Thu, 16 Apr 2026 23:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776381735; cv=none; b=ppngzMIsowV4IR5/A/dnBZrb8TktVriUaMfOwGSi6DyZ9GsVG77S2L67deNCLn/mWiIiv20EfrELvauF0WCMTB5ApshFVVgA6DLwm+LSTqlaXaBrJrOC387yNlZvwX/JCyTMQRimrzmRZk3782AUnm45kBQRoR+lMy7SlR8iS2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776381735; c=relaxed/simple;
	bh=m/FYaAc0DJxchTCfP6AAw4aEYsvsHhSI+UcWaWI5gW4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FayZG+fdnYwKMXx0DM7eUWAc/Sp0YGrYbj3t120oqJN8k7ihb1LT39DF5/kNcABs78YlOTVEQtoG6Pax1gX5ZwWc+d49OnXG6hvCokkIyIj3LflQh4OjZWMJRRnVg8BgkZoeNCRYXoe8tYaVTe7aiyAHCXugMDLN8HQ+JhtKf2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p0bYpfrB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p0bYpfrB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4CF6C2BCAF;
	Thu, 16 Apr 2026 23:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776381735;
	bh=m/FYaAc0DJxchTCfP6AAw4aEYsvsHhSI+UcWaWI5gW4=;
	h=Date:From:To:Cc:Subject:From;
	b=p0bYpfrBDoYxvUIo6FtSd0MzdUjWK2/xKmCWgrNx+XIjZ5qcRDQwqCF0w6pFPb2PL
	 ScVRQWfDLKdHSNjr0HtJp5ejqoNnRI0KWWWviW0OtzHLfqsxjGNRQ27X9AGMlpQWXk
	 1RQKl7Ayrd2eY05+m1LROGW2cv4l1c14f08koaRpE67rAEXAF7nydZSUEOqtNFPF/R
	 dSLo2KTOVvEaXvwglL8C9yFCjIwjk6rhCW+jBe+Z4jzPSOBZblfUsyK/tEwyote2jP
	 /j61WI73v04k/r7zb3zjCt2QZ800cNhT7W4l8SquJneKU2uBnMt31n53RRBo9g8uPa
	 siovafZ0q7aVQ==
Date: Thu, 16 Apr 2026 16:22:11 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: linux-next@vger.kernel.org
Subject: Adding clang-fixes tree to -next
Message-ID: <20260416232211.GA97229@ax162>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mark,

Could you please add

  https://git.kernel.org/pub/scm/linux/kernel/git/nathan/linux.git clang-fixes-for-next

to -next? It will typically include build fixes for clang targeting the
current development cycle but may occasionally include things for the
next merge window, depending on size and timing.

If there are any issues or questions, please let me know.

Cheers,
Nathan
