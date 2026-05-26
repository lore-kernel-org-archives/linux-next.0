Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 246513FF1C5;
	Tue, 26 May 2026 14:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779805817; cv=none; b=j4eqVgng5iFefuKf188hByoZfSFE0swRs6AmyDVrzh3U7DxzmotlkIB6HySlXROEVjflb6d/fqtQqRRgZ4fBZketlMbTWuiwF2fT22ljvS94Dof/bGcnFdACswGmLp8ccrHJt/XRVkVOeAO9MxVhN9NsNo2NQpDHtifHW42t9Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779805817; c=relaxed/simple;
	bh=3+MJ8ML6EvDCNYaTPPKELEpJS/+pniAbHtJqfws/0lA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HWgQybWgBKFwCMBYjqDTJoSBL82k5/Fjq2bLAUrkfEpy61p5W8AwV5nTwgeDljiro+CGSTiw/FtQZvLBiQY751mHU2DjSzM+f7DzjJy8Es31xRnN7gYexhBBSoQvSUuAdS2gVGIIkpluWQzvabZWLY+VOVIdE5DjDI/VuQc0WQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bcuBpWfG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bcuBpWfG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CA111F000E9;
	Tue, 26 May 2026 14:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779805815;
	bh=c+QsG/S1mvvtYLuQTbfpwMTsMNJNpZVRf/rj/KieD+E=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=bcuBpWfGFo/LVKeJ63g8JWPrDJb2bC6yVlnA1u1l9SP5CL9FaCXQNArtTRFuMhi6p
	 gJ/TtAcpVg+PAJpC4EFsVzkjrFPYvwXRK0f3pEzFmTmSzcrn4DjCP1rpj7pYFOfMmX
	 M5WXpA4xKVtHGoKgMy5BlBhpnxwZowZd5M3yBHdq55h4IzhoH0jeO+vDts3ekN8vV8
	 YllJbP2wqjp4IoYTnikjnXyIGBvLdqtUcTWH+EN8RMTxKGl2bV+pflBH3x7PvA+6Ma
	 Manj/CEtS6O1L1DuzEee/OoPbdKt310qWkfuCazOZkVMli7kAQ6LE45es+fvlPfy7T
	 v3vvOetAO1HBg==
From: Pratyush Yadav <pratyush@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Mike Rapoport <rppt@kernel.org>,  Andrew Morton
 <akpm@linux-foundation.org>,  Pasha Tatashin <pasha.tatashin@soleen.com>,
  Pratyush Yadav <pratyush@kernel.org>,  Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>,  Linux Next Mailing List
 <linux-next@vger.kernel.org>,  Luca Boccassi <luca.boccassi@gmail.com>
Subject: Re: linux-next: manual merge of the liveupdate tree with the
 liveupdate-fixes tree
In-Reply-To: <ahWlYXNjGUbkKoHy@sirena.org.uk> (Mark Brown's message of "Tue,
	26 May 2026 14:51:29 +0100")
References: <ahWlYXNjGUbkKoHy@sirena.org.uk>
Date: Tue, 26 May 2026 16:30:12 +0200
Message-ID: <2vxzjysq451n.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi Mark,

On Tue, May 26 2026, Mark Brown wrote:

> Hi all,
>
> Today's linux-next merge of the liveupdate tree got a conflict in:
>
>   kernel/liveupdate/luo_session.c
>
> between commit:
>
>   da7f658ccc8da ("liveupdate: validate session type before performing operation")
>
> from the liveupdate-fixes tree and commit:
>
>   d6b3d47bdaf89 ("liveupdate: add LIVEUPDATE_SESSION_GET_NAME ioctl")
>
> from the liveupdate tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks! I did foresee this and was planning to send a fixup that we can
meld into "liveupdate: add LIVEUPDATE_SESSION_GET_NAME ioctl".

I suppose one option is to wait for "liveupdate: validate session type
before performing operation" to land into v7.1-rc6 and then rebase the
liveupdate/next branch on top of it and fix the conflict ourselves. This
gives around 2 weeks for the rebased branch to soak into linux-next
until we send the PR. But I am not sure if this is enough time or if we
should just let Linus deal with this...

>
> diff --cc kernel/liveupdate/luo_session.c
> index 74c39d93d45a1,1caaa7886ec6d..0000000000000
> --- a/kernel/liveupdate/luo_session.c
> +++ b/kernel/liveupdate/luo_session.c
> @@@ -293,15 -306,9 +306,16 @@@ union ucmd_buffer 
>   	struct liveupdate_session_finish finish;
>   	struct liveupdate_session_preserve_fd preserve;
>   	struct liveupdate_session_retrieve_fd retrieve;
> + 	struct liveupdate_session_get_name get_name;
>   };
>   
>  +/* Type of sessions the ioctl applies to. */
>  +enum luo_ioctl_type {
>  +	LUO_IOCTL_INCOMING,
>  +	LUO_IOCTL_OUTGOING,
>  +	LUO_IOCTL_ALL,
>  +};
>  +
>   struct luo_ioctl_op {
>   	unsigned int size;
>   	unsigned int min_size;
> @@@ -323,30 -328,15 +337,32 @@@
>   
>   static const struct luo_ioctl_op luo_session_ioctl_ops[] = {
>   	IOCTL_OP(LIVEUPDATE_SESSION_FINISH, luo_session_finish,
>  -		 struct liveupdate_session_finish, reserved),
>  +		 struct liveupdate_session_finish, reserved, LUO_IOCTL_INCOMING),
>   	IOCTL_OP(LIVEUPDATE_SESSION_PRESERVE_FD, luo_session_preserve_fd,
>  -		 struct liveupdate_session_preserve_fd, token),
>  +		 struct liveupdate_session_preserve_fd, token, LUO_IOCTL_OUTGOING),
>   	IOCTL_OP(LIVEUPDATE_SESSION_RETRIEVE_FD, luo_session_retrieve_fd,
>  -		 struct liveupdate_session_retrieve_fd, token),
>  +		 struct liveupdate_session_retrieve_fd, token, LUO_IOCTL_INCOMING),
> + 	IOCTL_OP(LIVEUPDATE_SESSION_GET_NAME, luo_session_get_name,
>  -		 struct liveupdate_session_get_name, name),
> ++		 struct liveupdate_session_get_name, name, LUO_IOCTL_OUTGOING),

FWIW, this resolution is wrong. It should be LUO_IOCTL_ALL here.

>   };
>   
>  +static bool luo_ioctl_type_valid(struct luo_session *session,
>  +				 const struct luo_ioctl_op *op)
>  +{
>  +	switch (op->type) {
>  +	case LUO_IOCTL_INCOMING:
>  +		/* Retrieved is only set on incoming sessions */
>  +		return session->retrieved;
>  +	case LUO_IOCTL_OUTGOING:
>  +		return !session->retrieved;
>  +	case LUO_IOCTL_ALL:
>  +		return true;
>  +	}
>  +
>  +	/* Catch-all. */
>  +	return false;
>  +}
>  +
>   static long luo_session_ioctl(struct file *filep, unsigned int cmd,
>   			      unsigned long arg)
>   {
>

-- 
Regards,
Pratyush Yadav
