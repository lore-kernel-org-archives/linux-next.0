Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E83D34104B;
	Tue, 17 Mar 2026 09:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773738013; cv=none; b=gTtJiUOm2FmS62pE1a9bDWWfxYK2jzFSCRjPDAkNek+6WDrRq84QfmBQUBpWwK9rYIjjs52nWj9MsZtD6a2MpfOGLjK8B0HNRA7QJxVLcAKg9hbqbMsflEsuRrFtTs3hpet1HhrG2lkRX6wTA77X2HijXgvdUJB0866e2h5aCQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773738013; c=relaxed/simple;
	bh=bVbMadnnMyfKG/7TEsblf9Dge4ig7t6X4Lm9Om8SJL4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=TxcFjQeuaXNy289jNYC+/9luOWUUMemUoemGrSHrS8DHXy/nx37DMjCbyzOQ2MAqF+xDsKTww5kQtqQq+BRE/MJy/nH/bmnHAPJ9T7A2H2bH56LUvbOlpwfTEP8M1P5Cf4sAszjioa1fkpnYDczz3P94A3df5W+FD4J5QGkXkKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ba2w3KAw; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ba2w3KAw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773738012; x=1805274012;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=bVbMadnnMyfKG/7TEsblf9Dge4ig7t6X4Lm9Om8SJL4=;
  b=ba2w3KAwGvcWA/OUt7Uf5XRu0obiVlUOKOGsXXjEgIcEQH8Z2fE1TSrt
   MTV+xJ6JNx97lPy/4CMnXzKYdmnm0ApbjfoYtwvl6+3XT9woM6OffHr32
   J33jJTZbzQCf+Tzttvde2T0WgPZB0/58KhQE8bf8ZUPDTBXIoBS8Vyf85
   ld+bVPxTf9wXAl1OlEf1+t2OGT4ZADQPsipfEU2KGD8thaBGD7PT/eoxv
   YQAmYTBQEwlFbsClEnx5utLhRxHzL9zn9inqCs8DfWO3pN5/gNCszUn1k
   piX4Z5rEWthXKKbvawDDu4VaygtXoJ8YAQUW5lGfVl71ZJJ5ObTCHVxzD
   w==;
X-CSE-ConnectionGUID: lbc/yvzRSQ6ENhY8TJtYlA==
X-CSE-MsgGUID: dRk6hxIXRpq0tyFt+7etRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="74652985"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="74652985"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 02:00:12 -0700
X-CSE-ConnectionGUID: ExA7lnRtRMmzYBYpc1rwEg==
X-CSE-MsgGUID: COZv2xRRS8OgN389NvNenw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="226879168"
Received: from krybak-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.32])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 02:00:08 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Mark Brown <broonie@kernel.org>, Simona Vetter <simona.vetter@ffwll.ch>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, =?utf-8?Q?Jo?=
 =?utf-8?Q?s=C3=A9?= Roberto
 de Souza <jose.souza@intel.com>, Lionel Landwerlin
 <lionel.g.landwerlin@intel.com>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the drm-intel tree
In-Reply-To: <abg6u6o_Pjxkvi0A@sirena.org.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <abg6u6o_Pjxkvi0A@sirena.org.uk>
Date: Tue, 17 Mar 2026 11:00:05 +0200
Message-ID: <b11ec646ffb147524dcf48dfc8540475b93054e3@intel.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, 16 Mar 2026, Mark Brown <broonie@kernel.org> wrote:
> Hi all,
>
> After merging the drm-intel tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> /tmp/next/build/drivers/gpu/drm/xe/xe_lrc.c: In function 'xe_lrc_ctx_init':
> /tmp/next/build/drivers/gpu/drm/xe/xe_lrc.c:1554:43: error: implicit declaration of function '_MASKED_BIT_ENABLE'; did you mean 'REG_MASKED_FIELD_ENABLE'? [-Wimplicit-function-declaration]
>  1554 |                 state_cache_perf_fix[2] = _MASKED_BIT_ENABLE(DISABLE_STATE_CACHE_PERF_FIX);
>       |                                           ^~~~~~~~~~~~~~~~~~
>       |                                           REG_MASKED_FIELD_ENABLE
>
> This is caused by an interaction with:
>
>    0e07b16371b6e (drm/xe: Allow per queue programming of COMMON_SLICE_CHICKEN3 bit13)
>
> from the drm tree and is obviously related to:
>
>    https://lore.kernel.org/r/abFpM1FHgzgARB88@sirena.org.uk
>
> This has been broken for almost a week now and just keeps getting worse.

Will be fixed real soon now. Sorry for the delay.

BR,
Jani.

-- 
Jani Nikula, Intel
