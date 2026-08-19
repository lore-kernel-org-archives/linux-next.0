Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56BC43D411B;
	Wed, 19 Aug 2026 07:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787123387; cv=none; b=X/AD7TBh6ZJfUPB8a0KdEsKXCHgXFHUn0VCPHUK3DnOpzAvV8NhS86c+uqrCDsCuIZz9TnY/nWIgRa8KmRyvXcNttUnDPBKBY3KAzHwap4j4fXSueSTgjkaizwjsNPAVz7EiB/tJUR80ICZehpPsXJekSJal3hvNx6+eIcIau2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787123387; c=relaxed/simple;
	bh=dxqpOPGUKt9fzUShnvRwtpWIHWT9WD1jmQToDhzm/U0=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=ZK4D7/E6cug9yfn7vAhtHs0gxvzo6yIA5yL45QDzOkqlw5NHiylHrdSTElADIZJ4VvsdljNVlHU50ZtTsJH5L+yVmVUHScSmsCtgBeLhlzwzED2I75tORg+Se7mqIH/4vApntF8EILG1gh142biAFgT7Bo1pjyhMkmUpnnoZbzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=epqNMg8k; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="epqNMg8k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787123386; x=1818659386;
  h=mime-version:content-transfer-encoding:in-reply-to:
   references:subject:from:cc:to:date:message-id;
  bh=dxqpOPGUKt9fzUShnvRwtpWIHWT9WD1jmQToDhzm/U0=;
  b=epqNMg8kXlwo4yodnlF7ykuS4bwT92vXkjt7sHrohdBX/ke/XW0Hxu5o
   eEiP5FPy8Wkew/7PzlUUI2CtDUT8i9nAwgMowsLvj56SCmpw+um4+ELJM
   wQdFPjxa8SNa2HOO03W9JcJabQtSuhU0YxrMBqxUob4sGV2z/bmSTotmX
   gwBcHXg/8ID3LTkgDX7N+mV24cftdo417CbUs1V/rt4SGYj8ZvYhonxXO
   1pM4MUQbIT0zEnubmc1UrtLk3oM1b1G1Zf+ryd81rEZL4mr0ssSncUArV
   4aP9uDiah6JJ825WSkj2Xg8ma1T08KxXPnWF+Uavteb0QfSGVGMHA4+yD
   w==;
X-CSE-ConnectionGUID: cxK3BxBXRIqv3Oqd+O7GFA==
X-CSE-MsgGUID: 0Ph6AURhT6yZJude+Hy2mQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="113172071"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="113172071"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 00:09:45 -0700
X-CSE-ConnectionGUID: BBo3tM0HRG2n3stOGg7ZYA==
X-CSE-MsgGUID: T21tUoibTsqn7vKVdwGZCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="270661780"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.124])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 00:09:42 -0700
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <aoR9bznCkJHwK4DY@sirena.org.uk>
References: <aoR9bznCkJHwK4DY@sirena.org.uk>
Subject: Re: Fixes tags need work in the drm-intel tree
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
To: DRI <dri-devel@lists.freedesktop.org>, Intel Graphics <intel-gfx@lists.freedesktop.org>, Jani Nikula <jani.nikula@linux.intel.com>, Mark Brown <broonie@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona.vetter@ffwll.ch>
Date: Wed, 19 Aug 2026 10:09:39 +0300
Message-ID: <178712337932.24680.17671628229026350089@jlahtine-mobl>
User-Agent: alot/0.13.dev2+g40c57d620

You may want to include the repository name in the body of the message,
not just title. The full repo name would help, too.

As there's no drm-intel tree, one would assume drm-intel-next, the
below commit is not there. Seems to be from drm-misc-next.

It seems to also be drm-intel-next-fixes tree which has been reset to
equal drm/drm-next to prepare for -next-fixes PRs.

Maybe you want to only send the notification once per unique HEAD
(ignoring merges)? That'd then target the original commit and
any cherry-picks.

Regards, Joonas

Quoting Mark Brown (2026-08-18 18:42:39)
> In commit
>=20
>   0aeed866cb938 ("drm/amd/display: Fix dangling pointer in CRTC reset fun=
ction")
>=20
> Fixes tag
>=20
>   Fixes: e7b07ceef2a6 ("drm/amd/display: Merge amdgpu_dm_crtc and dm_crtc=
_state")
>=20
> has these problem(s):
>=20
>   - Subject does not match target commit subject
>     Just use
>         git log -1 --format=3D'Fixes: %h ("%s")'
