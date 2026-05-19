Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364053CF02A;
	Tue, 19 May 2026 07:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779175290; cv=none; b=Um3A79pN5/t+x1MQhMzHYVFn/ZCfR7Wxy5eLVsFlutWAxeplimo1cPZLLqcOQpMWr6RJKb5ENY0AMh3e3BGjAP3wM25ONZ9RnoV7HNC9D6f8/3FtInakqX//lO9Zycj2nWU9/+XqnSh41L3DJlpAchndBixL1mrdLwgBkAJ0x6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779175290; c=relaxed/simple;
	bh=MYVIkWpp92GCGLQwDSPxGIRSacECVNjiK0KW148lBs4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VLizRxigv35Vt8FlmAefcUz9StdLoI3Xvrw9Rr9YxVPy+lyp8njwlGkmNWrdob6e8OEQix5YWDH9Vx+DVJn1jOUOVR3qvyIomJ6yV6qBZwXsw/O6q5n8NBG/3ySnBebjD0n+yui8DGw44lBaH5XOtHSLLAbExBVr1FY6sKfo3QE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YMcr3ubo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YMcr3ubo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C5CDC2BCB3;
	Tue, 19 May 2026 07:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779175289;
	bh=MYVIkWpp92GCGLQwDSPxGIRSacECVNjiK0KW148lBs4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YMcr3ubolft6xgWlk7sN8o4HW9lYDsE9CclHWMj0eKEJZYyqV3IUqSxmNZ+JPiOlf
	 MAaKyYYZDdksjzMRQYAcy7OLn7JFFFNDES3rrhz8/1mpMSW39YNbfAOTlb88M8Q5KY
	 qYy1VXiQjXBKpJc5fUI5B4Yai6NTdHV/O1AOcfaK3JlLqKFXDg2cah4sN3Vt+dMzyZ
	 /Ai3o9QLTvu8twQtZ4G/VJgr11KmUpvMQ+P1bn2nJuxZeGnO+CwXmJavTXu8bTusGv
	 jmteKopcaaa2OCkgpGy32qii+ZlfbVBQG9WkWaffyf+U9gJqFQcJ+wSkQyYbedoIHw
	 NTFdzDv5hW4NQ==
Date: Tue, 19 May 2026 08:21:25 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Mark Brown <broonie@kernel.org>, David Hildenbrand <david@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure in final buil
Message-ID: <agwPOuMRifldkUiP@lucifer>
References: <ags6IM0qGAkndEV5@sirena.org.uk>
 <20260518130124.1da1d87bed04e422b585447b@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260518130124.1da1d87bed04e422b585447b@linux-foundation.org>

On Mon, May 18, 2026 at 01:01:24PM -0700, Andrew Morton wrote:
> On Mon, 18 May 2026 17:11:12 +0100 Mark Brown <broonie@kernel.org> wrote:
>
> > During the final builds today's linux-next build (powerpc
> > pseries_le_defconfig) failed like this:
> >
> > /tmp/next/build/mm/hugetlb.c: In function 'hugetlb_unshare_pmds':
> > /tmp/next/build/mm/hugetlb.c:7282:17: error: implicit declaration of function '__huge_pmd_unshare'; did you mean 'huge_pmd_unshare'? [-Wimplicit-function-declaration]
> >  7282 |                 __huge_pmd_unshare(&tlb, vma, address, ptep, take_locks);
> >       |                 ^~~~~~~~~~~~~~~~~~
> >       |                 huge_pmd_unshare
> > make[4]: *** [/tmp/next/build/scripts/Makefile.build:289
> >
> > Caused by commit
> >
> >   2bb8fe16f7bf4 (mm/hugetlb: avoid false positive lockdep assertion)
> >
> > I have reverted this commit for today.
>
> I removed this from mm.git on May 15, but I cannot find the email which
> prompted me to do that :(
>
> Oh well, I assume Lorenzo will send a new version, thanks.

I sent a fix-patch for this, but will send a respin today if that's easier.

This is a trivial 'forgot to add a stub for a certain config' thing.

Cheers, Lorenzo
