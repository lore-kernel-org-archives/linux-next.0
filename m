Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D0E2D3ED1
	for <linux-next@vger.kernel.org>; Sat, 28 Mar 2026 21:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774732659; cv=none; b=E4oXb3R/n94PfrhTe8b9CIAiYk/CI7173AjnvAuqSZ7FAoeFw1DyPxs98O5w4o0Zrk4BEIYWrp0XUU8QpUchxfYrg/8DHo2kwxY2j0VlbKXPp+xYO5gCLiLyjuLlLXxCNiZOGlL7ZCqozfbqcPc/GR2xNEx0CeRfiGH/fefa4Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774732659; c=relaxed/simple;
	bh=qco5cyASbKPLVv6resOfPW9e8eSir0N5UVy/wKiswxs=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=C4IBhYI0yviEqpL+8FESNn6hy0vPjRhOzgVShJxbaPDejX4g3qVthr5/ywXeTNvNSN931Nn68CNSz33A6ubJoB73kJbutWTcSt10gClVTPA5HCFejaZRc7oWabmSwGBkAJgv5pZFB+flquUtSNqCn2pWykDG1JH1WaGJM2CTuDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=qQsJ1PIM; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="qQsJ1PIM"
Message-ID: <02908210-0ed5-42a7-b725-8bf70f936828@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1774732654;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qco5cyASbKPLVv6resOfPW9e8eSir0N5UVy/wKiswxs=;
	b=qQsJ1PIMRu1WtH2C0GIo6QEfJYR705mC/FC7sD/XpiCWBE0Qdqw57oMcbGj9xgBZ9Sdkwp
	6I8MFnw7E2BiRZjGxjPzdFnY0etw7J+hlGI5hGRV2wXaDqCShJXif0hBgoBuk3OU6EOb+H
	sLA1DoxeNlf6s0N+z5q3umPg72tUVLI=
Date: Sat, 28 Mar 2026 21:17:32 +0000
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Language: en-US
To: sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Igor Korotin <igor.korotin@linux.dev>
Subject: Please add rust-i2c-next and rust-i2c-fixes to linux-next
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

Hi Stephen,

Please add the following tree to linux-next:
Tree: https://github.com/ikrtn/rust-for-linux
- Branch: rust-i2c-next
- Branch: rust-i2c-fixes

This is the maintainer tree for the Rust I2C subsystem.

Thanks,
Igor
