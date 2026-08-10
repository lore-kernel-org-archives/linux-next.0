Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09323E558C;
	Mon, 10 Aug 2026 15:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786375723; cv=none; b=HsyZYNM6yyZHM1sjBxuvu3hhMKLHuFA3tlyIM4vkPRRVzex3RkLgQrbX0aYmIl6dIaHLYix/PvVwHF5g3rs2HprnNiWBRQNvHDDOKUWzHaImb3LkTA9mIuxLAycGOFWdYUot1OkFGeJHJP1IiaCpsIn/WXmXT+x8qBjNQnQqL6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786375723; c=relaxed/simple;
	bh=9L2kQSvY63Q+XULEp7CAqCf8rH3Gv6CAmBPcQEGDN90=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ac7ZmHJladuu+xS8AEg9W43W5teUxyxjJHQFbdqyiITn1nR3OhjHdTvFfFeR5D3fdqxeGqJQT1daf8UHZgj2N9iKx6FARCWugZcX0SICHDe0Rrfyn3YSQ4WvabQ9YFlwf9MJ6p7nc7eVT5n9x7Q//a9xXFpJVfMU8DSoxscb0HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dUlTsHWA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dUlTsHWA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA8201F000E9;
	Mon, 10 Aug 2026 15:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786375722;
	bh=V2xFXdjUrGwMgKHYyZUPKN+fk+1V1JzCCuPiQAOo/4Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dUlTsHWAQqQwRs3nXZ6EEVdFGNlCJS4IlUA1wIZ5mkA88TlyjCytoRIVPYhSu9NI3
	 wXVaa+q964hI7aWWCNTD4iR1QgMCwiTe5Uggjxx3rPQ0r9w2lc+2LpV97a/3xPpkEl
	 tNxP7EL4MmR1XaGmVgURjOq1iJaRH8DHa9wpT02MtyBzuhF5XsJTRaYgkk++IAcY9T
	 qmNJDsXgjeQQCu2Xg1PxwNbUGrxBlRe6zDAtiJeuOfpwOS1L1tSeEyz6fcl8ERcNwi
	 GNPzsHmvi5upkyA+XunwDLHfcGI5s57SKhJ43gmw0jTHt0M/rSAUbOaRKWquTsRLxK
	 Zhr8zA1j72WKA==
Date: Mon, 10 Aug 2026 16:28:37 +0100
From: Will Deacon <will@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Linu Cherian <linu.cherian@arm.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Vikram Sethi <vsethi@nvidia.com>
Subject: Re: linux-next: manual merge of the kvm-arm tree with the arm64 tree
Message-ID: <annuJS8ylmqN1r7i@willie-the-truck>
References: <anXu1CnuHQo-fKId@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <anXu1CnuHQo-fKId@sirena.org.uk>

On Fri, Aug 07, 2026 at 03:42:28PM +0100, Mark Brown wrote:
> Hi all,
> 
> Today's linux-next merge of the kvm-arm tree got a conflict in:
> 
>   arch/arm64/tools/cpucaps
> 
> between commits:
> 
>   94104e3cfa803 ("arm64: cpufeature: Rename BBML2_NOABORT as BBML3")
>   12aab25ca56ee ("arm64: errata: work around NVIDIA Olympus device store/load ordering")
> 
> from the arm64 tree and commits:
> 
>   27a263e1a0fa2 ("KVM: arm64: Move GICv3 broken SEIS implementation detection to a CPU errrata")
>   0dbb49dcdbbe9 ("arm64: Add ARM64_HAS_NV2P1 capability")
>   5be1b8de27dce ("arm64: Add ARM64_HAS_NV3 capability")
> 
> from the kvm-arm tree.  (Only the arm64 tree touches this file one of
> the other commits says!)

Heh, well it usually does! kvm-arm sits pretty close by, though, and
the attempt at alphabetical sorting didn't help us here.

Anyway, thanks -- the merge in -next looks good.

Will
