Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3E03EC2F4;
	Tue, 31 Mar 2026 09:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774948902; cv=none; b=ETmJEYQKxo44V4Bf2zuTeorL/yHX1FGQfsPoZGP2XXh3JjCMSK6z2IIOXbEUsAAU8wVNq0AXN3ASAaj29HCnF4gal44OCKs81FlVc3XTeluo40IpWQjwa+KSIbAHdY4kM+JnyXA7bu2VPiozH9CjFisluviupZ090IJ6cwzqR1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774948902; c=relaxed/simple;
	bh=Jyr0HxPHf3ZmsPGwifgt9XWR69TJgtYhGG49YXLWQRE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xy//gnaFu7357QpYGpET95s3wwAuNWBvEAk+jQYMu5L4zAUfHfnOP9SvDGfmvVp+yg/LXldQ/oW8c2AOHyS1fboLIT84LK1rekZfQZi9WGmPnWMRtNGI2uxyUu8S6LNDDZ2zP4rHyoxibIxek7djUx97HNQaVwzyY3gOzfzHrI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dUKB0HRw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dUKB0HRw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42B6DC19423;
	Tue, 31 Mar 2026 09:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774948902;
	bh=Jyr0HxPHf3ZmsPGwifgt9XWR69TJgtYhGG49YXLWQRE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dUKB0HRwjLtZ4YtHbLMEhmZ5J2SgqSa7wcYXnEyobnjbHRJ+mfIE6CEgM+J+95as9
	 stfVIaE/VfzFeDQT6ceQzBD9OkAifz13xrEEaUwMEkAE4KTSyHFeYe9tLI+JHRsHij
	 o5VVEy41lsfFaf9PsFsrhjGnpe+rbu8I+WUQ0m1tmC3d+FzEkQsYmlBMQM6c0LMqYF
	 vGbqEYsMkmYaucL1HMx5QNiC+V2rP2wq5clP8lsAml8oJ+hp3n+MGKcRx+Bq1yDbtX
	 6JU7zPq7/pAcNU/HHwarMvmQeUyYLu/J6/1R3cDMJcZGABswgAMakAWwJtmX7CJAXr
	 bFC5r5BgQaGKg==
Date: Tue, 31 Mar 2026 11:21:38 +0200
From: Christian Brauner <brauner@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the vfs-brauner tree
Message-ID: <20260331-mondphase-schwalben-72b291049031@brauner>
References: <acPV19IY3Gna6Ira@sirena.org.uk>
 <20260326-gefeiert-beschaffen-edf852a3aa71@brauner>
 <acbDBxR6tgO6WzCB@sirena.co.uk>
 <bdfb46ce-1585-4c42-af55-a2202aa4ee9c@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="u72fpjal2tpzleo4"
Content-Disposition: inline
In-Reply-To: <bdfb46ce-1585-4c42-af55-a2202aa4ee9c@sirena.org.uk>


--u72fpjal2tpzleo4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Mar 30, 2026 at 02:17:32PM +0100, Mark Brown wrote:
> On Fri, Mar 27, 2026 at 05:48:55PM +0000, Mark Brown wrote:
> > On Thu, Mar 26, 2026 at 02:36:50PM +0100, Christian Brauner wrote:
> > > On Wed, Mar 25, 2026 at 12:32:23PM +0000, Mark Brown wrote:
> > 
> > > > In file included from listns_efault_test.c:23:
> > > > ../pidfd/pidfd.h:229:19: error: static declaration of 'wait_for_pid' follows non-static declaration
> > > >   229 | static inline int wait_for_pid(pid_t pid)
> > > >       |                   ^~~~~~~~~~~~
> > 
> > > > I am continuing to use the tree from next-20260312.
> > 
> > > This should be fixed now. Sorry.
> > 
> > I'm still seeing this today.  I have:
> > 
> > 84f524dca4b8bc9e9aca8ea1dbbd2aa3a239d998 Merge branch 'namespaces-7.1.misc' into vfs.all
> > 
> > as the vfs-brauner tree, I'm not seeing any new patches to the test case
> > there.
> 
> Still seeing this today.

Sorry, this was _yet_ another callsite that completely duplicates
wait_for_pid() for whatever reason. The following patch should fix it.
I'm adding this to vfs-7.1.mount today.


--u72fpjal2tpzleo4
Content-Type: text/x-diff; charset=utf-8
Content-Disposition: attachment;
	filename="0001-selftests-namespaces-remove-unused-utils.h-include-f.patch"

From ef6960362e5b33402b9977972ab2a9fabc4c8cb9 Mon Sep 17 00:00:00 2001
From: Christian Brauner <brauner@kernel.org>
Date: Tue, 31 Mar 2026 10:58:58 +0200
Subject: [PATCH] selftests/namespaces: remove unused utils.h include from
 listns_efault_test

Remove the inclusion of ../filesystems/utils.h from listns_efault_test.c.
The test doesn't use any symbols from that header. Including it alongside
../pidfd/pidfd.h causes a build failure because both headers define
wait_for_pid() with conflicting linkage:

  ../filesystems/utils.h:  extern int wait_for_pid(pid_t pid);
  ../pidfd/pidfd.h:        static inline int wait_for_pid(pid_t pid)

All symbols the test actually uses (create_child, read_nointr,
write_nointr, sys_pidfd_send_signal) come from pidfd.h.

Reported-by: Mark Brown <broonie@kernel.org>
Link: https://lore.kernel.org/all/acPV19IY3Gna6Ira@sirena.org.uk
Fixes: 07d7ad46dad4 ("selftests/namespaces: test for efault")
Signed-off-by: Christian Brauner <brauner@kernel.org>
---
 tools/testing/selftests/namespaces/listns_efault_test.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/testing/selftests/namespaces/listns_efault_test.c b/tools/testing/selftests/namespaces/listns_efault_test.c
index c7ed4023d7a8..b570746e917c 100644
--- a/tools/testing/selftests/namespaces/listns_efault_test.c
+++ b/tools/testing/selftests/namespaces/listns_efault_test.c
@@ -19,7 +19,6 @@
 #include <sys/wait.h>
 #include <unistd.h>
 #include "../kselftest_harness.h"
-#include "../filesystems/utils.h"
 #include "../pidfd/pidfd.h"
 #include "wrappers.h"
 
-- 
2.47.3


--u72fpjal2tpzleo4--
