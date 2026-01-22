Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3655F38FF18;
	Thu, 22 Jan 2026 15:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769095868; cv=none; b=KziZ2imgKlJGipMFHSD/hI9jrDScELqeslgYvJTHWdnUn4Z/ju1XmrITbXiEFFCyNXzgirsXcXkFFc9Ws/BulX0FnNmsxL1BG18OKy1oAjcYbZWnAlgzVQnGpGSzr6WaBO5ctgjigPUqIpKS4AyGpx8aUYI+HNxNDYL9g9ozBxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769095868; c=relaxed/simple;
	bh=1137+ywH5n1GKsviVtd+UrF56JIoSkmdTlaN4N8raI0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jvkNMd7iK1V0XYXECEjB1rfPypO0bzJZ4M/LVerrUZiIqVcpDApfZlw5DGyzIMHbFprYdv9/XsQBkYW4gE9zr2yfHl98elReyCaaNDnZ8E8K0ex5Vj95EEEEO+QedaZihePHrOMnZ5s1u8BeTgOcX5LBV47Fx5B3/Cg6KGDOaZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ICq6RwrN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ICq6RwrN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D74DC116D0;
	Thu, 22 Jan 2026 15:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769095866;
	bh=1137+ywH5n1GKsviVtd+UrF56JIoSkmdTlaN4N8raI0=;
	h=Date:From:To:Cc:Subject:From;
	b=ICq6RwrNhS1kgaw45YTeo4hAmQTFju84qzC2rt7fLsFTWqlGK1ZQZ4MiXD0XgynAu
	 qOwVLuKApKOAEqSXagFcygxHOHmbTUdUuJNjaf91WhsxbiNcmCrmRpTa53jiRCAVoN
	 Rkco/mR+PtRsveptTwlL5u9X4Cm5EIRxCnSGN7xg38mRNkiq0ONVcY2uYCwVxovU4g
	 pdCRNbjq96aD5J37dRXPBF9y/jL/leXdnGSoVgIxP51aQvUWjFjpAyKyCj67+KR6Gv
	 Wp23ijzDDjxQXlFeQcxm8+gcbxC6snmnv5VPTfORI05ZcHkZ85qO1cp+jNkKZJOB8n
	 7ytt28zK4X7aA==
Date: Thu, 22 Jan 2026 15:31:02 +0000
From: Mark Brown <broonie@kernel.org>
To: Richard Weinberger <richard.weinberger@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Rob Herring <robh@kernel.org>
Subject: linux-next: manual merge of the mtd tree with the origin tree
Message-ID: <aXJCtrMEK8vhp7wc@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Today's linux-next merge of the mtd tree got a conflict in:

  Documentation/devicetree/bindings/mtd/partitions/seama.yaml

between commit:

  54de247a0efa4 ("dt-bindings: Updates Linus Walleij's mail address")

from the origin tree and commit:

  125981ffa1674 ("dt-bindings: mtd: partitions: Combine simple partition bindings")

from the mtd tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

[Dropped the removed file]
