Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B71994519B9
	for <linux-next@vger.kernel.org>; Tue, 11 Aug 2026 17:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786467703; cv=none; b=XbC7Zlf3GwXdP1tjc6pssavLiY431IbZQx1FAlEbpgKsqOsqcjtgUar0P+J5Hqeps167/Kecs6J2swww9FHLu6Emc90ChNm7QoXu56SQPevUOAYnzfiWVGrValnSUlBwvADfwEIrBVuEup86G0TX5ACijpzvqohdty9o6cK5Bnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786467703; c=relaxed/simple;
	bh=BaPRZOcvLeP6UgdA21KhY5LUDTX49y4aqj4WuNp6wKY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NOyP85kqvhwK4Vjwq02+bjGtQ3vrqfF/kLceRs/rfN5IeW9fFwNyz/Up8oNbZq0CQTqVWxEg7rZssZOwQ9pKofVxOpussRBXzILWhLps91lBCZRNn4H/iZdoxqyt4XDDwy7RPxWtsGJ3VJpqz9p+Bc3Ni25aemAPQhLNVILprqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iSZlZRne; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iSZlZRne"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 575311F00A3A;
	Tue, 11 Aug 2026 17:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786467702;
	bh=XYHdW8tFo+GR6c3ktcII56YZ3CWPV30E4CflgzQaKcY=;
	h=From:To:Cc:Subject:Date;
	b=iSZlZRneXeUN6o+9r5GsA+a19W5lxu2KmHHojlfcOM9JLHkxXM8eWiramk7Dsqizn
	 xIH+CkvYoEzbg2V8tL2OGPMEiT6OoCp0n3gJQrFpGQG86yfrm8Y+Qxm//4lF4/KVWN
	 tdinMakWTIuNGiFy6qY6Tb7itDCbL0UQgNRkzuA34ST6mAT7+N0jsrYJG71DUV5s51
	 +ueon89BOu30L9yETMsTmI9JUqMEcBMPGL86O84FiLO+rGsbVgo1SoTD6C0z2BmPb8
	 HNVEz0KpYddJj033OvVrPkjBZH/Q6eE6Y+JsW6u4N1HiGQrhX67Iec0dGUiMMQDaTk
	 sl7jFRHjQOZgQ==
From: Mark Brown <broonie@kernel.org>
To: linux-next@vger.kernel.org,
	Thierry Reding <thierry.reding@kernel.org>,
	Breno Leitao <leitao@debian.org>
Cc: Mark Brown <broonie@kernel.org>
Subject: [PATCH] next-status: Include a list of trees with duplicate commits
Date: Tue, 11 Aug 2026 18:01:37 +0100
Message-ID: <20260811170137.319964-1-broonie@kernel.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It's possibly interesting to report trees that are duplicating commits,
this tends to be a combination of trees that routinely cherry pick fixes
instead of merging them up and transient issues with trees that upstream as
patches rather than pull requests.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 next-status | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/next-status b/next-status
index c8aa0eb..7403faf 100755
--- a/next-status
+++ b/next-status
@@ -87,7 +87,12 @@ count_tree_commits()
 
 echo Top trees adding commits to -next: >> ${MSG}
 echo >> ${MSG}
-count_tree_commits ${REPORT_SHA1s} 5
+count_tree_commits ${REPORT_SHA1s} 10
+
+echo >> ${MSG}
+echo Trees adding duplicate commits to -next: >> ${MSG}
+(cd ../duplicates/next ; wc -l --total=never *
+ cd ../linus ; wc -l --total=never * ) | sort -nr >> ${MSG}
 
 if [ "${BASELINE}" != "" ]; then
 	echo >> ${MSG}
-- 
2.47.3

