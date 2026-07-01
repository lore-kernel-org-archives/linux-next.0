Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C8B043637A
	for <linux-next@vger.kernel.org>; Wed,  1 Jul 2026 15:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782920533; cv=none; b=FKU2Sl8CvDkRxEw0qfr7G5wxE21CFUHGXIh4jqa2MJEC3blIPqWk2xmc8yuySqAiDg+SGFXBy/kD3QG+kx/ZxZkXEvdP4XdTGSsMVQDstI/9co1E9U0q0aCP5o4Y3bXEAy4E+wS5krhnmO2NF3wTpLGrASaBm63DaelQee0uLZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782920533; c=relaxed/simple;
	bh=jdiE247G8f2Qs9jCA/ngthd1Kg5JOeUhZtmQ6Px/sd0=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:MIME-Version; b=EUjdMJ3SSLUG91q+CBxBpOjlALO7tm9QXk68mbQimAPCIDNhS+Lwu2BS9s63fc64HJT8fOXYEXa/bHj2d1Bxk0cYtdkvLJ+psbxeSdt4ZLTsdLXsRKVTCFh6Vjs9jXi6VwEUlC04aQdY5XZQUaLvWQHeI4You7bvMWK8J+2OEpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 368A420094B;
	Wed, 01 Jul 2026 17:42:08 +0200 (CEST)
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wex4i-005bMj-0R;
	Wed, 01 Jul 2026 17:42:08 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wex4i-00000000FyB-0DWM;
	Wed, 01 Jul 2026 17:42:08 +0200
Message-ID: <dbca57be9066a3853236a6395a7fccd8932bb65b.camel@pengutronix.de>
Subject: Moving reset branches to git.kernel.org
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-next@vger.kernel.org, kernel@pengutronix.de
Date: Wed, 01 Jul 2026 17:42:07 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Mark,

Could you please update the linux-next repo urls to pull the reset/next
and reset/fixes branches from

git://git.kernel.org/pub/scm/linux/kernel/git/pza/linux.git

instead of git.pengutronix.de? I'll send pull requests from the
kernel.org repo from now on.

regards
Philipp
