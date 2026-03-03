Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5301371054;
	Tue,  3 Mar 2026 14:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772546418; cv=none; b=O+ItdHmVqdA5ilpGSjjc7i8qsrvVfm5281/NbkWnojl//g0L0prWasTmHDGooLwyH9NwuOsCRp0MuxdfpQsirT0ZGRObS4a2LE6neSNiCmbfKKTGlCqWzXhs1y7Lk0GJf0YL+aPFH1uThUSMveahfCHKRA0LTPRfK1Nxsx0C3XQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772546418; c=relaxed/simple;
	bh=I2kQmLXSbNoa7989l19GGZfigJQO10teEb/CCeNlmFA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Rq0vrzLP1gToV9lYKlR+4WpuAU6KWTSoga1kwff0tmGRrMzyJdy4UdYfTNEyI5ivTUDgMwoV2IO1ngLBlndj1b5ImVGDWXiysuSf+w52103O1CRjJNF0YUi89o+ogUH5SColMAbfw1Lsga6RT5/vPROmfjQzjIs30Rn4SpYSAsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kncO7FBl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kncO7FBl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6511C2BC9E;
	Tue,  3 Mar 2026 14:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772546418;
	bh=I2kQmLXSbNoa7989l19GGZfigJQO10teEb/CCeNlmFA=;
	h=Date:From:To:Cc:Subject:From;
	b=kncO7FBlgeVO1Bpo/eBWDbiE0hTEK5qZm4m6WJZfrtahsoX4dTnzDIyunY1zKhe7l
	 mGEfFbma2Zj0c/ebvW3cmvojJdI2zwW9V+Bep5GE8lVVtptF2ZmtoM0x8I5k5EE7SW
	 cagcAWele0pFcgLr6xTqLQCWZjweCsGvfkLpPz6pPE3QHD8AjzYPhrD14gwQVjvHEb
	 35ilAroG2J1Plt51zvOXQ+EdYHVVmDV0AqNIw83JkYjM6cKvdSyJiHVFqkmiRWvBOD
	 zR9K6myvSdObWDwrlmndqyniQbDPS47xPG25KwYrbGb/CtJU4K8AQvifCwLStpesYX
	 cTn8WE4+9VFgA==
Date: Tue, 3 Mar 2026 14:00:14 +0000
From: Mark Brown <broonie@kernel.org>
To: Shuah Khan <skhan@linuxfoundation.org>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Shuvam Pandey <shuvampandey1@gmail.com>
Subject: linux-next: manual merge of the kunit-next tree with the kunit-fixes
 tree
Message-ID: <aabpbnOt9nCuQrfu@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

[I note that Shuah is the only contact listed for the KUnit trees, is
that right?]

Today's linux-next merge of the kunit-next tree got a conflict in:

  tools/testing/kunit/kunit_tool_test.py

between commit:

  40804c4974b8d ("kunit: tool: copy caller args in run_kernel to prevent mutation")

from the kunit-fixes tree and commit:

  7e331b560a76d ("kunit: tool: skip stty when stdin is not a tty")

from the kunit-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

[Sorry, forgot to diff - it's a simple add/add.]
