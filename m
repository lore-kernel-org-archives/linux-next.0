Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC953590C3;
	Fri,  8 May 2026 09:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778234109; cv=none; b=OUhFaB0aioeuNivKBK/m9YJNYzyOxGBvs59cSyfrUjpZPHOPx5oK18KLeLM7rHfGQj4yapYFy+4PvJztbjw6zoZTJHao4333vNkxFXEHW++VH4nwWwfzTf/r65R79XfY4finRh+7x7MyXB/GGnZ02yl/NA5QMoM+19L40tSKQ+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778234109; c=relaxed/simple;
	bh=LjYnZxga6I0GTdBh/7OJ6maIw+svLfwEFc3R7Mo2bLw=;
	h=Date:Message-ID:From:To:Cc:Cc:Cc:Cc:Subject; b=MvlN4tEu5L+WRlDDsjfwWSsa9QAnKoTxJ9k6aeJNdhP3INIAv6Y8gajchLPjDt5OhUVxNUp6jrDqMrr3mtYgZvG145n0y5xft8j0DO9U94k0F9IEIHqtgCo1LrkYzHYnv28jL7CLrrnGp19YjdalZiu9JmEmXg0/KYZbhnCB1RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ug7/X8RU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ug7/X8RU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97191C2BCB0;
	Fri,  8 May 2026 09:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778234109;
	bh=LjYnZxga6I0GTdBh/7OJ6maIw+svLfwEFc3R7Mo2bLw=;
	h=Date:From:To:Cc:Cc:Cc:Cc:Subject:From;
	b=ug7/X8RU/U9TL8UP1a3rlOmu/lYppvONMW4PKTYPJLWz92rRWiA1OZu/JPGgVaVDq
	 sUw14/NR/4wVAdyR0Z93X4d4d4gHt/Klty2TvsnAazIMYs3qD2/f27nseYwXmgu9bD
	 zDn6fzTm4NXzY3IrnYUj43TgeuJ8pP28XKBaorm6FPq6TfLXG3yfRE9VMRnTUD7AKp
	 lCLHNnYYdR2eB1EXYWyBArzZIl4W6kN8EO44yYmWprLel8fVXMZx3aI5IqarWpWzVh
	 UkE4a6kgsIspUI+qArPc8TYzm2Rvi6Fpz7inDMfYUZKla2tq1KLEbRuxUbXP3CK9gc
	 CHr1cMy1/9mKA==
Date: Fri, 08 May 2026 11:55:06 +0200
Message-ID: <b44aea932425f52a9d0921c127c1f839@kernel.org>
From: Thierry Reding <thierry.reding@kernel.org>
To: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Subject: linux-next: manual merge of stm32 tree with the arm-soc tree
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>

Hi all,

Today's linux-next merge of the stm32 tree got a conflict in:

  arch/arm64/configs/defconfig

between commit:

  f54f7979ff88 ("arm64: defconfig: Move entries to match savedefconfig")

from the arm-soc tree and commit:

  515aa8b11884 ("arm64: defconfig: Enable STMicroelectronics STM32 display support")

from the stm32 tree.

This one is weird. It looks like a version of the stm32 tree was
already merged into Linus' tree as:

  407b861f4d0c ("arm64: defconfig: Enable STMicroelectronics STM32 display support")

And then reset to the slightly older version above. Please make sure to
have your stm32-next branch point to the version that ended up getting
merged into Linus' tree, or roll it forward to v7.1-rc1 so we don't end
up trying to pull (nearly) the same version of the code again.

I fixed it up by using the version from arm-soc. This is now fixed as
far as linux-next is concerned, but any non trivial conflicts should be
mentioned to your upstream maintainer when your tree is submitted for
merging.  You may also want to consider cooperating with the maintainer
of the conflicting tree to minimise any particularly complex conflicts.
