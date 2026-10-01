Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01F9A38B122
	for <linux-next@vger.kernel.org>; Thu,  1 Oct 2026 20:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790887781; cv=none; b=Px/5/cuzMPi26kXgejglADXEzYnkQXFvDoAjlAJRjpeJb4PT9O0BAJR2ur9GQxjKi7cmxWqBSlMxzC6sG1qlFj9w8p2CCegHYGyRx3Hh3s7BprWatH5jNu/ek8hQ7W2XWPw0W+rQZadlWrgCIYlfWQYpxrdq2+K5ItrEhttQFXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790887781; c=relaxed/simple;
	bh=lQLYSulu+INzPkcRHOYKO3LmgaWFC0RQc6vwZli6AS4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Hrn9B3b4cNAFLMPCm7hm9qpwrT3v+UgPw8PtruuHZ5bNoqO9hzVqKg5RC2iYIde3XrXLjfAbBujvltncyGREjRE45Sfd1BuFLlTXfE7kagyROeF3C3okT+d82LoU02fmxGDJYD0uj108ZXZKZP/gFvxv6fR7/WIlO6HPSQ1wXHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h18K/9Kj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h18K/9Kj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 981FF1F00899;
	Thu,  1 Oct 2026 20:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790887779;
	bh=mTrV/CCA8S51C41GuT94H4njxTjYb3lZoCizSNePsTM=;
	h=From:To:Cc:Subject:Date;
	b=h18K/9KjAfBNx33lWukqVCmr9d/DPEx8xz9UMbaUSzC6A0tEU/xJ6BZ+a83wh1gBc
	 JVkocnI+VUk3mNbuiV3NsJCG8OWSS0x1MEnVItH+cDEanqzqNjUVcIQkd6DMZh71fI
	 g0ul1Hngr/f4/eMsOmIWXv/DGgAi/ABZhO0mmy/OVy4QSJDWUS+zil4MXsojSRXcUM
	 JX7cn2I6ETjtc3XCk45YEMUtIg3gNDMGMC1uIkwv38eXgL5ktXZR1faCiUOXJiioyM
	 K5hgcOah1y7D09ZoVUM0uP8N5Usm5qN34q/auz1seF+NIRB7VFLFTgpq4gdSbj461j
	 EsEwUBsb/zmlQ==
From: Mark Brown <broonie@kernel.org>
To: Breno Leitao <leitao@debian.org>,
	Thierry Reding <thierry.reding@gmail.com>
Cc: linux-next@vger.kernel.org,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH] merge_msg: Gather the email addresses for the conflicting tree
Date: Thu,  1 Oct 2026 21:49:35 +0100
Message-ID: <20261001204935.635681-1-broonie@kernel.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We have a list of conflicting trees and the contacts file, do the lookup of
the contacts programatically. Skip doing so for the origin tree since it's
not generally too interesting to tell Linus about these things, and rely on
the sending MUA to deduplicate addresses.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 merge_msg | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/merge_msg b/merge_msg
index f781e0b..e95cbaa 100755
--- a/merge_msg
+++ b/merge_msg
@@ -46,6 +46,16 @@ if [ "${#hb[@]}" -gt 1 ]; then
 	hbs='s'
 fi
 
+# Rely on the sending MUA to dedupe
+for b in "${hb[@]}"; do
+	if [ "${b}" = "origin" ]; done
+		continue
+	fi
+	bc=$(../tools/get_contacts ${b})
+	IFS=',' read -r -a addrs <<< ${bc}
+	cc+=("${addrs[@]}")
+done
+
 printf -v subject 'manual merge of the BRANCH tree with the %s tree%s' \
 	"${hb[*]}" "$hbs"
 printf -v update 'The BRANCH tree acquired a conflict with the %s tree%s'. \
@@ -72,8 +82,7 @@ if [ "$#" -gt 1 ]; then
 fi
 
 "$tools_dir/message_helper" "${branch[@]}" "$subject" "${cc[@]}" <<EOF
-FIXME: Add owner of second tree to To:
-       Add author(s)/SOB of conflicting commits.
+FIXME: Add author(s)/SOB of conflicting commits.
 
 Today's linux-next merge of the BRANCH tree got $conf in:
 
-- 
2.47.3

