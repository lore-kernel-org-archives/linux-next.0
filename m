Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792764161;
	b=cwAqylkH/2O/9NyL5RSaK35EK90jA3S4EwQtqy0YiDaA+yl31FgSrhVJDcD1G1k9GXH/
	 7ljlBAtYYCWzEKxkp1FBx1dBIVbEV0oXYz7VOQbiCCRxJT/VJ0jRNNyLNMNYJi04+OKea
	 Vx0C53dL+oNsrSWP0oEOqNVGUqmETOtyD7Ms7yoE7jApKlQZcfvBdpv+T4rNUOPD7Kos4
	 1BSNXBHNydLLdU4QwKPHrqh50l6DrDuRrYANE0JKf0LdjgD2xMktYNng8m2dj4PuTOu6N
	 HHg68zz8yDkRbQjX2NHWaPDDdI7g4WA1G2Heu4MHO2QWLdBQVW4Xyew73GcMBSo4cZQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792764161;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=KxLoDLWgJvMgs6wIWVpfV0QVpqCJ03FPiCeEYymXH0Q=;
	b=dPkETsLJQfuI7AZQ44MGNpXYyJOffH68EAzopdFjvJqY68d8Y63hzDxxkW8SayQlVQSb
	 y+I7t+5K/E0/P7UDScaxUFEpm8g8s6w6VgE1Whc/5utmjQ9hxVtzTFH8trSUSYOwV47pj
	 HqXXRgMHbFAdYIYUX9ZZIiQuEzsuFucelfUckCXKu/A+xLppefexUdCBMSCR0UkQkcuIQ
	 NpDNbokrTm5at3PyELGhfwsbXUVZPSNdnlvN9Teb+L4hczPf90H5wuIUQp0f75NyHMhfT
	 U52Y3qKfQcqDxDGQ/HqAOz+amutdpcUrr504OJY12L68q+KcBOB9QCmd3axVVVEYzkQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kRSd27EJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74BEB606A31D
	for <linux-next@vger.kernel.org>; Fri, 23 Oct 2026 14:02:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74BEB606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kRSd27EJ
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-313bab9cfe7so166276eec.3
        for <linux-next@vger.kernel.org>; Fri, 23 Oct 2026 07:02:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792764160; cv=none;
        d=google.com; s=arc-20260327;
        b=ZEthUQHrWZRjHTqxE55Rbm3MTaSlvAwcABAyViT+7jxHyODzpXzlEWsmsAIkWWhcvC
         ZuFjEjul56/MxAolaBZaslwutOSsklDzW9Byj3/wUuESJKBchO3r4vwkI4s65OSaklhZ
         7GVhscXSTurXdLlH4jcxKOtGu9G54Y878NXJU/kcy78faiQPLVnOxgf1JD746OTt+9j7
         nx65HQwQVA04SiExO6zJ/x9ARZyGVTU9V2Zpf5USMnjvc2XKJYwUbJp2goNbesEN85ta
         +/HVA4dbnYanLzW1ZWX4/O71LM8maaTzn2ehrAlKYV00A3+Qey1WzeYfv1U8WMIsoec3
         Ar9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KxLoDLWgJvMgs6wIWVpfV0QVpqCJ03FPiCeEYymXH0Q=;
        fh=fEeaeEZ8MXlzAFvgncpS4ZE6gXVT5sX4uGe08qlZEx8=;
        b=E7H+9w+fTY6EK4PM9SXOXb4sPmmwgMh5t+TzuwNgY7sa9TjrOFlRPIVWSULuFk7IIw
         FJbhGmUeRoI4vATmnahOH5ary0bXIugNYUyxZcucXEXgsBy5w/b2KKFLFYeQagNVOuqh
         T3Vf+Ojhlu+9Hzx3yHH9npW40yhxVQyrNe4G1bDnWQCbAInJ4moAYSa5MmrSKjTkhKPO
         +XGgdrjmpqcoTp4EHRblAc/1Btj0jDm4l/rCdnseCwtAEla3AbzV2UUrYVnwBGd342aN
         /fut56M2FMbRI8FGd3y3TW6LxEAGWzUrLOxC4IwfWGgQgfp+TWkbNpF6Tz331vhbfl5H
         xS+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792764160; x=1793368960; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KxLoDLWgJvMgs6wIWVpfV0QVpqCJ03FPiCeEYymXH0Q=;
        b=kRSd27EJYJUKVcWPuee5ETNgciKVK5zp3PTQ2bwJHBplRPWfvSHH7/gWDz9hKwSdeo
         1xa9qKXoRp6oMOlTsRUBh4jN2suT1mhMeRtQfK+lIbCXA0Bb2OcShUtu0JBFQSM7XsGw
         StncTsQn/FiAXK0dfzYd7NK8R/7tfKOvo+OoI9q0ZX7lcmqtZ9FJ7L6vX4yX4MIT3fan
         B0bMoSr1XUyZN1riQyYt8eVNd+NqvpIKUIGqGtRn42i7EKZznOoyRcPbVeCRa/Ezxr/T
         13Hx6o5ep6GuCVO8+RJBZwxnRZualgH0jyShKrtQqvd/vgNvIdtzPrnVBZEsRfBPMMRL
         lucQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792764160; x=1793368960;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KxLoDLWgJvMgs6wIWVpfV0QVpqCJ03FPiCeEYymXH0Q=;
        b=ynsvHjaELAov6KKTH9jrr7/Y5wIz67XuFr7awqz3iGIbIMAAYtG8xtQZcBfYmHZdt6
         MY/kkOr4mldp1AZpC6fCCZCQS3DIGnJSDV0vD1hslblsyemflBfxhNNM3y+7q9Dwbv+w
         nEVH4Me1Jb5AW+PPHjjNtYw7BgRJuhzCSCsisCqKgaFP16BryngwQGlcHxMn7CfNvNnb
         LZWje3m43OdLWdVEVmUSKkG8F8IGGCH5nZIlfpAetSvnYE0vYpFTjwj6Or3fzVerajFA
         iUD7kjkBFtL3p68fGrTAfyQ2TBYGrf82nvSquT9zKXeWtYUwlM3+UHfBSI+MXpfW76uQ
         3M7Q==
X-Forwarded-Encrypted: i=1; AKwUvBzurakHS0XJCtTHC42p8HiBZBN7kmjqzoI13d1NFz5Hfvvy+gcOzSfFed6AzUzfXluC61RTm+2EJlMb@vger.kernel.org
X-Gm-Message-State: AFq9FYLszDE/IJAZjPkvcfC2HKbQ6weTliqISnKZVxX4mPsO779rxLQW
	wQVz2ZQHQO6T8QuELUB6+MvbMpFL1I29mQiRROIPP7JfMpXl41c6HmijBURcUIuveYfGjoo02Ig
	tyrLtHeEUDW/P8SeubH31SmgJivLNmUI=
X-Gm-Gg: AYBFou2Plt0bc74kih5tdB85/Gz43HqdCwcBprN4KaNrVcwovGvRyRNwT4g3Bd/F1l2
	aWn9DeqqscA2DH19Hcgd9wbjx9pJ4TEQIIT53rfU9P3yGcyhnqAZZQxo+UQpGjYSrFCvkxXT2d0
	Tprjv4sQ78g+jaYghpeKUcgXkZf/v+hcDHpOkLqxPnsEdh/Z8LBEIIZFopIY47j9p6+KN3JRmlW
	IqEySsEcrv+pKbnLuvwDT2NfVd/W8DJUMHNn3D2/xcOs6d5uQI9/XcmRMTp3HaFlCNzxXTnlhqU
	4D85/4/ncjIurRYxZX/Wq50dB1BWu2KFHxDjxd2vUYBMa78V03FQH3zdt5BdPJY0Ynn+oSJuAas
	RA7ksI9ml+LG57kdh+DLHX2NhSa7BgWVHThzFhgBX+2wu0ryH76sXP55PC2k7q9FliT5I9IWSpx
	B2R/D19FcJ0RsoKKLRCDnhFuu907BwgDHHuhjcyLQ6sSw+irh4JnvzhfooTmb+ZLLfARHdPAXqb
	UsuswTBcDNvdWDu9CWOxxJg67TtS+dl0NIa
X-Received: by 2002:a05:693c:83dc:20b0:35e:d21c:f33e with SMTP id
 5a478bee46e88-369d9721136mr5533543eec.1.1792764160430; Fri, 23 Oct 2026
 07:02:40 -0700 (PDT)
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <attokmkItpQqg6Rb@sirena.co.uk>
In-Reply-To: <attokmkItpQqg6Rb@sirena.co.uk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 23 Oct 2026 16:02:26 +0200
X-Gm-Features: AclHuK8zRsOU9MnBL8-KjVBrr97HHHuEvLkLhpW6pD8mxLOKF8S5sTMyWGzDLvc
Message-ID: <CANiq72mifaokm9QBeFgY9gSph3p3XPZzG5Gt5Oyb6OSZqOrrRw@mail.gmail.com>
Subject: Re: linux-next: manual merge of the rust-fixes tree with the origin tree
To: Mark Brown <broonie@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Jason Gunthorpe <jgg@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2026 at 4:00=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> Today's linux-next merge of the rust-fixes tree got a conflict in:
>
>   rust/bindgen_parameters
>
> between commit:
>
>   bc6f2a284c633 ("rust: fwctl: declare cfi_encoding for fwctl_rpc_scope")
>
> from the origin tree and commits:
>
>   01f3e6b4b1c8c ("rust: irq: declare cfi_encoding for irqreturn")
>   39fe6892fd52f ("rust: hrtimer: declare cfi_encoding for hrtimer_restart=
")
>   7d109178cd644 ("rust: dma: declare cfi_encoding for dma_data_direction"=
)
>
> from the rust-fixes tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This

Looks good, thanks!

Cheers,
Miguel
