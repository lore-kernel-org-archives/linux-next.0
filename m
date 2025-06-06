Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1DDDF5C
	for <linux-next@vger.kernel.org>; Fri,  6 Jun 2025 01:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749172362; cv=none; b=pdodfGJyioWEfALPe5vmJOrVQqWTOHIpQjBpr+yuARJbl2z0gxN4sB1BayXhVE74TRb41uRY7MF4lDbShO1sqLyjew56UX8ByhC8F+0Bw2h3un51uca5mbbL8xl6EI0Cqi7Y2dy9yEyi9ahA8adn5+tGd68a3hslN8JAByKMlBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749172362; c=relaxed/simple;
	bh=mrvfFKKwr6gQCL+B43XV74OxgUS3NYCZ/39x4fJ44gI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LQwUn4XAUSCVx4/RTR+TBOn09W++6UnO4ZX6uFc+zqK6FQqqnbwMfSHmu5jHYKvB61wXrCxQctbK3m6cp+W+z64O8xszy2lgymrg+NcujD2iv/z/oV4OL9uLL6vmKDCZKZ2hKrZSfRf1KH0Zwl5aRT0fkZ+KQjz310gv4ZOD8s4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AHYN8fLC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AHYN8fLC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20ED9C4CEE7;
	Fri,  6 Jun 2025 01:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749172362;
	bh=mrvfFKKwr6gQCL+B43XV74OxgUS3NYCZ/39x4fJ44gI=;
	h=Date:From:To:Cc:Subject:From;
	b=AHYN8fLC9jh3kkq4+OauNxbEhwEqsI8L1A1c9aufDobInjGNJSqK3S/GO77KB1c6t
	 I/g+2xKnetVP3l6OAVekLQGicisCCL78qrpu0pOhZiR4KYy/3hSeJHXbOVS53MzOlm
	 npx5F2oJMMC3h8HTOZuBOJ2Ly8Ic+RF0U1B7nCr+6C+8lSaFnKGySVe+iy8Conu12x
	 QLxvtoWNcAAioiW2ssbbxWdjWrgj9hf51i8WoN/7cWv/aWOx7gmksbBp6hRDtrm0DZ
	 5rwYz9iOKNh3qwpSqkyK462aMRNjUtCRRfifYXVEshpXnxRBncn6PwrKDs+2g2cclU
	 Y2yivziW8Oayw==
Date: Thu, 5 Jun 2025 18:12:22 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, "Jason A. Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>
Subject: Add libcrypto trees to linux-next
Message-ID: <20250606011222.GA1228@sol>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Stephen, could you add the following to linux-next:

    Repo: https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git
    Branches: libcrypto-next and libcrypto-fixes

It should match the CRYPTO LIBRARY entry in MAINTAINERS.

Thanks!

- Eric
