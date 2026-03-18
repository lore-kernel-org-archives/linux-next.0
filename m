Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC7F292B54
	for <linux-next@vger.kernel.org>; Wed, 18 Mar 2026 15:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773848999; cv=none; b=rHwtZnskpp79xBk1/7p0LwUYf0D5rhRWWOUZAtpzlmiW0G18QmDLr5tmQYMSaV0TNDSfUfmMCWZmftYcdAHZX9SuIjNKKnW2h4OeBNs28760TVQVWmNAY5vMlcKeTUnjyzoTQs/wViTqR+Uqh5agEiUEPeu9Ibjsezb+NnDnlRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773848999; c=relaxed/simple;
	bh=JlOu3IxuxQxhTcEAJQYW0u1B7eoV2X8BJFS/ERJefp0=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=B9nS2B9Hyx+AoXhScS7hbuO0B9sZzEUxNuzz84SMrrR31Wxen8dQOhPQ7jNRtwjikAVsXcq7clyCDPTF8LFMjrqT93DlnPBswYca2aEA1wayw2I61R5+RyfOvcT1NKR5EhiJYTv9XOlKqdmR2Leg97fT9s4bWJ38s2shfYYDoSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=cer95wW7; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="cer95wW7"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A5B784E426F5
	for <linux-next@vger.kernel.org>; Wed, 18 Mar 2026 15:49:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6CFC96004F;
	Wed, 18 Mar 2026 15:49:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8FFDA10450528;
	Wed, 18 Mar 2026 16:49:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773848986; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=CbtO5U8FaZ71dSZYe1vxqKTd7QimlGKBm+QnX+YHrdI=;
	b=cer95wW7P12CuQTCVwrWeLkS30amE39NNGi9Gb7re7p2x7pIt+pTmh6fsw3DtAPGmmr2e3
	aLI3pJtjGCEro597k5jO6H9YX6Wqz9iK1JUXrL4Spm9IYBZI454gpC8KHeM+0qCQ5Ma9co
	AmTZVE4eMiCL8vqRtQwVDJCbuq+1Dwg40s1a900Cbwj1w+9uo4KWCkM8FVgpkzMHT77i5J
	7uVWmpVKHcWOXiavWA/cB9Qn0MoL26F9LbPOQrY3ZLU9mBGNOgt+BEKvOSst8NA4W04N1i
	/8M8pwib/fIlTL6WTFyNC1daiHHSjXLCPH3EFmErGA2xm4+9MFqPg3dWGst2BQ==
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Mar 2026 16:49:42 +0100
Message-Id: <DH60ZGTHFMZ5.HOOT9GVR0Q0V@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: linux-next: manual merge of the drm tree with the
 drm-misc-fixes tree
Cc: "Christian Hewitt" <christianshewitt@gmail.com>, "Cristian Ciocaltea"
 <cristian.ciocaltea@collabora.com>, "Daniel Stone" <daniels@collabora.com>,
 "Jonas Karlman" <jonas@kwiboo.se>, "Linux Kernel Mailing List"
 <linux-kernel@vger.kernel.org>, "Linux Next Mailing List"
 <linux-next@vger.kernel.org>
To: "Mark Brown" <broonie@kernel.org>, "Dave Airlie" <airlied@redhat.com>,
 "DRI" <dri-devel@lists.freedesktop.org>
X-Mailer: aerc 0.20.1
References: <abq4YV8QgsmpUoHI@sirena.org.uk>
In-Reply-To: <abq4YV8QgsmpUoHI@sirena.org.uk>
X-Last-TLS-Session-Version: TLSv1.3

Hello Mark, all,

On Wed Mar 18, 2026 at 3:36 PM CET, Mark Brown wrote:
> Hi all,
>
> Today's linux-next merge of the drm tree got a conflict in:
>
>   drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
>
> between commit:
>
>   cffcb42c57686 ("drm/bridge: dw-hdmi-qp: fix multi-channel audio output"=
)
>
> from the drm-misc-fixes tree and commit:
>
>   3ea699b56d31c ("drm/bridge: dw-hdmi-qp: Rework Audio InfoFrame handler"=
)
>
> from the drm tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

The conflict originated as I applied cffcb42c57686 on drm-misc-fixes. I
carefully followed the dim procedure as I know it, so I'm not sure I did
anything wrong, but if I did I apologize.

The steps I did are:

 - dim update-branches
 - dim checkout drm-misc-fixes
 - dim b4-shazam URL
 - dim checkpatch+sparse ...
 - dim push-branch drm-misc-fixes

One thing with this procedure is that dim push-branch pushes first, then
finds out any conflicts. I wonder whether dim could be changed to find any
conflicts before pushing.

As soon as dim push-branch warned me about the conflict I tried solving it
myself as per [0], but the patches on drm-misc-next (3ea699b56d31c) changed
the codebase completely and was unable to sort it out fully.

I at least fixed the conflict at a pure patch application level, so I would
expect the rerere cache would avoid future conflicts.  I was wrong
apparently. It had worked in the past, no idea what went wrong this time.

Then, as far as the original bug is concerned, I notified the involved
patch authors [1] hoping they could find out whether there is the same bug
in the drm-misc-next code and fix it if needed.

If there is anything I should have done differently I'd be happy to know in
order to adjust my process in the future.

[0] https://drm.pages.freedesktop.org/maintainer-tools/committer/conflict-r=
esolution.html
[1] https://lore.kernel.org/lkml/DH58MAETGDMM.2QS6VJDQ7UXIV@bootlin.com/

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
