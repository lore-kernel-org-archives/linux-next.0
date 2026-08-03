Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 321DF4334C9;
	Mon,  3 Aug 2026 18:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785783582; cv=none; b=iwAfh0AaPubTGPTLhawhQNXHEd9X9dFMCwLZx7G5PDNFVH9RRV2txCaR9pAFXhDlMTBCl22YuH8jMD79R9imABwCz1dXuVXJChCEyXlaais+y9hzdkt+nS/x9+IkwCpnCkb9paD06Anciy73E6h8IQHV0H7cnlkFfLqLYXmSipc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785783582; c=relaxed/simple;
	bh=Rx1ggbyIYzuJ+5Yidzz/C0X0C/+8qhqDmkJ8h+fJxHs=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=GOFzoGhvkUVJ6ziWomqSG6fu2UmY0PPe857/ANzKtv/S7gX4cg4KIViHOzAomLDkfxyrJjXCqRL45ZhI8q4QAK0yyYd6c7Hv5vmK10gsc1VSyeUMPYEXYsI95aTj7zmW4Nhgfufz4PWz6YuIrI/MqFgi9HgfpKb0X3udlkKla/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MljL1qMG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MljL1qMG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D05561F000E9;
	Mon,  3 Aug 2026 18:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785783580;
	bh=Rx1ggbyIYzuJ+5Yidzz/C0X0C/+8qhqDmkJ8h+fJxHs=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To;
	b=MljL1qMG7h0ulUQLqEvDwnwJlROOGFegS0K+ZaHKA4IwdFIUF6aCpv1dw/uSLUTsT
	 zQn7JVkn6PRfus86if+cajAfFFqdDDM8ARjuMN4bKZWSTHNYADazl11BT0YSPvWVrv
	 Hzj59HP6Lah0DZqlwlZBAc5dGebJQ1gD7umUCae9yWVe0+y8sTWnnIkU+txCf56dtn
	 8+qgUSBDuMOJn5kGOghvlouNDiZ7l7iWIdr596+TcFFj5127imxYGgQLyzA52a/i6s
	 CBh0R/u6nEOLIU7+GfrXmqWSvlZTmQwYN7/WiBL0SQMgH6nYobjNqSCIc33Ieaxu2Y
	 bhCsDkHmyGNoA==
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 03 Aug 2026 20:59:38 +0200
Message-Id: <DKFJG2CUQNTO.1920BDJLFN0UY@kernel.org>
To: "Mark Brown" <broonie@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: Missing signoff in the driver-core tree
Cc: "Greg KH" <greg@kroah.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-next@vger.kernel.org>
References: <amZFO8eUhS9xhfCs@sirena.org.uk>
 <36b6f2b8-f5dd-4629-b3d8-17f1b884594c@sirena.org.uk>
In-Reply-To: <36b6f2b8-f5dd-4629-b3d8-17f1b884594c@sirena.org.uk>

On Mon Aug 3, 2026 at 7:25 PM CEST, Mark Brown wrote:
> This issue is still present today.

Thanks for reporting; as mentioned this is from dropping an unrelated broke=
n
preceeding commit from driver-core-testing.

So, technically those commits got rebased before things were propagated to
driver-core-next. However, we are usually not rewriting the history of
driver-core-next.

Again, sorry about that.
