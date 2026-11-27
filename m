Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795823469;
	b=Z1bVXfEx1BCW25grf7vv8kHrKdrZ102Bw8tGFGPlUzDBysgFGPQWoAmX0qB87nr9o2d5
	 eJsuT3BVCVK/NW92fh/RRsWwUFLpQdvvXNxZuaD+XoEkHNj99sFBlH1HjG0+/MWZx8zhg
	 11dq88gnVaiC2SaGSmG5mIUPRIfMvp9Os8Yu27mkxjd9iCCzhloKphrDFpUOogiiBb4sg
	 OnU0gl34YutW8nam3VQv2SzssrJMmX7zYw2FD0MoNMw+iUlgRQilNZXo80qy5uDyOqoRp
	 myWFwIfx9rVrWEr61k4W8mSX1tF+KUb3ZcGhrXnl+s8RNjJyVi+mY4n2uhiZF2eJ3nQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795823469;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=KVOmWfdqIYfeqYTgBunQD6m9OZ3k3UGq1oiUDE8grf0=;
	b=0cKsF5+Rd7deIk+D8N0HKISlazJdDV+fXsWq2RXtNmAQS5PZAn22pyP+COpDMcOrG7VE
	 9IBq32VgGH/J06wsEIfdjvF+rUyO2MG4gzZmh96qpexqWB0OtmNlFUFbVheYsD2/6PW7J
	 1beJhfhnnK1Z6HA43v1Bwfr2mb6McIt6yQUyahhnSnap8XDhYLLxbVTs2leu1u2h+yObl
	 bD9qVo9YR/JuhgXiTt/put6OYHQfz87BGlXFukUCd83J3t5S4vtm5d68g8iG7+9u8DFIT
	 q6sw21DlrFgXzzLKxB/AVSdHhccGIQ50iQaUnYS4RnnRIXhXRLrPBHrP+fUGXAV9UJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XsRBJCk3;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B005B606A31F
	for <linux-next@vger.kernel.org>; Fri, 27 Nov 2026 23:51:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B005B606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XsRBJCk3
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2f052ae3c86so46772185ad.1
        for <linux-next@vger.kernel.org>; Fri, 27 Nov 2026 15:51:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795823468; x=1796428268; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KVOmWfdqIYfeqYTgBunQD6m9OZ3k3UGq1oiUDE8grf0=;
        b=XsRBJCk3h37CLoNuGVplS9B3qcgNJLLmLUTqVwgmIkFkQhQglYtGNLfv3eAz6mMA8s
         IktkZErgR3mttJlLafpvgr8BqNKTdB5oYd8fn+76KRDjakGh/n4qJVwh4/nQxuG5kV0J
         l9XD4U7jXCtd+NPd9XbC65XqToOMCS5dDqyM+QGwuQX+v1WqNsTor7gtOT+yx9xp7tJU
         esjjwnrovNs+/J5O8oS6rh7r3VFuCWgn1y/vPY9Ip3dpV4zBgjqQGs2egNPqhyouKdLH
         wTedX2UL0RmoB9g6lwn0gSQUH1LWWyQThd3Ji9lsOotG0h17iWKzimw9hmz9LQHkCigN
         7k3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795823468; x=1796428268;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KVOmWfdqIYfeqYTgBunQD6m9OZ3k3UGq1oiUDE8grf0=;
        b=GdvotH6inBpSYwNMKIcotTZzUkweonho+L9kx3A77Zm0Cn8AXdC/uV7Wr0Hpn250s6
         x7706ei8HUrRi7zUTekIyj/az0V7T0IbdxG7uGFxL1xOKz33pFjb8Dabf720hFrnrf4g
         dQ5vFlWK75T3ly1CX37qAgE9B/p31s6F4pzPUOvT1Y0i1VuaFTvX4+VlSBBN2RsByLB7
         Ii2yWjF1qxxIb/NogUew+V36eXYB22LCHZgJldSn8L0iRnCglIML4VHfw47jnigGNNxM
         QE5mwdOuNJ67JAidlL/39oK5BdtOe8rohZrAxhvJ2GH3wiGrPC436wp/+OSBpZpnpR8Y
         OYsA==
X-Forwarded-Encrypted: i=1; AL+hErG1+6+sF8O7sDcOB5RoK6qgihU7psfaqfl7zalXHjbyaqNivc8ZlaV62Egp8gbU01F5WhtZJ4vFeThQ@vger.kernel.org
X-Gm-Message-State: APuU4Z8OEvh6TtKbngaBJvowUhrWoKTnd3IEn66We4SP08d3yAEYHeKb
	nFmzKOPLGneyTH3+/AoMfbpg4CnnhndIaThtba1PLutiRCi/O2xSR0wG
X-Gm-Gg: AZFdTZfbNFQuvNgdr6yPukxExrdf4LqHtGcWdxVWl3HJiCA2fqQ2so2bP4orIPTA1tH
	c3YFJcST96eBidLsHKtXQZU1KWhzt2s5WjR0AfbfHw9anO0jga5FQJ0Ktjeu/5G8N5xsqqFJLwy
	yWjJElr8UMtx1XgSDG+w4fpi0PFrgSiObOvRoynYkR8uv4UgN2svoR94ODtsYnKnRraqwuw7fAJ
	wgz6Q+oKt2P0jTx+LuybkCMWz0s7JXFyMSGDJO2gYK+xoz1pUmv9THWG4dPaqDkBiAfd3+NsAl1
	ulul1K8AIB91iMBL8H5xyf9DTuo2LslPDa3x9O/+RuuZdTHNuVncCmkqpTGlhFRYRgkJx21Zx9o
	XEFkbWz4LOuWEaaPDsVLDfU1NhV0j/WLJcwmsuKV0rERM0oaPB+dfqB4q4Sp90FOvOQtR9IaO7Q
	BIZ4p6WumcZU4vPQl/99JACnpVD4+ogCiWZrjjkkPHvNE8j/IiWOlBJcQGqk/t3Ob45u2U3CRLm
	CvSnzsA3VTGug0IldBvymg7c9Bk3a6yc2pVcjrKk+l2TFWY2uxHtCUzIBcd/NFTBkvjvUDHo4lZ
	tFk5YvfvOstLoFpPktqn6Qpm2Lw0Y3cqqS/M3pCfgL4uQVh6v3vuC4xAjuoPJmv47b4aCcOPdau
	eqBlpMZRjSYCsIihze2/UaCxSnbx7xQ86RA==
X-Received: by 2002:a17:903:230d:b0:2ed:29a5:7828 with SMTP id d9443c01a7336-2f03f1770c7mr274805035ad.11.1795823467843;
        Fri, 27 Nov 2026 15:51:07 -0800 (PST)
Received: from localhost ([153.61.198.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f1215e2sm128158155ad.63.2026.11.27.15.51.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 15:51:07 -0800 (PST)
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Nov 2026 23:51:07 +0000
Message-Id: <DN6EAFMXZAIA.F3ZIJ8N3OJ3N@gmail.com>
Cc: "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>, "Linux Next
 Mailing List" <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the bpf-next tree with the bpf tree
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Mark Brown" <broonie@kernel.org>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Eduard Zingerman" <eddyz87@gmail.com>, "Daniel
 Borkmann" <daniel@iogearbox.net>, "Alexei Starovoitov" <ast@kernel.org>,
 "Andrii Nakryiko" <andrii@kernel.org>, "bpf" <bpf@vger.kernel.org>,
 "Networking" <netdev@vger.kernel.org>
X-Mailer: aerc 0.20.1-355-gf870624f6c37
References: <awmn-8pxvHphS_xZ@sirena.org.uk>
In-Reply-To: <awmn-8pxvHphS_xZ@sirena.org.uk>

On Fri Nov 27, 2026 at 3:55 PM UTC, Mark Brown wrote:
> Hi all,
>
> Today's linux-next merge of the bpf-next tree got a conflict in:
>
>   kernel/bpf/verifier.c
>
> between commit:
>
>   02d3452bdd80c ("bpf: Set the run context for async callbacks")
>
> from the bpf tree and commit:
>
>   d83c595d9480e ("bpf: Put a barrier where no mask fits")
>
> from the bpf-next tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

The resolution looks correct. Sorry for the trouble.
We're seeing more and more conflicts between bpf and bpf-next,
since the verifier in bpf-next is completely different.
We'll try to sync bpf/bpf-next trees faster,
so you don't have to deal with this non-trivial conflicts.

