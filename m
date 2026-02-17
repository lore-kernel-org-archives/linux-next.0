Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3AE2D592C;
	Tue, 17 Feb 2026 13:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771333862; cv=none; b=Ly1o/vhyPeEOqkaGoLq8uWL7dCNrURJ0xNAYh5pDjHM/9acCIZgs5NIZDDc9raIc2T0Yt/7an9BXCv85sOs8Ul3LnsRsIkau6goIvZA7eGZ/y1EI/V05I+rpocv9swL4W8N2XeEnyGEyenSOu0di6O7w3Xrd2Hk9s/Qvk679ihc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771333862; c=relaxed/simple;
	bh=807BTtE4jt1qTb8P6Qbs5EfBFO92bqPqwlv1+Z4I7z0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=TtBlQ0q3Yri2AU9YAw0KeAduer59unEUxrqzjLXKI31NQWQhztOPHOZ00n6zRDlrVEtT11X+ibVUXYvqT2PGQs74YQ5hlN/FyQo2/2kQE7iUSf1l7t9LlzK3Goq3zGjXWHEILoi8avGbvv/X0gMD/TKH8Pz2VznQNlNc0Q+eEJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f/vMY7zt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f/vMY7zt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E82FC4CEF7;
	Tue, 17 Feb 2026 13:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771333862;
	bh=807BTtE4jt1qTb8P6Qbs5EfBFO92bqPqwlv1+Z4I7z0=;
	h=From:Date:Subject:To:Cc:From;
	b=f/vMY7ztlPdGcXF7ZwFB5PRUC1Qt4S2y3oeLeatogSsPW5ui1wYbiYTHxICH6Hegy
	 jPEtXkCG9aSuOamoGie0gvjxnQp/rssGAsCIXbztUyEVKDzWoXdqUdfL35oLI6seFY
	 vCQAaScui/tE7GxJS7QvCCi5eP+/Tg3qwx5uepfmNSaib+Cxm71Xx9Zlui1nZqVgVw
	 snkOp+xneAfQK66aLvcE8ymsSjDGN3guxSLEQ3rlX4slebai8qWqJsfE2daZ8PDB2a
	 ZSVvyxKz54dtr6WiegSLZOlJ7RddHJViTy1OjgRomahn+F9wC1LXClRLbmvzN8FIk3
	 z8a5U6qCQDA7g==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 17 Feb 2026 13:10:46 +0000
Subject: [PATCH v2] CREDITS: Add -next to Stephen Rothwell's entry
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260217-credits-sfr-next-v2-1-5cb987a4deec@kernel.org>
X-B4-Tracking: v=1; b=H4sIANVolGkC/32NQQ6CMBBFr2K6dgwdpEFX3sOwsGWAUVPMTCUYw
 t0F3Lt8yfvvT0ZJmNScd5MRGli5jwvgfmdCd4stAdcLG8zQZWgdBKGak4I2ApHGBHlZBl8WwaK
 vzTJ7CTU8bslr9WN9+zuFtHZWo2NNvXy2z8Gu3p/8YMFC4V3hco8nzI+XB0mk56GX1lTzPH8BV
 zfrrsMAAAA=
X-Change-ID: 20260216-credits-sfr-next-388cb85c12bd
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, 
 linux-next@vger.kernel.org, SeongJae Park <sj@kernel.org>, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1374; i=broonie@kernel.org;
 h=from:subject:message-id; bh=807BTtE4jt1qTb8P6Qbs5EfBFO92bqPqwlv1+Z4I7z0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBplGjk4yueNG6gYHAz7k69zqBhJGR3gWKoXR+gs
 upV4hjM4nGJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaZRo5AAKCRAk1otyXVSH
 0B2pB/4kocOFjiViUlYv7t94ds6RuQrr8chfonbmDEd4lMfIk79FAdbKmfQ4Z9iOC3SayjhRSjn
 KaLheDGSlLHD5WJ7VG1NwlALBZUdSFzAMJmXSuDjnzP41BgZ86Xf2T4IWJzgwo/8B19xFKTdO2V
 uLOSg2+64ppkkBsacDHll8zA6jfbuusK8gywJzHlYrnas9uRnSVrOhzQE+GPy44FmaBEB84pQus
 kzwyC6rcn7jIhSGiUcdUM6q/TeMf4/MtbrMzkpTX5GDjMuGzivshWPYmO/zxDxxlMH34nioChQz
 qfr4LQ6MWzbT6ZH37z8xGXGiXbLc8D5a2kEnXASdaSJ1TJ0w
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

Stephen retired and stepped back from -next maintainership, update his
entry in CREDITS to recognise his 18 years of hard work making it what
it is today and all the impact it's had on our development process.

Also update to his current GnuPG key while we're here.

Acked-by: Stephen Rothwell <sfr@canb.auug.org.au>
Acked-by: SeongJae Park <sj@kernel.org>
Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
Changes in v2:
- Roll in Stephen's new GnuPG key.
- Link to v1: https://patch.msgid.link/20260216-credits-sfr-next-v1-1-5b6563b29234@kernel.org
---
 CREDITS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/CREDITS b/CREDITS
index ec8a2acf1947..1322673b4610 100644
--- a/CREDITS
+++ b/CREDITS
@@ -3488,7 +3488,8 @@ S: Brazil
 N: Stephen Rothwell
 E: sfr@canb.auug.org.au
 W: http://www.canb.auug.org.au/~sfr
-P: 1024/BD8C7805 CD A4 9D 01 10 6E 7E 3B  91 88 FA D9 C8 40 AA 02
+P: 4096R/5AD24211C060D1C8 D41C A3ED 5B30 275C F5A0  1B05 5AD2 4211 C060 D1C8
+D: Created linux-next and maintained it 2008-2026
 D: Boot/setup/build work for setup > 2K
 D: Author, APM driver
 D: Directory notification

---
base-commit: 05f7e89ab9731565d8a62e3b5d1ec206485eeb0b
change-id: 20260216-credits-sfr-next-388cb85c12bd

Best regards,
--  
Mark Brown <broonie@kernel.org>

