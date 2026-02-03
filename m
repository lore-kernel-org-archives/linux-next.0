Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2670332142F;
	Tue,  3 Feb 2026 16:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770136158; cv=none; b=RgGmAUCOCj+Q+eH0Lh9vpRu6GsvL+x59UkzasSED67wLuIk/zItbgihvNKvSC80oeAy6h2c+21bp2Qk/bJc5nuZfQ5ahl0cUQ42YSeBK9L2sZBDf0HYSe1HusehY1a26nUTmrO6CpPR4XbNhKIyGu6tngQ8+oLHhGoOFWl5eSMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770136158; c=relaxed/simple;
	bh=f/TRia/N5QF+eOIu95D0pIEuluqKvByHhWwuULxnU/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IAL33lXv3Wb8PGD1YywTkIjNZnoUu4SA0ewZyq3gJ4iBlBfHp4niWiZkb+ruSmj/1kplE9p6CaOIGIc+7+SVkBWj5lQH7oroyXc8OH5So7lPPUJBTC1QLeU5cFccX79tbgkF0Q4H1husEjNOoUnFuGSr0vkyLOPRkA903hw+9GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 56A8768B05; Tue,  3 Feb 2026 17:29:13 +0100 (CET)
Date: Tue, 3 Feb 2026 17:29:13 +0100
From: Christoph Hellwig <hch@lst.de>
To: Mark Brown <broonie@kernel.org>
Cc: Eric Biggers <ebiggers@kernel.org>, "Theodore Y. Ts'o" <tytso@mit.edu>,
	Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the fsverity tree
Message-ID: <20260203162913.GA28595@lst.de>
References: <aYH54qJee85qLLkN@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYH54qJee85qLLkN@sirena.org.uk>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Tue, Feb 03, 2026 at 01:36:34PM +0000, Mark Brown wrote:
>  		} else {
>  			folio_zero_range(folio, offset << PAGE_SHIFT, PAGE_SIZE);
>  			if (f2fs_need_verity(inode, index) &&

This also need to be replaced with a

			if (vi &&

Eric already posted the conflict resultion here:

https://lore.kernel.org/fsverity/20260203053604.GC15956@lst.de/T/#m291294c1f6b7368d3c426ee47e6d23dc854b3ba6

and I independently verified it.
