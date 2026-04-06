Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D6C2F531B
	for <linux-next@vger.kernel.org>; Mon,  6 Apr 2026 13:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775481391; cv=pass; b=eObEzD+A9ZtaXrlxsuxLS8GpoiGZrMwQmMksBpcC9B3KOtw2ERZQ8VhoWdg4RpoPd2I6+DRYuDI517SumTIhxccD3xQo5zf86lYtT1oRfHWizl08YhUDhsFtCfhGzAHTnL1S0A5SOrLOz2fvIVJAv6VnFYP9jrI5bi9I2ySPcnI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775481391; c=relaxed/simple;
	bh=j82tXlAr5th5eU5JNLIszevvxTB9Ut6s2iXNt3N7FhU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RTnkqImtzQ8nnB2St2O+d5hQ06gGsmYfMD/55GhdWFS0XRvMRfpxeHag8aIO/Udr4eShiEbEGhLkSUUpq2VlvtGi1pSYzNy/VSpyQ4ygg64pDOViDg/nP09sbePvoanQPOqxyWZTibyVKZ2m0bL0hviHG2bDydYYY2xahaSPir0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Eg1IuFhm; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Eg1IuFhm"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2bda3b4318dso243475eec.1
        for <linux-next@vger.kernel.org>; Mon, 06 Apr 2026 06:16:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775481390; cv=none;
        d=google.com; s=arc-20240605;
        b=D9C3tcQC8EgAUNrbSn7UENFqcUJMZ2/yKEPu1fI9GzDXDUQVpmizNHT668Dc4B1xcW
         506mqzFR/vujDzu6Td5ivP/Qt+MxAlNbGoS3PlETqoJntt3i8KQRA3ghOOM68JeWQFNB
         U7Z3z5cx2alZaSmvtJHVxJnhcYaZi6yVfLnlCbszdBvfdZdtflh96zIA7XTqqDh4RNSv
         jD3Zp/kABN7PZi4RNTfRo8jtPqK4pweSwqFUPj6fi3X79uNMzQ4IflFAnOigH16s2/0+
         8dtgt+KM84b3s5m+jJd7J9Fr28eMLq/KhXek+1CpN3smqvk31qPIIJFOSOukz06bwoFO
         whkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=j82tXlAr5th5eU5JNLIszevvxTB9Ut6s2iXNt3N7FhU=;
        fh=sb3i4uTmbKkw89i3wVutKhmyEKriz5aqIEa1WM9vqzQ=;
        b=TSEwAnexix0/RFFtyB4qxJfOaevKDpZRs/30ndoTqUOm9VYkkgQdoZ2JwMZOLxNZ++
         /VUUuThF6gkKXwdeoAvpKNoN9nk81ZaiH+6soanz2ThNx2NHQenYvv2spQA/DHT2b23L
         q3fMh+96GLb8UAIvKvql5QgplvAHXjVqldLPs1K7K45VlutKrQ0zf67KAeVBJtOz8nUu
         29OvXrTkFji7ULAa4DwSFx/7iTqyyMS3V7dBvB24ExLSQc+/N94qn8GI0WnCHKhvPPDZ
         goQjQeTUHVcC1GwwEBZoxLyFQokinR62mRgaYaviBsomjDNyniHWt/1jSMj4fcZgt7RZ
         tK9Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775481390; x=1776086190; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j82tXlAr5th5eU5JNLIszevvxTB9Ut6s2iXNt3N7FhU=;
        b=Eg1IuFhmTi91X2t5qT5YJoGw7e1RNsO3kDgCqBPmG55NTFCjR39VrF6CKKjTcan28I
         CLWqGcSoBmtl3FWwrIijJ3V6/jAfV/VWcO3Sh9BQpaBwY6XhwD29BnD4ua23VXSa3Bu5
         pwd3s+pvLpXJaBNzf1ZTe1JuRwIL/qRMfykYNrqCkIbyTgFGSB6zJT2IV5jY4YIbB173
         LPSKeUYr07KHnnuGlhI1hollxUrBJppKHTTJSirao8JduPbwp+u/FGTZN0N9Hq+hEOLv
         B5nxmT64G0qmEQEgjt2xTfcxnkRSyMZaZWVvaO5sOWU973FDuFMKNx2HjxkrgCk/8VXb
         1Zew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775481390; x=1776086190;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j82tXlAr5th5eU5JNLIszevvxTB9Ut6s2iXNt3N7FhU=;
        b=L7hl56QUqSvk5dAUD6xhHneu+LM+3eBqC5f8aQr3yvGOLwhtqtFYaMy0qcrKM82JWR
         fwN2iatDBz/B4CbGbUlGoF/+oBZBmAGWHHnfAVA0VeNhZhDzC5cBSFMLS56Hryp0imrP
         /iWBiLXjIoFpyMctyNrTL/hduBok+KBBAUl4HZPaYfXG2B1FqDcC0Jn3jbQAphNsX2T1
         gIS5grS+Vl/O3CmNjaGo8NUCM2QRMrs/7vqa+Ax5woeqTWJkKTLY7izuAGHgoIYrOocz
         qK4ZWGCxChcMURrv5m6I2bPmHgF0ja09gBUeVJq3oTiPb0CGv433IxoGcZZ9HYfGMlWy
         x+DA==
X-Forwarded-Encrypted: i=1; AJvYcCWnLHF9kXssadOpBJXVT5oogy0UxJ6/suo28BwGq7SLQ7fdxV3xXWSnHEWo21XBCpyLtnHLA0W50e+J@vger.kernel.org
X-Gm-Message-State: AOJu0YxIf8jwVfB9pxp0DRC7WpIkSISgVAM+h/LAWTIm4/Q4qlEhmWJj
	qRCas7+korgxQ7QQjp04VSAvr26RG6srh/In1L2ckOORT3Ktc6KYpKDgAy6miwpvcO+BafFtiPb
	yDrZYx2eSyxfV6JtcYl/80sVPV/8zJYo=
X-Gm-Gg: AeBDiess4jEitWcQ8e11dj0HEhNyl46Ay8XhwU1Yo3WggyzulshlwwOeT5c5fk6fh6t
	DBrshVFmf1yiadD/yjHUipxfauaT+lm60xkhx2o86Y4Gnii5qVF7qmhzgt+MalksVSGcXPmfNjC
	ckAX21I1N2NNFhCrtPV0uPY19DuyEctTSOy13zmiCPeoHkzRkuabeno5lQX0NdzQUKMoAWdZzvu
	5bCVfg6FRy85uNIDQ/z1+31Cx8L3QLBwkp4wtHxJ2NWrf1IJCkcs1WmFtlhKJ9ktuKFpRSYw5ox
	n0g2lvx22aKgiV26Iiz+CrMAbW84W0Z0lhi8QlHADLsUU0buWXIjkclBhMpYgIju/wRPHtG0Oiz
	VMkc0mO3WGyUeqEk9l+xoXGo=
X-Received: by 2002:a05:7301:6093:b0:2c0:c55c:156f with SMTP id
 5a478bee46e88-2cbfbc82969mr2617150eec.4.1775481389680; Mon, 06 Apr 2026
 06:16:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <adOxXnpJpmQk-opP@sirena.org.uk>
In-Reply-To: <adOxXnpJpmQk-opP@sirena.org.uk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 6 Apr 2026 15:16:17 +0200
X-Gm-Features: AQROBzD2sxVWL3j7K5Lohwc7EdFHr3DG1a5FopTs28RKOU-kyMbjdxcfdBxY_eA
Message-ID: <CANiq72nPW=BGUuTXgOp_t+rpo5N0=bPGArCsUkFaePLf7eaM6Q@mail.gmail.com>
Subject: Re: linux-next: manual merge of the rust tree with the origin tree
To: Mark Brown <broonie@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 6, 2026 at 3:13=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
>
> I fixed it up (see below) and can carry the fix as necessary.

Looks good, thanks!

Cheers,
Miguel
