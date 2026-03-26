Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75363368B8;
	Thu, 26 Mar 2026 05:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774502360; cv=none; b=MPoK7d7VGkeMBTb4aZy0Q9WdBfJGaFj/mhhX+vUw1K6ov1oot/Q+B2aP12U4ggX8g3e9Vz3AFKFxGEjyiBZGcCEAxBO6xyXDd6C4GkjtK1LWHwkn77VqRC0fcJ5xVhQAQyt9C2vqiQ08m4Bjdfau6XVek5h9t0upPz9paekDPUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774502360; c=relaxed/simple;
	bh=dmPYXSMGTuL8Ehvg6cKhbhZ6ZLV3p1BYq5EgEWWls64=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kV2YH2vg0d8UEMd0cBIrceMg9TV3mWGpsU1depwUAaXZBjw6j1kmS+UmQ5hwCBPnwTWy/2cpqqDqhQk/4S4RuKx3GxvTrTjYrKVYZtu2/qHUkbBmTWfxZy1XhZJ2QSiDevkjjRsotadQ8+3Rlxqhk+4dwb2OrJy4+EBUC9PkbJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 3D03E68BEB; Thu, 26 Mar 2026 06:19:15 +0100 (CET)
Date: Thu, 26 Mar 2026 06:19:14 +0100
From: Christoph Hellwig <hch@lst.de>
To: Mark Brown <broonie@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>, Christoph Hellwig <hch@lst.de>,
	"Darrick J. Wong" <djwong@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the vfs-brauner tree with the
 vfs-brauner-fixes tree
Message-ID: <20260326051914.GB22847@lst.de>
References: <acPjQfoS-k2oDp3i@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acPjQfoS-k2oDp3i@sirena.org.uk>
User-Agent: Mutt/1.5.17 (2007-11-01)

The merge looks good, thanks!

