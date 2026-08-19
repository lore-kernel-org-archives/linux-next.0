Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772AF43F8B3;
	Wed, 19 Aug 2026 09:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787131880; cv=none; b=k7D40Q4tX8Q27gxR/tFMlhEACD4QGH05NvhOS8tZazI2SoHZTC7X8Buy6mnPqDcyAbuhqKgEJi8GvzPayVPg+phv7bLguw+qLzV1CM5IctFK0exTq4BgooEF7E7iP8zzQGfOLYwCfMKIyJSeWejNxbKL45YEMDlww5e9AGGFNXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787131880; c=relaxed/simple;
	bh=3u3xlMJ5fpbZzxsclW4XVg2U0FbIpBnl65cYigskGc0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=EMr+b2+jGCwSLITUfYIVAOr25SiDMtIQyV3HrKRDTE0dsQapkDzomSTtsXKwjtfQ9uvjKxgAIfcC5UlA/qRZ6qMwcQYSgdHGoPtQm6BBRhhR3I5XqJ7NNcVUZIT+SmzStmtwaGWv9vpne+DyWdAcUexunixnMWmdoj/QhF4aj8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CCnVvrQb; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CCnVvrQb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787131876; x=1818667876;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=3u3xlMJ5fpbZzxsclW4XVg2U0FbIpBnl65cYigskGc0=;
  b=CCnVvrQbbGHHcUTSuuF72GMYfYCJYpMV465bMEVxNYZX6BkO4ZEBawFq
   G+JwGoL+OsHcQEGBJ/BxLcHXEaXbtSnLRmjaatsUj7Fx17g8ZD9oG+MsX
   phidYGY6VDrbqX8ar7kFSQFiEr5bH/B+glsRODTj8TG091uf/BK/nfQRB
   iiteP15gY1CAYvfKUkVhvuYao27BbLbbuEjZkmuA/k5+Lgs28Ha0B1iN5
   If9Q61KSXyb47dbqqohDAYDTbAyjsFJGsISO0fHfPfgz9HKvNO6pKTtm2
   00NxhmI58PAp7BYjXO4ixf4BiqCSDGRDL8wUI7T7E8sf94Zjr3ZyF9WNG
   g==;
X-CSE-ConnectionGUID: t12A2uVLQhadd3V9MsddaA==
X-CSE-MsgGUID: z7/dGF9eR4aStoKWcOTHsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="113185479"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="113185479"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 02:31:12 -0700
X-CSE-ConnectionGUID: 2PuugOzfQAeylrVcZiNS/g==
X-CSE-MsgGUID: 42QGZO9kSMWCtkqYS0dWAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="262230989"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.152])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 02:31:10 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Mark Brown <broonie@kernel.org>, Simona Vetter <simona.vetter@ffwll.ch>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: Unexpected files in the drm-intel tree
In-Reply-To: <aoR9fNYRhmWDNJtz@sirena.org.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <aoR9fNYRhmWDNJtz@sirena.org.uk>
Date: Wed, 19 Aug 2026 12:31:07 +0300
Message-ID: <cbd77031f484d0c044666c4fc11fd3ef273459bb@intel.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, 18 Aug 2026, Mark Brown <broonie@kernel.org> wrote:
> Commit
>
>   ac3baea883dab ("drm/panel: find_panel_by_fwnode() return a counted reference")
>
> added this unexpected file:
>
>  drivers/gpu/drm/drm_panel.c.orig

So this has been reported before for drm-misc [1] and drm-xe [2] trees,
and has been fixed in the drm-misc tree by commit 651b0bd0922b
("drm/panel: remove accidentally committed .orig file").

Similar to what Joonas said in [3], this should really only be reported
once for the tree *and* branch where it originated. There's not a lot of
value in reporting again whenever something gets merged somewhere else.


BR,
Jani.


[1] https://lore.kernel.org/r/al9cE1PAYd9jyCfZ@sirena.org.uk
[2] https://lore.kernel.org/r/annCRqegoQ9PBClJ@sirena.org.uk
[3] https://lore.kernel.org/r/178712337932.24680.17671628229026350089@jlahtine-mobl

-- 
Jani Nikula, Intel
