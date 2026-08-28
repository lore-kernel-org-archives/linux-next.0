Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42CED3E0C7A
	for <linux-next@vger.kernel.org>; Fri, 28 Aug 2026 08:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787905676; cv=none; b=W/oF/QGK5Aqvty8QPxqdrLCZs7POpH1fj5zJi84WL9dQhSZWEt4LBlo6C5GJ9adGTIskfhDrdYzF34OI1mINxbg39Zhdry8BpccGDQ9k0NiNKZKK8ZnwMNvt0JAHsm7mB8o133deJriVcfg+6Qtc5YTrL4/uNSx4HmAiYGA7yrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787905676; c=relaxed/simple;
	bh=Cb9iWXYgVgyVrQtOb7PJzLbHwVuGyNuQYUoQ7RY61zg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qHLZ35/Y38fBHufGtB+Xo0A+BT7USh9UVNBfVSRxxpgwE5dRLd5PHeAbzrbAJynOFmcQb+E2yLUfx+YXhzxsEnv6beWILC7+WR/z/dOK0j2NkQqx3CbqHS41Xva7pWrUiUWub6nrX6EF8Md6ZWcxCqImzLAugD1ovcKrHCsozUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=r/lJPzNR; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="r/lJPzNR"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Content-Type:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=0N/Ra7UG1QaBCzS8uutEWS7vePI6fiWjk3d3AItFiQ4=; b=r/lJPzNR7LRhK2v3CTgGshZVaV
	2PUgw32Dn70zReX8WHh8VG/xr3wPq1hTj87ZFHENIqDOXjHbrlAwuNK84oDWbt/a4N44qz5nWX1Q2
	+t+tc0ZrLOaeMgs+lPF7hbv+5qUFXQCopci9cRkJzXnutu6o5RtciECQ7k8MqPtVUPM1V4JfCuQzP
	QVyU1PCXYPzsI5TuwIAdI2+emD6MlPHehRXIMR+2myhi5oFr5eVZ4h5+6AaIxBLozwVg+Pcdy+D/Q
	E0gAW5eZl+PiI7GaYYwtt7vpyagIhQN7NPT3gz9trCN9entEGRwSnlilEYuH3Tzeb4n9xinn8dbUx
	sbCr/lrg==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wzrwA-00Gdui-0z;
	Fri, 28 Aug 2026 08:27:46 +0000
Date: Fri, 28 Aug 2026 01:27:41 -0700
From: Breno Leitao <leitao@debian.org>
To: broonie@kernel.org
Cc: linux-next@vger.kernel.org, thierry.reding@kernel.org
Subject: linux-next: add configfs-next tree in the merge
Message-ID: <apFFi-I3gJWvxeHk@gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Debian-User: leitao

Hello Mark,

I've recently become the maintainer for configfs, and now have my own
tree, which I would like to see included in linux-next.

The MAINTAINERS file already has it:

	T:      https://git.kernel.org/pub/scm/linux/kernel/git/leitao/linux.git configfs-next

Is this enough, or do I need to take any additional steps to get this
tree merged into linux-next?

Thanks
--breno
