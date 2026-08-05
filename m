Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE22349CD2;
	Wed,  5 Aug 2026 12:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785933293; cv=none; b=jkGIOU0/ImPyRzXimvQiqL8H4wuOSKJdrM6girRVbWoO8em4VZkJleC1WTiCRc1gB53KB64i9JqaKPnA0u6yhFHbqnX+hvSsn4BBls0aQ7/2fAxp4FEUxrPc27WXjwHF2hykiRK/ed7FQoeSpSa0tC7Va3bSUHrOEE3ItPps60k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785933293; c=relaxed/simple;
	bh=aGB0wNZOl3JADknd+L+KV0AFcfT5YPyZ18fe6yTI7NY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q82yhnJNKwen/0ugMJvS1/TmdubXeaC8pDmBXXfdiZwj8zI/2I5eTeoluxUf+HTT9Ey2M8yCVcEj1bLoSczk23O+NuBUQSn02rYjFAu1MWB5gMd6k4jiWnOQT7FubvmTKQy51Zz4xtx14pUpPyOnYP5w91smS/xhYPpT3SDhZNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G7tZTBPt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G7tZTBPt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7AAB1F000E9;
	Wed,  5 Aug 2026 12:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785933290;
	bh=1Px15NtV2yzJ1AgiDDXE7qklYgx87sLpBXfXQ/aTEbw=;
	h=Date:From:To:Cc:Subject;
	b=G7tZTBPtdWBa2YS9h/523fHCIqKtvC0rGn11q+nRksgKJXDPh7pR+fDDozPnX0NHi
	 BALxzTmQTXpZvfXpJ0mYcSGcxHLS9lOGLYxbk5yhed5YLc3kiXPJyPUYB2Wu4oAcpg
	 03ztTDIxjY873qAhIYnv6iw4PomTvzukLHO0vKNJTDcpvk15wKL9Id7Oggu762p5fJ
	 nal+6469zsKuGsbOl7R2Ha5ytX1JLET9Nw6HbbpzHUTDI7h1MhobEoqdaIUPEsdY2Q
	 xTAz/Lc/ZvY6bwVU/HpHzw0VMdLYXhaG15U29ZSFwzu6qM2qtwiUbkc/OmB4WxaqZ9
	 LQJvaR/Okc+ew==
Date: Wed, 5 Aug 2026 13:34:46 +0100
From: Mark Brown <broonie@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Christian Brauner <brauner@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Willy Tarreau <w@1wt.eu>
Subject: linux-next: manual merge of the jc_docs tree with the
 char-misc.current tree
Message-ID: <anMt5iPbjY3hxA6Q@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Today's linux-next merge of the jc_docs tree got a conflict in:

  Documentation/process/coding-assistants.rst

between commit:

  3d7c44f73765d ("docs: coding-assistant: explain important steps when looking for bugs")

from the char-misc.current tree and commits:

  d699a5da10394 ("docs: link AI coding assistants and tool-generated content pages")
  816d9992d9ed4 ("coding-assistants: simplify attribution")

from the jc_docs tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc Documentation/process/coding-assistants.rst
index e71df7d28467e,e62c9577d91a2..0000000000000
--- a/Documentation/process/coding-assistants.rst
+++ b/Documentation/process/coding-assistants.rst
@@@ -56,41 -56,4 +56,41 @@@ Basic development tools (git, gcc, make
  
  Example::
  
-   Assisted-by: Claude:claude-3-opus coccinelle sparse
+   Assisted-by: LLM coccinelle sparse
 +
 +Procedure for finding and fixing bugs
 +=====================================
 +
 +When an AI assistant is used to find and fix bugs, it **MUST** follow at least
 +these steps:
 +
 +1. Before starting, read the whole process documentation listed above, as well
 +   as any other document mentioned in the request. Do not rely on isolated
 +   parts found by keyword search.
 +2. Note the commit ID and Locate a bug as instructed.
 +3. For any bug found that is not trivial, verify that it looks real by
 +   attempting to create a reproducer to demonstrate it. Lacking it may cause
 +   the report to be ignored, as many unverified bug reports sent to maintainers
 +   happen to be invalid. Stop here if it finally looks wrong.
 +4. Write a fix for the bug. This part is not optional: except in a few very
 +   rare cases, an AI assistant able to find a bug is able to fix it. Note that
 +   fixes written in the same session as used to find the bug will generally
 +   lead to better and more accurate fixes as the LLM's reasoning context
 +   remains present.
 +5. Build and verify that the fix works either using the reproducer or by
 +   re-running a complete analysis; drop any fix that doesn't work and try
 +   another one. The fix must not add build warnings and must pass the
 +   checkpatch.pl checks (see submitting-patches.rst).
 +6. Commit the working fix with a detailed message describing the problem, the
 +   solution and a Fixes tag. Do not add a Signed-off-by tag, and add an
 +   Assisted-by tag, as described above.
 +7. Identify the maintainers and lists using scripts/get_maintainer.pl.
 +   Documentation/process/security-bugs.rst shows how to do that.
 +8. Indicate what could not be done. If the fix could not be built or tested, or
 +   if no reproducer could be produced, say so explicitly: maintainers currently
 +   waste too much time analyzing unverified reports and untested fixes.
 +9. Read Documentation/process/threat-model.rst to determine whether the bug is
 +   a vulnerability or a regular bug, and leave the result to the reporter for
 +   review (the assistant must never send anything itself). Regular bugs are
 +   submitted as described in Documentation/process/submitting-patches.rst,
 +   vulnerabilities as described in Documentation/process/security-bugs.rst.
