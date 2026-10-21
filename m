Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792614494;
	b=pZqzyD9MapQqVk+nzcBYnaPdzxRsJabmMYt/89LU/Yw0I18/V8zNKeYX/BsCLkwL+sNA
	 DMbpc4wuhYZZXylB5R3ZsbciERAZwKg9nCDuSI/WQO1nBs1KiKlHmdWnA/tEKGlELJ7Nl
	 0+7olrKXhJyY9WdxlyvbppFzL6FLmsB1uQIIzdtfGO+iqXKBKrpAWPtXBwvFTieTS5CJ7
	 5t3UFhiNoNI9IkY1wkNHRQMiBTpnLNxKIi3qSBLJ9T4iccVAGCnYjthdbIuqoVWqHQR7h
	 HZsAgSurVGyRJaI5MeW9Vs+UUXMCQzeTNI7Kn4h50bvPDhY8yxzJ5tfrzo18OFcjAsg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792614494;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=0puJpnNmDvGtBriXSLRhq4RtO307HXFeqwawArp0hCM=;
	b=Y9SbxTZbWmnB9insWQJRq8hOc+QHDRLbV0050Swyk33JQTARP3/qJCzz39tXqEm+zc9Y
	 3UDkeH5g0uGl7k+hz4OcbOtvqY4Cn/cnvwj0pB2O9BBzFgBJmhqHoVbx5VDrTrtgTSdnP
	 ZnUWdTo2Hx4LUSkNor/HTuDeR2nxkKz6XE/VWCX50hvNK/CI9sV4qVGNxO5lAnA7UaafV
	 WfEMTf0huCbTHPWTJoLaIcBQYVwI09MIpulO9mawrwKYPR5rpnREh0rjuRhbeUaHdOH3z
	 MYn1IDK6Z9E/E19iXo8Qc1B3S8p2y7jansUU6c4CVMpn4gdtRd3P/Pq30SKc8mnYCVg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=URXmPl2z;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEFCE606A31B
	for <linux-next@vger.kernel.org>; Wed, 21 Oct 2026 20:28:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEFCE606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=URXmPl2z
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b1d8944cb0so1765668a12.3
        for <linux-next@vger.kernel.org>; Wed, 21 Oct 2026 13:28:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792614492; cv=none;
        d=google.com; s=arc-20260327;
        b=nE9gVdMve1g19oUy8nlFfSQXy6/i7qwkkwPphW22WEAUEW3EuVsymZwqKbYrApU1ff
         E2LpTFXekXU7ivNRIYBlPonuYTFcpgusJODQJ/rIzC89wAHKHu2JwBsIc9O8WpjUusyo
         0eEEJYl5oMwqkLvZICzjbv918737CNN+rUuxjrk8QvrLb6W3IIzW7DSBb9LTUPXyh4AW
         MEJS3R2y2/hTwH/SJcz+0lJNJaxxpLXjujHDRonJpShwDKlEomql1BULLyxbKEqw1yiE
         9DfsZ/3ur92ycRfEcUbIYEsXQg7+PUWwlnKBXZ2Yhq1kwHNkDURwIuErSTyPfqkR8mCK
         8o4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0puJpnNmDvGtBriXSLRhq4RtO307HXFeqwawArp0hCM=;
        fh=SABnHh5Ifj86WQsG+2dZDIDjK4UlqpxY2nNqBK5oyU0=;
        b=oGtQgSS+xgBAO7YMuJCUBWlyaqEo0s4UfUD6dJNpKMYzqGOI6J+A/jt8oNeMBguJQY
         2vn8/FNNWSN6hh0xf6n8Lw9kC2b9DgLyIEci5jsnMpGFzIXsgOMud6+2+VXJ/4/us8q9
         pFgabHRaxSZeo0EUe5gdeo/V0SH1ky6pxMSkWmAo99ZMSl3QVV5OvrNgWULQU3ctFUM0
         qyKAISTo+ZXTzM77wnjrN+cf743zdj2/H2IsveJslVHiDBKmO4CLydKXuwP658b/ybG+
         Rgv3S5A2lWCsNovD+o/8OKC/LsaRrKmroykATPlemhKEHtyWoU3AmK/okw9jCE2t4RrR
         ftKw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792614492; x=1793219292; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0puJpnNmDvGtBriXSLRhq4RtO307HXFeqwawArp0hCM=;
        b=URXmPl2zu5AaaNBg5ooC/iK7NTyySYtNXsaKySb9/H4Qw9911yJ2jwmHAn7350jJg/
         a2eSFgcfyZdyJRR5KOa/C7d9K5YOCA1vn4EMJYxfrubzWly4MIamaeyZZqOsJhQ5na1n
         ifR7aLm1Mq89DwJhJHOa6AjfRjuV2xrDd2m3O7Q5tIYD2xWa3PnAw3rIMmro6/CZC/sb
         cgeTRHoT8dsscKPO69TKUfMAo+skotHEBliFKK+PfOpdLRT6I6Yz/qPr9lRHyQrnsplp
         75gkO34utiegY/F2CYlPwaXxPgSki0RAvGQUTb1aS+ql1Fo0q0HYeRoSqdnVnAEZ1yD0
         PFpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792614492; x=1793219292;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0puJpnNmDvGtBriXSLRhq4RtO307HXFeqwawArp0hCM=;
        b=QrBkSwsXcV+7qG1y+Ws1RL5EnpZwovXvw2NuAmEs/OtBE3HNKgjQS53GKOaZwrlOAT
         cub6jmVlMQKiduwl78seCIeoypBxlGR5y6635n4nO1XIu1W72wzjB3w9xwh6SaWgKfty
         8niAWmpVXLJTwOrJLVR1Z9aTEJHI1qVXsCNlleNTbyDmgtruAbnRYPZx9/+017r2zd2x
         Cx80zn0b5YEgyyC1scamJea1gbrocvxvkJYo69AOmhUVMFibYPFlxbdvX2TOasfa75zV
         1KksTxbfaeiQwACCH3LmFaTJRKEBPCCg8Dm0qjP6Lf/nM1KqTQDJCWeEX1cdY+EWq3VM
         7XcA==
X-Forwarded-Encrypted: i=1; AKwUvByeXrasPWuKOU+R2YWgus0fVt8ZKewBfyLh8kxkWezNc8/x8TQHhFteoYadwrEoqWjEfO9yEhzhOpKF@vger.kernel.org
X-Gm-Message-State: AFq9FYLywG29CTtx/VcWG+OJCoNM3q9XvKbIqmVairaATxjCXGGPBBgK
	MQndh/gYpgqj3g1rBBo8TgAuyzoe0wOGRvKWtZIERdGojAVPryNw9vcLFfs9vJb89gzwAwofuhq
	MFFCbGiqqCszWrXFTxpSndgd4U5RRa+s=
X-Gm-Gg: AYBFou1Schw5mGeBPJYEZ/Ex1Ptgszgg979sRmxglEm4/Mvy+06Ic5precM6GyzFqNf
	8vgS/FKtMkC0sQSMgyDzT8egES9W77B8kVo5RfNtLJ6m0zSyIFXd7L21oII1qn9aYBBGwvuqnjl
	COaoHp4PlV/+Vu5+kGQmAUdzxJC/W7wcVZI1VNTkyhZtPPa/RbglJupqCH6w2UgQPz0/PrYl+zA
	NVEQg6Brl2tPzx2q6ILcWz2nu6forcpk5L1YeGTZ/zMegfrsc0emPa0raJl9e9AphnJwXZdnYoI
	ea0Db7Fj6t1DFVxsFfsZQGGrJ4E70xfXgIJEq+d5LstNxk6yv4uL3Nq9xxx4DcbpNX59z2ZyyvP
	Fpl4YR23TilWa348HFJeDz4CCobG22Bez48HqxtFSU8v8bsbj4eG7I+dWz4E2M2MDjA==
X-Received: by 2002:a05:6402:46c3:b0:6a5:fbc6:cad1 with SMTP id
 4fb4d7f45d1cf-6b408e89e41mr2170258a12.7.1792614492072; Wed, 21 Oct 2026
 13:28:12 -0700 (PDT)
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <atibhAMcgKle37-g@sirena.co.uk> <CA+=Fv5SUHkGtBPgzg9C1qGf6aiiFTVpStPd6Os3mTrz_+_5dKA@mail.gmail.com>
 <20261021185857.GB2608581@ax162>
In-Reply-To: <20261021185857.GB2608581@ax162>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 21 Oct 2026 22:27:59 +0200
X-Gm-Features: AclHuK80SVzQM3IT8hIbzJ05B2q7Hnxxi9JMQfhtwyRQawT4F4MwO5pP48izAmM
Message-ID: <CA+=Fv5Rf0puguC_G8L+CL6G5gjQZ2m3LpEsicN_jTcBpEK7XeQ@mail.gmail.com>
Subject: Re: linux-next: manual merge of the kbuild-current tree with the
 origin tree
To: Nathan Chancellor <nathan@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	KBuild Mailing List <linux-kbuild@vger.kernel.org>, Kees Cook <kees@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Matt Turner <mattst88@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Nathan,

On Wed, Oct 21, 2026 at 8:59=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> On Wed, Oct 21, 2026 at 04:40:22PM +0200, Magnus Lindholm wrote:
> > On Wed, Oct 21, 2026 at 1:01=E2=80=AFPM Mark Brown <broonie@kernel.org>=
 wrote:
> > >
> > > Hi all,
> > >
> > > Today's linux-next merge of the kbuild-current tree got a conflict in=
:
> > >
> > >   arch/alpha/boot/Makefile
> > >
> > > between commit:
> > >
> > >   c437950dceb88 ("alpha: add self-extracting compressed kernel boot s=
tub")
> > >
> > > from the origin tree and commit:
> > >
> > >   0d4d70da348b0 ("kbuild: Mark the gzip recipes as recursive")
> > >
> > > from the kbuild-current tree.
>
> Thank you for the heads up, I have let Linus know about this one since
> it is a little tricky.
>
>   https://lore.kernel.org/20261021184723.GA2608581@ax162/
>
> > Thanks for resolving this.
> >
> > This recipe now only copies the completed image, so I think it
> > should stay without '+'. Matt's series moved compression into
> > arch/alpha/boot/compressed/Makefile, where the change should be:
> >
> >  $(obj)/vmlinux.bin.gz: $(obj)/vmlinux.bin FORCE
> > - $(call if_changed,gzip)
> > + +$(call if_changed,gzip)
> >
> > The existing vmlinux.nh.gz gzip recipe in arch/alpha/boot/Makefile
> > still needs the '+' from the kbuild patch.
>
> Correct, thank you for catching this.
>
> > Maybe adjust the resolution accordingly?
>
> Since the conflict came from Linus's tree, I have resolved this in
> kbuild-fixes-for-next so that Mark does not have to worry about this:
>
>   https://git.kernel.org/kbuild/c/83deedcf85af511dc120b3cd8ee597d211cdf2f=
b
>

Thanks so much for handling this.

> On a related note, is your tree flowing into -next? The recent
> pull requests for alpha have come from your lindholm/alpha tree but
> Next/Trees shows Matt's mattst88/alpha. Should that be changed? It would
> not have saved much here since I send my pull request to Linus before
> c437950dceb88 was applied in your tree as far as I can tell but it is
> always good to catch these things early.
>

You are absolutely right, I'll wire up my lindholm/alpha tree into -next be=
fore
the next merge window.

Thanks again,

Magnus
