Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7038528488D;
	Wed, 29 Apr 2026 10:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777457275; cv=none; b=E64MFz8vcwZN4baadfWDz3g/a2w2jWqsDTkayee1YAqxLzonw2ZW2lSa6byr7HVOBRfrLiiUKpjybyesTNuuMxZWkRt4+gL/lGdVoruPbg77WP/8Hbha4sGYudybquYj/O51A85OPhh96Br82Jgjox9z404gGitaF2mbi8yEnrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777457275; c=relaxed/simple;
	bh=S5NRR+AmibLdJOKVACKCU15+MWwxfya2IXCa1LOoJQ8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=haxiLLy2qSvnvj4NtfMG1QRzpTmvWsHNbLC0Tq4AlFwVYUM10BbEdlC8fzRcHJDNbzGBfmlHGazxBFza3pPXqLYkm37V5iIw+W3bJ42n0agi3XqMRdtIEZGck5F+888Kuqx6ULmBJjVo7SEVc3FEaUrnj9XboqYed+xjXRafc4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mZwc1fnt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mZwc1fnt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA659C19425;
	Wed, 29 Apr 2026 10:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777457275;
	bh=S5NRR+AmibLdJOKVACKCU15+MWwxfya2IXCa1LOoJQ8=;
	h=From:To:Cc:Subject:Date:From;
	b=mZwc1fntDRo+4WlCspw7GGdUuV8PYMrCP1uYdRuUzSnRZrP2EbdDGBJL1LItNW+0+
	 WSJ1uGl9VWeua2w6I/WM6WwNrqfcppQxUy1Hs8u9YQ7/j7vswqlI1qwB94Wf2bFohN
	 mWfgYHBHNUnJuNehj8XQzmNjj4gpUU6ezXr44+c1353tlqYh9SXk0uB7IFhjzng4Zs
	 mxzvq/M/iCCOXoAfOljN/+wXL3LA/swSkbURpEioh/lNRhj5OTD570fhvYIzNPQbhm
	 9qH/upvUDp450vWJFbEkyWJwCiKiaShmjll+Y66761ADEzCQncd1KAksceGuXhxgnt
	 kd6qMfYEQ8Ipg==
From: Thierry Reding <thierry.reding@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Boris Brezillon <boris.brezillon@collabora.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the nand tree
Date: Wed, 29 Apr 2026 12:07:50 +0200
Message-ID: <20260429100752.3983097-1-thierry.reding@kernel.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

After merging the nand tree, today's linux-next build (all of them)
failed like this:

    /srv/kbuild/next/linux.git/drivers/spi/spi-airoha-snfi.c: In function 'airoha_snand_dirmap_create':
    /srv/kbuild/next/linux.git/drivers/spi/spi-airoha-snfi.c:549:50: error: passing argument 2 of 'airoha_snand_supports_op' from incompatible pointer type [-Wincompatible-pointer-types]
      549 |         if (!airoha_snand_supports_op(desc->mem, &desc->info.op_tmpl))
          |                                                  ^~~~~~~~~~~~~~~~~~~
          |                                                  |
          |                                                  struct spi_mem_op **
    /srv/kbuild/next/linux.git/drivers/spi/spi-airoha-snfi.c:519:63: note: expected 'const struct spi_mem_op *' but argument is of type 'struct spi_mem_op **'
      519 |                                      const struct spi_mem_op *op)
          |                                      ~~~~~~~~~~~~~~~~~~~~~~~~~^~
    /srv/kbuild/next/linux.git/drivers/spi/spi-airoha-snfi.c: In function 'airoha_snand_dirmap_read':
    /srv/kbuild/next/linux.git/drivers/spi/spi-airoha-snfi.c:575:36: error: 'desc->info.op_tmpl' is a pointer; did you mean to use '->'?
      575 |         opcode = desc->info.op_tmpl.cmd.opcode;
          |                                    ^
          |                                    ->
    /srv/kbuild/next/linux.git/drivers/spi/spi-airoha-snfi.c: In function 'airoha_snand_dirmap_write':
    /srv/kbuild/next/linux.git/drivers/spi/spi-airoha-snfi.c:764:36: error: 'desc->info.op_tmpl' is a pointer; did you mean to use '->'?
      764 |         opcode = desc->info.op_tmpl.cmd.opcode;
          |                                    ^
          |                                    ->

Caused by commit

    56b2c0848273 ("spi: spi-mem: Transform the read operation template")

I'm going to roll this back and revert to yesterday's tree.

Thanks,
Thierry
