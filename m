Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC1F39A068;
	Fri, 13 Mar 2026 13:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773410244; cv=none; b=AANlI5jzWN+6oF3eSKFxXEFw0j8vtMYsG7ydsZnD56OfNWEwBaqEv/K1kWyVFaowbCqphmjblBt7ES3kOtcdRi2ec1B1PCBkAMsvIYlQdq1Nyv+mIEu4wGuQzgamVU137Lcn2uNtpZn0WzyedxseC7g2PDktFoGM7p5AxpF71EU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773410244; c=relaxed/simple;
	bh=mlxxgB0/nl07W9Teep0CZE12L+OVZZ+OqVvMnbFOLAY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=mNH5gUB3wyqpav66+zYF1U/kdTcESiDvjwniLERzyJZEr8bHAD67c21N+kazPZTz7sw3qQMLBj53BNmoAXPziKRTP0XkF/N9SQ2vk0Z5cfdDpg5kcX8DDjZ4cYG7MTpn/NTwm0QEIwfPOk3Je5ewTDSs+8o+/CXN4al9sjyDQGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h7frUmB+; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h7frUmB+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773410240; x=1804946240;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=mlxxgB0/nl07W9Teep0CZE12L+OVZZ+OqVvMnbFOLAY=;
  b=h7frUmB+1ONtw2tFCRp6VMvzJEJdZy96v4cB1mO6ZHE8JuubDICrmp3y
   qAG1zc/9RAmA2YIpSzrfld2yjM3qcrUEvFrlKxpaMeNoH6CKoItvCFiYa
   uLRKyJdKlJgnCyeVPDmzNp9ocGAQwjo9Qw2nBMrwYSa7/JZw6SO8qFMlS
   e9MelxoDuuSjsNF4m43f8k2ACSpk/Wc4XrfjwzAOxMWFMLa54mGS1jWJy
   gKhbLhdMgumnY9vCRWXeux3J7CehpWA1eKiSmG0k7cd/srL+w8HjwWzOr
   +ZhOcE/FjIGbfSYZYJeh7ksJnfX1qH1Fp6pqzPc4h5ayWIdRlyIlMF4Mg
   Q==;
X-CSE-ConnectionGUID: qAU2EaDoT/qqM2nIdZHjEQ==
X-CSE-MsgGUID: F9aCgHUpQQWtW0H1bD93Kw==
X-IronPort-AV: E=McAfee;i="6800,10657,11728"; a="74432446"
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; 
   d="scan'208";a="74432446"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2026 06:57:19 -0700
X-CSE-ConnectionGUID: Py6LgrhhSe2rm2lZlgpRcQ==
X-CSE-MsgGUID: LtyocnFXT/aQWxI2O+wgKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; 
   d="scan'208";a="221228371"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.193])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2026 06:57:16 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, "Souza, Jose" <jose.souza@intel.com>
Cc: "broonie@kernel.org" <broonie@kernel.org>, "linux-next@vger.kernel.org"
 <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the drm-xe tree
In-Reply-To: <7df1c2dd-1e62-4cc6-9fb8-9f4ac160077f@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <abFpM1FHgzgARB88@sirena.org.uk>
 <ae413dfe2aa2d18c0b4c44d4bdb15bb630db177d.camel@intel.com>
 <abGv-5kXSCtOTO8M@intel.com>
 <8ec7f38d87fd49a4c81a228b87b1ad244c9b9df8.camel@intel.com>
 <abHMaBe4Wo_PH4uR@intel.com>
 <7df1c2dd-1e62-4cc6-9fb8-9f4ac160077f@intel.com>
Date: Fri, 13 Mar 2026 15:57:12 +0200
Message-ID: <690dbd675c4b704844decd077a424de68099dee5@intel.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, 12 Mar 2026, Lionel Landwerlin <lionel.g.landwerlin@intel.com> wrote:
> Is there no process to deal with kind of merge issues quickly?

For us the main part of the process is: If the patch doesn't build after
applying, talk to the maintainers to get the merges and backmerges going
*before* pushing, *not* after.

Similar to linux-next, drm-tip is the early signal there's a
conflict. If you develop on top of drm-tip, you'll find out about the
conflicts when applying to the individual branches.

I'll try to get a drm-intel-next pull request going today, or Monday at
the latest. Lots of changelog to write. Then it's drm-intel-next ->
drm-next -> drm-xe-next merges/backmerges that need to happen.


BR,
Jani.


-- 
Jani Nikula, Intel
