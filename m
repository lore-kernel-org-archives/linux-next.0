Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899053603F6;
	Tue, 21 Apr 2026 18:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776795559; cv=none; b=nLxCVxoFifXvYmB0qNaQahnMnI6vbo6Sjoxe2LbC+KfwwanxrJiqHiRqPOCdaYUevsaRUd0hBGqHjzKAUAJRw+O/pR2t49hP3jDZQfCMfF9Pmt3KNeamGiIUOGTOgQxIkkzAnNNBUdowkjnAjj8Hrw2kkiL+gQSTZSmseipLiOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776795559; c=relaxed/simple;
	bh=ICdHJjFNbmgFD5Fzqz1L0nyhspROUPLgyTzQHfUzQIc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cNs05g5Vhl9MZhJiN5pTFzEJAnz+6ClGwDE3gionRcVdVHJ/rKt9B794rf5tWGTNdg/ug0I334/6Iq94YVU5A76Kl20ZbAqktqbNBlRpeeplHA/bvzm8ohIECJ7AT+xfq1ufTvFIAFESdkyh8/HkG5Up4B7H+kQQ9wE1vFVAgjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H+a6Ennw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H+a6Ennw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CCCCC4AF09;
	Tue, 21 Apr 2026 18:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776795558;
	bh=ICdHJjFNbmgFD5Fzqz1L0nyhspROUPLgyTzQHfUzQIc=;
	h=Date:From:To:Cc:Subject:From;
	b=H+a6EnnwOw78cLAyD4dZmX86b0xCSH6OWS3FFIJj8QHjlTRxoaULhbv/k7E4EiG6M
	 W+vRzxB8azyYM7MLaXjy4KYrJPEr76yA5g/rEmkJIrlLRqnlFoaW4qGCQhLNu5Nqvw
	 gjhi1t09d6eRF8wGVMs4yxHJgOT79DpMaD0W7xJB+sljoYP20MrWmrCKY1pY4ZMuRp
	 Imh1WD2rgf+r/Obkmb+nXhRADpLclNQlNRiKHArIjU6aXvSY3CpEeIDc0UoU1WPVmm
	 O9g695Lmznvq+P7Y1EuwE8wmh+R5PlQPwwEXNRzeik2VckaujOvFl1p7EMIVN/QlF9
	 nSsionx/1jFNQ==
Date: Tue, 21 Apr 2026 21:19:14 +0300
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: next sync updates
Message-ID: <aee_mCW8p2J6IbIO@kernel.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

In order to address in long-term the issues reported by Linus [1], in
addition to improving my workflows, I've create two branches:

1. https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git/log/?h=for-next-tpm
2. https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git/log/?h=for-next-keys

These will replace the currently mirrored branch:

https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git/log/?h=next

So my request is to:

1. Include the two new branches.
2. Remove the old branch.

[1] https://lore.kernel.org/linux-integrity/aeVSbVIFaCDRXf7C@kernel.org/

BR, Jarkko
