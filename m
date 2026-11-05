Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793886291;
	b=2DrIX8yndPLUT0MMU63JX32gmaQn7hG77ZP/vr/INW6kiNnYN+aG8z9lyp/sfSUgjwzz
	 Tz73bAuwrYhpQrWsjFgHlP4xbhfBxGIssYKKL1M+C6k7c+cL4PcaNEk5+3zP0TXSGwY4B
	 aJL5Fckvme3rO7p2JX7uyPd3Cf9CmDh7NWma/DFkNY90TwiNtNur9GuqEILU8MlBSqDdy
	 C6w6k7uQhNn4kbwqoxDb86BE4Jppnp2BILOszzRXH1cBjzQcdY04cAlJWWjn1ji61wRa6
	 UrtY9l/92XrJMmn7yQ0xLkBTXA+UQAgzY0l08TjieYvuo79wGz+OnhCa8P76rv6ZiXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793886291;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 In-Reply-To:Organization:References:Date:Message-ID:MIME-Version:
	 Content-Type;
	bh=uqt/4C+qMWUAwJOPjLfvJIwz9vv1LU6urd/V1TYlxS0=;
	b=nYSVUN4Ij+aaWBuBKAx8xhphcA4ZVPmBLTthc3J/yFCrZpmdDtRPI9rLr1TNWvs0+DCH
	 gEvvMyCmd6l0UjhVR/2Qnd36taJFSjpzInHNhgdc+17odqco+PwPL7T39O9n3onLzfBDJ
	 n5wpYlrkggKpmAVt5rHpql2ytSqZdI/B7SFarBI9YoNivXLYVhJeancBKUbTwlL9y8j8h
	 Z2q+cbmuafdK4pinzKP7smYeb+yGs6ZG+/M3cnv/F/CVu7MHW7VXCr15WTG4+PHQov68r
	 VhaYmtnRvTDBktM7VtLWig1YmYikSa0NrOQZgLbP5y/vdY4qAnPEnp+hYSnH4mu0fvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XCah2xIe;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB29606A329
	for <linux-next@vger.kernel.org>; Thu,  5 Nov 2026 13:44:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EB29606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XCah2xIe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793886291; x=1825422291;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=2EB2Dg9WOdkoP7xzdf0SxLTspyBScLvlctZUQAhgbMk=;
  b=XCah2xIes8i5tgqMG4TAg8JCtlF/cs5Y170LeDuZqDIZ1lYFXdGI3i69
   +UqnEtl8DY05P+8vppZiViXd7lUsJZgILj+3bjG4bal3pJI3U5P4JOgGH
   ow4xd/XZ9MLHNiI2rwJPjNdSkdTGrZM6lNfjBYyOhWHOLjPk3qSHFe6rQ
   W/VK3uc7aNR5XPtG0pSWfvravXLceeiI1waf0PoC2Q+w4rJ5ju+/P7pXW
   UYO1Q5FVxp9OYWqysLjNYJi1y9WsarN3qcqyc3klqZ2KTdetiBG4izPQW
   rQh5S93YfiKQOEsCGvTZB50oRnU45dXXkmohI58aozJhWSqhDC1sZpwSB
   A==;
X-CSE-ConnectionGUID: JFmHBaTESn2Qi/4J3y3wzQ==
X-CSE-MsgGUID: xWWnYkz9QM22YciUVQ2ljg==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2711962"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2711962"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 05:44:50 -0800
X-CSE-ConnectionGUID: NSke3uTCToiYRQcrXMCQwQ==
X-CSE-MsgGUID: aKquthEGQzW5M2PoUN3AtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7026531"
Received: from alekseim-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.241])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 05:44:45 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Alex Deucher
 <alexdeucher@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Joonas
 Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Matthew Brost <matthew.brost@intel.com>, Thomas
 =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, Alice Ryhl
 <aliceryhl@google.com>, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, Mark Brown <broonie@kernel.org>,
 linux-next@vger.kernel.org
Subject: Re: [RFC] linux-next: replace the DRM trees with a single
 drm-for-linux-next
In-Reply-To: <CAPM=9tzu6MYQ-Y0iYK=2PLiM5=1BsEN+Q5WnmYh=hkKnLJ4b1Q@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <DMKY979I29AF.BS1DF5YAZMOY@kernel.org>
 <aujikV14tF6K1Xqw@intel.com> <DMKZR0YZV1CX.DWVK9V47GR1J@kernel.org>
 <CAPM=9tww=CJdxzvfUvLwQ6V4uoszg8JrB1XCAcp15upM-xPvSg@mail.gmail.com>
 <DMLTRKUXTL3P.11VRVU1A8ERMG@kernel.org> <aupFKGpAwAiGXN0U@intel.com>
 <DMLVPRO7XF7F.21199FO61MFRD@kernel.org>
 <CADnq5_N-6_T8EnihjoTSqpHGb_mZPogi6z=Ti-7_oue5d07oTw@mail.gmail.com>
 <aupktBCwcN_coHEH@intel.com> <DMLY7GDT8VBO.EE1P01ZX2HPK@kernel.org>
 <auqaZdocMvOIxN1c@intel.com>
 <CAPM=9tzu6MYQ-Y0iYK=2PLiM5=1BsEN+Q5WnmYh=hkKnLJ4b1Q@mail.gmail.com>
Date: Thu, 05 Nov 2026 15:44:41 +0200
Message-ID: <629d19bcd0f61974f3e1c94c90b4052216d2a967@intel.com>
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On Wed, 04 Nov 2026, Dave Airlie <airlied@gmail.com> wrote:
> On Wed, 4 Nov 2026 at 12:37, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
>> This is the part that I disagree most. In my proposal, maintainers need to do
>> absolutely nothing. The freezing is already guaranteed by our rules.
>
> Yes this is the thing I like, while I like maintainers having freedom,
> relying on them to do something manually every release at the same
> time doesn't seem to scale so well.
>
> If we can't have the tool enforce what we send to -next after -rc6
> then it's going to have gaps.

Taking a few steps back for perspective.

We already have a branch that's guaranteed to only have stuff for next,
and never contains anything for "next next".

It's drm-next.

What if we decided to *not* include every driver tree separately in
linux-next? Ditto for fixes. Let's just make drm-for-linux-next be
drm-next + drm-fixes? Our shared rerere should handle the conflicts
there.

The cutoff problem goes away completely.

The main downside is the delay between merging in a driver tree and
hitting linux-next. But we could also decide to mandate more regular
pull request to drm-next, maybe weekly, especially for the drivers with
more traffic. This will mean lots more pull requests, but it's really
not a bad thing to keep them smaller.


BR,
Jani.


-- 
Jani Nikula, Intel
