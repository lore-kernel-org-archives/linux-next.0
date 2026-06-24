Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B742305669;
	Wed, 24 Jun 2026 13:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782306327; cv=none; b=YGqZePr7c9xPWvkHk2e+ybtnu0QkXU3pLRSY5zFJZ0k7OaOCDNJP0jnpodtUiBV9xJGwHffrcYbpcsJDgMFCmsr/KLanbbHjIhMoVtpdW+POqXBD7k0CgLk3kzta1UfWu91sM8gwVkYmNKL0Bv/Y+4yDgEqoAr04pd/yGBZdXKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782306327; c=relaxed/simple;
	bh=Snk/x1nv2FPq0m932A9AXckOLuUClhhhoRK1uU+BAlA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XtqwgM9QlzxmKl0INK9V676/qh8p+u27lQhGCOVcbapRtm5ETYWxOSwVrKgc8cawXuTNaPJ29hL8seY9S02F/PKdmAL143afcCk7ECoGBeBJgnhG1H7GGKCBIZlEG9Te+ukoQ6E4WV343zbHPdTqSyS+/rrPJEVj5qzzEayZPVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ROArb+/6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ROArb+/6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B2B71F000E9;
	Wed, 24 Jun 2026 13:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782306326;
	bh=U6cefkX9RiIJObun+KV2R1ffjJXBkgp8y5WcUhapkf4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ROArb+/6/5zFuPtxVNWEJXWd5S7MY906C/jmkf2u8x+J0+GYM9MCX0vdsRLliNFet
	 E58Um+TEWIriy4nqEmqE9Rt4NE7fUBYIWkH0HsYal1xtQHgis+HxtCzCwQr+Dwk8cr
	 +FQyYXkEQ7KR3X3/GRR2/SdtmXEncLkh2bS+JydmveZwQF5RRpKU0eX/V4Wkr0znh9
	 dxn5a3dQ9R+onIcIEoNfAaACUbOoTXOaFTm13cqSJGW8a9QxsjTjM3k7YXn7jnEUOm
	 3eSo+mVYbk/fLV+XxFJwrtnqfPJp09JnTw+8mXySkSZ++oEmJ8ZPxe6/4qYd9XfeND
	 rgwo46m6vJtpg==
Date: Wed, 24 Jun 2026 14:05:21 +0100
From: Will Deacon <will@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the arm64 tree
Message-ID: <ajvWESo4ybnDRyVG@willie-the-truck>
References: <ajvGS7UBpWzJtzkw@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ajvGS7UBpWzJtzkw@sirena.org.uk>

On Wed, Jun 24, 2026 at 12:58:03PM +0100, Mark Brown wrote:
> Hi all,
> 
> After merging the arm64 tree, today's linux-next build
> (arm64 kselftest) failed like this:
> 
>   CC       iommufd_fail_nth
>   CC       iommufd
>   CC       msgque
>   CC       ir_loopback
>   CC       kcmp_test
>   CC       harness-selftest
> In file included from /usr/include/aarch64-linux-gnu/bits/sigcontext.h:30,
>                  from /usr/include/signal.h:301,
>                  from include/test_util.h:12,
>                  from lib/io.c:8:
> /tmp/next/arm64_kselftest/usr/include/asm/sigcontext.h:81:9: error:
> unknown type name '__u128'; did you mean '__u32'?
>    81 |         __u128 vregs[32];
>       |         ^~~~~~ __u32
> cc1: note: unrecognized command-line option
> '-Wno-gnu-variable-sized-type-not-at-end' may have been intended
> to silence earlier diagnostics make[1]: *** [Makefile.kvm:347:
> /tmp/next/arm64_kselftest/kselftest/kvm/lib/io.o] Error 1 make[1]:

Thanks, Mark. I also got a similar report from test robot [1], so I'll
just drop this change until I've figured out the root cause.

Will

[1] https://lore.kernel.org/r/202606240441.7eZ1TIRM-lkp@intel.com
