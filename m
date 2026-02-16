Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38AD833993;
	Mon, 16 Feb 2026 17:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771263201; cv=none; b=Hb1TiBSKOCz4wod0QGYc0A2033xU/SznwZgJKcCm1dun6iqKubzJ3vA6DaDeLT/uAwITJ7xzHNAmdX2sH3XiJF1j/YWTdkSvUlWeGsZoEBWNZz5Fi8hTm9XNO6SSC8yKK2YxHRn2WPanSYKc2KLu73Rs6VZp77B0JXrWkHg+4Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771263201; c=relaxed/simple;
	bh=Bax6ANoBKM/898caUFCZZzHugxXTW748y6UV7rd1uEo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=dDYf/GEJRsfPNe82ugrzkWWh9orm55onpiUtlX0ngU9NWp0tzzQbTY8sDtUKJBXy8RK8x3z92Dh6OOCS5/2fBYZvoJz6MRJezTUIxOKsD8bw4mNfbAIqENuCGhNLtd0/OfaHfMAVmtFq5SwSlvdP8F0rcQYVaWZDDsCIOCo9Rog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fUmsGrmh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fUmsGrmh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7F28C116C6;
	Mon, 16 Feb 2026 17:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771263200;
	bh=Bax6ANoBKM/898caUFCZZzHugxXTW748y6UV7rd1uEo=;
	h=From:Date:Subject:To:Cc:From;
	b=fUmsGrmhpCTi8UI90b0VCT7AY0Le4MGZPFcx2iyfwj7P/cn063qmr/1GXgsfsTKKC
	 OiFdO6DCJrBDgx/NB0RWP8I5uzBGxrku2ZVGJ9JwRS7lTruCYTb+a27keXNlYDYz20
	 OZKTEJgZUCM8Ifkh+FnGh80MZpsT+Ym+JTfs0V7pqGIn8NaKpLzPpd+MrjoEPG06Vk
	 uuNcEP8Ioy0Te6wLbD5GTyN3W2u8wsDlzphNNJznfjTMRpf5lqwUxs9qtUVKIu4z64
	 t9BzSI/6XrnAEjn+Uhflg7eeIzkI7qSlS3SZ7HQ5B1UYhkjclLdot5I+doq1ZxO/+n
	 GF7L5yEFOjk4w==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 16 Feb 2026 17:28:22 +0000
Subject: [PATCH] CREDITS: Add -next to Stephen Rothwell's entry
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260216-credits-sfr-next-v1-1-5b6563b29234@kernel.org>
X-B4-Tracking: v=1; b=H4sIALVTk2kC/yXMwQqDMAyA4VeRnA3YDqX4KmMHm0aXHepIuiGI7
 75Oj9/h/3cwVmGDsdlB+Ssma65wbQP0nPLCKKkafOeHzrsBSTlJMbRZMfNW8BYCxdCT8zFBzd7
 Ks2zn8v64bJ/4Yir/DxzHD/y0zAl0AAAA
X-Change-ID: 20260216-credits-sfr-next-388cb85c12bd
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, 
 linux-next@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=912; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Bax6ANoBKM/898caUFCZZzHugxXTW748y6UV7rd1uEo=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpk1Tejkd9zogF226Okydd72BL2eaFeMk5Jy/tA
 w2djc7o+QSJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaZNU3gAKCRAk1otyXVSH
 0EUCB/wOruiIwttIHLNxYbSI/PJFUhAgf9K87fph6YlD6a8VhO6SLM14p5PBh/h9pKAaV4RjN7g
 XzWXdD8wh4hl00enjMLW0Tlqz4W7m3ZJiHBXNULWK+mZlkXzBCcBJUHQ5FSuFEYZPPGUt2zhZJL
 eIrRq6LxDobhQdQ0Ggy8EVULgcmQ8tNUD1x5vOV4WpvDzFl9kLMFKUL7Lj2h1Q5hvv8wQw1Ew6n
 qWG7wnOsLw6/yBtYQqNaw75qgDFragAn5d+/n0NmiN9fF9Vcf18mWR6S8GwkW98ykAEaYvTgfY1
 idhQ7ecowOXR17THSdhkEJ/fGAJsUla3hc7BG1mlU9o2kjne
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

Stephen retired and stepped back from -next maintainership, update his
entry in CREDITS to recognise his 18 years of hard work making it what
it is today and all the impact it's had on our development process.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 CREDITS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/CREDITS b/CREDITS
index ec8a2acf1947..324959909603 100644
--- a/CREDITS
+++ b/CREDITS
@@ -3489,6 +3489,7 @@ N: Stephen Rothwell
 E: sfr@canb.auug.org.au
 W: http://www.canb.auug.org.au/~sfr
 P: 1024/BD8C7805 CD A4 9D 01 10 6E 7E 3B  91 88 FA D9 C8 40 AA 02
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

