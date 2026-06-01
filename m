Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8138129CE1;
	Mon,  1 Jun 2026 17:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780335849; cv=none; b=mBtYxiFX98S5yexPRcZzUg7f3DLLK4DEQbBVEmrDqBoQY+AsOOPjEikm/ffeermBv+rAuSK7dFHpnbfm1PgCU691CE0kZq4rzufZbkuRnPVXWZ4FItQ9T1RiNg+wFbL41H0t8iyoANLaqfqYd2xZCT3BoGpeJlTa6b5tB8tWZT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780335849; c=relaxed/simple;
	bh=7R7ndodQPiIJhsmp/DxIyj84pWbxKh9GvAaEXfG3Muw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fb1N7u9wAJikxqNL4dyMbJqQ6e3Gjn8eRL4LKE6LoEzhx1SioZvZUG/xWdxCMAQKFu6rniv9lYhftWyk6I7Cqpk08/e3WVyWXaUqgjHYRCiR4eI2RBtPY79Me7bHahx/5HXf7j1d8cQ3UXBiJ9Zu2+Ka0PlwoJB2ayssBb/OEz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=SA84WusN; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="SA84WusN"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=zdnZkLpK8BSyanxla5y3m7gt9uQQC9jIvk1EkWnG2gs=; b=SA84WusN1TPRJXK/oG+ERoC6Hs
	lKHe8XQkPMMd7skBpnNmIJErjF4soc9+aSFGmMRChZTpc0lEn6aK81RGblsTmRBCUCJQbS4AtiDln
	ISipUuFTs8TSEjYCHajdaB5aDvqveTXZc/gLRn8wiTUyjn5KQwZFYvJ79NBEkA5wF0zsMIQjB0EL6
	XPkWiBPtrx2xNc1sQdzovGpjlEK9dSEOv8gVioie4WjD2CvurFk48jDD6q1SYzZ0/Z6wZ1zy3GQyM
	8UNEyg2b3InE5Te1VKzUlpKaTsu0I6/KE9sXvnr22hn9ousK5RbI/LX+4FGvwFjw7kKoTSpfSKIZ7
	R6Rok1ow==;
Received: from willy by casper.infradead.org with local (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU6gG-00000000V6n-1Bvt;
	Mon, 01 Jun 2026 17:44:04 +0000
Date: Mon, 1 Jun 2026 18:44:04 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Mark Brown <broonie@kernel.org>
Cc: Jens Axboe <axboe@kernel.dk>, Andrew Morton <akpm@linux-foundation.org>,
	David Carlier <devnexen@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the block tree with the mm-stable
 tree
Message-ID: <ah3E5CV6pZO7kq07@casper.infradead.org>
References: <ah26UmcBXVJMy-Cc@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ah26UmcBXVJMy-Cc@sirena.org.uk>

On Mon, Jun 01, 2026 at 05:58:58PM +0100, Mark Brown wrote:
> Hi all,
> 
> Today's linux-next merge of the block tree got a conflict in:
> 
>   mm/page_io.c
> 
> between commit:
> 
>   d590df11be0f1 ("mm/page_io: rename swap_iocb fields for clarity")
> 
> from the mm-stable tree and commit:
> 
>   ca36c1aaee095 ("block: Add bvec_folio()")
> 
> from the block tree.

Thanks; your resolution is clearly correct.  If it'd be easier, we can
just drop the hunk touching mm/page_io.c from the block tree and I can
submit a separate patch next merge window to the mm tree.  But the
resolution seems straightforward enough that maybe just keep it.

