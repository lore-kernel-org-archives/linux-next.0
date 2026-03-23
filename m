Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E71388E7D;
	Mon, 23 Mar 2026 15:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774280250; cv=none; b=tP1X7M2wrI0hHRITjLSfkdQDQlO+TS4I5R93wfNseiPJkoqJ3EaHsoQmZRqaI0cZdJc/1nbAysFvU2BMc1zcWG6ZVdxxqCsprgb0XouXk5HzTdXN5ZSV9DuIJXypa9a3Zl87P57iyyaDiWzwrkA0aqM11Ge6GpUuDBc5LT7ORdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774280250; c=relaxed/simple;
	bh=TMHujvxZ/oJ6A9L/a0Srod7FXviAILVmEwoTSJs2wrQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dk7SFxXQxbiY0Q67j2H8dL00JPbEFwlDaUT41/+6BD/RoadzVdsHgbrtI2C5bopJoYTiIVURbkmqxW0r0vGSwzEG+/xtnq1DfmY1jRd8WeoUN141nTdsgNsEWAHfYT+1ywFiwhHPLEbQn1icmlQUzavBLMOJUNv7yQzl41YZDBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fnBhQBAF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fnBhQBAF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 225E8C4CEF7;
	Mon, 23 Mar 2026 15:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774280249;
	bh=TMHujvxZ/oJ6A9L/a0Srod7FXviAILVmEwoTSJs2wrQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fnBhQBAFUoGNGEcWdolRdaLQradh5Sy1jhAYQ8B1jwJpDUPAtB2A80bQlWnvXFsXR
	 tmFKcnU4IptjLpCFV2YyjPammn7FMY/p4hmyHddOIbaFZejFsaxrCe7mt7kNc0I9G1
	 0JHPmsz6hJd/M6TMB8TvsfOWnu8qYMqBHGkbpmHghcaUdTNJ9dYBvlkkKmglXDNnU9
	 6d0ZE/oFO0LAms4204HkzYVQjZKRaoNw/L1m9eEMaUc2HYzhhpdT6H/cx5F1OPcQQm
	 ssqy+w68XH/sDyvzY/HP9KK+sGnvJMFHkcMwoNlDO+Z+KsH/yvCPWXn5HiwR6FYlc7
	 mo0bA1F3E6KSg==
Date: Mon, 23 Mar 2026 16:37:25 +0100
From: Christian Brauner <brauner@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the vfs-brauner tree
Message-ID: <20260323-empfunden-innovation-6caf40d8e6e5@brauner>
References: <abQKe58fc13oRFfB@sirena.org.uk>
 <0eb49c98-13cd-4ad9-87f3-7c7b0ace242c@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="hupxdcqzotiucho2"
Content-Disposition: inline
In-Reply-To: <0eb49c98-13cd-4ad9-87f3-7c7b0ace242c@sirena.org.uk>


--hupxdcqzotiucho2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Mar 23, 2026 at 01:56:59PM +0000, Mark Brown wrote:
> On Fri, Mar 13, 2026 at 01:00:43PM +0000, Mark Brown wrote:
> > Hi all,
> > 
> > After merging the vfs-brauner tree, today's linux-next build (arm64
> > kselftest) failed like this:
> > 
> >   CC       statmount_test_ns
> > statmount_test_ns.c:37:19: error: static declaration of 'wait_for_pid' follows non-static declaration
> >    37 | static inline int wait_for_pid(pid_t pid)
> >       |                   ^~~~~~~~~~~~
> 
> This issue is still present in today's -next, the version of the
> vfs-brauner tree being merged is currently that from next-20260312.

Sorry about this. Fixed now by appended patch.

--hupxdcqzotiucho2
Content-Type: text/x-diff; charset=utf-8
Content-Disposition: attachment;
	filename="0001-selftests-statmount-remove-duplicate-wait_for_pid.patch"

From 418d1c0cdd872493731cf1f10f16a54b38a9ef57 Mon Sep 17 00:00:00 2001
From: Christian Brauner <brauner@kernel.org>
Date: Mon, 23 Mar 2026 16:31:30 +0100
Subject: [PATCH] selftests/statmount: remove duplicate wait_for_pid()

Remove the local static wait_for_pid() definition from
statmount_test_ns.c as it conflicts with the extern declaration in
utils.h. The identical function is already provided by utils.c.

Fixes: 32f54f2bbccf (your "add tests for empty mount namespaces")
Cc: <stable@kernel.org> # mainline only
Signed-off-by: Christian Brauner <brauner@kernel.org>
---
 .../filesystems/statmount/statmount_test_ns.c | 25 -------------------
 1 file changed, 25 deletions(-)

diff --git a/tools/testing/selftests/filesystems/statmount/statmount_test_ns.c b/tools/testing/selftests/filesystems/statmount/statmount_test_ns.c
index 063d9de46431..e500905e4c07 100644
--- a/tools/testing/selftests/filesystems/statmount/statmount_test_ns.c
+++ b/tools/testing/selftests/filesystems/statmount/statmount_test_ns.c
@@ -34,31 +34,6 @@ static void handle_result(int ret, const char *testname)
 		ksft_test_result_skip("%s\n", testname);
 }
 
-static inline int wait_for_pid(pid_t pid)
-{
-	int status, ret;
-
-again:
-	ret = waitpid(pid, &status, 0);
-	if (ret == -1) {
-		if (errno == EINTR)
-			goto again;
-
-		ksft_print_msg("waitpid returned -1, errno=%d\n", errno);
-		return -1;
-	}
-
-	if (!WIFEXITED(status)) {
-		ksft_print_msg(
-		       "waitpid !WIFEXITED, WIFSIGNALED=%d, WTERMSIG=%d\n",
-		       WIFSIGNALED(status), WTERMSIG(status));
-		return -1;
-	}
-
-	ret = WEXITSTATUS(status);
-	return ret;
-}
-
 static int get_mnt_ns_id(const char *mnt_ns, uint64_t *mnt_ns_id)
 {
 	int fd = open(mnt_ns, O_RDONLY);
-- 
2.47.3


--hupxdcqzotiucho2--
