Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749893D9535;
	Mon, 10 Aug 2026 12:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786366468; cv=none; b=uUqm7YICVuOOj4etZO40UVZqvkMezxMT5ZVcCQ9/VufD+Vjn97iyB26yF3vbrdSHdxuWMiVurvMls58cv9dL3mN81VHW6kqRv3WXKQugcTbVHjdK+v0Y/kxwAV98TlV4csV81df+o02ebKTPWmIOcIqVNr3CWdJXtbSNl1ygneM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786366468; c=relaxed/simple;
	bh=AfZ9IBiARQSob+IYHG+cbu0gTyremXmK6MOLJLm8x0Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=V6KoL53sfM6uWYSZX2jV+iWH5QXv6Z15Pv8587Bfvzrf0txIIDaBIk3TRnnX1IidBRH+lPcu2DUj7/ndnHzEXtNOwL2AN64OP85k/bYlpFQtAoGASSX8QVH+dlSFDhCI237e8EGrk6QDd+9up/2AbnXPa53D+1VPstWZPrHLN3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L9nfJLwc; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L9nfJLwc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786366466; x=1817902466;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=AfZ9IBiARQSob+IYHG+cbu0gTyremXmK6MOLJLm8x0Q=;
  b=L9nfJLwc/4U2OFZBHMCPl1r/k7iPvSsoNOlyjucXdSTglZkdgB4JcO9G
   RgtedlbgqmD1rpxEszDK0BxguzvAZkPpXhHZngImv8JAXJ6gndLlaWq53
   CjawT9dBaTNhGcH1ky4xHjOoGr/AlAF1v7JCMlhfg1cf0usGnWNjtQUdC
   Perl9awZy1PoKiC7PO+pUp1TAXiHI88VXQaV/2Dy3Olug4VZCZgyr/kz3
   H7AMHxzrTImrf+ZL+qBZjwMhSJh3+G8tmqVJYnNbpBc3K9JlBJ4lWS8Pv
   okdKayEcDI34s3Rn3w1HLM6qt7AUgBKewNynWAsI75KBqVkXwd56s17pK
   g==;
X-CSE-ConnectionGUID: oB8YsjcURri+jqiva2dyeg==
X-CSE-MsgGUID: bGSVTxNLSgeZeh3uDPqriA==
X-IronPort-AV: E=McAfee;i="6800,10657,11870"; a="104271346"
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; 
   d="scan'208";a="104271346"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 05:54:25 -0700
X-CSE-ConnectionGUID: Ij8UGpEnQfi6dzBaOLpb/w==
X-CSE-MsgGUID: Jiu1COScQrWif2OpZmklqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; 
   d="scan'208";a="263640991"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.103])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 05:54:22 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Mark Brown <broonie@kernel.org>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, DRM XE List
 <intel-xe@lists.freedesktop.org>, dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: Unexpected files in the drm-xe tree
In-Reply-To: <annCRqegoQ9PBClJ@sirena.org.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <annCRqegoQ9PBClJ@sirena.org.uk>
Date: Mon, 10 Aug 2026 15:54:19 +0300
Message-ID: <23d8ccf32c09ab940ea03a62b9827283df945854@intel.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, 10 Aug 2026, Mark Brown <broonie@kernel.org> wrote:
> Commit
>
>   ac3baea883dab ("drm/panel: find_panel_by_fwnode() return a counted reference")
>
> added this unexpected file:
>
>  drivers/gpu/drm/drm_panel.c.orig

Thanks for the report. Fix at [1].

BR,
Jani.


[1] https://lore.kernel.org/r/20260810125204.3258447-1-jani.nikula@intel.com


-- 
Jani Nikula, Intel
