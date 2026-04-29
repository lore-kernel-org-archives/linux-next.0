Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27AF63A3E90;
	Wed, 29 Apr 2026 07:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777447184; cv=none; b=C15FrbYh/TuDigaUqWMHCFpTBGZpLFfPP6aD2xREtKPhd1rXFfzgrS/5r6xWu3yiaZS0ExLl+LDzB0bWme5gwsGiNP7BCK1ah6isUgJbk3vw5hEyqbsZLor/B/yJYswqUjGOH9oOr/G0427cOB2DQwYmLb50uyP/Kv93O3tYTxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777447184; c=relaxed/simple;
	bh=75xMV46cI112JwJqrFjOWtrwlWCIRuJoVrF5EydsniA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XaseoHRI89xByvb/SuCfbfmwIBj745xJ1XKfTC8YyrUqUT64fZGetRsPyAr5rtmw1w7qsV3xWS3PMmST52E89//2TbElMYk0VpoRFt6uA/HuV8sfgKqCj3hxI7tq6xh4a3t198dt7xfeMYUsEjsYPgsTFs1NqLQB5j4CCZFda/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GWZh2Mf3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GWZh2Mf3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 756CCC19425;
	Wed, 29 Apr 2026 07:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777447183;
	bh=75xMV46cI112JwJqrFjOWtrwlWCIRuJoVrF5EydsniA=;
	h=From:To:Cc:Subject:Date:From;
	b=GWZh2Mf3ijRVR247hWUgcCOIpxbm4eWjhBSvDtXX36tWJthnXaQ9qtuYzGDU+Vp2v
	 WO0OcMaHK4I4SUTN6QZ5DUF5rsPRhEXP9zQa0v6vQE+heUoeocKbKhMU2GayLWBjeJ
	 8o62a1xNonIL2UhFHbBk6doZ2AXBm6w0Gq8g0/TOKk75qLs7XXbuVTXQKoG4QFatfz
	 RjYNioFv3LVZS7dw7s7aifp/xFTXNdm6pa53qcPX3j/amTGUkd67bXT8jxDExpQ6mP
	 Ej7zftyVYtKvw7C252pliMyiAEf1XJae8jFYEZ0tXKiG8GWrPy6QH86ghvsDY1+ljl
	 7zMj7pDcGhzdA==
From: Thierry Reding <thierry.reding@kernel.org>
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Cc: linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org
Subject: Fixes tags need work in the iio-fixes tree
Date: Wed, 29 Apr 2026 09:19:36 +0200
Message-ID: <20260429071937.3945841-1-thierry.reding@kernel.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In commit

  55bf748e4e1e ("iio: adc: mt6359: fix unchecked return value in mt6358_read_imp")

Fixes tag

  Fixes: 3587914bf61 ("iio: adc: Add support for MediaTek MT6357/8/9 Auxiliary ADC")

has these problem(s):

  - SHA1 should be at least 12 digits long
    This can be fixed for the future by setting core.abbrev to 12 (or
    more) or (for git v2.11 or later) just making sure it is not set
    (or set to "auto").
