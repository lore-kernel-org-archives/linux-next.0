Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 489B0271A7C;
	Thu, 26 Mar 2026 13:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774532214; cv=none; b=Y92ZVLb4l+O9P7hDZOAYNcOwYvDrLqEiw0KqALViHr/RnfVhr3g9H81/+GKEl2xI20alJCUpItYX18FSYWRdjXMQrJpsN66jQnkSJ7you64Wym4kqq2A1pR4/l53SmsBEXtGPzMuo+r06fHRrj5Q7cECe+X17+gSdOd6dOW5H7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774532214; c=relaxed/simple;
	bh=cTJScizcuo+nkGoBcEegnzHULeuFDN4v9Nsxyt1voAI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NaSgXIbGjvyG3I4Ylp6xCOIs2qfKj6338I2hCJmCpEzAdrz0IsiTwboDmLtDM3Tf8rE5bEIWVu7lJYc5+IJb78v+6y18GdY92PcAeayEpfrWFUS3FRwn2RMOpbYzLUpENGFGtmmA7SnGtoKh1mX5y0a3Bc2eDQKOOE/GFzfhvWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=goFQpdGV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="goFQpdGV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA118C116C6;
	Thu, 26 Mar 2026 13:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774532213;
	bh=cTJScizcuo+nkGoBcEegnzHULeuFDN4v9Nsxyt1voAI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=goFQpdGVjKljt/oijxaoRcxv3u/ZBjlAmuSpJ2PKzGFyaJ0469nAnbTEgNowDHIV3
	 DzEYPddWBGSOK6k7uxtdK5J3nEBDdNP9FJpXCnNZMs4k/DlQsY/ChCXdDPkgF64Tm5
	 G2ODeehzXDJDVT2zKqLTyIzNPSYjoDU7QMeDTv5/2CLFTVUBOVbuhj4jt9HQKKtzeK
	 TyAZUhPWA53/3r4nfkJzgwTZmU/Ne+0wNVeYP611Nb9Cy4OCzR/GkZOUlhzQUcVV2h
	 upe7C/l3YYTmaSfKVEITytBX8GuGT75+g+iaBZnzF9XKT2oK3Mlk/lss7Rf8Vq0s9O
	 Ixd7HDL3cLckA==
Date: Thu, 26 Mar 2026 14:36:50 +0100
From: Christian Brauner <brauner@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the vfs-brauner tree
Message-ID: <20260326-gefeiert-beschaffen-edf852a3aa71@brauner>
References: <acPV19IY3Gna6Ira@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <acPV19IY3Gna6Ira@sirena.org.uk>

On Wed, Mar 25, 2026 at 12:32:23PM +0000, Mark Brown wrote:
> Hi all,
> 
> After merging the vfs-brauner tree, today's linux-next build
> (arm64 kselftest) failed like this:
> 
> In file included from listns_efault_test.c:23:
> ../pidfd/pidfd.h:229:19: error: static declaration of 'wait_for_pid' follows non-static declaration
>   229 | static inline int wait_for_pid(pid_t pid)
>       |                   ^~~~~~~~~~~~
> In file included from listns_efault_test.c:22:
> ../filesystems/utils.h:47:12: note: previous declaration of 'wait_for_pid' with type 'int(pid_t)' {aka 'int(int)'}
>    47 | extern int wait_for_pid(pid_t pid);
>       |            ^~~~~~~~~~~~
> 
> ie, a new instance of a similar issue (probably masked by the build
> system with the earlier issue).  This is due to a conflict with the
> preexisting wait_for_pid() in pidfd.h triggered by:
> 
>    32f54f2bbccfd (selftests/filesystems: add tests for empty mount namespaces)
> 
> I am continuing to use the tree from next-20260312.

This should be fixed now. Sorry.


