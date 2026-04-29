Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83703C555B;
	Wed, 29 Apr 2026 10:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777457243; cv=none; b=p3LaspFXm38x4OH9lAmAQgfu3bAVRhcBEDS899tEQyiGN6wWWI2yq7DwyveMYUS9UGcf+Wr9NAO0w7NbTThJxOTYhj2Fja9GaTeYvXRL+U0fiT16D5LO8v/2Tj7KrAXUFrmR/4zQhYJ2ztbey2WW4TVdQgwX2lhCTPwd1X+rFNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777457243; c=relaxed/simple;
	bh=KXZBTjgngdiEGzi/w/5uqf3VrhAOOzgVdez/vlbX4wM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tRlITJHMLY13kKDr6N0lRqIW+g+KnImaZZvmGIuatMsn005Wsn12qdF19n3v6s25VJlFIxYCX8VQoMiGabMz5yPwPCQcnFH09HQf/k/ToPOvXckc3nB7S+D/0iXeMsIbHrS2AlIdXFw3gz4+DxEJjZ5RzxSqM23Ktc1nzTQ8Yxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b9mtRXb9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b9mtRXb9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0A26C19425;
	Wed, 29 Apr 2026 10:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777457243;
	bh=KXZBTjgngdiEGzi/w/5uqf3VrhAOOzgVdez/vlbX4wM=;
	h=From:To:Cc:Subject:Date:From;
	b=b9mtRXb92LZWlHPw7q/JMw0Z0IScflgFOKV8GkWXAb8qoazJxT9w3Q+krNCz4PsMw
	 dejbWcyP7EcVCnLO66jxeSDIp984ZubkDG7tKmVTpd7waL7LvHv8kRD+OxoIy/OUSr
	 j1SzCWxgD9BonngaYFx0FsE4/ircE6AmenbbQFWd6qAxUTYlnsgq5h2Hp0TcXxILOC
	 OSzElgSb1s979rm1k0sbwXHxmqi9g4Xu5PSHOMPvFMhWVVmbpFEYRNNMj0wekRNGVh
	 3iHqYMYdw0nwvYO4amJ62gRcA6PgwKh+XfM8pIkXVzJEa7eSLUBflcS+IhAP6NJ0iX
	 HggNhuVHCCJRA==
From: Thierry Reding <thierry.reding@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Boris Brezillon <boris.brezillon@collabora.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the nand tree with the mtd-fixes/mtd/fixes tree
Date: Wed, 29 Apr 2026 12:07:16 +0200
Message-ID: <20260429100717.3982889-1-thierry.reding@kernel.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

Today's linux-next merge of the nand tree got a conflict in:

  drivers/mtd/nand/spi/winbond.c

between commit:

  8d655748aba1 ("mtd: spinand: winbond: Set the packed page read flag to W35N02/04JW")

from the mtd-fixes/mtd/fixes tree and commits:

  9980ff0d528f ("mtd: spinand: winbond: Add support for continuous reads on W35NxxJW")
  a211bd1ecc0b ("mtd: spinand: winbond: Ensure chips are ordered by density")

from the nand tree.

I don't know if I fixed it up correctly (see below) and can carry the fix
as necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer when
your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

diff --cc drivers/mtd/nand/spi/winbond.c
index 7cc0f0091430,578f702528ee..9ae397f17730
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@@ -504,35 -685,15 +685,14 @@@ static const struct spinand_info winbon
  		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xdc, 0x21),
  		     NAND_MEMORG(1, 4096, 128, 64, 512, 10, 1, 1, 1),
  		     NAND_ECCREQ(1, 512),
- 		     SPINAND_INFO_OP_VARIANTS(&read_cache_octal_variants,
- 					      &write_cache_octal_variants,
- 					      &update_cache_octal_variants),
- 		     0,
- 		     SPINAND_INFO_VENDOR_OPS(&winbond_w35_ops),
- 		     SPINAND_ECCINFO(&w35n01jw_ooblayout, NULL),
- 		     SPINAND_CONFIGURE_CHIP(w35n0xjw_vcr_cfg)),
- 	SPINAND_INFO("W35N02JW", /* 1.8V */
- 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xdf, 0x22),
- 		     NAND_MEMORG(1, 4096, 128, 64, 512, 10, 1, 2, 1),
- 		     NAND_ECCREQ(1, 512),
- 		     SPINAND_INFO_OP_VARIANTS(&read_cache_octal_variants,
- 					      &write_cache_octal_variants,
- 					      &update_cache_octal_variants),
+ 		     SPINAND_INFO_OP_VARIANTS_WITH_CONT(&read_cache_octal_variants,
+ 							&write_cache_octal_variants,
+ 							&update_cache_octal_variants,
+ 							&cont_read_cache_octal_variants),
 -		     0,
 +		     SPINAND_ODTR_PACKED_PAGE_READ,
  		     SPINAND_INFO_VENDOR_OPS(&winbond_w35_ops),
- 		     SPINAND_ECCINFO(&w35n01jw_ooblayout, NULL),
- 		     SPINAND_CONFIGURE_CHIP(w35n0xjw_vcr_cfg)),
- 	SPINAND_INFO("W35N04JW", /* 1.8V */
- 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xdf, 0x23),
- 		     NAND_MEMORG(1, 4096, 128, 64, 512, 10, 1, 4, 1),
- 		     NAND_ECCREQ(1, 512),
- 		     SPINAND_INFO_OP_VARIANTS(&read_cache_octal_variants,
- 					      &write_cache_octal_variants,
- 					      &update_cache_octal_variants),
- 		     SPINAND_ODTR_PACKED_PAGE_READ,
- 		     SPINAND_INFO_VENDOR_OPS(&winbond_w35_ops),
- 		     SPINAND_ECCINFO(&w35n01jw_ooblayout, NULL),
+ 		     SPINAND_ECCINFO(&w35n01jw_ooblayout, w25w35nxxjw_ecc_get_status),
 -		     SPINAND_CONFIGURE_CHIP(w35n0xjw_vcr_cfg),
 -		     SPINAND_CONT_READ(w35n0xjw_set_cont_read)),
 +		     SPINAND_CONFIGURE_CHIP(w35n0xjw_vcr_cfg)),
  	/* 2G-bit densities */
  	SPINAND_INFO("W25M02GV", /* 2x1G-bit 3.3V */
  		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xab, 0x21),
@@@ -573,6 -736,19 +735,18 @@@
  					      &update_cache_variants),
  		     0,
  		     SPINAND_ECCINFO(&w25n02kv_ooblayout, w25n02kv_ecc_get_status)),
+ 	SPINAND_INFO("W35N02JW", /* 1.8V */
+ 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xdf, 0x22),
+ 		     NAND_MEMORG(1, 4096, 128, 64, 512, 10, 1, 2, 1),
+ 		     NAND_ECCREQ(1, 512),
+ 		     SPINAND_INFO_OP_VARIANTS_WITH_CONT(&read_cache_octal_variants,
+ 							&write_cache_octal_variants,
+ 							&update_cache_octal_variants,
+ 							&cont_read_cache_octal_variants),
 -		     0,
++		     SPINAND_ODTR_PACKED_PAGE_READ,
+ 		     SPINAND_INFO_VENDOR_OPS(&winbond_w35_ops),
+ 		     SPINAND_ECCINFO(&w35n01jw_ooblayout, w25w35nxxjw_ecc_get_status),
 -		     SPINAND_CONFIGURE_CHIP(w35n0xjw_vcr_cfg),
 -		     SPINAND_CONT_READ(w35n0xjw_set_cont_read)),
++		     SPINAND_CONFIGURE_CHIP(w35n0xjw_vcr_cfg)),
  	/* 4G-bit densities */
  	SPINAND_INFO("W25N04KV", /* 3.3V */
  		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xaa, 0x23),
@@@ -592,6 -768,19 +766,18 @@@
  					      &update_cache_variants),
  		     0,
  		     SPINAND_ECCINFO(&w25n02kv_ooblayout, w25n02kv_ecc_get_status)),
+ 	SPINAND_INFO("W35N04JW", /* 1.8V */
+ 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xdf, 0x23),
+ 		     NAND_MEMORG(1, 4096, 128, 64, 512, 10, 1, 4, 1),
+ 		     NAND_ECCREQ(1, 512),
+ 		     SPINAND_INFO_OP_VARIANTS_WITH_CONT(&read_cache_octal_variants,
+ 							&write_cache_octal_variants,
+ 							&update_cache_octal_variants,
+ 							&cont_read_cache_octal_variants),
 -		     0,
++		     SPINAND_ODTR_PACKED_PAGE_READ,
+ 		     SPINAND_INFO_VENDOR_OPS(&winbond_w35_ops),
+ 		     SPINAND_ECCINFO(&w35n01jw_ooblayout, w25w35nxxjw_ecc_get_status),
 -		     SPINAND_CONFIGURE_CHIP(w35n0xjw_vcr_cfg),
 -		     SPINAND_CONT_READ(w35n0xjw_set_cont_read)),
++		     SPINAND_CONFIGURE_CHIP(w35n0xjw_vcr_cfg)),
  };
  
  static int winbond_spinand_init(struct spinand_device *spinand)
