Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5852337AA65;
	Thu,  7 May 2026 10:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778148330; cv=none; b=rmAZyAExfuvh4YPS7sJkjUaVeZDDai9TYvywz5we5FURBNLzC1hd4lDOjHztHtEiVueiVQqRFjd5vEX2o/QQN7xfzKdgnOQEqbodQuIzkHFF54SlUgF1eGdlEtyt5+G80McSJQSC1s2gtUnBf+9fAGbRmEmMeystFIk6o/xuHhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778148330; c=relaxed/simple;
	bh=AS2mz4+oYAKo7/voPxOlSDCPUIi51ydV4XJP8+t67Vc=;
	h=Date:Message-ID:From:To:Cc:Cc:Cc:Cc:Cc:Subject; b=m8uDIMkGFNJ2uUhyRVlrwCRL6KK3cdfXoFZrcBGDta1kCbE/hWYt1AEDa6RxNUZ34QEIMdib5HlFg8N/Y2BKhix6c3XXqvyhbkhny4MLN8mxXetKVaGIeBUPY4Szekx0pBfdFMCOhXamXy0AZn8oMisydJED/6bRai4txfRfYIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VCtnGijT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VCtnGijT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFEC7C2BCB2;
	Thu,  7 May 2026 10:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778148330;
	bh=AS2mz4+oYAKo7/voPxOlSDCPUIi51ydV4XJP8+t67Vc=;
	h=Date:From:To:Cc:Cc:Cc:Cc:Cc:Subject:From;
	b=VCtnGijTW8TsC5hN+x4LfxmXt3vFIZFwys8FkWaNkN+pNSVEgdPKSYgnZ1GWk0ulI
	 43sLoRzTSY4XELt+ZpWoeDtZ2IQS3u84nFUmxXn9y0xVwpAjyqXdW7IzuNDi72G/Wx
	 ETJm4QHv6/DBUPeyHb+ohSmMld4jQ176e0z1wMqkvLJ3widpkwo1lICrBWUuGtSB4p
	 acVFyyOUUlU8Hi8wzNmODGyhbPUWhrwoNF5+hMfbw3lwQzwerAz+v3d0aiu178wiKu
	 LPBlmyIA9YHDwTPJWf9AtvFg1SlO+lN/37DvYnWBuZI5ogvTjlzMKETIurMNMMNTM9
	 2UqdZ9UwkiXlA==
Date: Thu, 07 May 2026 12:05:27 +0200
Message-ID: <a361f317e3aff614a00ddc8ef908d820@kernel.org>
From: Thierry Reding <thierry.reding@kernel.org>
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Cc: Francesco Lavra <flavra@baylibre.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jonathan Cameron <jic23@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the iio tree with the iio-fixes tree
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>

Hi all,

Today's linux-next merge of the iio tree got a conflict in:

  drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_buffer.c

between commit:

  cba48e44357b ("iio: imu: st_lsm6dsx: fix stack leak in tagged FIFO buffer")

from the iio-fixes tree and commit:

  7216b9f7e9fe ("iio: imu: st_lsm6dsx: Fix check for invalid samples from FIFO")

from the iio tree.

I fixed it up by using the version from the iio tree. This is now fixed
as far as linux-next is concerned, but any non trivial conflicts should
be mentioned to your upstream maintainer when your tree is submitted
for merging.  You may also want to consider cooperating with the
maintainer of the conflicting tree to minimise any particularly complex
conflicts.
