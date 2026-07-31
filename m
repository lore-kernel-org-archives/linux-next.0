Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A02039183A
	for <linux-next@vger.kernel.org>; Fri, 31 Jul 2026 13:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785506276; cv=none; b=uZiXUtN1rU4kuj7WNy9Y+OnNllqIYTDNh4USWCndaeC2VeAuuh+f7UyEI7TChxrHAH03O8CuBJQQZLfRtvHaoadUifs7hMm9YnqfFeDYGIVsMIhxI21IfeVRdOOd3u0V4BEZV77HHxGtpgQBQAisDCkNWuRVgaWrNDR7qxVAHBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785506276; c=relaxed/simple;
	bh=IIbXF+fe+rJkd/WYU9t9zd90ofPiE1eIZE1ob4uq2XQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qevpzLnKbot8Poxx2qP7Z5BOhMEC6d5oX2JCqI9rYHhOU5xnH1s07GK7v+k7ASLh9g5WxHio5cSn4SgOhlhkyXBLBh8Ao+oAayx77F0D+7yaoexJWdJec9EmUOc2lDL/8JH6s1GewGZa6bUdvBb3uxiHUcWWfv/Q9cqDetERIE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gwz4bAEV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gwz4bAEV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5074B1F00A3F
	for <linux-next@vger.kernel.org>; Fri, 31 Jul 2026 13:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785506274;
	bh=bd+n/sHW1pir6tw9A/jpUa7jFv33QvYa2WKYMH45838=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=gwz4bAEVmnmeySnrfpHTdBrMIxbisPRUvYS8rWwVEoms/16DRWgxTM6KdnTFyNo5N
	 dZOu7OJVul3sBExHOSJRhf+gaTTGH52yu3wK+ifKMrZiTruoxCmIV9cmS4H2S29GD9
	 FzAW/ZpTHw6IYpYv0S28WX5TxTxdarRdnW7hC3dMb4jXpif8w4ughSCrEVqC66wing
	 80DB12AkKWiAm2uaIVeHHdqnkW0UsvXMPg91F4DjhszNevmPxj7F2sMu0hSMUQmDDa
	 avXLBgq8H3IOg8FIrETS+CKaioS5gMsqQ6Xly266uOkF+IgfZU9jrgHtBWdY2E3qoe
	 zp2WLD1+b9WQg==
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-698a9f11776so1655332a12.1
        for <linux-next@vger.kernel.org>; Fri, 31 Jul 2026 06:57:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrmgUyyVkr2aSdSVQPg2F8l054nYFT7FaNWeov/azxlgM22RQyq7bu5BdLRkTldJC0sATt8CvR0AVOl@vger.kernel.org
X-Gm-Message-State: AOJu0YxiHEbKhsc+KBsfJht3rKenPjukYl4ixG9mAY+D/Ve6DzYJm8KK
	UUXCqoma7qG1A4rAjoqVCPHfbvr9iECcRuhapRkktH3DrU1chYvU3LIHCxWneQekXiR3lZObhdo
	EwXxtWACg4uBJJ1c6pRTuIO67chGZcQM=
X-Received: by 2002:a17:907:d1a:b0:c16:589d:c969 with SMTP id
 a640c23a62f3a-c1fd28ad134mr133837266b.43.1785506272936; Fri, 31 Jul 2026
 06:57:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <amyoFfMXA9fI2hbF@sirena.org.uk>
In-Reply-To: <amyoFfMXA9fI2hbF@sirena.org.uk>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Fri, 31 Jul 2026 22:57:40 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_03azOZwZOBDiQG6nvpZjp98w-jfZXfV7tDUOptsqPxQ@mail.gmail.com>
X-Gm-Features: AUfX_mxN3judelkfK4YqOIKwotha_QigHLiW5CI0KsaIW_fdCLd6JDo4UUcrKnQ
Message-ID: <CAKYAXd_03azOZwZOBDiQG6nvpZjp98w-jfZXfV7tDUOptsqPxQ@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the ntfs tree
To: Mark Brown <broonie@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 31, 2026 at 10:50=E2=80=AFPM Mark Brown <broonie@kernel.org> wr=
ote:
>
> Hi all,
Hi Mark,
>
> After merging the ntfs tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> /tmp/next/build/fs/ntfs/attrlist.c:183:6: error: variable 'new_al' is use=
d uninitialized whenever 'if' condition is true [-Werror,-Wsometimes-uninit=
ialized]
>   183 |         if (!NInoAttrList(ni) || !ni->attr_list) {
>       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> /tmp/next/build/fs/ntfs/attrlist.c:317:6: note: uninitialized use occurs =
here
>   317 |         if (new_al)
>       |             ^~~~~~
> /tmp/next/build/fs/ntfs/attrlist.c:183:2: note: remove the 'if' if its co=
ndition is always false
>   183 |         if (!NInoAttrList(ni) || !ni->attr_list) {
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   184 |                 err =3D -ENOENT;
>       |                 ~~~~~~~~~~~~~~
>   185 |                 goto err_out;
>       |                 ~~~~~~~~~~~~~
>   186 |         }
>       |         ~
> /tmp/next/build/fs/ntfs/attrlist.c:183:6: error: variable 'new_al' is use=
d uninitialized whenever '||' condition is true [-Werror,-Wsometimes-uninit=
ialized]
>   183 |         if (!NInoAttrList(ni) || !ni->attr_list) {
>       |             ^~~~~~~~~~~~~~~~~
> /tmp/next/build/fs/ntfs/attrlist.c:317:6: note: uninitialized use occurs =
here
>   317 |         if (new_al)
>       |             ^~~~~~
> /tmp/next/build/fs/ntfs/attrlist.c:183:6: note: remove the '||' if its co=
ndition is always false
>   183 |         if (!NInoAttrList(ni) || !ni->attr_list) {
>       |             ^~~~~~~~~~~~~~~~~~~~
> /tmp/next/build/fs/ntfs/attrlist.c:149:12: note: initialize the variable =
'new_al' to silence this warning
>   149 |         u8 *new_al;
>       |                   ^
>       |                    =3D NULL
> 2 errors generated.
>
> Caused by commit
>
>   57ad655524e85 (ntfs: protect attribute-list buffer replacement with att=
r_list_persist_lock)
>
> I have used the tree from next-20260730 instead.
Okay, I will fix them.
Thanks!
