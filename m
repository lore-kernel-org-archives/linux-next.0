Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF473EE1F8
	for <linux-next@vger.kernel.org>; Wed,  6 May 2026 18:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778093939; cv=none; b=aD5/wpXHqkh2TxTz3cMyiA4m+wQj8tLt6dfpUMBnZahSTMUzrJAm6GzNEJ6C4Myhd0N9yqyA/ZLcXKiOP7GVNNqUQUYcKo5iqQG86hvBC5Bf/QjE2m4kd2sUFSETLnKbAKJItu6eSi8EmgKp2+/rQfMDkUlj+NigxI2/s23ucbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778093939; c=relaxed/simple;
	bh=VUZVcjCXv1k/bnYz1ubrPFp5h0o3UA/gl6FdNyjzg04=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JHCi4q1KI735qus76RmNyMtJGPIUeni7/v29c2tc2A1LmkzjCKBztNofz7uxzazFJBuxUxqSggl9705lX7JK6cbNz60ivxWRYINIOumG+aa9vro+S/2eERqKUYvsq4K1BERnI51lEtRM0MYVDrl5I33Z2VLuG6GmQPbaPswEzbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uLD8775I; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uLD8775I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00CBBC2BCF7
	for <linux-next@vger.kernel.org>; Wed,  6 May 2026 18:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778093939;
	bh=VUZVcjCXv1k/bnYz1ubrPFp5h0o3UA/gl6FdNyjzg04=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=uLD8775IIkf8qstRUZou9eC98E8ohq9PaQMCihL5kQALtdkNsRpxYpIoDKMwC20gK
	 xpctkScoM7RRxn0xqU/2cD4EPU6eTCVtOdlU8C9dmvCwtAw5NDFE3/XVS4cm81jai/
	 MsgkYjhZwKkS7HF4F9WueJJetI01zVqCaZgt5XhmaKnBEABgYFgmBIzQBWP1WbhxSk
	 48LBT9Q4Sts8HfLJoSZ2WV1Yfj5YdkvHnJoCmbXl6tx6qSpIjT4VLr00OKMZ91T4St
	 tf1NB+gK4pVESGEUwUxq+22J43vhbPBpGBnwFM1H8l1sU9MuKSEaGmhRYsJqT44mbC
	 7fs0FuSMWQSOw==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5a85b30dd54so5749220e87.2
        for <linux-next@vger.kernel.org>; Wed, 06 May 2026 11:58:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+BW7qTRlyer6h+GyKGZmefNgLnC/dPlkFl7T5apmcicyuf3JmgeuQzfXoGbkItl3pNHLfwp+UsI8EZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwAfo67j16pJA6ytRmUGzERSIV6/Sfd89o6edTkR3CuURJc8Ol0
	caT71REgSBM62pANCQe+nlSSDR/knGj00lgcgC136o25+VadRyuCM4mALKEdoFVR9Ymfk8D2gE+
	uLgDnF4YD/1/hwdBXzdpVdPd/RiOylKc=
X-Received: by 2002:a05:6512:3b0a:b0:5a8:64fd:142 with SMTP id
 2adb3069b0e04-5a887ae1ffbmr1497399e87.15.1778093937610; Wed, 06 May 2026
 11:58:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <bdb98d48984f53087669d761f771f72e@kernel.org> <aftHEpJMopvbeFKu@orome>
In-Reply-To: <aftHEpJMopvbeFKu@orome>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 6 May 2026 20:58:45 +0200
X-Gmail-Original-Message-ID: <CAD++jLkdHiz+XdX6vRK+73_We-ucBNzi_yVwNgBVmiaawzG8hQ@mail.gmail.com>
X-Gm-Features: AVHnY4JN-C5Ct9JWVNM3NMWkR_zaj9Hwhdfjczluma4jhmezZRWKS1pY9x2hnSo
Message-ID: <CAD++jLkdHiz+XdX6vRK+73_We-ucBNzi_yVwNgBVmiaawzG8hQ@mail.gmail.com>
Subject: Re: linux-next: manual merge of the pinctrl tree with the pinctrl tree
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Thierry Reding <thierry.reding@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Peter Chen <peter.chen@cixtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 6, 2026 at 3:51=E2=80=AFPM Thierry Reding <thierry.reding@gmail=
.com> wrote:
> On Wed, May 06, 2026 at 12:02:09PM +0200, Thierry Reding wrote:
> > Hi all,
> >
> > Today's linux-next merge of the pinctrl tree got a conflict in:
> >
> >   arch/arm64/configs/defconfig
> >
> > between commit:
> >
> >   2fd3902c91c8 ("pinctrl: qcom: Make important drivers default")
> >
> > from the pinctrl tree and commit:
> >
> >   517d8fc52f3c ("arm64: defconfig: Enable CIX Sky1 pinctrl, PCIe host, =
and Cadence GPIO")
> >
> > from the pinctrl tree.
>
> Sorry, looks like I messed up the invocation here. The conflict is
> between the pinctrl and the cix tree, obviously.

Hm. I'll put this on an immutable branch instead so we can pull the
same changes into the offending branch in the SoC tree.

Maybe not the cleanest but it should do the trick.

Yours,
Linus Walleij
