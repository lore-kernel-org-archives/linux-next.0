Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE27632AABF;
	Tue, 10 Mar 2026 23:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773184674; cv=none; b=f/GMfZCbfM4pDXpZzOxamLvw0BHNck4TOTARh6hj6VRBaSy5YA1TsMGwdkOw5bGJkIUGkhu6SmnTjXiNXrfesIpRLsWo7ISiqESEL8RZ1XMHO8K0BHBiRqViFqeIDcg6N3nHdz9lY0xkndSsflR9N2i2HXspVgOwHRt5nmllw0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773184674; c=relaxed/simple;
	bh=JaE3E4pgIrlAA7S2/p+E6toUdWSX9uZdtL8elsYJMlw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uCQnUdUWXrN1nRv0Yw5JVn/vPsczsOdDKlBetuCQQfgqTgQqOeVI3CetVIGQyL+U6jM5NMq9pYBYfkW7FucgFfCELf9+VpT6VNItUbBvEdNrtUIXhRwofPopX6wazc5PVlR7xjm3VHDYjK0nyQgny1dUrCJIQVc6xoMIxK+een0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=POsFWxFF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="POsFWxFF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8894FC19423;
	Tue, 10 Mar 2026 23:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773184673;
	bh=JaE3E4pgIrlAA7S2/p+E6toUdWSX9uZdtL8elsYJMlw=;
	h=Date:From:To:Cc:Subject:From;
	b=POsFWxFFYMF9rhuhNbKlfHkjoSjANuRQ6qvfWWvtSJzXzrsUgao8nL/uFqI+qH5IE
	 bn4L6jnxcQ3APw4IrPTvPduXVhRt58OOJjlHRf230HDDxU5PcYgofQkW/Hi7nsVzgN
	 5RRdXyKvvPAZHTZe1qssPxaeH1v0WqGaUXLOfsa35EZG8QAokedHLFADmeY7Kfhqmo
	 VrpVb6N9QxFlO9lSLoEHrJgIPG1vmkJYmBxODIQvdYSvsNDgTJgM2CX07rGUsQt0ES
	 fuDbX454BIXof6+yC2ehQOAbud0/oD4Euf5KJ8xlK+GXC3doxz1Rc+IOVKtwAl3nzg
	 a4B+dgtQGKONQ==
Date: Tue, 10 Mar 2026 16:17:52 -0700
From: Drew Fustini <fustini@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Subject: Add tenstorrent clk to linux-next
Message-ID: <abCmoGc4DiVE4KpK@x1>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mark,

I have setup clk branches in the Tenstorrent repo on kernel.org as we
will now maintain drivers for the clock controllers in our new Atlantis
SoC. Please add them to linux-next:

tenstorrent-clk https://git.kernel.org/pub/scm/linux/kernel/git/tenstorrent/linux.git#tenstorrent-clk-for-next
tenstorrent-clk-fixes https://git.kernel.org/pub/scm/linux/kernel/git/tenstorrent/linux.git#tenstorrent-clk-fixes

Also, please update the existing tenstorrent-dt entries to use the
kernel.org repo instead of github:

tenstorrent-dt https://git.kernel.org/pub/scm/linux/kernel/git/tenstorrent/linux.git#tenstorrent-dt-for-next
tenstorrent-dt-fixes https://git.kernel.org/pub/scm/linux/kernel/git/tenstorrent/linux.git#tenstorrent-dt-fixes

Thanks,
Drew
