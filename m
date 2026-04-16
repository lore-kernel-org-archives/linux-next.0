Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 039AD3793C5;
	Thu, 16 Apr 2026 05:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776318863; cv=none; b=Dpuwx/MlbfQyYaa1iJRy6FLqQcb31blISDGCdNvhS7JpyVRNuPOK1zNsM4ICqcETbAsF8b7ZI2UAOboMAYgt2dOBvWBwI7DforiWC85xbqcLrvHIbsCBQR7HgExDVW1M8uAtJ1PbKojNhoHGw5JZ0QmXDyhcAo+Uvzca+2bkL50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776318863; c=relaxed/simple;
	bh=4xhtHvO3G+wn8P0FjPBTMyZuEPkh6Xw2LjsKPpRB2Rw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TUwLmoC7ETqurKyA6TadFR/H49rtexc0qRrAYzAQiTKmOscf9XgmKAUh5aaQaNvQgwpBl70y3aTPKJTJotcEe6s7YwJwHxhod9z6rhO20nvGd+LkFVbwh28TxnQ+X8fOSitFo4DEWQKkWzU2xilpfca2HDKiOlW6qX3lZW/Q18U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uUKxuww4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uUKxuww4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B19CC2BCAF;
	Thu, 16 Apr 2026 05:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776318862;
	bh=4xhtHvO3G+wn8P0FjPBTMyZuEPkh6Xw2LjsKPpRB2Rw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uUKxuww4ne6pYNzn3ZtLcbtEIJ5fUAnNj3ZFXsUTToFoHLrJaimZgV6vymSruzeui
	 z6ZGNoCMYyEJVj5s5oTb0jWMNgjZVshmWQV07QuKKY9VhcclwRxKSvWNdonSDcjNNx
	 hs7rwDaoKN9M8Pyx5ScSY+4b9gH31NESVKiaSNMMNpd1H6Mn069xoVd9cTPOYYolqr
	 JreJXTcHPK6BEvrbqMwuxBI4QW+foJKmK2JpfgMLAi2arkoGPBALl889C+MTR0tF+p
	 ltq377LgnPW3p7kkppCp6Uhx6K3j7rP7FWzoLWSQmTfUjrfxk/EhdBeuO5P9dZG6FS
	 mU7RElW1k//aA==
Date: Wed, 15 Apr 2026 22:54:19 -0700
From: Namhyung Kim <namhyung@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>,
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: Fixes tags need work in the perf tree
Message-ID: <aeB5i8Zr2U6of_3I@google.com>
References: <ad9kc24cz9mhPXWJ@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ad9kc24cz9mhPXWJ@sirena.org.uk>

Hello,

On Wed, Apr 15, 2026 at 11:12:03AM +0100, Mark Brown wrote:
> In commit
> 
>   841dbf4871c57 ("perf loongarch: Fix build failure with CONFIG_LIBDW_DWARF_UNWIND")
> 
> Fixes tag
> 
>   Fixes: e62fae9d9e8 ("perf unwind-libdw: Fix a cross-arch unwinding bug")
> 
> has these problem(s):
> 
>   - SHA1 should be at least 12 digits long
>     This can be fixed for the future by setting core.abbrev to 12 (or
>     more) or (for git v2.11 or later) just making sure it is not set
>     (or set to "auto").

Sorry for the trouble.  I already have the config in my git config but I
missed to check it in contributors' patch.  I'll update my b4 script -
I hope checkpatch would catch this kind of problem next time.

Thanks,
Namhyung

