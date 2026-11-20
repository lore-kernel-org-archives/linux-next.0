Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795134910;
	b=iDD04dYiRUNfpuqIM3oKASMXO3T0WRIU3ZtlUugMjTLF4uexYvnGNwae5W1aqZJ4iflG
	 6TRx1W6UvKqH54K0RdSgRD9FW7a1Xyf9xcCxDUKvGessFNZU9gH8iaxCjN5ugCjHEM2o/
	 5YGfOqVMleoPT1Mi+mUxvm3HOPei3X+IprLAjuR60mfJxctlnpzmzc9A9Wvjl/lAmnDyI
	 /K7ld/BjUOmWd1heC8tJy1dN0wtdhmnbHUGF+YJLXfWXv+xrP/FinzpmUVttfGyOdEAZy
	 qceHNl4wPOZUh7ie+UaJORhitWL/hE9VYKQL2GkcQ/qqrtl0kgmFVQbbYWzfP5gt3PA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795134910;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=rcPnb0S0VMJ8ztk6/Lua9wBTwaFCuXSAKzGqIYJcgy0=;
	b=2xCZq/gUNUUIu8IsnVhbzUoKCdSTNZVIu9A0WO3SEWat2xVko7ZoWhsAwaQnoWIaD0nX
	 fHZKN18EUXezfMCnRC6CTTP4D+pPJRYgHXq+0x3CsgYM9TbY6OOrpjSrvDD4t+FRW1iI1
	 yj/PE8i86PQ/5XgwoKz1mCSqrJ7QEb3kxUYyq2kpCf1BdSievTkzqB7I8geyj6VyoGmRN
	 51RuTuUWl/GZ+Hfr7BODhZZOdqFtQW1On3j5D20hzhGU8UrT2I0fKdRpZYFbo71QwZju7
	 UMr+sBexhrKYU38u3YtPdEmHL01Mt7FUzz3bo2yZv5uhAIJcq3dV0WCNoES3gn8vUPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Zuc7g0F/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A331A606A320;
	Fri, 20 Nov 2026 00:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zuc7g0F/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79CFF1F000C4;
	Fri, 20 Nov 2026 00:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795134910;
	bh=rcPnb0S0VMJ8ztk6/Lua9wBTwaFCuXSAKzGqIYJcgy0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Zuc7g0F/pu1e3R3C48EurVqsDljw2LumTnjjYJSLqUXLQbjN6OWe58sCbCVoCOqQs
	 ufT0lMACda/SVSTlpbAqez3upBeLESKk1kPR/ZPTRih4XbE0pub+7pD2QWSc0GxuHF
	 Ul2f7QyQQE1WSD4QQUvg4DQTLQwFn2TL/efejGAl09GGITlDuckWpldtRRyEGa/Ul2
	 zKhfZOGGkl8XPQvk3EvuKzAmCD+Vqmq04jNDuygKlNrXhUMnT0bhIiTbAe28ja1jOt
	 mQAVIOMz5aXAKV0HRFQFstKenB7p5z42T9g9zJPEaURBahdzWxFeFFBcJCEsnVluhe
	 fF/cHF7juxI4g==
From: Sasha Levin <sashal@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>,
	Namjae Jeon <linkinjeon@kernel.org>,
	Chi Zhiling <chizhiling@kylinos.cn>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [PATCH linux-next] exfat: check the emergency state in exfat_writeback_range()
Date: Thu, 19 Nov 2026 19:35:08 -0500
Message-ID: <20261120003508.2135492-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <av2mOPyANz3H59F5@sirena.org.uk>
References: <av2mOPyANz3H59F5@sirena.org.uk>
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

The vfs.all merge in next-20261119 takes the exfat side in
exfat_writepages(), where b900c61a3f21 ("exfat: drain dirty pages after
forced shutdown") moved the shutdown check into exfat_writeback_range(),
but leaves exfat_writeback_range() with exfat_forced_shutdown(). So the
exfat_emergency_state() check that 788f21d1f192 ("exfat: don't set
SB_RDONLY after filesystem errors") adds to writeback is lost, and after
an error with errors=remount-ro writeback keeps writing dirty data.

next-20261118 had exfat_emergency_state() in exfat_writeback_range().
Put it back.

Fixes: 026bdab726d8 ("Merge branch 'vfs.all' of https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git")
Link: https://lore.kernel.org/all/av2mOPyANz3H59F5@sirena.org.uk/
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
This is for folding into the vfs.all merge in fs-next. Built fs/exfat on
x86_64 (defconfig plus EXFAT_FS=m, W=1).

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

base-commit: adcad7f4e6332cff3d6d7165f41584899f598534
-- 
2.53.0

