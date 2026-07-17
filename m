Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD9B2C11E6;
	Fri, 17 Jul 2026 13:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784295071; cv=none; b=rHA4eO8YCVjs8iMb0Wvglo04TT/GaGizgNWvmGA1NENdCCkuRUw+Jgymtf6JeWd9VGPPTC3A0236Rfzm2JS3SCLUzIEmF47JxPaAE2QxlqQjdsYEKzX73GWCR3V6V+c1BssQtntaBNlKHONOhZzDmLVCM/Ok8JlEZndbH6mTc5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784295071; c=relaxed/simple;
	bh=c3G+GhT4QLmwerESy2BYwEZvIjthjQOyCDM59KJ0tPk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nl1ScBQSlkRLIg12gZ3fRXzeQc24Fi1zzkh9N3YCAXTM4FudG8xT6C0C80ZaZJ6caZq2BxaQlQrxl9fLw7MWXAjLDOyBmEYcSt6hczyhBxF/YAWU7o0g9NRlQejm4ygeUcJ71dFy+kZrlPsj92MJmWEe+wwi1O9tGGOUjMIJJqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nozCxtHQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nozCxtHQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2E621F000E9;
	Fri, 17 Jul 2026 13:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784295070;
	bh=bE7L8JKesPzdsXpG4+gOQi6dqVUYVwtusY/l6JqvET0=;
	h=Date:From:To:Cc:Subject;
	b=nozCxtHQUbP17r2T28siF7tiG0Wb60rzPtcXSpNWtxX169xyP6NI3X+Fr+YUtRh4e
	 IDa9rEZQTwFcDnSWregL2a/beFQKbq70npJCB1eYLM1srDxYgrfaURcZqa4Y0AdvRg
	 Zvo3hPVCYS7Byw27MY4P8M4R9eqVgQw3oEXza9rFozeHIx6LHNDWz4FGNaN/gR5EwN
	 rdV7hsBi+rZDnYgdvYICPg2ZIKVwods4zCnsUaBgTxrx05cNOb5TeTPuNQVyemiAc/
	 /6O3xBLYEc4adRh9ViRcmX9ykwKrt8VINTPD0PDlvFZxP+CXR/58fpkuO95DnDAaL4
	 7AxFedivjFS6g==
Date: Fri, 17 Jul 2026 14:31:06 +0100
From: Mark Brown <broonie@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Wangao Wang <wangao.wang@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the qcom tree
Message-ID: <aloumm-rrofkrmxT@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the qcom tree, today's linux-next build (arm64 defconfig)
failed like this:

Lexical error: /tmp/next/build/arch/arm64/boot/dts/qcom/purwa.dtsi:169.14-35 Unexpected 'VIDEO_CC_MVS0_BSE_CLK' 

Caused by commit

  43899c55d79ba (arm64: dts: qcom: purwa: Override Iris clocks and operating points)

possibly interacting with something else that changes implicit includes
or something.  I have used the tree from next-20260716 instead.
