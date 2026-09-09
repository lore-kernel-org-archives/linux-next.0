Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4406564A91
	for <linux-next@vger.kernel.org>; Wed,  9 Sep 2026 00:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788912936; cv=none; b=LrXNqX6qDH3nOLSxmOTSLssgASuX7TdpjH7wdjNvkjxzUmUMMnSaIuaMsjrPQDcPE757iAXmUW14eB3uRGb2oeo9brc09AFGfVhYuiPqK9Cmop4+SUt4eybely1uwIL/1pOOMCb0A1h0nSDs8mqqkokzeSREusGPB6CEze53pyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788912936; c=relaxed/simple;
	bh=5GGf5nih+zX2QTe4GbTq95IH1aDahic9tLtOTfzEWgo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i5bXrgnmDkfKzwc0qWRDfQFE6+69tXSWEXhuUG/AutZH7bM5WZYDOKLp5og1smUXM8+3LZL7PJu8OCjJr6VSO34cYk1rnSyB34zlhUV9YRT6QYWnhDXqWxLXx2KAb66y1BlW2H6GtEW+2evk19D1U+QdqKT6HOppvrEKWEadXCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DQTNducN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DQTNducN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7605C1F00A3A;
	Wed,  9 Sep 2026 00:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788912935;
	bh=5UdAMu3dV1bqUvZS8yekF2QPAFMMwh+kJxL4hr69g28=;
	h=Date:From:To:Cc:Subject;
	b=DQTNducNf6MJC3DxbpOIhHcksSMz7ZUAx6DnM26fDhPBIRrQw1fP8b/XAt35EBTiM
	 4AXXtuM2bdHLXiKng9i5XCfjAa8sjDK68OhD2I5Eq8B57rUe5j6Qu0Wj4FVA9vW5l/
	 GxIz0jGvtiiFPnZri6FqkgRwZzibocQQoIA/3byeSUN/L/WfLJwXdI8MiwWEZy+/04
	 ye1WR+AICpaowK1I2iHwdvCjeirCYMFgToLjng57mZd6Ckq2I1WJ1pgoAvPDGDyRYO
	 hH3eXCWLgqq9G1un/1+KeaCV6OiSlAq2TwUhpCFrXyxsPO3tYXUjo+vZ/BdWBNi196
	 mnkFaKudk+Fhw==
Date: Tue, 8 Sep 2026 17:15:31 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: linux-next@vger.kernel.org
Subject: Adjusting clang-fixes branches
Message-ID: <20260909001531.GA3539957@ax162>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mark,

Could you please update the clang-fixes trees to use

  https://git.kernel.org/pub/scm/linux/kernel/git/nathan/linux.git clang-fixes-for-current

for pending fixes and

  https://git.kernel.org/pub/scm/linux/kernel/git/nathan/linux.git clang-fixes-for-next

for patches destined for the next merge window? Thanks!

-- 
Cheers,
Nathan
