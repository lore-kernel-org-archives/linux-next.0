Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F11E36EAB0;
	Wed,  6 May 2026 07:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778052416; cv=none; b=tMMw9mn1Fs5C90ri1wJsBbw/xV0VqZsjoPUT8N3Wt4QPbkmhWowgRNY+zOBwe1jJp/QVS6ILyNJzuI3Ax/oZaeVgDIH4Xtw8RNZeGAH6jBZyfrOtl+GzOXJTh1qFibMhXmIjQqBw8PPYOz3Xquad6oJbvHoV6KhHFx1fNwWn9J4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778052416; c=relaxed/simple;
	bh=c90qRcrWJa2kPY+mLGisEAdcGELxI/o5J+wl6KZwAJQ=;
	h=Date:Message-ID:From:To:Cc:Cc:Subject; b=j/FIyJWau2EUyhYiSTsYYNTMp4c8oivbDt2uNpAJ+17JaogabeJGr+yXUhNxtDQkE+ao1i3KWRjghw0Dk/d/D+JOWFxpcVFv5Cxk/Iv+snpTBIpyp/6pbuLCfEuD8OHmbaE7GntsiQy+hv0DaH+9lwRDrqWBZ7gVrWRtV/kO4rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OgPKw3sZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OgPKw3sZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68830C2BCB8;
	Wed,  6 May 2026 07:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778052415;
	bh=c90qRcrWJa2kPY+mLGisEAdcGELxI/o5J+wl6KZwAJQ=;
	h=Date:From:To:Cc:Cc:Subject:From;
	b=OgPKw3sZs+G7KAsgvZCiO1FcgG6FjA7uxAzdWN94sDzWFBr2xLXIEd6EU03iwsQJs
	 LWDETnJSjmJbarnpBUZSA9xvGANIr7OcOk8nU7J1uonEu3QdlHu4M9DKnR86efjxAR
	 /TnBviUEcH+NVCHpITb+0uesdDu3ElI2+4TwZJo+s33Eo2hlLN1MJ9FAReyo7KTn/o
	 txfyXuUw2SPi6CQfK2YkxjPp5eoBWdUne4atrL2d5Bj0+7RuIfQsdh/ffE30Knu8Xh
	 sxfEZsAtXUJOSJcC080Bx/neIxaon3fcwCU363tZtCjACrqW1YfizEKAZucHZ0P0yb
	 G+Gaw3TYkKgVw==
Date: Wed, 06 May 2026 09:26:53 +0200
Message-ID: <4850650ee094d1a038fb3e8299ef823f@kernel.org>
From: Thierry Reding <thierry.reding@kernel.org>
To: Yury Norov <yury.norov@gmail.com>
Cc: linux-kernel@vger.kernel.org
Cc: linux-next@vger.kernel.org
Subject: Missing signoff in the bitmap tree
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>

Commit

  403750662dab ("bitops: use correct parameter names in kernel-doc")

is missing a Signed-off-by from its committer
