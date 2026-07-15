Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32D843303A;
	Wed, 15 Jul 2026 11:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784114580; cv=none; b=CZ+Yq/AgkVAUHJBmr41Ki3ZeciQqnbXA+82QUXI/gSvaK4cTou7ZjyMofpYWY0o1H4gCDY9Z3bDI4qktdSaaBIW2PdK2IP1d7suZqekYuwQLY1kHSnqYOSxleeQWfGkirgVnhpz1nE1eEFDic7A2bmCiuxFFJZHq2uTH230unsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784114580; c=relaxed/simple;
	bh=c0w8gHbaKzhIyQmr/1NPVuV4XBOy1fDyuE0NQOg5exQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YBp21xuJY+MXl6ZxUScHT7S454pR7NPmC/V8FZmTUt+6oK17fz8U120270ExYAN5VAHoc0im1bV5ahSJQi6QT13a736Qy9agEDO+1firJkJuiayl2wMVGzQcrBPt89Qsqg8PmQIHx8WZkCDKyp4vQbJR1Yi8cBcWAUKcD7wLvVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XwqsqOFH; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XwqsqOFH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784114579; x=1815650579;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=c0w8gHbaKzhIyQmr/1NPVuV4XBOy1fDyuE0NQOg5exQ=;
  b=XwqsqOFH/RGxxVlVjEHkI1l6Zo80YlIJy24FEELvsqltAZJztddC3KfQ
   dvynxjbkOxLzFMyBlauM02bK8Gu7Wm/tUehYUGyh8lhXgZ69p+30IK+vM
   fxcODr9DLPbt4hBq+cq9SQ+hgV26F23/aRYdHOy4FR0Aklv0ghRuVUK+3
   TtwWt1zI5k++BM8KhXXAIFY+PrnyvRH6YLZaujzbPVLcaU5wBTgj8Rntd
   klioA9NNlZ/6KOLiA6KtAcaY2EvTacLaMWXUR50fSlLGWzns1lQMx6DM9
   e09QLySgn1n/uiit7oRfyX3nlKqImaQeppuluF0eJRjXOy26lYauewLcr
   g==;
X-CSE-ConnectionGUID: SLFUSlviSLCfb/5dIOoP4w==
X-CSE-MsgGUID: NCsc6YCoTXKiFup8zhWonw==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="88651950"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; 
   d="scan'208";a="88651950"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 04:22:58 -0700
X-CSE-ConnectionGUID: F2tOz2J9RZWvmNjPVQIFYA==
X-CSE-MsgGUID: CAI+9p0fTZyhpMkUpojvyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; 
   d="scan'208";a="286228892"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO [10.245.244.145]) ([10.245.244.145])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 04:22:57 -0700
Message-ID: <f9bd11224a5efc2bd76fe81603f6fbe2a6823cbe.camel@linux.intel.com>
Subject: Re: Fixes tags need work in the drm-xe tree
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Mark Brown <broonie@kernel.org>, DRM XE List
	 <intel-xe@lists.freedesktop.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Date: Wed, 15 Jul 2026 13:22:54 +0200
In-Reply-To: <aldqsddPPF4VaFCU@sirena.org.uk>
References: <aldqsddPPF4VaFCU@sirena.org.uk>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi, Mark.

On Wed, 2026-07-15 at 12:10 +0100, Mark Brown wrote:
> In commit
>=20
> =C2=A0 3b1f4d5e47b36 ("drm/amd/display: Fix dangling pointer in connector
> reset function")
>=20
> Fixes tag
>=20
> =C2=A0 Fixes: e7b07ceef2a6 ("drm/amd/display: Merge amdgpu_dm_crtc and
> dm_crtc_state")
>=20
> has these problem(s):
>=20
> =C2=A0 - Subject does not match target commit subject
> =C2=A0=C2=A0=C2=A0 Just use
> 	git log -1 --format=3D'Fixes: %h ("%s")'

This appears in the drm-xe tree only after a backmerge of drm-next, so
I don't think drm-xe is to blame here.

Thanks,
Thomas
