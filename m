Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357D1426683;
	Tue, 20 Jan 2026 12:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768913039; cv=none; b=rp2NJwYerY9NWfvarNalVz6eUwV8OEKwE8FksJYG4De2Z1qVsISbznxn1cVpWlW0LDC5YXGaLMSRREDmRvt1h+EN3k8bwgO4xXsRjewTmKVhxAI1AvFvNC6nXoBQuim41hhX/wWKXUbxEnw1HQ5x3D4SRcYywHGHVhjZHBE4v/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768913039; c=relaxed/simple;
	bh=brhZajrgvgu3E2bjQ2f8y4JwBaa9sHL/lTG6f+865C8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JZEJ1Xu0oS4jrenSIisIjixylFN+HSYcGb1uhS7crXfddD4Uz1t2F/8/4eCq7aYCAD04ZX5lE1PWctxl1K1+IyVx9gEX1K/ihcC/1MldHBmH4mGNJTke/hEnUWnxnABDeNzoPP76GSBYcBFNM+ObJh1cUsvA8mlayo7uJJZVhBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=tDxaxwaJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="tDxaxwaJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 391E5C16AAE;
	Tue, 20 Jan 2026 12:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768913038;
	bh=brhZajrgvgu3E2bjQ2f8y4JwBaa9sHL/lTG6f+865C8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tDxaxwaJSaWXJRIOyvQd/+//9OqnWJt+bzdCM+qOgK4j7hIEG0xdkxOFlrysWVmta
	 dOzEwi7LiC31wKTttpShDsIoojcFYRQa515VPVn3UyDgfiVBaRScFuqtMlWWFOk2rv
	 tFkRyM7b5RCWGA36xJUB/uaJUfsBkXFGBtDC5xog=
Date: Tue, 20 Jan 2026 13:43:55 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Tim Bird <tim.bird@sony.com>
Subject: Re: linux-next: manual merge of the mm-nonmm-unstable tree with the
 spdx tree
Message-ID: <2026012043-borax-cosmetics-0a0a@gregkh>
References: <aW912Qvlf_n2S8f6@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aW912Qvlf_n2S8f6@sirena.org.uk>

On Tue, Jan 20, 2026 at 12:32:25PM +0000, Mark Brown wrote:
> Hi all,
> 
> Today's linux-next merge of the mm-nonmm-unstable tree got a conflict in:
> 
>   kernel/cpu.c
> 
> between commit:
> 
>   330eb955ea9e7 ("kernel: add SPDX-License-Identifier lines")
> 
> from the spdx tree and commit:
> 
>   30811b31fac32 ("kernel: add SPDX-License-Identifier lines")
> 
> from the mm-nonmm-unstable tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> diff --cc kernel/cpu.c
> index 5185c0be847a0,a7a1cf8ea8e08..0000000000000
> --- a/kernel/cpu.c
> +++ b/kernel/cpu.c

Odd diff, did something go wrong?

thanks,

greg k-h
