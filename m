Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647493A1A59;
	Thu,  5 Mar 2026 14:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772722476; cv=none; b=FYpwmPt8xlWs3m7qT/1AD2IqlQEre3jcNGVUmwQI+B9ijXqSDkpmaGzcfa1ws1sSdjVhbDYc5f1/S/bFABrNOt4eCOg2/BmnDBJhlAs6zbFKf7MksS1yXtsl06PEEqoDqhZIqy5VpHf25E6FpDOc+0df5l3bE3QYt7q6NcMSTnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772722476; c=relaxed/simple;
	bh=1EKW+IersTF8BOqUpC4NuPy+FK1cvinY/r0x8tuPwd8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oGxvj5ZIrcOzKv67SElBZtZ588S7oEFhx5QKCXuyyhqNyLC8iDoIZ6mIv2vv/5DHVZgF6RqVHt9oOd7I5ntQWA8JmOs4TwhpX41grO7snNPhThMO0tFu6iaWPydHmBdooPrPXYK2WfUaTXbfNlfHbiXnb4zVxoLvICrVqDdVMlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 15A4768BEB; Thu,  5 Mar 2026 15:54:30 +0100 (CET)
Date: Thu, 5 Mar 2026 15:54:28 +0100
From: Christoph Hellwig <hch@lst.de>
To: Mark Brown <broonie@kernel.org>
Cc: Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>,
	Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the block tree with the
 vfs-brauner tree
Message-ID: <20260305145428.GA17884@lst.de>
References: <aamIvIWiZDDCmNYG@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aamIvIWiZDDCmNYG@sirena.org.uk>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Thu, Mar 05, 2026 at 01:44:28PM +0000, Mark Brown wrote:
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> I don't have a huge degree of confidence in this merge as the block
> change was quite large and the code is entirely unfamiliar to me.

I'm familiar with the code and looking at this I have a hard time
understanding the merge.  I think we need to get both of these changes
into the same branch somehow to properly audit and test it.

