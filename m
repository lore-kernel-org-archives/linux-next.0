Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB2F35DA75;
	Thu,  4 Jun 2026 17:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780593828; cv=none; b=W8v+4k3vImzxDFH9DPAir2M50kBx9PwrDZ3VN0a51eEnduuAVF+p0RzfIBThxLR3M56De6mOsoZOI6tgztHdBV1dhgYAylAokshV187j0qxfmy52+b2bXMqQW9gQdJq3+krdK17NG5FczBCmuPhvFXMZ/jb/vlvcb4tASzbGi6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780593828; c=relaxed/simple;
	bh=l5asS8SpSkQYf+YuhGCpSbcTaEHoBBdWcBH67W6W3fo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ohCi7EpYHeC3UW0sfFcKHIukBj8RQO8jtdHC6Y2DYnoOdIhkrugbi1rb2V83/TqU+ad7SLSafZKQjMLXmTx7wrBsyZ4lOqx4hg9UUfgN59aWl86yenHd7pXoHKdF5/ijsGWt2qv3MDkM2c756dP+OMczQuLGyFL/qsldthIYmFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E6HzlUIu; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E6HzlUIu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780593826; x=1812129826;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=l5asS8SpSkQYf+YuhGCpSbcTaEHoBBdWcBH67W6W3fo=;
  b=E6HzlUIukPTvUO439/HDGnH+9UrQKBMgHiD9/8sJXv7x2E+ENAUyY0we
   sA53S881scPZJ7Z4KpuOAembYDB029LvkCa37atBg3SjEdevx6XahTBei
   aw2BDVcokCuq7qdGJvCCWRsVvqiASQGPeWSzuDnQLJGTCTMd0eeq8ifUs
   I2TCbE1q+2izkTET1M6VsIpX0SWMyNkk2WH/fWkTvXnrWMAoTSGgBqqUG
   Gd6GYjg0s37nljo4QJhy29WjYn9BPUVM/dgFjCR1FFvGDu3TemuIw8at0
   /K1EnKv0/4QNVtgVNMVsUQBLR/Byltr19WrAobnJvscHIqthA9prgt90B
   w==;
X-CSE-ConnectionGUID: je7xebcHQpSd1Xza3v9iYQ==
X-CSE-MsgGUID: a+qVCKZ7S+y7DMxZnowTEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="81333640"
X-IronPort-AV: E=Sophos;i="6.24,187,1774335600"; 
   d="scan'208";a="81333640"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2026 10:23:45 -0700
X-CSE-ConnectionGUID: YW23+NPcTWm68cvRSmpMzg==
X-CSE-MsgGUID: nRc+5WOVQ86wCWJBmU+OIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,187,1774335600"; 
   d="scan'208";a="242114187"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO [10.245.245.65]) ([10.245.245.65])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2026 10:23:43 -0700
Message-ID: <8c4d38f10b1941687314bc43cc4de40097b84b78.camel@linux.intel.com>
Subject: Re: linux-next: build failure after merge of the drm-xe tree
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: DRM XE List <intel-xe@lists.freedesktop.org>, Gustavo Sousa	
 <gustavo.sousa@intel.com>, Violet Monti <violet.monti@intel.com>, Matt
 Roper	 <matthew.d.roper@intel.com>, Linux Kernel Mailing List	
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List	
 <linux-next@vger.kernel.org>
Date: Thu, 04 Jun 2026 19:23:40 +0200
In-Reply-To: <551d384f-d151-4d1e-bcb8-a1cde0860a30@sirena.org.uk>
References: <aiAz4DmtngY0r6Cx@sirena.org.uk>
	 <bfb0dee8-b243-47ba-a89d-71472b0d51c5@sirena.org.uk>
	 <f9094757b2aab617feb8fc3f8a66f46595e0ae27.camel@linux.intel.com>
	 <551d384f-d151-4d1e-bcb8-a1cde0860a30@sirena.org.uk>
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

On Thu, 2026-06-04 at 15:50 +0100, Mark Brown wrote:
> On Thu, Jun 04, 2026 at 04:43:17PM +0200, Thomas Hellstr=C3=B6m wrote:
> > On Thu, 2026-06-04 at 15:35 +0100, Mark Brown wrote:
>=20
> > > /tmp/next/build/include/linux/compiler.h:200:84: note: expanded
> > > from
> > > macro '__BUILD_BUG_ON_ZERO_MSG'
> > > =C2=A0 200 | #define __BUILD_BUG_ON_ZERO_MSG(e, msg, ...)
> > > ((int)sizeof(struct {_Static_assert(!(e), msg);}))
>=20
> > Funny, I see no build errors with drm-xe-next allmodconfig. What
> > compiler is being used? Any sha1 of the drm-xe-next top commit
> > you're
> > testing?
>=20
> This is after merging the tree into -next, that'd be on top of
> 09b893db4d9e68c2679e76624d420f438f8d3e98 for today (not published
> yet).
> It's possible it's some interaction with other trees (like the main
> drm
> tree) and works as a standalone thing, it wasn't obviously that from
> a
> quick investigation.=C2=A0 The toolchain is gcc from Debian stable.

So I merged drm-xe-next into next-20260603, and no build errors neither
with gcc nor clang.

AI says it's confident that the error report is from clang, based on
-fmacro-backtrace-limit suggestion and the "2 errors generated."
summary, and suggests this might be an older clang version limitation?

Thanks,
Thomas

