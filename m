Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591FC3AE701;
	Thu, 19 Mar 2026 08:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773910756; cv=none; b=qFzt6oONiU26u9Mr66/SmM4My7/q7S4o1/JEubwfBYbbGdCk+n31rU5SYgomXCP2PA31T8RWA8GZjnl7YcR5IFaIL/NOt+9l1A/vpwmxGC6dhtOQE7s0HkLRnumq9QsRmpgJurDzEKZ11djh5ogonWxYmgDz3gaFItSk/CFbD04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773910756; c=relaxed/simple;
	bh=v+jwSRRrP8GMG4Ipw17k7w4xQt5EsXeKnCIqOhygl7Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=JyE1X2tN9NIsDmC4G/DLfdkFwFnEQPx1GZze2kQ3XyXp2MiDXyYCOMBO9Vmfy32FMDGW1s0qtvu46yqD0wfNb0npTGCWBsdvDcl6Vz4C2qOBPoVp36pwZeKnFM4oORcsC5SFP6t6o2+k/dkbGbVt8AyQtP+aW24Pk9eIaQIcWPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XGhIqNW9; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XGhIqNW9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773910754; x=1805446754;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=v+jwSRRrP8GMG4Ipw17k7w4xQt5EsXeKnCIqOhygl7Q=;
  b=XGhIqNW97yejLwIw1p+p/Q8M3pPwi6znZKbxQeuhAXKquqN1CZMlJaf4
   AXsX9vKr9Hwa0POGDq8wKQkRKOgQAD6SkVqziN/4KX+BEgvn7vBTAuNoz
   JrUN6Ky3tgsCs7HBtUrmFcuyLtP43yaFdIax9ZiQ0uLZqv7WYXJY1HwI/
   uu7nf6mF442ghm6/hmTzwb8k/UnJ3sEvJvR6HytCrm9njyQnEw/Ecog/W
   6cFAfGcToD0Ooe+KeoB2uBUM4wH9UA68/gCmFxxXo5uwWt2JAomAGQGpd
   3/m9h5XejTt5TkMKnwCR5RVgsNd3o3lFmwhTi6vAgrh8dQKRjFeipLkZo
   A==;
X-CSE-ConnectionGUID: 9VsoY3N3RTeCBqdCD21erQ==
X-CSE-MsgGUID: bGXO17AjTcCUTTrQz0z+lA==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="77584335"
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="77584335"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 01:59:13 -0700
X-CSE-ConnectionGUID: 6AV2+o79Tj+Ekgfx/Gvrtg==
X-CSE-MsgGUID: aOp39+tOQ7GsU+emm9aTbQ==
X-ExtLoop1: 1
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.118])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 01:59:11 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Mark Brown <broonie@kernel.org>, Matthew Brost <matthew.brost@intel.com>
Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, "Souza, Jose" <jose.souza@intel.com>,
 "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the drm-xe tree
In-Reply-To: <0f8cfe1e-f444-49fa-b7c8-151cfa7c606c@sirena.org.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <abFpM1FHgzgARB88@sirena.org.uk>
 <ae413dfe2aa2d18c0b4c44d4bdb15bb630db177d.camel@intel.com>
 <abGv-5kXSCtOTO8M@intel.com>
 <8ec7f38d87fd49a4c81a228b87b1ad244c9b9df8.camel@intel.com>
 <abHMaBe4Wo_PH4uR@intel.com>
 <7df1c2dd-1e62-4cc6-9fb8-9f4ac160077f@intel.com>
 <690dbd675c4b704844decd077a424de68099dee5@intel.com>
 <0f8cfe1e-f444-49fa-b7c8-151cfa7c606c@sirena.org.uk>
Date: Thu, 19 Mar 2026 10:59:08 +0200
Message-ID: <96b58b8e02d4f850c3611f74e3c5112d546eff1b@intel.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, 16 Mar 2026, Mark Brown <broonie@kernel.org> wrote:
> On Fri, Mar 13, 2026 at 03:57:12PM +0200, Jani Nikula wrote:
>> On Thu, 12 Mar 2026, Lionel Landwerlin <lionel.g.landwerlin@intel.com> wrote:
>> > Is there no process to deal with kind of merge issues quickly?
>
>> For us the main part of the process is: If the patch doesn't build after
>> applying, talk to the maintainers to get the merges and backmerges going
>> *before* pushing, *not* after.
>
>> Similar to linux-next, drm-tip is the early signal there's a
>> conflict. If you develop on top of drm-tip, you'll find out about the
>> conflicts when applying to the individual branches.
>
>> I'll try to get a drm-intel-next pull request going today, or Monday at
>> the latest. Lots of changelog to write. Then it's drm-intel-next ->
>> drm-next -> drm-xe-next merges/backmerges that need to happen.
>
> Any news on this?  We now have issues with the main drm tree interacting
> with drm-intel due to this change.

Matthew, please do the drm-intel -> drm-xe-next backmerge, and ensure
the merge commit builds.

BR,
Jani.


-- 
Jani Nikula, Intel
