Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB3E357CEA
	for <linux-next@vger.kernel.org>; Wed, 12 Aug 2026 13:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786541678; cv=none; b=vDPptJ+7rNNfqtqiGN6NVRwQ/Khu27Mlh/jHdEjex2grdjjOKWPLhmyjyAzyWAQPBHvnlilvvhNZC+re3b2bnZ1OWOf5Qdj9jQgWRHf6zZYnJPnFeiqudsh2BeiBboxJtzjcCn+4fsH4v+FwG2zLtqAv6IM5I8rDE45Fu6eZdZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786541678; c=relaxed/simple;
	bh=jHMoc1AcCbSmL/SPAgfKLZbqvfyTGK59Nv8NqIRNMAI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IguBhd+6n4MWjrVkNiTZjG8rJMV6jgKwz7tzN8iSrLbF1dzAscybAvyx0P4FZUTNley46NRYXhL+nuEnhY1HI+azo/DAcdswVnKlh41uQftAWyJC6b/9Xz6q0Jww3kzZhav5aVC96Mf8yeH5y/+HRa3HSFDvRLo0fR715M3t0/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=GZnl5g6k; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="GZnl5g6k"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=QJkxABZzUVKTqMJnJKRTtoZ6ug/FrULtNX1uOcgiVk4=; b=GZnl5g6kV41IUvANTuM7HYFuBb
	tOxPbvvDpQiQ+fnLsIFJd+Y5gZbBYGFNVE4zfRidGuifr2P2yRHSQ9jO57a3BYkY5pLlUvmuP4rPL
	EIDjzyLxKyVfXmTt6PXyZw/jr6jM4AkDtTrvey/ae7yFEwQ7wLhMc/ily6agCv707qEUn70XRcfAR
	BQC81IX33ktGx6abSKE/A4L86L0F0qoOVMfQLKpDQ3fiDoyqRsMSFRgdU2TntvuPBx/3iCdBVdtYL
	GdvmCqvrTl2+QcXKGyFxVBXm6tptT8TcAofw4ifs+Y0KiSxBPu1bLxtc3oPKv1lLBqNwzMWgVEgdj
	yLwFFtTQ==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wu96I-004NW6-0q;
	Wed, 12 Aug 2026 13:34:34 +0000
Date: Wed, 12 Aug 2026 06:34:30 -0700
From: Breno Leitao <leitao@debian.org>
To: Mark Brown <broonie@kernel.org>
Cc: linux-next@vger.kernel.org, Thierry Reding <thierry.reding@kernel.org>
Subject: Re: [PATCH] next-status: Include a list of trees with duplicate
 commits
Message-ID: <anx2Wd2wtQXNNexy@gmail.com>
References: <20260811170137.319964-1-broonie@kernel.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260811170137.319964-1-broonie@kernel.org>
X-Debian-User: leitao

On Tue, Aug 11, 2026 at 06:01:37PM +0100, Mark Brown wrote:
> It's possibly interesting to report trees that are duplicating commits,
> this tends to be a combination of trees that routinely cherry pick fixes
> instead of merging them up and transient issues with trees that upstream as
> patches rather than pull requests.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>

Reviewed-by: Breno Leitao <leitao@debian.org>
