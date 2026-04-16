Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D723101BC
	for <linux-next@vger.kernel.org>; Thu, 16 Apr 2026 11:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776338235; cv=none; b=ui1nSLAeoi9XD0/uAj3gsuHYhvgNXPt/i2rCdOzE/DJ6DOqckDR4RIxdbvLDsAwatSdjMoqLjXv0BDKOtK0sY8STJrc0s8/LfmP3c39eKkeqUnosAqYNtz3k9VFWQywqDEVDwVdDl0BMcl0ynrwJ6XbhJTa5zFe+Sn8iSXPfKKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776338235; c=relaxed/simple;
	bh=PZTBAgxOErVM3SuSnJ0p65j3I2Bht2CWuBrtTY2hQqY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pKUxyj0O3meA9FpqkUqAqYy3uCaqhXjcmUeDR0I7s02RaE0kU6CPPdshgHVy+PugZ0w4G9BddldBCXhBNZQKYN6XL9jXoXje8l4nUNIj7l9h5a4Ceaejxx03QLVJJe6tS5h33e3vRAJWOI/2bSzz2BJ/f1OR9eLlTbFlS+gqpYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KWL3rz9T; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KWL3rz9T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D28FC2BCAF;
	Thu, 16 Apr 2026 11:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776338235;
	bh=PZTBAgxOErVM3SuSnJ0p65j3I2Bht2CWuBrtTY2hQqY=;
	h=Date:From:To:Cc:Subject:From;
	b=KWL3rz9T9Imc3zZplwMse3mFQQqiP1lMrjg+ZqUqZqh8mcY5GEJ5yesgWLSqH1kgR
	 kn7tNyIcPSXG3Y10AgMr+kN7OZrs+u0sGMQZb/K9TldY48ExiAaZ9NeqRerpTiLzeN
	 hj3prTNxu726B787jKh//ljT1CP9mlNvUsY3G1ApZsljR4l3sIWydStkexTLZlnZad
	 yGYFSfcYhQiT4Rz3IwIx/I7hlsZpk1J2bm018Y6muKzOTXrQlgrZDxmWgEHdMYg4pU
	 IZG9EpXyi1YmbkPgZRCwkiqMXN5HUC+37/KgxKuIUdD7rt8ATuUjP2B5fbhk5WSGaW
	 J/uYULG881cLA==
Date: Thu, 16 Apr 2026 14:17:09 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>, linux-next@vger.kernel.org
Subject: adding liveupdate tree to linux-next
Message-ID: <aeDFNb2skxuNrDIW@kernel.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mark,

We've setup a tree for Kexec HandOver/Live Update work and we are starting
to take KHO/LUO and kexec/kdump patches via that tree.

Can you please add our branches to linux-next?

https://git.kernel.org/pub/scm/linux/kernel/git/liveupdate/linux.git#fixes
https://git.kernel.org/pub/scm/linux/kernel/git/liveupdate/linux.git#next
https://git.kernel.org/pub/scm/linux/kernel/git/liveupdate/linux.git#kexec-fixes
https://git.kernel.org/pub/scm/linux/kernel/git/liveupdate/linux.git#kexec-next

-- 
Sincerely yours,
Mike.
