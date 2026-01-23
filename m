Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304EB1662E7;
	Fri, 23 Jan 2026 15:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769182471; cv=none; b=p9dRB79NkMEu7n3T5VYCeJuEMkteL2wYPsCjrTGJfnOH7TwDVrkMA1RDi93hp9qluHQ1xUpw2Q006W10gHfmRdhlmjbv30ES+4bmghQcJiG5gpBb6DxUUy3Cn/ay+bqIcc1z1jEGNgEeLw7T0tQ1MgsQoaprOr5lztpucxjrPy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769182471; c=relaxed/simple;
	bh=YseJkVABJlm/jhvdY1L58/hMfxdtbJczxH6fIXRkGEI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BaVMdMoRZ/BYuZkrLWiGSq83Q/BVfqlxwvUYmh9qzUIZb2tsX8L9jOQ0mzwxIXRuj8iljsGIdyxvKni0N5e8Go3D1aOz+GAPeHROUToaOhikR/L1tRViS1T886yvcT7UjeJ12PsmWO1lxMWClVKE1zT+ykbj+yECoaH81l97SA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nEUi3UDH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nEUi3UDH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4815C4CEF1;
	Fri, 23 Jan 2026 15:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769182470;
	bh=YseJkVABJlm/jhvdY1L58/hMfxdtbJczxH6fIXRkGEI=;
	h=Date:From:To:Cc:Subject:From;
	b=nEUi3UDHo7zwvCliR3TkXUEhWp5O8g4Mcx0kD45s5h3GeiHPgHPfEOYynmJYCevuA
	 uEk3O2FgTusGHg/P0kHMIcIdRnN0141qBHSr1og80y0eIWOgUu2M+vI06/yjUmpRtf
	 pZN5zIpyP46F6IIlbsvo+f/uNzmEVNMlik/gZ/1NtCRszCPjdg8H1seNYl5reW3YAv
	 ToeQujjfh34EtjUziDMZWImPOlK1dx9ucvB3xTvaCS7YB+dMsFf9i5Im8mejYOb0tv
	 ru0ZCDJbrdgtx2+G8iEfASbKDGYrmVJS9bvnE5pguWM8gEno2pq7h3CtK4LJ/M1+4n
	 ySgzh9nLGhnOA==
Date: Fri, 23 Jan 2026 15:34:27 +0000
From: Mark Brown <broonie@kernel.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	DRM XE List <intel-xe@lists.freedesktop.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the drm-xe tree with the drm-fixes tree
Message-ID: <aXOVAyMnaCIwgF6r@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Today's linux-next merge of the drm-xe tree got a conflict in:

  include/drm/drm_pagemap.h

between commit:

  bdcdf968be314 ("drm, drm/xe: Fix xe userptr in the absence of CONFIG_DEVICE_PRIVATE")

from the drm-fixes tree and commit:

  1e372b246199c ("drm, drm/xe: Fix xe userptr in the absence of CONFIG_DEVICE_PRIVATE")

from the drm-xe tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc include/drm/drm_pagemap.h
index b7a78c1ca7670,2baf0861f78f3..0000000000000
--- a/include/drm/drm_pagemap.h
+++ b/include/drm/drm_pagemap.h
