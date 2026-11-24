Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795542448;
	b=rT5Jxqad2OcTkPSBz+BJ2f5SCoM1F0G6gk3ta1UNW+Gm1mvW371+oCI7WvO1axPW2p1y
	 vdgogtZwFxNduCpgRA7Xj8E8IQI7RZMRLzMIqa4VgtWHSYXnei9ZvG1ey22pxnwL6nl8W
	 oDF+hSrSi+tBaMDx3V6JT9Iqv1R1Jq4m+tjFPsqC5i9mZDTAYpICNdPfQD9rUKm+/saIl
	 QogNE2gibZdzdF7vEFR5g+BVcSeZosaXXos69xFjQ1ern/Y2FUSbTQeULLX9FMSlg+Bj2
	 J6qRseo8njmFmB7FYzFu7HgnXRjOJxd/ERhk4jjiXT7itx8ZPNWuDKKawP3BVtt46Dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795542448;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bdWEFbRsgzPIYKTa6jIj3ybNip24+D6HpGcUy94Q6ms=;
	b=LbTSaPwNSnr/ZdS1HFS8/Ivs+nc7K3uBOQyIOT4gCO/xAIT+TDGTE2Lzwv4n084tQBDw
	 5sIgWYf70YW5BWi5krBsezyz/DSicJE18A2aPHw48d6UzzyjugZShes2Fr83Il7u5FUDZ
	 WiCaNWejbWW87SGzeaO7es1A+cWU7AKfV6OurcsWFGP6XzulOI6GGwI6pjl/FDbcYtqG9
	 ctBsFbK/bFbx1BAp7TPsM9Z3cWGi3XNM6XmkkCq9jdn8X9wZJhcvKZoOBQfQSIJjEtcE/
	 PRQwuObRJX+b/GmK70YigDlgujcJ5PcaFlR7p/4A91iKMMImsCdV7M7OqHojTH5SNAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iW1QITC7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F765606A321;
	Tue, 24 Nov 2026 17:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iW1QITC7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 461DF1F000C0;
	Tue, 24 Nov 2026 17:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795542448;
	bh=bdWEFbRsgzPIYKTa6jIj3ybNip24+D6HpGcUy94Q6ms=;
	h=From:To:Cc:Subject:Date;
	b=iW1QITC78HmEKvHY1LHgqf5WA8VOaFWjb+vGKR9W7lDLp9s+osWWpEnGAlyksc+73
	 9fa5ql3eV03w/0KWy/18rCqIRnTd8O5AKuA/a7+nEANNMD+YEuhzAeLosFgXiMe7G1
	 zC/P1/ES2/Aea+nlTLo8XiEiHQ34MTr9rmP0Q6u4vT8HQY/4xZR/+hyDnsCoXa1mFy
	 RXfPdWD5/EKUfzXnbdz3Iy4sLdUogT4EA3dQzQLX+357x8a76wqHEFNVh+QIgrzUDR
	 D9yJU460MvDor4oC1Rs3YiixuPMaC8fQELMuSP75bqtY0pxqpezB41Z54u9BJIkAQo
	 MQsTe1RO3dVMg==
From: Sasha Levin <sashal@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>,
	Namjae Jeon <linkinjeon@kernel.org>,
	Chi Zhiling <chizhiling@kylinos.cn>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [PATCH linux-next RESEND] exfat: check the emergency state in exfat_writeback_range()
Date: Tue, 24 Nov 2026 12:47:26 -0500
Message-ID: <20261124174726.2223430-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since next-20261119 the merge of the vfs-brauner tree with the exfat
tree drops an error check from exfat writeback.

Commit 788f21d1f192 ("exfat: don't set SB_RDONLY after filesystem
errors") in the vfs-brauner tree switches the write side shutdown checks
to exfat_emergency_state(), which also fails after a filesystem error.
One of them is in exfat_writepages(). Commit b900c61a3f21 ("exfat: drain
dirty pages after forced shutdown") in the exfat tree moves that check
from exfat_writepages() into exfat_writeback_range().

The merge takes the exfat side of exfat_writepages() but keeps
exfat_forced_shutdown() in exfat_writeback_range(). So after an error
with errors=remount-ro, writeback keeps writing dirty data to the disk
instead of dropping it as the vfs-brauner commit intends.

Use exfat_emergency_state() in exfat_writeback_range(), as
next-20261118 did.

Fixes: ce0505a38004 ("Merge branch 'vfs.all' of https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git")
Link: https://lore.kernel.org/all/20261120003508.2135492-1-sashal@kernel.org/
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
For folding into the vfs-brauner merge in fs-next. Resent as a new
thread with the full context, the first posting was a reply in the
11-18 vfs-brauner/exfat manual merge thread. Applies to next-20261123,
built fs/exfat on x86_64 (defconfig plus EXFAT_FS=m, W=1).

 fs/exfat/iomap.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/exfat/iomap.c b/fs/exfat/iomap.c
index d0bcf523f48b5..a846fbc450b82 100644
--- a/fs/exfat/iomap.c
+++ b/fs/exfat/iomap.c
@@ -374,14 +374,14 @@ static ssize_t exfat_writeback_range(struct iomap_writepage_ctx *wpc,
 		struct folio *folio, u64 offset, unsigned int len, u64 end_pos)
 {
 	struct inode *inode = wpc->inode;
+	int error;
 
-	if (exfat_forced_shutdown(inode->i_sb))
-		return -EIO;
+	error = exfat_emergency_state(inode->i_sb);
+	if (error)
+		return error;
 
 	if (offset < wpc->iomap.offset ||
 	    offset >= wpc->iomap.offset + wpc->iomap.length) {
-		int error;
-
 		error = __exfat_iomap_begin(inode, offset, len,
 				0, &wpc->iomap, false,
 				exfat_get_valid_size(EXFAT_I(inode)));

base-commit: 3191063649dbf7c0d0b768e1f3655e4c5fc6edb5
-- 
2.53.0

