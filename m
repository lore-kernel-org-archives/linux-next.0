Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585F041C309;
	Thu, 26 Mar 2026 17:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774544748; cv=none; b=RhMqdhQl7wyYgd8oSc2VD8LWiieVZ8exFdPDvJ2ixpHkzDzVHysqtkDFmF1HcY+ptr/XWSgIUOq+X757CesTbvp0B0Ld0bZPJ9WTQu1anbx64+PWEBudSurmn9EoUGUyljP5BUfxvWDz/nvRLVR3z0slN7t5v6RsLLIDn0P3Avg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774544748; c=relaxed/simple;
	bh=Md/qLmweY1ca5kMblMGpcsqgOpTWfh5VGHI9lA6vS48=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=RPrjhumX5c7ffinT7C49ijM0m7hQrb+WVqtChPLTiYtIjjeNftpZ+rwcx0vp001Wr4bFXr+qJuLjSc23ghHC18vRkVzPCtH7eRUyO1MH5yO8YQk+mkPZ7lik7UXpOTaiEImrBrOjxs7PZ9ZmjZQAHOjBG3tB2LU+iGI+2wNfZkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UHTLnO6B; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UHTLnO6B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80A4AC116C6;
	Thu, 26 Mar 2026 17:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774544747;
	bh=Md/qLmweY1ca5kMblMGpcsqgOpTWfh5VGHI9lA6vS48=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
	b=UHTLnO6Bx9uFDJjHFqjmWyy/U0qYPOJiDSIhnqmGsKd8iWBZmBTxO2za/i/JtW4ft
	 9BSYWMUVNN32XRCj+G92PCmjghRk8eeRTEfAp0lRe0cXMXIDw3IFZomszBLbPYK1e9
	 4V5paBHYVxBR/uCLxeBpZl8RlQ4LG1soZUJguBoN+XKtabZrR8aC28gluvDTZSqRjX
	 9PS1MZK3FXwqTBqIMw5J+177Lj4ySFUz1tXnzwdv8YJt3NGX4YXa9x+xJpd0Z7zpgJ
	 grjheHc+VIoovKF7OpjjI47nUojADVh8eaxR6aJzcv4PcecA2Azf9GnDNYzAACWqYy
	 ZeKfcd6bDJ/vw==
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Mar 2026 18:05:44 +0100
Message-Id: <DHCVM1KT0ITU.4WWXA8YQZME6@kernel.org>
Cc: "Lyude Paul" <lyude@redhat.com>, "Alice Ryhl" <aliceryhl@google.com>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Janne Grunau"
 <j@jananu.net>, "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
 "Linux Next Mailing List" <linux-next@vger.kernel.org>
To: "Mark Brown" <broonie@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: linux-next: build failure in final build
References: <acVZB6iMoUrV45zH@sirena.org.uk>
In-Reply-To: <acVZB6iMoUrV45zH@sirena.org.uk>

On Thu Mar 26, 2026 at 5:04 PM CET, Mark Brown wrote:
> Hi all,
>
> During the final builds, today's linux-next build (arm64 allyesconfig)
> failed like this:
>
> error[E0405]: cannot find trait `AlwaysRefCounted` in module

This is due to a conflict with rust-next, which eventually removed the old
import path of AlwaysRefCounted (kernel::types::AlwaysRefCounted).

We've already fixed this up in [1] and applied it to the drm-rust tree, so =
those
should be gone for the next round.

Thanks,
Danilo

[1] https://lore.kernel.org/all/20260326-drm-rust-next-fix-aref-v1-0-7f6f58=
d2828a@google.com/
