Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892C92BEC52;
	Sun, 26 Jul 2026 22:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785105209; cv=none; b=BbAKS4i7aeRgejh9GQeeT09sEyW//csC+J9KhHAuLfHdC24qrapBhR/jeAjRatZ+SW94K86fwrcokKFMubZXkJlqSaFXWWkiNBNIc9za9DorRN18MV8uAEql542fJNmw78sYLbLLVjxEXNB75WCkhf0CgYA0o3jKVbNdKtTu6Gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785105209; c=relaxed/simple;
	bh=jciCzbwPgez1GuYNGYW6mfsyUyEeBNJnp496YuAG82s=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=mcCAPpPn78QONX5aHIMdVN3NpLpo6tHXbQuvnh2cE33GcG6mwSuao4vJFT0BsMFD3QqYj9CwzTKYCxIF1Gv4gSeqbfE7nIxo7kTRk51c2pV1eZ1lhRFSdmpkywrS0RkF308hW2+HR9c3dZDh0G8kTZnukwOlpo1mBwIn2boK+xE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kwa/cG5V; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kwa/cG5V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2101D1F000E9;
	Sun, 26 Jul 2026 22:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785105208;
	bh=wTRoLpuNE2cO7c7GbmgfuEVGAfBlyUo4rm2RPBn4UI4=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To;
	b=Kwa/cG5VqRNNsDq0RqJzNUOyAerAKaI46zaX0m8GwG6n8ZI6FZiraFxCzdW2Gb845
	 HExQE024FowM4IMftj2zH7d5ZmhG7yng3zQ/Zys2wc1dGETrV+zS9m51eGe0j5fvgW
	 ZUc6foK9fYgmGcfdlObcC6OJnS82daum0Ug12Jkc124bwxjVyU8UAPutCFXtoLVA+H
	 JfdOYTafZLXLu4Lfz5oORCW8wjEX+kOCxjCsK0ZNFEiwPncLdW8/eB6ZBHRLvTCD3m
	 ciQe/DixulVU9DjlB3IVyDe4fw3giWzZ+8X+D4oR2XeoBjCLpRqtgQ8w5PHohPb9Re
	 NNLFxUItFVBlA==
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Jul 2026 00:33:24 +0200
Message-Id: <DK8UZDXP0J4J.1ZGL24V7GBCO7@kernel.org>
Cc: "Greg KH" <greg@kroah.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Linux Kernel Mailing List"
 <linux-kernel@vger.kernel.org>, "Linux Next Mailing List"
 <linux-next@vger.kernel.org>, "Matt Roper" <matthew.d.roper@intel.com>,
 "Michal Wajdeczko" <michal.wajdeczko@intel.com>, "Raag Jadav"
 <raag.jadav@intel.com>, =?utf-8?q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>
To: "Mark Brown" <broonie@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: linux-next: manual merge of the driver-core tree with the
 drm-xe tree
References: <amaCqZUpvgKLe9gC@sirena.org.uk>
In-Reply-To: <amaCqZUpvgKLe9gC@sirena.org.uk>

On Sun Jul 26, 2026 at 11:56 PM CEST, Mark Brown wrote:
> Hi all,
>
> Today's linux-next merge of the driver-core tree got a conflict in:
>
>   drivers/gpu/drm/xe/xe_i2c.c
>
> between commits:
>
>   5d8ed6b64220a ("drm/xe/i2c: Allow per domain unique id")
>   9420abf8dbc2e ("drm/xe/i2c: Drop manual VF check")
>
> from the drm-xe tree and commits:
>
>   e766abbc5191b ("drm/xe/i2c: use platform_device_set_fwnode()")
>   0f485f88656af ("drm/xe/i2c: use device_create_managed_software_node()")
>
> from the driver-core tree.
>
> I fixed it up (see below) and can carry the fix as necessary.

LGTM, thanks!
