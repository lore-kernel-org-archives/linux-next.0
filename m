Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA5635E949;
	Thu,  9 Apr 2026 07:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775720886; cv=none; b=YVprpQWWj5F53s3g3H2d3spe2/wo9Suq0uny7sgBMuRrCEIaaVYrB3RPC+JzIJFwjZBm3pwy/3KIoWYsRW8WTiqsdkkx4KMbIkRciWTbXwC3iWqxP6BT5uh1V/AuRUgjqpQrQ66vaGR0EQkXR9ygHRRcrF6imf7sz4AqxJeBybM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775720886; c=relaxed/simple;
	bh=VyUNNaejMB1+HhTOT6IIe7zR55+rghGSBohfTvZcAIc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NyoKwe870wbtpnaZ0h7cNM+Am9drRWf2PyiIONTFt0aZN70I2WTPoCtY+cxtpFL9vvq/alRU7/j6524Cicpt3g0tQSKD3WOuTYOZGQZjBbJt1kLaJFa2Km/FydphOBSTm0IPyjq9d72yaxCyzJCHmysK3VyvXF5W/ZoW5/iNVm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=NIMz+/7G; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="NIMz+/7G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1775720883;
	bh=VyUNNaejMB1+HhTOT6IIe7zR55+rghGSBohfTvZcAIc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=NIMz+/7GSy+4CxRWZaWtJ9h0ywWz5znzgApZoqTqwN3VPHHJjA8ey3Lgoq0/XiS8c
	 QccxjkufHLdbGakORNTnyL5r9JDovPXHXXj4QyzNyZZao2/ZNtVcD0A/8GUCMCQdfZ
	 n9iU9PE82oaQr/Aw1r+BMjaZmS9nx7a+3AKJYSunHlhWHd+lBV6sjosijgmU2XcFVJ
	 CIT2uzgcFMGNY/L6fwNi5eUrIMLVJQhg4t9U09A9FkEzrf661XpX5tHw5qlw3TxHDC
	 wPjtkYBGx7vm6e3rUie63TsClpynIbQSKJoB9z9+p/MnK2gZhj1FcN1GV2WcZc8qr4
	 tVPB5/sswWA6A==
Received: from fedora (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3324417E0C83;
	Thu,  9 Apr 2026 09:48:03 +0200 (CEST)
Date: Thu, 9 Apr 2026 09:47:59 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Mark Brown <broonie@kernel.org>
Cc: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Pedro Demarchi Gomes
 <pedrodemargomes@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: linux-next: manual merge of the drm tree with the
 drm-misc-fixes tree
Message-ID: <20260409094759.03d0698b@fedora>
In-Reply-To: <efa647ef-17e8-432e-9560-a1f0435c0975@sirena.org.uk>
References: <ab1XClKfaCMYzg5-@sirena.org.uk>
	<20260320163902.24571f5d@fedora>
	<efa647ef-17e8-432e-9560-a1f0435c0975@sirena.org.uk>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 8 Apr 2026 18:26:04 +0100
Mark Brown <broonie@kernel.org> wrote:

> On Fri, Mar 20, 2026 at 04:39:02PM +0100, Boris Brezillon wrote:
> > Mark Brown <broonie@kernel.org> wrote:  
> 
> > > I fixed it up (see below) and can carry the fix as necessary. This
> > > is now fixed as far as linux-next is concerned, but any non trivial
> > > conflicts should be mentioned to your upstream maintainer when your tree
> > > is submitted for merging.  You may also want to consider cooperating
> > > with the maintainer of the conflicting tree to minimise any particularly
> > > complex conflicts.  
> 
> > I have a slightly different conflict resolution (it's the one we currently
> > have in drm-tip[1]).  
> 
> > [1]https://gitlab.freedesktop.org/drm/tip  
> 
> Sorry, this got buried and won't be relevant any more - for future
> reference if you could send an incremental patch on top of the merge
> that was there that is much easier for me to ingest.

Okay, I'll try to remember that for next time.

> Merges are
> remembered with git rerere and then fixed up with patches on top of that
> if needed.

For the record, we do resolve conflicts between sub-drm branches too
(end result is stored in the drm-tip branch on the tree I shared in my
previous email, and the rerere-cache is available there as well), so it
might be worth checking what we came up with next time you see a
conflict between any of the drm branches.
