Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA233D25BC;
	Fri,  3 Jul 2026 15:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783091339; cv=none; b=iJRrwqN0mZEUzvnrMLoE/yD+Dpg/uoqr5MQM6dla7S08AuKUsO5H+dvyVw51sne6mE1wipx1bLVGHULjV9wZPmThf24tw0gNN7YhBPMGadXcEwtAxfoPLhWuw+927jbPN9+VefBi4NK+nX735ZRTh7pky+WZJAd/DSOBXYYDFJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783091339; c=relaxed/simple;
	bh=aSybWTj7yVbndnK5cLY9xy4hg0RvSff3ZvxknhqjCtw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XYj0I8i7nAPmLDjmpdZrp0y/XYGb3NaAirQs291bXDqcmBCegh4ljo1OWXE9ARgvmR5McHY3NEyyJwNmScc8L+1NhiN8U26m2umh/ehobUR+26IdJWIDH9OyxqUC74ztjw2LnkUvg0osxDCev7SnZzwc4hmTyRRcLyF/TLvBo8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D36y4/Tz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D36y4/Tz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AA0B1F000E9;
	Fri,  3 Jul 2026 15:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783091338;
	bh=FuL4WeewDArElfKjKW2FQOwiHzL8TbbRzcybFbnakyU=;
	h=Date:From:To:Cc:Subject;
	b=D36y4/TzdcXi9HugBw6aCNzdXy3xt7gN28tRcx8CbAv5gXme65yrF4mGXWp0Utfey
	 n/cAXe8iX0XZKnVcSy9jWZY8WlbZgwYsYZgepT14hqqJZxc7Q9eVGPYH9MC5Zz6caZ
	 3TXXjQsBr/HDpXUkrmn14brHbs0tqa3BZOFB6lPg0XEcSiL31Y+PHAB0bR2LsofNRi
	 2KTWEmuK0GYSGJbeN0AmtdXR/V20ZZpWA8yMz4w5ca7viTgmaxFWbiZM+oWlU9r7QM
	 xCuGhNvf6ky8KjvnVFqwuGJ2Cr/WFG4Ax4VJCWTmmYVvM7GbxwZN1Zn3gj9Rs8gekB
	 0D1FJBJcdChFg==
Date: Fri, 3 Jul 2026 16:08:54 +0100
From: Mark Brown <broonie@kernel.org>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	DRM XE List <intel-xe@lists.freedesktop.org>,
	Matt Roper <matthew.d.roper@intel.com>,
	Gustavo Sousa <gustavo.sousa@intel.com>,
	Violet Monti <violet.monti@intel.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the drm-xe tree
Message-ID: <akfQhvCUM6kcWeSX@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

The following commit is also in Linus Torvalds' tree as a different commit
(but the same patch):

   5ff004fdc7377 (drm/xe/rtp: Add struct types for RTP tables)
