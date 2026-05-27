Received: from courrier.aliel.fr (courrier.aliel.fr [65.21.61.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4743B19DB;
	Wed, 27 May 2026 19:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.21.61.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779911905; cv=none; b=KjchU86OFLLWAEu54mRIptagdNj0evmJp5JL0w1WwGfrZpSpcwCFjiQXQBJIYHNZU4/CXk+ZK/TuTTK+3xEhKxtD2X+KHRnwLECc6U/YX/TqQE7/QL+5/GN5PuIvp9wQxWAfgqsR7yEaDoLb32+ByTT4i1wy3tEXLB5NHWWkiUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779911905; c=relaxed/simple;
	bh=HC5gT9EIYoGwzW37HjmodDW9AwH5uI5qxc9Cxqota1o=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=VaRgTgKRNqRDOYEneEJDlxWwcb6lXw1SJIs3ReQrrd7fCkCacHlBcUlXYFD6gGsA5HagWyqADiuHJyvYOB2EiPjRdr7MR7euncaYCqvP8UdP6UT3ZgG2WltZNqFdRaYFjlcbyc6+nRtcP5RCC9PQTH0z7KOZ1pICQ7+DhicwCGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliel.fr; spf=pass smtp.mailfrom=aliel.fr; dkim=pass (1024-bit key) header.d=aliel.fr header.i=@aliel.fr header.b=AOibaHqp; arc=none smtp.client-ip=65.21.61.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliel.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aliel.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=aliel.fr header.i=@aliel.fr header.b="AOibaHqp"
Message-ID: <91ccd18f-e941-490f-8e71-62cc50baf1b7@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1779911443;
	bh=HC5gT9EIYoGwzW37HjmodDW9AwH5uI5qxc9Cxqota1o=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=AOibaHqpwSRqvuBi0WYTs/S1qId4v7y9bvSItoifdijsVjeJIflWtGCNgW0M38wOR
	 /4je42yw8WR0/aZORE+d92o2PeUGKkvxAXSRPRZKssOQUzi7opyrP9us7Vp9GV/IWG
	 ETDs/67ckL04vhNyOzNmTRz4oxQvcujJ/k73/ssA=
Date: Wed, 27 May 2026 21:50:24 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Subject: Re: linux-next: build failure after merge of the thermal tree
To: Mark Brown <broonie@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
References: <ahbqBvZF_zZGJyrF@sirena.org.uk>
Content-Language: en-US
In-Reply-To: <ahbqBvZF_zZGJyrF@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/27/26 2:56 PM, Mark Brown wrote:
> Hi all,
> 
> After merging the thermal tree, today's linux-next build (arm_multi_v7
> defconfig) failed like this:
> 
> arm-linux-gnueabihf-ld: drivers/thermal/amlogic_thermal.o: in function `amlogic_thermal_probe_sm':
> /tmp/next/build/drivers/thermal/amlogic_thermal.c:196:(.text+0x2f4): undefined reference to `meson_sm_get'
> arm-linux-gnueabihf-ld: /tmp/next/build/drivers/thermal/amlogic_thermal.c:205:(.text+0x320): undefined reference to `meson_sm_get_thermal_calib'
> 
> Caused by commit
> 
>   b21d88de69184 (thermal/drivers/amlogic: Add support for secure monitor calibration readout)
> 
> I have used the tree from next-20260526 instead.

Hi Mark,

Sorry for the noise on this one.
I can reproduce it on this commit, it seems it would need to add a
`#ifdef CONFIG_MESON_SM` and a else stub for those references.

What is the path to solve this issue ?

-- 
Best regards,
Ronald
