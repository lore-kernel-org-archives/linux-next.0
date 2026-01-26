Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC3530748B;
	Mon, 26 Jan 2026 22:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769468115; cv=none; b=FmQK4QMVoap8UzsRojzltqhAd7qpVJgD5piwO5HMRFIaw0Vk7wbhI1C6USSe6v4KBfpFWnt1BTXtwCDVLOlwCvrbAjF1RWO43LDWdl/fnFNcaMglLAB0nrJ2EJpzsH8P5GOqhgYfc9WTAjlzXqlia7lhDNeO4scRom03SEFBtbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769468115; c=relaxed/simple;
	bh=CJt5GWTS4WbeMsCIHtQAvw/02s4PgZXR72X0EsMMOo8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MsknIiRMwD9wUeq/S0fuk4bCo+RwRUoWJQsFLc5qneI7dr6yi7ZjEUPSmeUUbW/UmoLNnVQXo1BEQ7cqlSZ6nNggaZ9x/VymfKM26wT0UQcx2/w70qOHYlfXH9oIp/V2emYWHDHXZpEkzafgxUDij7bhYutYudiWueUbDM837Uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HQ9bftES; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HQ9bftES"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F25C5C116C6;
	Mon, 26 Jan 2026 22:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769468115;
	bh=CJt5GWTS4WbeMsCIHtQAvw/02s4PgZXR72X0EsMMOo8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HQ9bftES7QSWwdgsoYBrjJczpvmzYcCpGoJq0HdjYl655lm0vDvRJapUxE7TBH02F
	 Do6YltPwGccLDp0oO0YFqQYQ+EYCpIkmtdlAlNT1pBlWKzH15BNitJ8lTuA9uNhQCE
	 yKQQjQ4JxSZHJXhMLVAIN95RWPZXHEOoYllAeGsjdWecxSgfFb0SAKB7HVDFpwsC9M
	 wB3cSlRoTfFrqsszA7daCmepvhmW8ljuEc19o10h30+UT9Xdb30DpWiv4nzvbVSq1G
	 SloCEY8+37kVovCoMTvthCFnbSbeWtqlzX6+3mktROrtWy0xXf+VrMQhA/17pM/eMj
	 +uwi4LcXkMQSg==
Date: Mon, 26 Jan 2026 15:55:11 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Mark <broonie@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Guillaume Tucker <gtucker@gtucker.io>,
	Jani Nikula <jani.nikula@intel.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the jc_docs tree with the kbuild tree
Message-ID: <20260126225511.GA866955@ax162>
References: <aXeZT4VGXCf3a6CF@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXeZT4VGXCf3a6CF@sirena.org.uk>

On Mon, Jan 26, 2026 at 04:41:51PM +0000, Mark wrote:
> Hi all,
> 
> Today's linux-next merge of the jc_docs tree got a conflict in:
> 
>   Documentation/dev-tools/index.rst
> 
> between commit:
> 
>   6eac13c876805 ("Documentation: dev-tools: add container.rst page")
> 
> from the kbuild tree and commit:
> 
>   a592a36e49372 ("Documentation: use a source-read extension for the index link boilerplate")
> 
> from the jc_docs tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> diff --cc Documentation/dev-tools/index.rst
> index 527a0e4cf2ed8,4fc9d15f91d09..0000000000000
> --- a/Documentation/dev-tools/index.rst
> +++ b/Documentation/dev-tools/index.rst
> @@@ -38,12 -38,3 +38,4 @@@ Documentation/process/debugging/index.r
>      gpio-sloppy-logic-analyzer
>      autofdo
>      propeller
>  +   container
> - 
> - 
> - .. only::  subproject and html
> - 
> -    Indices
> -    =======
> - 
> -    * :ref:`genindex`

Thanks, looks good to me. I have made a note of it for the upcoming
merge window. I assume this conflict is not going to be uncommon :)

Cheers,
Nathan
