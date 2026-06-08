Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4CB6372062;
	Mon,  8 Jun 2026 16:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780937494; cv=none; b=kwJa9p7vzBUafnu4oFMrsYrasIA/Vk1VfdPt6auk6Juh8+DPqEAFZc/1BSGBIlzUMT6BXKcASd1npR0GbJzu4Om91r/4IxeCEz9FMBM2hPnc/bYErafeKerZHmh1xSLZbAPPm5UdkXdqMMqfkmWe0KMg9S+n07dPjSYkxzTDy/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780937494; c=relaxed/simple;
	bh=dSuBV2I+a8qV4J0vwKApr/Fccgkcljyiq9JK6MsLDqI=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=gJH29cH9X7psTi4jn/vdcR+R+CXMXDD1+Y9XMShjhEFbVlVkH8Sjix2XVmTWa4Fve6psL4mE1DB4JKxZqg87AJk1evf727DGH1eeJBogINvS8Ro3/vKzyXVzYVJjWgtdqgP1THXljNo7VPGk6FwOto63j2DmTANZMVFRqoAltfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S+jYMoyu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S+jYMoyu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 698291F00893;
	Mon,  8 Jun 2026 16:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780937493;
	bh=RYZjjoTnpTqCfFXMRmLngrBYxLS5DbJB6GhnTUHR7Gs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=S+jYMoyusGVw27KZu0/Rh6xFyh51+RS/BdwiTYQ3ebQK/vLIseVOxmrVqJ/7LhT64
	 9X6pHnZ6LvRsfrYtL24m/ZPj8pkcftLrbAAyOs+jO/+cE86GN6P14q/5AVA0BnVaqN
	 JY9gyI0lf3z4thXKujpIUjLPtFH/YIODRyLD4Hz1YoERa9N/K0r0FYvH3L7rapJweG
	 CdV4ECxM2YO86rn8qPa42tzEj72H1UZY3JjcHWjo52tOkQ/N1ESI80/qxibYRAEyhp
	 FTqLjAiZ78ByGkV85OJ4CBoNNt2+L+CYUlcDcb/mBff8H3rv+JypnLjinuWZZgQ+Pq
	 uFnhPOVzqjSqg==
Date: Mon, 8 Jun 2026 10:51:29 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Mark Brown <broonie@kernel.org>
cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul@pwsan.com>, 
    Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
    Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the risc-v tree
In-Reply-To: <aiagvVcftjZXyt40@sirena.org.uk>
Message-ID: <29ca7e5e-5298-34f8-a117-48e1d80b7fe6@kernel.org>
References: <aiagvVcftjZXyt40@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 8 Jun 2026, Mark Brown wrote:

> Hi all,
> 
> The following commits are also in the risc-v-fixes tree as different
> commits (but the same patches):
> 
>   aad60bdd0b5a6 ("riscv: Fix fast_unaligned_access_speed_key not getting initialized")

This, and the manual merge issues mentioned earlier, were caused when I 
moved some patches out of the fixes branch into for-next, but didn't 
update the fixes branch on k.org.  Should be fixed now; sorry for the 
noise.


- Paul
