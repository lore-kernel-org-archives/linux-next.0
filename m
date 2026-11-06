Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793963309;
	b=Rdvd8Dp8KXxHqbdm8L0axp8q8mMYy9Dvkh21wpQHtL7tiaQ4/an8GptUwxEA47BHqKf4
	 VptLR+NEzVcoqDiGBn7OZYwUiUzzlPRE/Dgm9UlvhvZszssaUk1/uf6pdOrGXBQsLMlfj
	 kDDrSO+KVEXPXMhHkuO2q2XafogAr7PjB0AMrg/eeRgB3lb4JmVQkzD+XoQJZ/gZ1z5XD
	 wJKSsgDi2QRbu3M2Q813UyKNKbt1uHP7zp4D8M0TwtVisVM+2KC/6v8H9VFeakvQUvDZt
	 HEEUCh1g1OcQyWIkfNekzZZXv0Dis86zAv9I/P4UDTKb3bInEvl+iBAHF/X7OmjQ0xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793963309;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 In-Reply-To:Organization:References:Date:Message-ID:MIME-Version:
	 Content-Type;
	bh=Pr7OTQ8YVdyap6aTpvwLGAeWfMQpMgri0V2rSwxuERw=;
	b=1oeazr+6SvjPET+tVc/y1RawKo7+eKX7976f6YrU4JbSft0RuGwixb8qg7YN0dJaIGQm
	 vnVCwNfJlSC90OlC2HOBPuzsanntcUeQEwv9ZhyWMr+jOqfmNht5ptkHR5F2BBe2L8+jq
	 t2OTvPfTc5x5i9Pjfs1nUylBN/hSmBaunbJpsOSwweF6/VhbztJR7tsULn3c9xNlBI/XR
	 j1nT9eNMVAcWNDM6GOlJkcFyu/MBtIB17BzwfJJKC3f/R5SYLpyJzbgmVO9Ui6fEU4gD7
	 MqGELBFbCHV9WfNVpUQ9axMg8zBOCPt4QBb8YmsxVPmB86oy1iWmjHE1Ha4T7D8iydA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="QX/PbVke";
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D6A606A329
	for <linux-next@vger.kernel.org>; Fri,  6 Nov 2026 11:08:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26D6A606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QX/PbVke
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793963307; x=1825499307;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=MYpRdIgz4VF5KaXErgd4feHkN9DzPg6BAG+Vr/5aYsA=;
  b=QX/PbVketNS3lFZfCm8t5qfPkDiFNK/WZNBA+IYpjP1hM2C+DAtPfIhP
   FMp+IDHuMsQpAGHL36D4ky4JVfBKfyRc1Ir5h5c7DIMfG2l8rDrnSWdy6
   aZtp0ynRP5svTnKMEO6/8Mm3lbUwy5bwTMCpZHA4pVlzEMr0ZYrZbv6i/
   VXaENZM5VdihR/OgGoqR/LmoX5WLQx0QYoJxRWiREd+WvfATpsUiJ+Rli
   Eo0uKES0bvPZqKk00ms6XChyTGHYd+MeZDrWIoOBdXtTeeU6dPPGZNUKK
   dPaI9Q68TfxgeIAlMUYJ2M1Puf6lKTITywocK43A16j+tc4MCEb3XgZX4
   g==;
X-CSE-ConnectionGUID: 819FpHuxTBuz9yqjL344SQ==
X-CSE-MsgGUID: lbrR1HNLQGe3bNDeSMSkXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2775604"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2775604"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 03:08:27 -0800
X-CSE-ConnectionGUID: oD0vyB4QSDO3/qT7UX6MpQ==
X-CSE-MsgGUID: ZI27fi6ORt6NHSDT2fbVcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7677534"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.101])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 03:08:22 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Dave Airlie <airlied@gmail.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexdeucher@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Matthew Brost <matthew.brost@intel.com>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Alice Ryhl <aliceryhl@google.com>,
 Alex Deucher <alexander.deucher@amd.com>, Christian =?utf-8?Q?K=C3=B6nig?=
 <christian.koenig@amd.com>, dri-devel@lists.freedesktop.org, Mark Brown
 <broonie@kernel.org>, linux-next@vger.kernel.org
Subject: Re: [RFC] linux-next: replace the DRM trees with a single
 drm-for-linux-next
In-Reply-To: <DMNL1MG0A8P4.1VPON40R8BX2U@kernel.org>
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
 <629d19bcd0f61974f3e1c94c90b4052216d2a967@intel.com>
 <DMNL1MG0A8P4.1VPON40R8BX2U@kernel.org>
Date: Fri, 06 Nov 2026 13:08:19 +0200
Message-ID: <3678ff00381a70148d6abafcf20ba3726bff2fc7@intel.com>
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

On Thu, 05 Nov 2026, "Danilo Krummrich" <dakr@kernel.org> wrote:
> On Thu Nov 5, 2026 at 2:44 PM CET, Jani Nikula wrote:
>> The main downside is the delay between merging in a driver tree and
>> hitting linux-next. But we could also decide to mandate more regular
>> pull request to drm-next, maybe weekly, especially for the drivers with
>> more traffic. This will mean lots more pull requests, but it's really
>> not a bad thing to keep them smaller.
>
> I was already concerned about losing up to a week's linux-next exposure with the
> proposed global cutoff at -rc5 [1]. This approach would extend that delay
> throughout the cycle.
>
> Even with weekly PRs, changes could wait up to a week before reaching
> linux-next. They would also only get that exposure after being merged into
> drm-next, whereas I'd like them to receive linux-next testing before that merge.

Fair enough.

> I don't think that such a compromise is acceptable: If a tree breaks linux-next
> it would mean that linux-next is broken until the next PR hits drm-next (and not
> only until it is fixed in the tree causing the issue).

Yeah, this part is really not great.

Throwing around ideas here, thanks for taking the time to debunk.

> I don't want to sound like a broken record (sorry if I already do :), but I
> still think the
>
> 	git merge-base --is-ancestor $remote/$linux_next_fixes $remote/$linux_fixes
>
> switch we already have in dim seems like the best fit. It already does exactly
> what we (and linux-next) need and is accurate: it preserves direct linux-next
> coverage and bases the selection on the actual tree state. And with the proposed
> git request-pull --final option it is very maintainer friendly.
>
> [1] https://lore.kernel.org/all/DMMS9R5JJ4ME.TBIB1TNLB3IP@kernel.org/

At a glance, I think the *feature* sounds good. But I think we're all
just going to forget to add --final.

The reason we have dim in the first place is to make us do stuff the
same way, every time, and not forget stuff. When we screwed up, we
addressed it in dim to not screw up again.

Not everything can be easily automated or enforced. Perhaps you've
noticed dim asks for confirmation when you're trying to push merges or
more than ten patches. Usually it's something committers shouldn't do,
but maintainers occasionally need to.

Anyway, how about just *prompting* "Is this expected to be the final
pull request for the development cycle?", and if yes, update
drm-*-next-fixes while at it, and have the automation handle the rest.

You should be able to do another final PR if something urgent comes up,
and it'll be just fine.

Also, if we are able to make dim more -rc cycle aware, the above could
also start asking the question at -rc3 or -rc4 or so.


BR,
Jani.


-- 
Jani Nikula, Intel
