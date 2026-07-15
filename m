Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480A73C3BEE;
	Wed, 15 Jul 2026 11:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784114653; cv=none; b=hApomy1zPaaIQZXX/vLd4REouuFmkCuIHLBwHt7lIkpYsEwPc/2F2y1/avl64hbObIJABFV7ocFnG9Gabu02pMX7YmVQwH1yxWGQq2+LxpDJ8MkdaNTZ5PXFLJie1/lw0tmNHI+1Zs99CJxjRdyfL+KJExo3p6kp5nD1SoB/S5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784114653; c=relaxed/simple;
	bh=rNJoJRHuCJsSKh01J+7U4FAtfd8OXRl6CUyW9/RG1Ls=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fQe6nY0MIuGOu0GWPOcn0qj/66O0kl4jxer9/SUqjnFZeJHpEHe0xsfGt3GnpYU3VwQjep2gERt/hEqBjcR84OBG+afWmBAXpsT5Hf58H4dIw45Fr26yiJXK7N9IkIGSFqP1Tn88o6I7VIdHNtxX9igs50YlubdV2o7+DIzegJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d9YF1M7f; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d9YF1M7f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784114651; x=1815650651;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=rNJoJRHuCJsSKh01J+7U4FAtfd8OXRl6CUyW9/RG1Ls=;
  b=d9YF1M7fZ9IoxVQtH7bILqdJJT3n8mApoakq8yaEsgHdxn8q3O9MsTK8
   L9DKUREQAwfM14kYFGzs8+iNbWtsfC8cSGGJye75z38hNotpbjCx2GP2e
   bIXtyXEzt6NsCWmimZ5XDekzsookE3/DG4s1hRTchhRFBiJNWLKDlPets
   sOmUvf7aizdgsKb8s1gGZVTh4qnQcMasbISS3ZMozvKapisA+pHEs1DXD
   dPbz51ZKck/3hULRETOIyXNUbCHBTzxcyK1WlxHbuMGs59EbQCzHL7bwv
   TSpGKwesRrxas1CtUoBI/2y6fIed5Aa3c09mjbT6dWHZwBnwhuSag+jOt
   w==;
X-CSE-ConnectionGUID: vhe+ft3MRtSjTT/LH6L9nA==
X-CSE-MsgGUID: YzVRMXYrTkOSEKV1VhURMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84602701"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; 
   d="scan'208";a="84602701"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 04:24:11 -0700
X-CSE-ConnectionGUID: ozUKoBqgQGigHt9xKHhD8w==
X-CSE-MsgGUID: oJJkCey7QtubiDaZnrBPVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; 
   d="scan'208";a="261062420"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO [10.245.244.145]) ([10.245.244.145])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 04:24:09 -0700
Message-ID: <55bb83d586d6f009b734e13c7b1ed95325129e5b.camel@linux.intel.com>
Subject: Re: Fixes tags need work in the drm-xe tree
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Mark Brown <broonie@kernel.org>, DRM XE List
	 <intel-xe@lists.freedesktop.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Date: Wed, 15 Jul 2026 13:24:07 +0200
In-Reply-To: <aldq1bH-I9hhdc7q@sirena.org.uk>
References: <aldq1bH-I9hhdc7q@sirena.org.uk>
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

On Wed, 2026-07-15 at 12:11 +0100, Mark Brown wrote:
> In commit
>=20
> =C2=A0 0aeed866cb938 ("drm/amd/display: Fix dangling pointer in CRTC rese=
t
> function")
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

Same with this one. It's an amd commit and only appears in drm-xe-next
after a backmerge.

Thanks,
Thomas
