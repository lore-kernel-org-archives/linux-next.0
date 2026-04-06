Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF2AD175A9E;
	Mon,  6 Apr 2026 16:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775493497; cv=none; b=Eko74YLgOZsWYqI4jjEw55K3wMYM2D+7e2uV5ATVVktoeiWIzr2/IUjh1JdOpAbibrcT0rQcIGwKdZJwf/zLRezOqdF9J03fO00HJMm4lRdGtgVV3k33lmcGzAOsmYSlDB37P4chVHT2cBFkiOnauvO9vo33Ii8QRaKO9s/b5tA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775493497; c=relaxed/simple;
	bh=zMouZCiKC8cmLmJ6pk+vFsfeOoCgTOe3l/dHYCZSg70=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=tMecMTzfgx8tQ3BvRI6jq1iu7fsnW3YZeGceSvfJCjjIrTGHEf33UE4Zaw/ECpJOlOBTM0izR4PsJnX7jCHBa5zdNF2d58MFU8GZSEY5TpE29HgxmT46xmbH50NhKxJMaDlgOHcbFZ7G5N5iHQPldwSU49MUJwoAs8Y/brPPOfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DKPB7Kny; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DKPB7Kny"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32347C19421;
	Mon,  6 Apr 2026 16:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775493497;
	bh=zMouZCiKC8cmLmJ6pk+vFsfeOoCgTOe3l/dHYCZSg70=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=DKPB7KnypFUOTVgy2RwSzaNrVXJjAiPwECeACaTAnePf99aUxHGUsX+O2wYDdFY9q
	 mR7y+WeyeUW4FrxdzR2NVLTC901rYMhUZsfU8WbFql1TYVdz7WB/Z11P4y2JDQDPiH
	 +4TSBk1vF4+6BuKck7j5pxmqtj8mXncsdURsXKguw25G0E/6KJ6hrlzQ7aST5ZiZwD
	 QP+qsb7PYtE+oFMHDBAx/XZIjw941tkeV271jS/TMqkbj6X0iUqjP3KODPr5Qyp3Lu
	 u9RVfN+ccerimrmCDcK2Bco2E8lymZPrjVxg5hj9fBCxy1SEFG2kZnLTW1xUxGNJvl
	 gsnlEAUZwrJwA==
Date: Mon, 6 Apr 2026 18:38:14 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Mark Brown <broonie@kernel.org>
cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
    linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: Missing signoff in the hid tree
In-Reply-To: <782cb718-33dd-47c3-b5a4-d95440c2d09b@sirena.org.uk>
Message-ID: <61868409-rs8p-rq71-q852-5296pnp42srs@xreary.bet>
References: <ab096wLbcpu0M-GF@sirena.org.uk> <fa4b8b25-8b34-4314-a7f3-ea7143ed9247@sirena.org.uk> <782cb718-33dd-47c3-b5a4-d95440c2d09b@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 6 Apr 2026, Mark Brown wrote:

> > >   142068281f513 ("HID: input: use __free(kfree) to clean up temporary buffers")
> > > 
> > > is missing a Signed-off-by from its committer
> > 
> > This issue is still present today.
> 
> And today.

Yeah, this happened because Benjamin rebased a tree with commit a that I 
originally comitted and SOBed (the tree has a shared maintainership).

If you strongly believe that this is worth another rebase, I can happily 
do that, but given the fact that it contains signoff of one of the 
co-maintainers, I wouldn't lose sleep over it (but I can be probably 
easily convinced otherwise).

Thanks,

-- 
Jiri Kosina
SUSE Labs

