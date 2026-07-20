Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA8E342EEA0;
	Mon, 20 Jul 2026 15:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784559828; cv=none; b=G4AiX1fqcKHKuEi/PybCwhqnv+FfTr1UEy4Bz53YXoLNaHVjWfx91gSrfLk6G1PACN9VknntBDPC5E+I98pkXk1P7Mt9KrovlKy60vz40V7g8xp/pRqodgVsLL7Ek0uMDsqsb75wLJ0Ezr9Ll7kEVwIC0RhtekK7vYyeeF6DO9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784559828; c=relaxed/simple;
	bh=vbcMjyNTooXyUkkep+atuJzouVpvNu8EjvpNZ1kyib0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ru2KCXYrqa7nN7e1OqeeMPw5uo5ugfB41bJ7XVTjga7U4UfGWXvX27hzr6R30ayz3ymgW8och+OYMa5j86/5I/3NiOb4BOFqnGtDcUaX9IJPoVIn77DJDZW6cMTIrgsRdND5ALA96Gfj4nQMln3UkvHTk3lYmEOK9Hu1eWaZR/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bf5zZ+bh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bf5zZ+bh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A41711F00A3D;
	Mon, 20 Jul 2026 15:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784559827;
	bh=qh5Olm5rwconCfKaCei7Lii5ifwNCavQbuvpVjQGoAI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bf5zZ+bhwVgQu0tONCqlJbXp+a6p22U1bLFTfgOVhWqdXVfflHMDcqoU3UyjWjiJ2
	 fPCZTTQUqaJRfSwdIANS/N9Gbec9TVYlEiYcSLQRnKJb1vIRF+7qCklgl0ebptdxAU
	 9z2KJXH7E3tcym87AbQtysifsSZtIMrft40mDD7EBFVnvlQuLO5vS1+5yQpLEpBiV2
	 5QQyZ+9uKyEXaH9ma2ZzRnIE5Usb17u7NgVuAz0el6LWX4VxNXDTpmIUOkNTsB0wRo
	 niEbdgg/Gew42oC6lTFCfEbfipNRP1v6WHkTuzR9Epeqd/JfsYL9Y8phas03k6bYzF
	 Vve6VadA6UL3g==
Date: Mon, 20 Jul 2026 18:03:41 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Mark Brown <broonie@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>
Cc: Jacob Moroni <jmoroni@google.com>, Jason Gunthorpe <jgg@ziepe.ca>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the rdma tree with the origin tree
Message-ID: <20260720150341.GG110966@unreal>
References: <al40KAaJ0Qiy-lTs@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <al40KAaJ0Qiy-lTs@sirena.org.uk>

On Mon, Jul 20, 2026 at 03:43:52PM +0100, Mark Brown wrote:
> Hi all,
> 
> Today's linux-next merge of the rdma tree got a conflict in:
> 
>   drivers/infiniband/hw/irdma/verbs.c
> 
> between commit:
> 
>   b9b0889071569 ("RDMA/irdma: Prevent user-triggered null deref on QP create")
> 
> from the origin tree and commit:
> 
>   d83bf998f719d ("RDMA/irdma: Prevent user-triggered null deref on QP create")

Jason,

By mistake, we ended up with two identical commits: one applied by
you to rdma-rc, and the other applied by me to rdma-next.

Thanks
