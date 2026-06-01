Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410E537FF71
	for <linux-next@vger.kernel.org>; Mon,  1 Jun 2026 13:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780318868; cv=pass; b=nKBF+S7Le4nQ20VNolk+xBMmhs08dbA9QJEGOoWBUplEw4/DPhGJLgQn2B2RZhFBECZdxM7h78/g7pYsPnDgeEqjIMm2SMHi7Djkv/0YL6lWQtBfRy3oDH8M21I/1BfqGDy6rNZ8bEdiOEqrIpkVN+3gtFXnHnH61V6kpa9ZwQ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780318868; c=relaxed/simple;
	bh=5mcGgw8CcJORG6b5kEmmuwkbo/zBoXy7kT2w5zhSs2s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S+JThW+kDBILoHobX7GDosNCKtpkPzzEt0PKzB8nxQu73KpykFOmW8hnVAI6DFe7tU/OjVNjOwMWy1EUPznhwB67YZEfFQ84YeC3Pe7QB9UxTXAxeaJkePU0g7w/msU7UQMNNHl94USZmHy9owJmSCN9mtztkN8kgkc/47LWs5s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UyxFqchH; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=DTgKdtx+; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UyxFqchH";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="DTgKdtx+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780318866;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5mcGgw8CcJORG6b5kEmmuwkbo/zBoXy7kT2w5zhSs2s=;
	b=UyxFqchHpTW8WGlBvJWHcG8M8M0INLWMoI0Ndw8XfG8mc0QDQg2C78wfxGV0Km3EB2WLXz
	zCW4RXCHJh4G+z15xf4lij3ozpp5VLtgwgrX/1N5fW6QKglBtMT8IFwwiNrjaS9oUzu7B8
	Ppo8ThCLQjLxPXBOpVYUHDPH0rZVQNE=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-78-BJbJqaOPNi-8Eq-jwGIvZg-1; Mon, 01 Jun 2026 09:01:00 -0400
X-MC-Unique: BJbJqaOPNi-8Eq-jwGIvZg-1
X-Mimecast-MFC-AGG-ID: BJbJqaOPNi-8Eq-jwGIvZg_1780318859
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-7e08bf5123cso32388057b3.3
        for <linux-next@vger.kernel.org>; Mon, 01 Jun 2026 06:01:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780318859; cv=none;
        d=google.com; s=arc-20240605;
        b=kbdTHcXGFh/y2QYrwYepcd47kOul4vPh1ZF3TMNxto5DYzbjA2rY7n3gOcQwZNiUE0
         W6GwBL34jsFdV8u04b3f3P6QHwgAuskht+xhVjayWhBAhWVvWHYqmsVa/m3HVAPAxVn2
         WuDV2J8Xad6QqSnLCXFGi1Z3ZELFpdts/uoyUTH4y/XlbaZFMcgz0HInyN4FVIakFcM8
         rKkVpOwGLU/aqvjn9reuQ96symR4Chwcq67nbSBJjRraOVu/ZRyn03irHmDANazXcONF
         1WPkWvNGZRR/6n4Y6tL0wyG4wdiJtoSB3NZ6o9K2eRUZnpj2158MSFcsusLp7d2Kz/V8
         i96g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5mcGgw8CcJORG6b5kEmmuwkbo/zBoXy7kT2w5zhSs2s=;
        fh=1VTaJEO9e5urbNU/iyfnM3sHk/Mza53SJTOSAYcGnIM=;
        b=EpedSiTzQtP+fTqhQC4yImsMHgLDFCSbbhsnKF7/lqpWcHii/c+NAla2QujQ17/FEY
         nIhWM/5FTEZqUscjqQx4chV68IDrbzYqUzaeE0rsnb+JYAdW7CGZQPDgzhq2j3Uj/BEt
         jt6FahGauuxgpjwjWt42ieIELN/7Xg9cwv/E7LloW0bybM63cOscmIixX/GSZO2b2p2m
         8s8bqi8r1JkNgmWlw5sxAwBzFD377WSmmtjjf6smQALF88sGd9PGOwelOMnKoMzV1yMm
         AeFDL9Ju3hrC5LEYuj1tNC587JLCaIg9q0Fj+ST0nY7itUmLMPEBk7vlSWSJ9QJx6JSB
         AYcA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1780318859; x=1780923659; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5mcGgw8CcJORG6b5kEmmuwkbo/zBoXy7kT2w5zhSs2s=;
        b=DTgKdtx+AdsjERGub0pSWkEfnwjodG0+t19s/hPFA0oDHrB/bOd/57aRCA7Np4VCGL
         eJe+eTPgmd6Ibne50+BU6NJBMRIS/xdwY4cDz1aS2M4mjM9WwDlCiHTapCozUxuT7Yxv
         eusIvUIvyEbeoY6Cway7CtvoZRhEE0k/k9kgFW57YCPkNLdwBauzbNz98ZC/vk8vIYj5
         4FGDDf4dO57cnBz9QUDozC3ZyE7n7kj77gLYV7g1HXE9NVWqkuoHWx0BomWfoHejj3VB
         wkvhDIsPURROiH463DeVcLyk/UFfvhgHEIcWPA06VUy8gh+P0sgUPkCaY3lw/SV4bEht
         sNvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780318859; x=1780923659;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5mcGgw8CcJORG6b5kEmmuwkbo/zBoXy7kT2w5zhSs2s=;
        b=Zl/ZVmeKG2O4LEiM7y4gUwRdssnElKD9QkVa6h+HrGQHm31GB/6FslIY9sn/0HUhmX
         qH3MxGwyyEB4ql4GhVDz7oS2j2fGMeVSyp1C/FegSfB9ciQGQk2vIzTOjGmJPDyRmlbs
         K0XwrvTaFWDyIhIAWXK10chhkXMnvwBPjWNLaZLmoTlm9FktK163YuQbU/R0TW4qzWUj
         nZiyga9qOdaDHRt8aGRVs0lfYpldIpwsMjy+trXsqj7klRhpiqoOOETR1tsEocm9Clnl
         l47ivvj7nJy4xtFBz3LIe1E4qQ4vyHWsRFdEAzbmAg3iHlId/aD//c8vV9xY4Tb29pxK
         JadA==
X-Forwarded-Encrypted: i=1; AFNElJ+p0AmiuMNb3A/TdaqBG8RUaBd7iTyrjv4i/QvOuI+rWTSeYx1Najcx+M3MQn6w9a5UtBa2twnG1eQA@vger.kernel.org
X-Gm-Message-State: AOJu0YzexbaQR+U/NWNwEYtfFNMapqy+y0iphC9NBOi2aE9YRpz9cawa
	idUPHVBFdpmsFi0H6XcdtM/QhTeYpTzZcfyyMzW51ax8v+tuq33SXTDbdqAPrbesSS4QTe0PsJW
	k3bwIMauuzaGTc99FRz1gE51HvQwbIU6qyYqe0TiL0WAPxeEoRUQv1IoZ6MbEkLMoP9LPLifv2G
	BWlkXjgCI7FbJ0VMBt2KFqmqz0+qBQXo8sdr6Klw==
X-Gm-Gg: Acq92OGXw+iw9F0KCgDCp7Jo8DE8P0P/tM88JXWprtdjzTWurFO2uJNGZyxMLQELrsB
	eIQJ7ZwB8zaxGJYlyU9i/204oyKfi/KT43f6oXgfSQMc6CpAulLEZgfoGRt/NGNpYNJbWo6uGDl
	37L3sOKoxg7sv7+DNnOmufRaEsneP6A9xb6TLwMxcLtosEIsb8Voh46VKm7s742n9n2oVPVzaz0
	5ezgdYwLJImW6/3
X-Received: by 2002:a05:690c:6b07:b0:7d1:fb8f:da6 with SMTP id 00721157ae682-7e05d8d092cmr98162337b3.26.1780318859259;
        Mon, 01 Jun 2026 06:00:59 -0700 (PDT)
X-Received: by 2002:a05:690c:6b07:b0:7d1:fb8f:da6 with SMTP id
 00721157ae682-7e05d8d092cmr98161037b3.26.1780318858426; Mon, 01 Jun 2026
 06:00:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ahRHShZFjI8AsT8G@sirena.org.uk> <894b9eb2-e054-40e4-a423-1ee5412a5e91@sirena.org.uk>
 <20260528-schalldicht-krampf-gefesselt-1be0e54eaa10@brauner> <7abb1dba-d4b4-4779-b9b1-01ec312aaa84@sirena.org.uk>
In-Reply-To: <7abb1dba-d4b4-4779-b9b1-01ec312aaa84@sirena.org.uk>
From: Miklos Szeredi <mszeredi@redhat.com>
Date: Mon, 1 Jun 2026 15:00:47 +0200
X-Gm-Features: AVHnY4Ls3iAgJrM06MYFVnqCsGAAHp2DLQtr8OXYcLjaWIJ-SGMhqVhfeEfVtG4
Message-ID: <CAOssrKeMe=67MLfrp+nVgY97EsSeTfmbqnTTon=AGAS6-oLjxg@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the nfsd tree
To: Mark Brown <broonie@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>, Chuck Lever <chuck.lever@oracle.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 1, 2026 at 2:53=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
>
> On Thu, May 28, 2026 at 10:30:07AM +0200, Christian Brauner wrote:
> > On Mon, May 25, 2026 at 02:08:44PM +0100, Mark Brown wrote:
>
> > > Unsurprisingly the vfs-brauner tree also acquired the same build fail=
ure
> > > so I also held it back at next-20260522.
>
> > @Miklos, I'm switching this back to jhash() otherwise we have to
> > default-select xxhash. See appended patch.
>
> This issue is still present today.

I'm going to resend the series today with various fixes, including this one=
.

Thanks,
Miklos

