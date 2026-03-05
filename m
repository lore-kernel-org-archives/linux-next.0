Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6968D3D564B;
	Thu,  5 Mar 2026 17:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772732045; cv=none; b=jOQ5CDON5sJf/EVpKwidrDT9OROtRko4CHg9jeM1+CzB425ClZP9g84GFkn3y6/F8Kp7VQpHM+7GGoECsSdp2YXVzFLI9L0ZSgciQaNmm6EPjXDqXClq6M9buwuudY6BeDAIofjUaDXjFvroksUerGPTuJqIxVCc6FThuE1kmyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772732045; c=relaxed/simple;
	bh=thHauZ87dWeEPOcP6HHlo642GNpvIkj16akCy9OqYP0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nmDNHlMS1Vfvo3Q95wFpECpjl6urcNLXQ78+8CeWcqFOylvPeEOu+jLAGYUmcV5+FBVgVw2po+G0zTRJsI8V1P7J8oGnsMlcwurhoAHHTXj2kr4HlR4jvZPuqtBxRLOnWVJuM856nP27n8lQHrtVNiveC0D0jH1l+uwpgNBvjek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G2ELhZcu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G2ELhZcu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AED15C116C6;
	Thu,  5 Mar 2026 17:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772732045;
	bh=thHauZ87dWeEPOcP6HHlo642GNpvIkj16akCy9OqYP0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G2ELhZcuhfcdlCamKUSKKGlAp5F6+QXcqA44bdHPR7WZGAkVn5l2eI006OvHow30v
	 96vLFw30CCltZEmduaehmMbZeBe4dpy0J5sNjUKFLY3f/mc0vylDf/go6a3BooqX2e
	 tRjcB/mIUWDKP/eXT+EOm2yGVSXZT7y8QibDQ2GmBod7NOwUjtY8x8eZ4rSNX064V7
	 FwAYRBd8dKRuvegoJliHSAaB9tD3+JdaKDItuxFZ12ZkWPrnmWIORZy0kHI/WVKlzT
	 eL/wQlsZh9ngEgduu7kh1V3A5xv7cnhZkHcP7SiqvnYG4wPsWPzb+JEOu0X8ah8Gni
	 IoB5xKEpxda/A==
Date: Thu, 5 Mar 2026 10:34:02 -0700
From: Keith Busch <kbusch@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Mark Brown <broonie@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Christian Brauner <brauner@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the block tree with the vfs-brauner
 tree
Message-ID: <aam-ijUWoOP5hhAr@kbusch-mbp>
References: <aamIvIWiZDDCmNYG@sirena.org.uk>
 <20260305145428.GA17884@lst.de>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305145428.GA17884@lst.de>

On Thu, Mar 05, 2026 at 03:54:28PM +0100, Christoph Hellwig wrote:
> On Thu, Mar 05, 2026 at 01:44:28PM +0000, Mark Brown wrote:
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
> > 
> > I don't have a huge degree of confidence in this merge as the block
> > change was quite large and the code is entirely unfamiliar to me.
> 
> I'm familiar with the code and looking at this I have a hard time
> understanding the merge.  I think we need to get both of these changes
> into the same branch somehow to properly audit and test it.

Yeah, one of us should have to rebase to the other. Since mine is just a
single patch on the one colliding file, I think it easiest if I just
rebase my data alignment updates to the vfs integrity branch, then send
upstream through there. Let me know if there's an alternate preference.
