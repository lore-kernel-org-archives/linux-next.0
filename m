Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C493B0AEC;
	Thu, 19 Mar 2026 09:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773910808; cv=none; b=KPnMlC+1S1I/zIwOEeRcycA9t1o6zrBB4mIrXPIl6yczxq+uMvSpwC62UtYgwMlnS/U7xp7v7uOqP5lTxLsUMNy7sKLJC1rnLEx8ggRyc+5yfU1eTZkoMZUTN9trxus1l3XBvjfGNYz77CBB/Ln0hyh7vdbdrOTNorTb2sW9CIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773910808; c=relaxed/simple;
	bh=JuxhHaz7GQ22RMedG6MqcLn0DOuj38mIzzkUMhUvHzE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=QE9yUQ2y91ewJohw/QIgUkSVKbfTjmnffca2FU1fzuB9f+yz36wlkB/lNJQ8JcgIH71E28I5aTjPR0DRSGcOhuKua5risQlY0biHyj9Hd53xVm4jGM4OBFoqZgZfzEQayyNhdHNUCcWJEhTZKnfG4dzsBlFJkqLlB0B5YI9aEwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WpMKqhH8; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WpMKqhH8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773910806; x=1805446806;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=JuxhHaz7GQ22RMedG6MqcLn0DOuj38mIzzkUMhUvHzE=;
  b=WpMKqhH8UicJzPVaqWPKGFY+DwgV1o2xV/OX+/u3AKyKvm9t9HwGHL83
   lCnof7Z2f6QlsNn/vbiPx2KKk3iV8c0aarJw/FiP45DhfWzDgTcfJay9T
   RZ0GPOwQs99Nc6ttesRfWGc3l1Y+AsIu7+edsZ5HmjogpR/EcioSmDyyY
   fzXiy3OBgGORRYJujNDmXdtTz9L/L+EyHO9yzbEj/o48j6aBfFUk/DDLw
   xpmVwDlBSz4nInwl9r9bH5wa8XwlZG0q/hXMzeF/oinSq7Y+SNsRE8vcl
   0u/rhAVO07g1vJbbYExpERgeo5ODGRCvupa5j8i/taXnpFul3hh9sf7su
   Q==;
X-CSE-ConnectionGUID: DV8MZtODRjSKHy3mNzW+DQ==
X-CSE-MsgGUID: gFxFPuGHTBqy7+VYxfTL+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="97588053"
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="97588053"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 02:00:06 -0700
X-CSE-ConnectionGUID: I8psD86PTdaCgq6Zv2WFRA==
X-CSE-MsgGUID: v4+P+g0pQBaplf1vPqTX/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="222141303"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.118])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 02:00:03 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Mark Brown <broonie@kernel.org>, Matthew Brost <matthew.brost@intel.com>
Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, "Souza, Jose" <jose.souza@intel.com>,
 "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the drm-xe tree
In-Reply-To: <96b58b8e02d4f850c3611f74e3c5112d546eff1b@intel.com>
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
 <96b58b8e02d4f850c3611f74e3c5112d546eff1b@intel.com>
Date: Thu, 19 Mar 2026 11:00:00 +0200
Message-ID: <a8ec7a15f4f6238ff9de6034957998f5bc3d1b0c@intel.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, 19 Mar 2026, Jani Nikula <jani.nikula@intel.com> wrote:
> On Mon, 16 Mar 2026, Mark Brown <broonie@kernel.org> wrote:
>> On Fri, Mar 13, 2026 at 03:57:12PM +0200, Jani Nikula wrote:
>>> On Thu, 12 Mar 2026, Lionel Landwerlin <lionel.g.landwerlin@intel.com> wrote:
>>> > Is there no process to deal with kind of merge issues quickly?
>>
>>> For us the main part of the process is: If the patch doesn't build after
>>> applying, talk to the maintainers to get the merges and backmerges going
>>> *before* pushing, *not* after.
>>
>>> Similar to linux-next, drm-tip is the early signal there's a
>>> conflict. If you develop on top of drm-tip, you'll find out about the
>>> conflicts when applying to the individual branches.
>>
>>> I'll try to get a drm-intel-next pull request going today, or Monday at
>>> the latest. Lots of changelog to write. Then it's drm-intel-next ->
>>> drm-next -> drm-xe-next merges/backmerges that need to happen.
>>
>> Any news on this?  We now have issues with the main drm tree interacting
>> with drm-intel due to this change.
>
> Matthew, please do the drm-intel -> drm-xe-next backmerge, and ensure
> the merge commit builds.

Argh, obviously drm-next -> drm-xe-next, *not* cross-merges between
Intel trees. *facepalm*.


-- 
Jani Nikula, Intel
