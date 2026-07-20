Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C5B3B38BE;
	Mon, 20 Jul 2026 14:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784558768; cv=none; b=TuzQSkyejmKEL7YVRrzsnw7AQuwFGx1tZR6Np9xl83AwZZENf2B8oaIP5NQ1R6ukYHQJx87Dvs2LvC6ymh3VwHxymBy1fgEID0T6lwWm87wFMWec1r0TnbMVp0Xkl1cCWc95Lk2u1i3rhG4JEeSu3FzWNWEldNXUc0eITGfQfZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784558768; c=relaxed/simple;
	bh=cJPu87nvYn3Xixn1rwDNcQAJzUhbR08LjTyaw+GT+QI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R6ic3hgXdDb8D9JTAja4iWRtb1eFltJ+iMbUhWaJTewfZMVhFIARke+FwazKCuJFNLJnMjpgtzzbRUc5Q6O4ek+0fK+LyvLW9XH0F1FfGd9trszafMz6CV4nufUIGZCVjMWxjBl5K2jT5i2Wowz2nQcQO9NEVfGqJw5UJKKEit4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=q4gTrKD/; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="q4gTrKD/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=PfRAFhBZQchppXOO+Jgr0cSkDMbt1DF4C/TUagsgCiA=; b=q4gTrKD/JHkF9rdgVeJRopM9/L
	urB9FO9pjuI91E3n7c9jeYmhfBQk91aQcrjjO1TtyyNPydmLVGxvVs8GYqpkhU6xWo+Hks5uvS6sB
	lbHDdqdJUCjuYiG8mU+GU49oC7mnX3Kj2F6mfBWxhopOLY7hye2br5fU7IrywpKGXRzGUth0DCKqO
	83YobtUbSGP3EUD1DQkEyI0UuUvTT/LFgFWKV0uhYRaMArtJ9d8bjgZRIC4ZiJqYnK1EvgzzFLcab
	03iYunE5zqja9kzp9HTj1eUqgezn+yrRqb7Fy3L6X8ZPqqAF9rs3rAq2uuSLtzcM6NlT1/E509PwL
	LAH7i8BA==;
Received: from willy by casper.infradead.org with local (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlpFo-0000000B90V-2Ozj;
	Mon, 20 Jul 2026 14:46:00 +0000
Date: Mon, 20 Jul 2026 15:46:00 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Mark Brown <broonie@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Matthew Brost <matthew.brost@intel.com>,
	Hugh Dickins <hughd@google.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>, linux-mm@kvack.org,
	Christian Koenig <christian.koenig@amd.com>,
	Huang Rui <ray.huang@amd.com>, dri-devel@lists.freedesktop.org
Subject: Re: linux-next: manual merge of the mm-unstable tree with the
 drm-misc-fixes tree
Message-ID: <al40qCMTxhEP3Kx8@casper.infradead.org>
References: <al4jGBGNG_QACaNL@sirena.org.uk>
 <20260720144141.GA16699@lst.de>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720144141.GA16699@lst.de>

On Mon, Jul 20, 2026 at 04:41:41PM +0200, Christoph Hellwig wrote:
> >   /**
> >  - * ttm_backup_backup_page() - Backup a page
> >  + * ttm_backup_backup_folio() - Backup a folio
> >    * @backup: The struct backup pointer to use.
> >  - * @page: The page to back up.
> >  - * @writeback: Whether to perform immediate writeback of the page.
> >  + * @folio: The folio to back up.
> >  + * @order: The allocation order of @folio.  Since TTM allocates higher-order
> >  + *         pages without __GFP_COMP, folio_nr_pages(@folio) would always
> >  + *         return 1; the caller must pass the true order explicitly.

Wait, what?  This is just broken.  TTM should change to allocate using
GFP_COMP.  Why can't graphics people ask questions before writing stupid
patches?

