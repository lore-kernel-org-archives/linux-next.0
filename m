Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8969F36C5BA
	for <linux-next@vger.kernel.org>; Fri, 30 Jan 2026 18:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769796821; cv=pass; b=SZfOlYw/bDuRgb6I54gc9MSND8HXL/Gguqshhq+1IZuK2o3SfK89YKkYR3serkJbDM2Klg1dOLRY098Tfb3sLjGJ1M58nPBLAXLar41sAUjWsQxTpn+l6Z7PmQ4tiPWlHeO5ItAWabaB5xim/Ied1mlvflUc6/kDu8+UK2lV7Ds=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769796821; c=relaxed/simple;
	bh=SNi6xiqdkXchT1i5J38oPrW4SgFikOEn4Zq6nDN6Ur0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZEzoyE3Ygg0l7D4A80WBT8Bx5SmfnohUdw16OGEfoAcSk3/LFu0nMzyWfn4dxdrSmpw6lLt3Q8Z1dvd5COlrBu5/zUmZjYsovUH+59V+P5oeI3z7yaiEc283Lb5lv6wO6H/hD4pOsWmCkbWzDRznjfiqxljYtNaRFte29NLSU+Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uOIDMBL8; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uOIDMBL8"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-64baa44df99so545a12.0
        for <linux-next@vger.kernel.org>; Fri, 30 Jan 2026 10:13:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769796818; cv=none;
        d=google.com; s=arc-20240605;
        b=MW/cgd7fPnjAQjQAoxKmwioMotSkk+TWShdf5QRRSdy6S/O575TinEyP8kmepC948J
         iBnDKhOdqQKkCUSngHKHaL2RQZPTxk05m0bVPBJ1odKJzz7DxaSPe/NorKt+wf1DmxTA
         5yW0lYVqf/c6kwyW1Ed+6KWsG/SEYpuheENcoe80DF6ruj5vDsmhHhY/VmddZF9jPSru
         aVsdXe/9sT1+xXeEBXelF9vjVFN9JxBN31pk/wni2w7cK31Duh/+6Vq6kQ72zuTGvHJE
         zRYavdt3lgXeMXjd62Ol6VtWhvIDfAG46F6hzrb3r/aIK6mFQ3zIv2QwnQ1XN6AXUceI
         xoyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SNi6xiqdkXchT1i5J38oPrW4SgFikOEn4Zq6nDN6Ur0=;
        fh=hJ1qEGo5KpOAeLxs3fIAZM0iyVk+LG8z6VS6RFyJbQ0=;
        b=UGQIyfTxvA4kn212jPYtW3r3ZRWb4khHgvucJMTyKeOzHfBIwHAgsdRY55nQw3Jju0
         yc/9Tr836UMM7Rs6QvUAs7dASd1wKi7KKdVfCrY/8O6+vOD8SXfx3N8BlqIKCAUwmU/o
         1ON6KE7Vzs7x3AyugrXxim/wktnx7y/kySmKAbcS0DbhyEUDcZPn8uER8lA4jGwXUpUb
         Xrc4ERR6+nTGAI0Wrvbr4iQvdjCfZ2FJYjwZ4fKdFsj7Em7/FJxhSyoEE1HtHed8g8B8
         K7M8fS58iBNHxRt/6VMeqEo1qvCSuqqwWzPNZc4IZduj7w/gOnnTOKvKKAVfZSOgJle8
         CfgA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769796818; x=1770401618; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SNi6xiqdkXchT1i5J38oPrW4SgFikOEn4Zq6nDN6Ur0=;
        b=uOIDMBL8wo+l5f10jbGvxzpYT3JB+dnrFMiQnEUu/pbgnf+f+3LIk/YtFEnfisYaLT
         3+whZjqMVKKJ/Us2kakUQZe5Y69jp5exZmj3i5mg33lNWlXcyPr+JL0gRSNVMwglhpxM
         xmktpKBYyG8aN3h2j2zr3TfQScv2U0FszcPiDaYQYtzVWlF5KEJdOO8dpspFhxsd82qI
         CoAg6bYuFZAZmP+sMtT3Y4a5wtqSzAVCrv0mZpzxtkPQUYeIv2ADYZ36v7S8EzGAfgHk
         vA1HevaBAUlI5GXb6Q3mSakAWNiP4br+39hyrYfZN/U/DQPpN2ZdW6AAbYZppY+h3bio
         VZBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769796818; x=1770401618;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SNi6xiqdkXchT1i5J38oPrW4SgFikOEn4Zq6nDN6Ur0=;
        b=ZigUv1lgJ3vA4KLQ9bXJHaNqX0DNIFY9XsnwN/qz1mMRV/CD+M+8jr1YtsYDootEMw
         QtH3IF3phC2iN7eOCIS78Ve3DehpIEbjGF3hnFACOuPJ5od8L1G3Qght2lG1Kar2HvFq
         3ynjEHX+kowsiniw0j6wtGBQiXnN/fPs1ULOjcImKtgyke8mt2DnSITJ+s4flJS4t0ej
         4eTaD62zC4ezvwLAuZaomMCY1sL0/6//GUaBsrjXLm7lqxmsiturQTOrkdRG7OlcMFds
         d553DzRjJaTp6gf8aXhHpZFw8TkJmI3y9i2AqXWFi856WhnBdk3WXvDODXu4QJspCC3D
         mZvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxPzN6acnVb5boSXbX/VH7sWNOl2z0Pess0y4ITwyrkRMRQnJeXiVseco52+CBScg9oQ36vr8Q/DZd@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7BWwEpAvTM0WbQFsLhxJHI9qrgjKE6OPtcT6Ez7MY1fc50rZo
	7HSX46CyfJShyjUBbpQNgrSIao+CtOinJmSTcp+TmNovpiX7N0htU+5e6h8zzK9JD5YWYzeNtqA
	oXhxwrdh/h/GJgf9zvLspnHyYlXyF1ll8EcH29/o0
X-Gm-Gg: AZuq6aKII7PEbk4A57NuFA3oSMUCLlixKMNBUq4r4GojaCCVa33UAg06mJc2gv7qkbu
	OEED0Cw+DdoL9YKlFVUEGXWiQFBAvwb5aGNoDhC3L0iy5PCkkhJzAo2mYucQzhyBmbSlOXmWif2
	72uqQoBL1j5wcO6E12PLOmc7AytBCIfwyZKwKSOuOInbh1nAcwZCVYH3DThmS504ErNOChOLsy5
	THlRLSzGHeq+pAoxrq8p7h3+u61Td60CYqGUzSro9EUx0aGN4ZwbGICH+8bLffqB4WY
X-Received: by 2002:a05:6402:2354:b0:624:45d0:4b33 with SMTP id
 4fb4d7f45d1cf-658f7d08bb8mr418a12.7.1769796817721; Fri, 30 Jan 2026 10:13:37
 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aXzoSci8NPhIwDf-@sirena.org.uk> <CABCJKueCeHDpu+KMTT9z_iNP2Ljipt6r4KkJ-8h4ysoTRoCW4A@mail.gmail.com>
 <33417587-10b3-4cea-ad5f-595af16174fb@sirena.org.uk>
In-Reply-To: <33417587-10b3-4cea-ad5f-595af16174fb@sirena.org.uk>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Fri, 30 Jan 2026 10:13:01 -0800
X-Gm-Features: AZwV_QhcwR0EUaLaSWUz1enTiWUXUiTMfKvuGuPbuznd9NzQKUcgfw7j5RiYEj0
Message-ID: <CABCJKudrUAuLCWW9xp0q6pgFygjtAi39e-=Grdgxtna-DQ7sGQ@mail.gmail.com>
Subject: Re: linux-next: manual merge of the keys-next tree with the modules tree
To: Mark Brown <broonie@kernel.org>
Cc: David Howells <dhowells@redhat.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Petr Pavlu <petr.pavlu@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 30, 2026 at 10:06=E2=80=AFAM Mark Brown <broonie@kernel.org> wr=
ote:
>
> On Fri, Jan 30, 2026 at 09:53:07AM -0800, Sami Tolvanen wrote:
>
> > Thanks, Mark. David, I see the patches in keys-next were updated just
> > a few hours ago. Would it make sense for you to rebase them on top of
> > next-20260129? Petr's patch removed the use_signed_attrs variable, so
> > we should ensure it's still initialized correctly. Otherwise the
> > resolution looks trivial.
>
> Please don't base anything on -next itself, that causes all kinds of
> problems and clearly isn't what you should be sending to Linus.

Sure, thanks for the clarification.

Sami
