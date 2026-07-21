Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2EA0387347;
	Tue, 21 Jul 2026 04:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784609662; cv=none; b=GJJC1shKy6BdrJGTDEMZN40m+SBU4Y7dpv7AhTEkKSkVpE8EbrRaOXqDxJ5NHNEDFnA8iDkly/ePBDs2AA2zHoK3OyvBTmzxwiQ2yT52tpB3N3cP3RW/wq3qkwvh7n0GDQMX3B6eRrpC1AwaoTVvsy5jOIn+9ZklhR6xUm1CSUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784609662; c=relaxed/simple;
	bh=QJcQiKFliWWmWXHSx63+aQHbLXrc4tgTViJ7VgxFp0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JjtpXmuA+8Z+GsdQ9LFwuRLWAIwSQ2q44UCYUGiGV+2o/MN+2f1/ZX3ZhjRIqxAZYCfIF34rbBGP6lw92Z2G47s3dAd50ZaWCmHfdvUOQaIHxs4rHVhbw/rSllvWtk+5ZZwT5ZpOuJUeQPsav9/cTyhJnc4mlrTQykY/EO0TDY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id F3EED68C4E; Tue, 21 Jul 2026 06:54:16 +0200 (CEST)
Date: Tue, 21 Jul 2026 06:54:16 +0200
From: Christoph Hellwig <hch@lst.de>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Christoph Hellwig <hch@lst.de>, Mark Brown <broonie@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Hugh Dickins <hughd@google.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>, linux-mm@kvack.org
Subject: Re: linux-next: manual merge of the mm-unstable tree with the
 drm-misc-fixes tree
Message-ID: <20260721045416.GA6737@lst.de>
References: <al4jGBGNG_QACaNL@sirena.org.uk> <20260720144141.GA16699@lst.de> <al6aCizqqilqQGZ4@gsse-cloud1.jf.intel.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <al6aCizqqilqQGZ4@gsse-cloud1.jf.intel.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Mon, Jul 20, 2026 at 02:58:34PM -0700, Matthew Brost wrote:
> Do you have a suggestion of what parts to move over to shmem.c?
> 
> Pretty much all of this?

That's my first guess.  Basically when using a shmem folio to store
data we should have the code dealing with it contained in the shmem
code except for well-defined APIs.

> I can take a look at this in a follow up?

That would be great.
