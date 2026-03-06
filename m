Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3973AE1B6;
	Fri,  6 Mar 2026 14:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772806991; cv=none; b=N3K1XpGt4CDwhNi0dZHlXaYP15cx2KEuzbQHiDWff6xPZzKTnUTqQIaEUzY9FAYnvsbGTWGyGGWLtohSf6zz+ednNTuLYhhd5I9U7JngiY9A1gU4FQYhPVvRytNgW6VB1TT6SSJXJfjQUYZ/q8P4TCucoL/RVm/Vb4R4vn88DKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772806991; c=relaxed/simple;
	bh=HDttVmHrTLYgef61foikF2JZHZIyn8kHohgQrq90XGw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QsF0x1SRqnvvBVtyuPVyK/nbBZVFdrOwqSYZodX88xz8N07Ae4xCi/HMlhqYQxDXmP+4a0z+uwRXiJYXsfta8C07FXk6taeuzVA9zj+EPftLZg5ULl6oPQIzDytcKZaEZMhJsJRREbO5mHBlXegGg6MUTQkb9r7OM8GGbqtawiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id CD1D568B05; Fri,  6 Mar 2026 15:22:57 +0100 (CET)
Date: Fri, 6 Mar 2026 15:22:57 +0100
From: Christoph Hellwig <hch@lst.de>
To: Keith Busch <kbusch@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Mark Brown <broonie@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Christian Brauner <brauner@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the block tree with the
 vfs-brauner tree
Message-ID: <20260306142257.GA16612@lst.de>
References: <aamIvIWiZDDCmNYG@sirena.org.uk> <20260305145428.GA17884@lst.de> <aam-ijUWoOP5hhAr@kbusch-mbp>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aam-ijUWoOP5hhAr@kbusch-mbp>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Thu, Mar 05, 2026 at 10:34:02AM -0700, Keith Busch wrote:
> Yeah, one of us should have to rebase to the other. Since mine is just a
> single patch on the one colliding file, I think it easiest if I just
> rebase my data alignment updates to the vfs integrity branch, then send
> upstream through there. Let me know if there's an alternate preference.

Yes, I think that would work best.

Jens: is this okay with you?
