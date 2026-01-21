Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4537333B979;
	Wed, 21 Jan 2026 11:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768994288; cv=none; b=pA1lAA+zk7Km8AJP7xU8sBrZRAq8Pbp0IpCw+PSHy2H949Y4p0kSgtpSvme6N4BGhZ3uJJ0dF1TcgRvd0H9U37XGB7gscIKwE0yx7/Dh4GP9AEgXT9W8vkj1RIipENRJ+cDf80FAIdm/xhU9OWT7s0wmP4cX6E1ftuBdKEizpWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768994288; c=relaxed/simple;
	bh=lFKp8Dr1w5WjVnelGIRLA/CQtVyOwSzkgQCzWHx/1sY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iOv/AISAKggQgszSSX5wKcOVWhL5QH4dtpE/aBncERnesWwy5ktzgyDCPMJxNHQBEYNKONUx5gVfE/iMvYhNIcXzRm7Yop6sdcOIC5DUl9AZXLu7aEnaDnU6PQhDDZC92C/EKiz2G1KWLa9F/pXhOW09oTLj8qctVcYpgSnCz7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CqXAv90U; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CqXAv90U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFAC7C116D0;
	Wed, 21 Jan 2026 11:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768994284;
	bh=lFKp8Dr1w5WjVnelGIRLA/CQtVyOwSzkgQCzWHx/1sY=;
	h=Date:From:To:Cc:Subject:From;
	b=CqXAv90Up/ovQmvcTA6VaAxbUtuCphHeQ08+q8coNV2snMIVwIRrWBQDdhMaabybA
	 gkQ93RrISrLgg9r00yNwE7xm95kb7g3O/+9+mmg6R1ZMBVkSwdrrLvfOpkw2+PBHBG
	 bdzg8iQXdXRLpsMfCa0fXTfQtocEnM3EwZfpL49xo7Mfm5nwBQMKwBfVPDVVLHAGED
	 KdeFxkGejwBAJfba1NDAbEuwrbYUwM/9Fq0Ur8vUtcy756C0a8wI8kilcEW90xwhoj
	 Ip/UlZXVh/3hV3HCfQYA0WlXiwTcDNUyTehib4YyZTNUs0KI0JRbpq/l8J81OzQ+Kc
	 JBFYIchio3M7w==
Date: Wed, 21 Jan 2026 11:18:01 +0000
From: Mark Brown <broonie@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the pwm tree
Message-ID: <aXC16aWHr9SPX07J@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  d2252319f89e4 ("pwm: tiehrpwm: Enable pwmchip's parent device before setting configuration")

Fixes tag

  Fixes: 5f027d9b83db("pwm: tiehrpwm: Implement .apply() callback")

has these problem(s):

  - missing space between the SHA1 and the subject
