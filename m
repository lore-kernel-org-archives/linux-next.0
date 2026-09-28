Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD024F30EF
	for <linux-next@vger.kernel.org>; Mon, 28 Sep 2026 17:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790615023; cv=pass; b=NMO8Gm8eJwOg3DuMT1rAKL9hcXH+ffqttvELF5TFDCLkp70X/FqKf9ddGyujpt394DyO+hh05ltunePhlXSmavDZd3hbKYyrF1i8SudtKcrbE8rh03rt1TEmCy+GXqtuLek848BJsKECJM2ek80NWejR1vKX/avfXisxtGBaA7k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790615023; c=relaxed/simple;
	bh=kIjtcL+Lz5QXWmruxMdQeu3SBDyRlCb/HiZSt2nCN5Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZgFcgI79i0RuuSN3E0ClT3nKJ3ZEXtntKUbK7ndQRSPOFkhCo20iJK71jBZderLji5Z1wMXrLExuPdeGiQXQQTKWL7rfsrPfHF3CTZq5ld/uWXAV9kzPJxnFAxGqwkkXNcm00dzj1K1U8jOAafUODl/6LvVCGtV1hCkGFMapTuY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mLeybZF4; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mLeybZF4"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66fabb1a601so3284163d50.3
        for <linux-next@vger.kernel.org>; Mon, 28 Sep 2026 10:03:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790615021; cv=none;
        d=google.com; s=arc-20260327;
        b=WBLGqpPf+yCU/r+qn9Uu61m6oqUONr7HP1mE0IvgwBhY3W+LlWYvMpuWaphKPCV7q4
         gLFS/Tx0o5z2z0lJSjyiuG21LAhrCkk1jYgt0hQMC8i38p/JFr30oyfBy/nFhpDNEvPY
         i3DJ5JkYm2tBBs/F8LwxJsI6vi9RAezih6rWHOuvmuGMWNWodp6qJhYTN6SZV01coI7u
         3kI25Lo7yNa8AxXYN1c7oCTkGilxJMiFxq9Odv4SZWwOYN3fB9rWazZ+9o7fWhxtZ7K8
         9s7UuTVVnaLv9n1jJwDKef67dGGKWTD6u7Phuj8fuW+Yu1BEQOh9grCEC/IercZbMkfj
         bueg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gMqS7k+/hhaAFYEhEXssGrTuHHeywAwvybm2CVGB9Kc=;
        fh=BnTZnrGBAo//yGV+g47QSP5rmFjhcIieLYa7TWeHZFU=;
        b=ADfPxsI36nFhW4Jy7NBRAeRupcsJeIPWJOh96iQqNhBScphql/P0WkYcYy0/JuNeyc
         iqVDtAZ8K51J2ED2Lw3rmEta3FVR6VM51wuiBVstpdgzkqPMBU+v4MwjBTtC2seXVORn
         XTPwkaYq0N+OZyg/F56F/LfTkIjeb+i8hIHWx3U7CbdOmJJIhqHWsVp2kZRM4lN9D9et
         dfTeh7TtWIIiKenrUlY/3l8rTW1Fwu9zqYZT8wKAScufWHx07w3fkg6kP8rP3gdo6iX7
         bqkQTfOvdiv4Tc/GjCAd3suUFKqPECGZXsD2XtApi3dvGGQl8G6iNTacxTW/EG18lMV1
         jGBg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790615021; x=1791219821; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gMqS7k+/hhaAFYEhEXssGrTuHHeywAwvybm2CVGB9Kc=;
        b=mLeybZF4o5R48hMp1zkGZ1bObc9oI5XxUgmdmWDp0zVHcm1PNjtkLwXMnag67i3ytR
         pMxWcd7OvI7L7tCj1l0sJkadZ3L9vSkL9jkD5gwITn9q8P7WIOsD6BxlvPM5EpCzQlXj
         qqEN9cZ0EZT+HlNShYISj3mhy0lrQMYxNV1IseKHSyx9XMknXjCsFovqGwvqfcklud5J
         qygTFgOOaddIKU1LhHBgGAobtI+RfbeCEhv1mTH1MgYihvhK+BXSJxFUVy06MP+Ft2Pa
         j2J9Z1yeUr/vUlcp/eNUvTMgduEXyB0l/XAhtEtqfAOV9KfR3ggzrj49HaMeECaNQusr
         EH7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790615021; x=1791219821;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gMqS7k+/hhaAFYEhEXssGrTuHHeywAwvybm2CVGB9Kc=;
        b=LZMrkSjfqRkMGCFjjJlxF/0yAdThRgO1yPyBnlvI5akPz5UP7i1KHArIjuutpXOhDZ
         ip8ImcYp/Qd8X3sWszPwQHxTWXsGfG08jruHZlHzRYte5+CmHlSYWRtHEsbPyoOMw+1A
         lRShk6pXyUzsCX3MnX4cPjCtentlv/llwYcS6NPNn3k/uNYfbfgHlH63hLGKwPSJOu6m
         6KM5pFFUl4I1ot3ADBp1AcesdHRtEik30r+HexhmiZuRTJFq/rjmiszND81aRJ3ZKhfy
         GjawHDE/COzdzFTDlB0/28YmWqJvuAZysiRkCkWt/bslHrU7FUOdghOzmxm+fE3PkHuA
         HnQw==
X-Forwarded-Encrypted: i=1; AKwUvByQ5ui0fzFC/Eug4g/0Ya/F0V0lR1cwwdoLCwAUD6Gndab7koA0DSXIE1SA0oW79XXzfNu1Y71n3Kic@vger.kernel.org
X-Gm-Message-State: AFq9FYJWOBpuZ6nRpgLJDFXOmuJ8V29JBPg1o8BtoS/GJATs8y/zWLYx
	D0dNQ7jCP1Ovi0adPrI5MFXkM7q/ejuWuCoE7ZU9zk84+tOvv33Yf8RexRKJ4P3iwFLuzgnN64V
	44TYG2pPkieKSGbCoyjAjEJeDtQt7f8s=
X-Gm-Gg: AYBFou1JbJpiqzhAJReelkPU3szX3WfWNkDcdjilmAg9Z5oHDh+O8P+MI2xxOqjWthd
	MmBsLJy7mA24HR0vZa0SQVyCd9Y0Qqjd+saOD3omd0IXYh0VMHOrwSCqkRAuZI6Tw3Y85OibeEM
	yYyN/FvxYu8p9AkZoWjdakZycgiTJ3QzA8xInETulVMTcsliTMs1IDhEdL30kqEFWAFm41NtiPk
	wCZiRcn84uZogvSgMK8ysxT/OM09jQElGP+io2HQ6JXTKBh6kxEIdlc4qeOFUbZPQATqVIPvuKN
	UzpFYVDsO6wWd0WsS3MKGF+nY8zQBcrwz/cwCGcb8OXl+ssOqGQ6lCwm9S0mbyeYLy+zOeg/tzE
	ZKsqtqpTMNT/aR1IG5I1eOAZR8Hj6N3qzYkFLYsm0mA==
X-Received: by 2002:a05:690e:148b:b0:674:a21e:bd37 with SMTP id
 956f58d0204a3-674a21ebf7bmr2328093d50.31.1790615021131; Mon, 28 Sep 2026
 10:03:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <arOMTa0L7QhM5RyA@sirena.co.uk> <96944c10-2a31-4e54-923f-97a608663221@sirena.org.uk>
 <CABBYNZL_vs+_MudyOBDK+pBJtOYcEEE6snUhU_btwAuW0RTjDQ@mail.gmail.com> <647ed0f5-360b-4d05-aaa9-9f3ade6f6b7f@sirena.org.uk>
In-Reply-To: <647ed0f5-360b-4d05-aaa9-9f3ade6f6b7f@sirena.org.uk>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Mon, 28 Sep 2026 13:03:30 -0400
X-Gm-Features: AclHuK9UF_xa2rnFnhmSVp7Dtg_WhARNyORcRxoYaHRjYw0Vfk55PTq37EeuSR4
Message-ID: <CABBYNZJKahHw_GXhiPKYH3_br7WWydH_YjGDJ4LAwOECLG4c2w@mail.gmail.com>
Subject: Re: Missing signoff in the bluetooth tree
To: Mark Brown <broonie@kernel.org>
Cc: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mark,

On Mon, Sep 28, 2026 at 12:27=E2=80=AFPM Mark Brown <broonie@kernel.org> wr=
ote:
>
> On Mon, Sep 28, 2026 at 11:13:19AM -0400, Luiz Augusto von Dentz wrote:
> > Weird, this should have been fixed in the last back merge, going in
> > the list of commits in bluetooth-next
> > https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-nex=
t.git/log/
> > they show as:
>
> > commit c9c15d4d8956df8c564f7c210e4dc5b9b820d97a (gitolite-bluetooth/mas=
ter)
> > Author: Sai Teja Aluvala <aluvala.sai.teja@intel.com>
> > Date:   Tue Sep 22 18:33:11 2026 +0530
> >
> >     Bluetooth: btintel: validate DDC record lengths
>
> I have this commit but also the older
>
> 4712bd9a14cbdd712fc8584f18be332b9ceb70b0 Bluetooth: btintel: validate DDC=
 record lengths
>
> I didn't spot check all the rest but there's a bunch of what look like
> duplicated subjects.  If you did a merge then both the fixed commits and
> the original problematic commits will still be in the history.

Interesting, so back merges seem particularly weak regarding
duplicates. I wonder if there is a merge option that can eliminate
duplicates, since I don't think there is any value in keeping previous
ids if a new merge changes them.

--=20
Luiz Augusto von Dentz
