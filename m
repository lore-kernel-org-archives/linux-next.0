Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C048339658A;
	Wed, 29 Apr 2026 07:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777447715; cv=none; b=Ey5Y2cep/zSR5ZeTGU716bTvcBxUOFMKg7BhtcEVvlfeyEY8o9xVt5EDfPb3ljMwJkbxeoK1e16YwP+FftHPem/oYGi/HkLI6IN1C0XFagD6cFrNc41T0bLtk2xB25UszrKX5CUth5twE7b1iPO1B8FaqEPBEKPeumEeUb0zEWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777447715; c=relaxed/simple;
	bh=Acxk/AEUgaxiFqbWXITF8qejTz5VGVbzy7OX41WaJTA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n2DtM6XW+3mcoCm5Qccck93KQhP59Sw5Knfiq49e6ciRyASpz66F5KiTTNGaXEYLC2cjtsf6dqinJG6bU1gHvx7mi+M4ctPyV+WJydcKTYhE4YzmFRfAyXAzkTpiwfet3RF1uAxejMcJ7dhi8exwIP5kjcasmZIloDRbwikpScY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IQedK9pA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IQedK9pA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13CB7C19425;
	Wed, 29 Apr 2026 07:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777447715;
	bh=Acxk/AEUgaxiFqbWXITF8qejTz5VGVbzy7OX41WaJTA=;
	h=From:To:Cc:Subject:Date:From;
	b=IQedK9pATRqBRshGlN3d5FnQzym4gDb4wzkskHPS5RB4hUkcWFdIOy8utBus0W60b
	 yRPVF7chtYeis8MWhySERSUlXDztY5SvfQcQzxeErZUrxWiNW86gI82iJa6h6X9wtG
	 OyVbXeiatzmTdxl9SKfDprI7aWjhYDMjXLORFkTuFOyWUcbkdjoe1tZkTd0/SEionH
	 lgfsxFxiuZManHN9QTJvZ7Io9g4kegi8bIWdkpns+oLxZ32zDC9E/Nsoup04oWpK2l
	 rLx8ZTcDIMe1NlOChSxntYeuG2JrW7/vdFMVdlDGhyFOKL9R+LfEaJeK1f0cafZIzl
	 RPu5k30/0DD6A==
From: Thierry Reding <thierry.reding@kernel.org>
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Cc: linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org
Subject: Fixes tags need work in the iio-fixes tree
Date: Wed, 29 Apr 2026 09:28:32 +0200
Message-ID: <20260429072833.3949792-1-thierry.reding@kernel.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In commit

    5ec569940b43 ("iio: adc: nxp-sar-adc: fix division by zero in write_raw")

Fixes tag

    Fixes: fdee77dea4b6 ("iio: adc: Add the NXP SAR ADC support for the s32g2/3 platforms")

has these problem(s):

    - Target SHA1 does not exist

Digging through the git history it looks like it should be:

    Fixes: 4434072a893e ("iio: adc: Add the NXP SAR ADC support for the s32g2/3 platforms")
