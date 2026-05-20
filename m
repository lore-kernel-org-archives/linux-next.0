Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809EB27E045;
	Wed, 20 May 2026 10:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779272854; cv=none; b=lPNrm0BAPkc1VDSz+cNQwwf7/cd4IyPNWeaAyYofQPA73tTvw8wDZlFxPfcQ/KRNA5Mq7a5Bxoz2WkrARxVuZs1ajPJq0SECuAxxWRoPxfo12MNq8PXFP3H1EM9ZII7k2KQZGmkK64T1eP9U87lmVyaawLznmu30truU23fn2sM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779272854; c=relaxed/simple;
	bh=FmAu0YttxozRcMiggg+hq8+ztCJ5e9+PyhZTvQk1iJo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P8IKTetPSzxZvnJ96jN0Y2JdupuaIhjD0abVWdgqArpMdK3m7L9NPAr0YrvIyJCLNYEaFM74k22sKlV+DBloyTrMblANsleJvw/VWgyfMS8qbLsZau6xf5sSzGZcBs9H+uKTgt6Qnlcj+IWi/D7d6Oyt+Vx1UwLvrCErmHUAWP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JXierJl+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JXierJl+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48F971F000E9;
	Wed, 20 May 2026 10:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779272845;
	bh=Hwnto5Ar8VPFN3zExPzzRwta75S8n9RiZcrbE+ZIKLU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=JXierJl+V13MmbwPXYTa5lrHc5X4pmLkqb+JirhiUVoXHQwepHIWlAbQBJP3gf6SF
	 ZF5qqKisngGOT7QeHmjBZMh+pBzK6P5FqqsH8PWyUNpH+zBqMuuOwzsh4H2Q+LrKKr
	 OAH8aAh55gEx+XE0bGgR5+zbZ4OK99lH/atJilPIecHzg2WPf2pZPi8xm8kyY5eqXT
	 C3lficLVZuoHGGpIqXH6ih4XP5+tcIhcutgzp0Z3Ygx5iOfSMLabvxfTvhdXs9UJ+X
	 El3AwPnuOh6YodfO+uMRiLGXTq1bCjlOBdPpULm8iRAS43n5/h6UtUv6XZBuUsO0kj
	 bSQgwHSB8KVXA==
Message-ID: <2dd022e7-af66-4794-a402-08b750f3c81c@kernel.org>
Date: Wed, 20 May 2026 11:27:22 +0100
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Missing signoff in the nvmem tree
To: Mark Brown <broonie@kernel.org>, Srinivas Kandagatla <srini@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
References: <ag2ICUOlMmGB_Bzi@sirena.org.uk>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <ag2ICUOlMmGB_Bzi@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Thanks Mark,


On 5/20/26 11:08 AM, Mark Brown wrote:
> Commit
> 
>   9241373b4768f ("nvmem: layouts: Add fixed-layout driver")
> 
this is now resolved. This patch was not supposed to applied to start
with. I have now removed it. It might have ended up while testing it out.

--srini

> is missing a Signed-off-by from its committer

