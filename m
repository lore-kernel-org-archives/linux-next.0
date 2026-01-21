Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4370328263
	for <linux-next@vger.kernel.org>; Wed, 21 Jan 2026 19:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769023465; cv=pass; b=tfk4TPKXqtuvx9A9DHF8hIweZA9fNqzDRTEPWUr6gwhaBN+nQ/a1gzEMhBAzRLLl+5goQf6lValnU5zWFcwsR6qk4FMFvdjZBvBy63pdDpkFeWY5vS3/kpDYJIcP+8ZEN5s63VHQBp3W3FacyXRMC/CHJ+gbY4YqSZ/pPVlGndg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769023465; c=relaxed/simple;
	bh=Qab7QJ0jocY8rXpgfurAMImQ+5Yg9y0mvpiib7JX8ZY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lfaxOrrk5gexa80IYfxLvdn3fEkdnJIG13Eqrc4xBDYh02JQ2iNiUVAEflQJiK3IdzoiNFo3NlOIsdbjThVuhVYW71OgVApvxIZ4uiFfTlRpYa4M1YUdQYzHlFnziw9kzMISE6p68ABnyTj7O9TVnwWS1gPR6UvFCt1LRNzp2kA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TpvP6kB+; arc=pass smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TpvP6kB+"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2ae60d8a05dso20681eec.2
        for <linux-next@vger.kernel.org>; Wed, 21 Jan 2026 11:24:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769023463; cv=none;
        d=google.com; s=arc-20240605;
        b=gLhqusAUraS5iz/MAWvzKTLhfOZBe62P4vP6dn6LVrsMFxKlqWlns+BVNFLaXi4hqG
         KJj2drUeV5v0+rwVDnQzATnLBpQQXUovhD0ErA+d9FDxVoEPtyzVRnbYWUmXaW+Lef3q
         PT9JHatulEGJfdNmg+x3cbVXE522OcjDYEg34F8yaP6GMvlWJxeIg/9vhlaCFjAxHLfa
         aj96sKR2rfuv/j3Ex1Z5LT3qD3j+tmF0c5IB+OEwETC50khhC77Aq3wf4Vn6eLW6/pr8
         KovhvyIm/llvX9Zcba+dEe+Y8n3+RAEU17xd4ouje5wOOGXb4m7v2cTdjXXXNx0PkYF6
         qwwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Qab7QJ0jocY8rXpgfurAMImQ+5Yg9y0mvpiib7JX8ZY=;
        fh=op0q+YENoQ/fus4cHOfTmKcMP/DBC3r8dP9caFnd+lE=;
        b=O7GoZJEtkCEeymk55BECPawUq9bItLyCviRN3o+SoJSxyN4ai6gD7+pcvvP48JXoCz
         Kthax1+yrtjusbI/XfmAvv+Ei9dW5ejM/CeqNDhGAd6TtdJ6WBHO+6+emTP/DdPjnIA0
         XCU3J1wenyuX/yFEJJ4uBocYxQbPIfQ/sx+gVqhuXqKiD86UHs5OhWKMurFFvIGSoPEt
         9Q7NJOwAL4sySbVunR6lEHkpmcma76By7D3YuSl6iB4aQO+C7PVpkl5uWS3eS8U3qi2o
         03v2zLIKKIu365xewKoT7rJaZ4gjBqA50WL/lTDcrdyg6YMPnrPeH0/lMuzIMZSSSlvz
         SMYg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769023463; x=1769628263; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qab7QJ0jocY8rXpgfurAMImQ+5Yg9y0mvpiib7JX8ZY=;
        b=TpvP6kB++wxElA9dNbzRjHalF9EPNKykuvVeWoalb+8QCnL4dXBwcJgQnLHV8XlMgA
         OMmxOBUWyjY/22bSx/3Hlb065XNOLfK/0ta3PnsZL69jTUeachTbfNpvMcxsgXVIgBv2
         QXoYPIpyYiFZ+7GM8g0BK2o3AhmxaSkGYccrPdYPQNirYQjlcw56+CpzJ6/jruEqrbmt
         e0FOfWzVygoJica3Tm7emNtp1ViZ+sBZcHgr8ukeYqLecR4iEuZkVbrRNZRSdq4GfF0k
         q5aVlZ9EXDgmlLY2H5tYRy/Htg5qcS0rW1Cv+oGeoTqd9+KJ7KTJa6GMDXwbARE2T+YN
         J8gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769023463; x=1769628263;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Qab7QJ0jocY8rXpgfurAMImQ+5Yg9y0mvpiib7JX8ZY=;
        b=bvYjEy8DW1uq6N3qAMy1fZNqOt8KzhYfzcqjLtlGPrqgKH70IDgBTc5k2L+zodE1HL
         +8k0N0q0MRKn6mTGKgSI5YXVsfOMBep3T8PxzIZ+ESuf6+NNh02wZl5crr9uVNWzSsph
         y8LS/m/kR0uN+GP2wKWUIhsp0jQP0iS5lVe/8i22NV/MPLoO8lh3+TPSTxTK/o2zeEI4
         FJtpwaNoju7iBcHCdGGLv4VMLDO26C8iOaI+Vwcct3YfXAjmEesTBrUB4+D4jsnQqxE8
         BzfmSt9EI5SGxE/T7FAu6FwCh1LrXnE6mmOWB/zQKQm78z7m0AAr5mVj4pX9SxsL51bZ
         65bA==
X-Forwarded-Encrypted: i=1; AJvYcCXxkPK3TngZ/XNICVzGz1gvwdkOzo4zewo/X0fMmWXj3inQjgEKL973caKWEEJLyR4UUnRKRxCcWdhK@vger.kernel.org
X-Gm-Message-State: AOJu0YwQTXOtdscNuwwEWoRkFuRtLG2BDC9AMg8TKUTHXadM30VthZKY
	K96L8z3SvO4Zg3wUXWxMq5dCWhwRCWtB6P+QAOEDIuO/i/AAUTdOHo+SJDhDKbtYSi6QTWiDI0I
	G29B1PiaBoRd8PKy0GBN20SKPjORiRCN+Oe/C
X-Gm-Gg: AZuq6aLpJLOA5Q6RbNZvpdL7U/6tMHxjq0uqACMZ4H6a2ngW29q8r1LNSMvfDshRmXT
	wMfGGzH9ahQflTqs6BnwAwrxtS+vHM6KLnC/EgFgtYUsrCpB2btCQRPFL++htbgBEMeuFFvnO95
	u6hT5jdj0LHELjR7nMXtblX+gcPEt5aCJv6X59ZuXy8c0nsDmXulwpyZaX8tu8qcVfoPyNTz9eL
	wMw0IO6jzEzrbAKjxhPcBOeozbn5p/Nc+rslGFPZ90LZFwoqXNh6k9TZxhkyGG42Ty03pnB1/m3
	qXDdubbeTdtnJcLS7++BS3+xBgnd+RMp8KwCjdUdl9/VOCQS6O9dJ7dkua8bTx3ZEdyXzdNyHLj
	ATAi83Ykw5xvZ
X-Received: by 2002:a05:7301:6084:b0:2b7:24fc:f625 with SMTP id
 5a478bee46e88-2b724fd292dmr145626eec.0.1769023461306; Wed, 21 Jan 2026
 11:24:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aXEJZ88g0Ng2dIQ4@sirena.org.uk> <aXElns7ZpGuZR6ke@google.com>
In-Reply-To: <aXElns7ZpGuZR6ke@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 21 Jan 2026 20:24:07 +0100
X-Gm-Features: AZwV_QjMp1BtCoqKCnVyBQA_TgIPcQ12PQAM-JTQXsPtMrvPhLZ4ITxVPeT3I0E
Message-ID: <CANiq72n=h5dzcmNULoXSZ4h2133hSY-AtU-xGxeJ=hfmgY1XZw@mail.gmail.com>
Subject: Re: linux-next: build failure in the final build
To: Alice Ryhl <aliceryhl@google.com>
Cc: Mark Brown <broonie@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Beata Michalska <beata.michalska@arm.com>, Carsten Haitzler <carsten.haitzler@foss.arm.com>, 
	Rob Herring <robh@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 21, 2026 at 8:14=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> Hrm I saw you had this last time too. I'm not sure how you're triggering
> it - I haven't run into it myself and I do enable warnings. But I'll try
> to repro and fix it.
>
> Note that for this kind of thing you can add `#![allow(warnings)]` to
> the top of a file to silence warnings.

Mark: we are in a call right now and Danilo asked about this -- I have
a similar issue with CI with `bounded.rs` in 1.80.0, so Danilo tested
1.80.0 and 1.80.1 and indeed 1.80.0 is broken.

We are upping the minimum to 1.85.0 soon, so it is not a big deal.

Could you please upgrade to Rust 1.80.1 at least for linux-next runs?
Where are you taking the toolchain from? i.e. I would expect a distro
to provide the fixed .1

We hope that helps!

Cheers,
Miguel
