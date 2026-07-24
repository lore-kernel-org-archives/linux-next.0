Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9A23CF054
	for <linux-next@vger.kernel.org>; Fri, 24 Jul 2026 19:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784922494; cv=none; b=G/dDnrS6wUzsag37mrGht6Va7sMTFxOutkShHdBhjN5f686A/ToacEXL57Tr9vYfSZXBrsHgsBMV0Lr4e1w6qZPiUr3rNUXKcnkOrkTowId2mIcHYsZR3w/T100qBqwACAS3x0T/fnC8HFedpnc+IPoMpZ2+uopHfMdYUJrcrvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784922494; c=relaxed/simple;
	bh=xHOXkpB1zVEKuIPVKOMxEffu5MeBgKdYHYGoI5w4Wms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kdVglZZr8U9yj/PsYMnED5SVb0xeeV+vwrFlky40Yd1Q8/CslXvObgc+5GQFdZ0b2+F1d44Le9etHfRny+/O4TKcilhmEjlLa/djn6EwyN7m05lSQorp5+fTSC1LLEFTHJmF3zeBhYe942R+au7+1Aam/kQVfcx3EpkxeQrMjH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R2cQLEyj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R2cQLEyj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D674C1F000E9;
	Fri, 24 Jul 2026 19:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784922492;
	bh=Xgjdyft+OKEQ3BRd9E0FjAMVZAURtSGF812mlpI1u9c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=R2cQLEyjYgkITQsGt3xdflVXjKM9Iw/P93FdIIIxmAFUqAHguKarCA5nNrGmuXoCh
	 4DiRfri1DhiNxQRD4DPyFdliKOh7txhvdhS5E+qtqNoptkOS0j576wp3on/rZzqmcI
	 tQ5NK6HLEWIq1i4hFWptquEL5naCcFmidLluFwNqY6+T/eUcaDTPqm0eig1vR1Tl2c
	 w2E6gT8RxUCd3jM73dkoxQDzOsYzVK7VhsBNqFcseOqEuZX9c0R72k0E62vXHwe4NE
	 i5qhweEGNqohCGQ38C9E5t56kgtI3dr4MmEnjEtdmjL5W7ami4DdlPTwuXHWnZklNY
	 Y2ft3xnrmDDOw==
Date: Fri, 24 Jul 2026 12:48:08 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Matthew Brost <matthew.brost@intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Usama Arif <usama.arif@linux.dev>, linux-mm@kvack.org,
	dri-devel@lists.freedesktop.org, linux-next@vger.kernel.org
Subject: Re: Semantic conflict between 04b177544a04 in drm-misc-fixes and
 0b6b1bb28482 in -mm
Message-ID: <20260724194808.GA1461047@ax162>
References: <20260722225605.GA1910198@ax162>
 <amFPJc1NQbuYWlSp@gsse-cloud1.jf.intel.com>
 <20260723212724.GA999236@ax162>
 <20260723160942.b58b065d771401aba117bc77@linux-foundation.org>
 <amKftG6NRZy0Ii2/@gsse-cloud1.jf.intel.com>
 <93289e91-ef9f-4786-bf49-e93d91afc1ad@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <93289e91-ef9f-4786-bf49-e93d91afc1ad@sirena.org.uk>

On Fri, Jul 24, 2026 at 01:13:42AM +0100, Mark Brown wrote:
> On Thu, Jul 23, 2026 at 04:11:48PM -0700, Matthew Brost wrote:
> > On Thu, Jul 23, 2026 at 04:09:42PM -0700, Andrew Morton wrote:
> 
> > > I'm fine the drm people changing things ;)
> 
> > I'll jump make a DRM change so this is all worked out when it gets to
> > Linus.
> 
> So should I drop Nathan's fixup then?

As you may or may not have seen yet, the drm commit has been reverted in
the drm-misc-fixes branch, so my change should no longer apply.

-- 
Cheers,
Nathan
