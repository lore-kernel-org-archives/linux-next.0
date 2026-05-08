Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB613264D2;
	Fri,  8 May 2026 11:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778238798; cv=none; b=Cng12Jk7DsRmSu4kawR9LLj7Js5WVAvrtYAqDKXgtvaS7Rnle9PaWO770XUwTQ2rsyGmogu2sTvPCicySWynw1stbvpB3pst5cW1B5Bf4eK90dMbuLSuswg9oOf9iyu3Eq4Z+nHUJi5TuIPsSLpADDbUrwlxNlttBDAsjfyvyOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778238798; c=relaxed/simple;
	bh=8y/KQMHL0YMTEB5StGQLZ3JDHLJM7PITkIqyLyzaCuI=;
	h=Date:Message-ID:From:To:Cc:Cc:Cc:Subject; b=N4XAXyemhNkS71uNYiYAoHTvOwCnEgKZ8aTAeBC+YgN0GR7x/o3KGmwJ/GuhWumeLkuxx6fy7qXv+W5RCD6si6yExx/bHEosG+Uw5BHbbyOLzbIXJYpwCKie8SU0UHnH4Z+EwVyyui7gxN9a5Wiq88C8lolgLh5AsLzcDiJWzkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tp1HisO1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tp1HisO1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72BEDC2BCB0;
	Fri,  8 May 2026 11:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778238797;
	bh=8y/KQMHL0YMTEB5StGQLZ3JDHLJM7PITkIqyLyzaCuI=;
	h=Date:From:To:Cc:Cc:Cc:Subject:From;
	b=tp1HisO1NcOGn2C7i0wny0xe55mroxm9tvnf9a/Fx8zWeiTGw+/j/S17yMre0tLhI
	 /yshApyarbQ48qAJYRfceBNdjha0IWMM1BaZPhBZMGT6dECOl5n4T5WUUmgAobHIfx
	 LbXTkVLY2Suxrbz34qtrxoYf9vN21IPQ0eqjv5osr5JsesVK0l/A28kSglDPqDHQZ3
	 HU3nvWnNVpmXmJyHfKC4tkexCHsZcoeqJo6jDo0iMRahV1VfebBWmtLtJ6ludw75ZE
	 CzI9W6rFu2xO8QnOBZ2IaGD1q9YYMTNlHDByGc1xumoUZ5GT4snWjfJVmJC+uR/2wM
	 BggkIC3gKPiLw==
Date: Fri, 08 May 2026 13:13:15 +0200
Message-ID: <58cff33edfe41dacd9eb7a10519f6be3@kernel.org>
From: Thierry Reding <thierry.reding@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Markus Stockhausen <markus.stockhausen@gmx.de>
Subject: linux-next: manual merge of the hwmon-staging tree with the hwmon-fixes tree
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>

Hi all,

Today's linux-next merge of the hwmon-staging tree got a conflict in:

  drivers/hwmon/lm75.c

between commit:

  3607422cdeeb ("hwmon: (lm75) Fix AS6200 and TMP112 setup and alarm handling")

from the hwmon-fixes tree and commit:

  4ab59263fd78 ("hwmon: (lm75) Fix AS6200 setup and alarm handling")

from the hwmon-staging tree.

I fixed it up by using the version from hwmon-staging. There's a 50%
chance that I got it right. This is now fixed as far as linux-next is
concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.
