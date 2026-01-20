Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C0963195F5;
	Tue, 20 Jan 2026 15:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768923269; cv=none; b=ki9PPupuXKD6RIEO/hB8fNRHlHWR2EB8WJfusqgOKU74UPCGZoMqZVtjlfHywoREAcuK66RLvDrjpY6MQA74jyVoTFRsLvgXA2uaNlxOSb8X8NvSmj3fa9Q9DvLE9TbPhh8AgNmuegJAuRCGOoRaQPjZG7AvHzxJeBE3DgI/Kb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768923269; c=relaxed/simple;
	bh=2o3HlPBaztBg3ky+vpLIPErlPkLduQbdakIca5fgrzw=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=JoptpyQJda5wmTK4c/NAFlLvq3MCTYJIMv8v99p7ky746FqAlwO895AIEuYN7YYxjGpu2jrlHISQdBMs0ws0YNH+zVVp1qzf2kkxcGnua9zrGLyuSN3kYVU/rY4X1Mi4xJz/g/gjn4SfGMpQX0aOAEyC8wS17Hc6JBFn+dv/POs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zgfes8Ap; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zgfes8Ap"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768923267; x=1800459267;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=2o3HlPBaztBg3ky+vpLIPErlPkLduQbdakIca5fgrzw=;
  b=Zgfes8Ap+hfD/CXY12Ey2sVb0EISNW4Mz7vXJt4E/7pXZ1OlEmK1FiqM
   AEiMFpn34WaVbZDIe3C1a53UlK0MEaBfO+npm0D4SzNUXvVylIjdldBOg
   8Z3EaUmOgHMQQvzKnkT/rPwK7P+cApfjjx+enAMWBD9roWbn8Fr3+g+w4
   CnG7OSgkyhQ3Hl7e19Y9CxxAOs9G84ZOBF0fXUljisgEMo+2g4qeC6Z4b
   iDX41tLumPUnuJ4mHi9X7qSoCDBHuwYOYjO55iyNPrUOrLuJyH+FKPyhD
   IVHMYNqLme0LDosY8LjUqo96qiT9bppx2jasdQDt8pISJxZ3pStzKi18n
   Q==;
X-CSE-ConnectionGUID: t/d+gb6GRDezc4pyvNIfEg==
X-CSE-MsgGUID: oWm6UTy6R7Gpy9rBsjCzOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="70227514"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="70227514"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 07:34:27 -0800
X-CSE-ConnectionGUID: /o5tQZIcQB6fiEEzoUKmBw==
X-CSE-MsgGUID: PSTYp78BRNmT4RMmdZ5WSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="206059580"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.10])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 07:34:24 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 20 Jan 2026 17:34:20 +0200 (EET)
To: Mario Limonciello <mario.limonciello@amd.com>
cc: Mark Brown <broonie@kernel.org>, Hans de Goede <hansg@kernel.org>, 
    Mark Gross <markgross@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
    linux-next@vger.kernel.org
Subject: Re: Missing signoff in the drivers-x86-fixes tree
In-Reply-To: <2a987ffa-e40c-453e-a54a-97a4ce8f8341@amd.com>
Message-ID: <0d48ec5f-41a2-8482-3612-858fc9581dba@linux.intel.com>
References: <aW-LCX4W9qIWNSdx@sirena.org.uk> <ee1f1510-2935-587c-d459-af9c1680c25c@linux.intel.com> <2a987ffa-e40c-453e-a54a-97a4ce8f8341@amd.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1204596495-1768923260=:12086"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1204596495-1768923260=:12086
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 20 Jan 2026, Mario Limonciello wrote:

> On 1/20/26 8:37 AM, Ilpo J=C3=A4rvinen wrote:
> > On Tue, 20 Jan 2026, Mark Brown wrote:
> >=20
> > > Commit
> > >=20
> > >    bb820f17b68f6 ("platform/x86: hp-bioscfg: Fix kernel panic in
> > > GET_INSTANCE_ID macro")
> > >=20
> > > is missing a Signed-off-by from its author
> >=20
> > Thanks for the heads up.
> >=20
> > The patch was submitted with Signed-off-by but git interpret-trailers
> > --in-place
> > seems to mess the tag up for some reason.
> >=20
>=20
> I think it's my fault, I wrote the commit message in another text editor =
when
> I was reformatting the kernel trace back and when I copied and pasted the=
re
> was a spurious " that messed up parsing the S-o-b.
>=20
> Feel free to strip the spurious " if it helps.
>=20
> Sorry about that, and thanks for catching it!

I've already fixed it by copying it manually, and noticed at that time the=
=20
extra " which explains why the tools did what they did.

--=20
 i.

--8323328-1204596495-1768923260=:12086--
