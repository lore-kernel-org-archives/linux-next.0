Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570BD3C5540;
	Fri, 10 Apr 2026 13:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775828473; cv=none; b=KctpalV4/VZ2SVR0+CKtn7/Z8sz4PtZD+VSYTcZux+0acW8+16UUCozFTcB5HWxtGgqWQ6/VQf9edCv8Cy8gbByObtYho8ZA2b9yOuuJYeTRddagW5nwMhYcyn8mqOYUy1PDMMFd3w6YVyLNtUIpOJmSq4H7KClbdFRdrkKDFNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775828473; c=relaxed/simple;
	bh=kwoB8ic3s1i9m3RrRaecyyFRsUDagCrVD92l9RlyQDM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bG5W2fRq9ox0VJB7nvgMnYUc82y4NobBXCc8ti5cSw7Fc7UT6Edd0pS5jYvY1sp7sUUoasYE5i8kbRv1wQXGpUNhBipAvzTkHuki4ZBDxSqO9F4Sj8XpAxZBJUGsOZlN92qbgo2EzJksWwcqNZ3BuOT+CT1Q+QAReqXwHHapUJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TO7/h4wp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TO7/h4wp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D67B7C19425;
	Fri, 10 Apr 2026 13:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775828473;
	bh=kwoB8ic3s1i9m3RrRaecyyFRsUDagCrVD92l9RlyQDM=;
	h=Date:From:To:Cc:Subject:From;
	b=TO7/h4wpswhpa+Nh4KWleO6zTdXYWo2VIBMQoTHv8g3abUTUPdOVc8IFkCmNxUpyN
	 vL4wUik+vM+Kn9q5mi5arNqgAWNBaAZ0pXzy97j8tSDN5RL6X6csUgQ34CocHpqMF9
	 ystJ9BbfO5HgAhMs+xh6IwBN5Ee5arHiYNCxuqyV2YF+LHKWtezp66YM0gXWEiQurR
	 zUNMAKXZiA6gNtFMkFUqyzxeJiasEsCC20z8t5rIChDLIdpUcZpmAn5GjYTzYNYVmk
	 pHJJxk5iRf5r/kCP4hSrWE7ZtxGDTVLYcO64QBuIvXvtgcnANOYf0Qk/+S/mWAbRek
	 DELPGrbdPIVZQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 06CCF1AC58B5; Fri, 10 Apr 2026 14:41:10 +0100 (BST)
Date: Fri, 10 Apr 2026 14:41:09 +0100
From: Mark Brown <broonie@kernel.org>
To: Linus Walleij <linusw@kernel.org>, Frank Li <Frank.Li@nxp.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the pinctrl tree
Message-ID: <adj99f9oz7Oon5nl@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the pincrl, today's linux-next build (x86_64
allmodconfig) failed like this:

ERROR: modpost: "pinctrl_generic_to_map" [drivers/pinctrl/pinctrl-generic-mux.ko] undefined!

Caused by commit

   62f97854fd4bf5 (pinctrl: add generic board-level pinctrl driver using mux framework)

I have used the tree from next-20260409 instead.
