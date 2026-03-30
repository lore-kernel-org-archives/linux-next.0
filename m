Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0E7260565
	for <linux-next@vger.kernel.org>; Mon, 30 Mar 2026 13:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774877415; cv=pass; b=CFM+3HFNYWE00Roklssoije/PxdW9CVZORhAAyDBoZkSoh62Ta2NRcwee0Cwg8DJN/p+t5AdFk+FRqKJ6VvFU9UqFZPLa6sxD6gsftkLrGjEBtEVAYMlFApws+BpAEEsTEjmh1EIG8QtCD313oprkBBfGpii6ERrrul8rRSSORQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774877415; c=relaxed/simple;
	bh=Uv4eEsZhl57U4YQ8KykCXvi1b2JYbfeS8u4r9gWF0H8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FhgrPkkiYJwhehrFkcWbRZJeBG0AJOmOtu5osTpM4wzuH5OKNp30LoiCpCAJBKCFBJGPH8Ng6fWsHroprCVlUH2Jlp6BAcJELBimvgKf+K3w/Kd9H6JBZ22ehs3UnYEA4EwokG94XY+R6LiE7YUpY+uh+BfOIu3rB90jiIXMmk8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lsvVraUj; arc=pass smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lsvVraUj"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-12a6b260693so487401c88.2
        for <linux-next@vger.kernel.org>; Mon, 30 Mar 2026 06:30:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774877414; cv=none;
        d=google.com; s=arc-20240605;
        b=IBFVApdfFj90PflG3i3pTg7ihoG7Hqed1WG0pAUAwrKC5NCvNH3CF8nP8yf2d9sbBK
         fWRGKv2l/jVqc0DYE8xbwrKL6mB0NGC/OPdeG/XkuZ5tT2xEjHVtStfvDbt0j+sPxvyT
         o53zZDssqFtS0bC8AXDU4XCLnTgm/BbNo91Y7u9aC8meK+bzSjnZCMu6wvv9O6tkKqaH
         73uyvhIXs2JPlGMPew5V9VPSkyl7jLP9V0ISkuJwy+1gTO4iUCf6kkC+TXY9jQeX1gSC
         qVzilRzPBzwF/keRRmHVdbcPbCY4jcQ4buNOcnkNpsR93VDqUYAoOm4VtjN3Du1qoFLZ
         KGYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N5Hc11wCUlguo+3zfCezdFY4LI5nEpmh9qAIQM+b16E=;
        fh=ojHiaiHwBW/f9VD0IpfvZjA1hMwKVoyJ7vIk46W0USQ=;
        b=Bc0NxG+ZGiqSeLv5nMUIX8jhKFJTNTCvhWT2XMDkMZa1Xx2AqYFCoWsjtjSpMS/x7n
         r+JC+kQV27/wSSGTDmwDhgP4uIpZ4lpY8DwpeKhMVAqAbBQih5h7wRFFTejNJiIuKBmK
         alASQP/8Jk0pUBdk3JlJHpvX/nM8FChb+DfN9kqPyblKM3WU6JlMy40ijQ/seHg9VGw/
         AbCHBHf8rUJ9blM4g0nsIDb9TNBmhEqLoy9bSpQfcPdbe2y2BYgfMMPPo6hp2TfnCLQr
         /SnAPjRqxRNCIHh3osOnKszuRIX/oOqEeRALRn+WCNJoUURcL43PrG4YNdFEEp8k9Xth
         57HQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774877414; x=1775482214; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N5Hc11wCUlguo+3zfCezdFY4LI5nEpmh9qAIQM+b16E=;
        b=lsvVraUjIFtgglV+KbiT7R2m+lySgd3iKH7Rz111iBw5hQjPgk+B6g54UzbQzz1IrT
         Y9MyqRaJP6CYz/IaltHTbjFKNBazLKLLrsJ5TxrkyPcZCmfFmSXi79ZJKqJuvdjBkus8
         vFSR72Ni6mKWWnz3IrPwZ6EbsPrsMYQ1dxWiSQ6z0WM9jZ23ek/3IdCFhY1nlq4nbuVz
         Nn3+4zcb3IckgchUdao2V8aw3xIjZKKuSCq3ENUaFVi/AdbNcye/OVXpU6Brw5apGKg5
         LitiMnriVa+pDXA6+ZcBAFwU/T8ZbKwIl44zH3dBdreIsBKHpnNT0TKTjFQ3wY0DThoi
         4heQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774877414; x=1775482214;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N5Hc11wCUlguo+3zfCezdFY4LI5nEpmh9qAIQM+b16E=;
        b=Xful2LhhU1kN4sbOIfL7Uws1XdoOZUHEG0vdNbtKY6CXrek3LUoMY4XtjN/TdeIruj
         Pt62CGZlnLPHwmbUxwowPW1Tmt0Phdtb709BNXzXAJoy8+WCtzau9wU5t9S1JhvG9BUk
         MLSMDsIx8LPVMeGfg3pCpDa76S+SRI0vZAmuGWuMS0VMpscpjqqTs8Tdb1W15xp7ms6J
         WtJRSAq/KmNLykhuDpEwC6tUSSZMlLG60fdvPlC766BF80mFxrgOnYypT6uymnaN32qb
         tABVrm9vWcJtMrBFBrjVpH5gmksZzTpXIqIIvsV/yiP3wbQjNIDX7QVezgVUvv409X/t
         vNUw==
X-Forwarded-Encrypted: i=1; AJvYcCVPNeR3ZRxT3bSxZjyUmS5slREYQYfuY2g0cx1ySfry3Aqm2Fr5za7z9PgeLbmAm0rwzmx54/PEmYnm@vger.kernel.org
X-Gm-Message-State: AOJu0YzCXHekBtmPTb02X8r2wrb7H5vDWXxbpjKgWmMh4VBsWKM3JWCx
	QAq8DzcwSSiE3H1yBXb/zzl+x725m27HRtUKgBlwd/uFzVa/mqGT7VyHERuQPJQc/fbVHL+V1ap
	3XMJx/CcUTnfv1OnunqIA8ETin6YvbNA=
X-Gm-Gg: ATEYQzzKLaWPkNLS59cIDq7XK++FoPsprfrXtyFnHwrweXPD8EBth+HLkln+eoNddIU
	wd/lk7W+V8C41fUuVYQXq4mpftvKBSgNadM4pt34ZPJRPYSuDfIw8dmK8uR4YfLS4L0aojVqvIs
	jC6wbP0Q9xxuWTJCJSbJC3N9pvIG0uHOmyut5z0YqAj9P69OP8OQURs5qx6YzMI8FDNanTy4ALT
	0rnoW0ctDXaevR5dlRS0pLURYrLtO2eEUpQ9YH6ywxl0iuQpeQvY+HsnU3QZqIKV9JgKTsfIYnA
	BUqGCVEufDsn9aEwdSjKDaqqIkYLM5ScnV4cmrrQ/xTXQsC2JF7Pa5KUoF3Ubomsc4swphpANiV
	+5D0bSuwIuNe7ce0LQZidS/4=
X-Received: by 2002:a05:7300:fb96:b0:2c4:ec89:bdb with SMTP id
 5a478bee46e88-2c4ec8915ecmr1593272eec.2.1774877413347; Mon, 30 Mar 2026
 06:30:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <acp4AY8W5_jOo56Z@sirena.org.uk> <DHG5G61H8WGB.1UL0YPOVFUWFO@garyguo.net>
In-Reply-To: <DHG5G61H8WGB.1UL0YPOVFUWFO@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 30 Mar 2026 15:30:00 +0200
X-Gm-Features: AQROBzDPUIIwMtNzR4rXinSf5OopLCGTxaRo5MgXYrZ9-hoYAkQCnvIUjFzuqik
Message-ID: <CANiq72=MZekuSDBDrWGPrJS-mcFm2V_WabdrsNn8bzOQFUDQyw@mail.gmail.com>
Subject: Re: linux-next: manual merge of the rust tree with the origin tree
To: Gary Guo <gary@garyguo.net>
Cc: Mark Brown <broonie@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 30, 2026 at 3:26=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> I think this is missing a comma between slice_ptr_len and strict_provenan=
ce.

Indeed, it looks like it -- good eyes!

Also, nit: the line

    #   - Stable since Rust 1.79.0: `feature(slice_ptr_len)`,

should use a period instead of a comma at the end. But, actually, to
be consistent with the others, we should probably do:

    #   - Stable since Rust 1.79.0: `feature(slice_ptr_len)`,
    #     `feature(inline_const)`.

To be fair, perhaps we should use the "one per line" style, but meh,
most of this goes away with the bump and we will have another conflict
soon, so it does not matter much.

Thanks!

Cheers,
Miguel
