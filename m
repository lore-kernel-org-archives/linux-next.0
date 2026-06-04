Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57AC317147;
	Thu,  4 Jun 2026 15:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780585638; cv=none; b=E8HqYwBuGQHyQXKMaNnNvTLpkFNEAGXMur985mIbOAvOh9DKxGPoNcecPiIpr9eH0o9OEZ9fxyQqTfpILWnslETeu6RnvAEokg53sfHOcZjrX5yBVtd+NzJkxW6rFbWWF4EZdPofU30NV7gWdwVZgAc/p+QETJe34Ga8MsbCsl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780585638; c=relaxed/simple;
	bh=Do8BJNGMqwjU89/HfxsGYJJa/kxQWbOAalIPQrB+o7I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LJ/V+fZ/1jkM9UU87EBJvNtN7rZLrfERBFcOoqjJC8aey7npobrWj/eGTv9GFxNFN2h1ZSK1ptiqG47tAv/5T5YHWPZDhcGWjlv8t+UMWXxhEQEt0zIcXjS7SLIPzrdP2fy3gh/hmvk+3Vv3K9wLnFvdm6k+djizaZEqnO52w3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EAPH7taX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EAPH7taX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F9BF1F00893;
	Thu,  4 Jun 2026 15:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780585636;
	bh=q7R/7GcPyjxyZKgdsuIBjH5Zlh3C5Hv3t788rFeFg78=;
	h=Date:From:To:Cc:Subject;
	b=EAPH7taXLZyIq7Bv/zvfc580qATx7opxOfrihBu+rRz1F1DFMsuevxrzILjGi17MW
	 yftOGcU84V5e/fVbgDt6Zd0FhkiUFUH0+Dq2waaAqdo3jveqgTgPWhbrFAoe32R7aa
	 L7DGeZhdI4RxjUH8Gsb3+ESbl1MTWAzvIuet9Ikga3ijXqW1h9lfVqKqnNI4lz61t2
	 ULR5GoemhEfAhL+INLPbeW2PC4DgdV+rkEFTXiy5gUwXbu/FGr4hQXCxDW4rqmFvHw
	 AGOR46sy6mt2Tc560/Zu0QCVHfWe9k/mITucZgafhK/ZsM/b4vN1rzVwXgPhXC6B6b
	 vfTXjVwO1z0ug==
Date: Thu, 4 Jun 2026 16:07:12 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>, wangdicheng <wangdicheng@kylinos.cn>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the sound tree
Message-ID: <aiGUoChmVKE-xwvC@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PiSxprrvlvN3sWzR"
Content-Disposition: inline


--PiSxprrvlvN3sWzR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the sound tree, today's linux-next build (x86_64
allmodconfig) failed like this:

/tmp/next/build/sound/usb/qcom/qc_audio_offload.c:1045:6: error: unused
variable 'remainder' [-Werror,-Wunused-variable]
 1045 |         u32 remainder;
      |             ^~~~~~~~~
/tmp/next/build/sound/usb/qcom/qc_audio_offload.c:1046:6: error: unused
variable 'mult' [-Werror,-Wunused-variable]
 1046 |         u32 mult;
      |             ^~~~

Caused by commit

   f1f16e1809c8f (ALSA: usb-audio: qcom: Use PAGE_ALIGN macro for buffer size calculation)

I have used the tree from next-20260603 instead.

--PiSxprrvlvN3sWzR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmohlJ8ACgkQJNaLcl1U
h9Chlgf+O79sdk7dcpSn7EH2JvGnB5sMynGpwaOHhQfA5Evhb+Ca1iu8SvpWaSPF
s/nEnh7BPC2yICD6A5E/I/rqv2GU/9IyEZ6F/gmxg8l0VHf8iUYStRkgh/Bo/VtS
Z3FtomOAS1UaF1JG9Geb4it4aevqU5/BFqlNN7XzZLSxFmqByqjW5tMFcAAaHiI1
94AS74ZqQPesawwVjuwCDM8arXuFntkcPoyHZl1TehHG798IbKVzcL2QiMZwfJAz
MLza1t+hCqKt8gsxFTtHRvJvsyfAqtO90WkTnpPO2WSLWVZ10POuXd0XnFxVo4fD
m4+cezKxvmIZI31U51e0e2kZxY6Www==
=mFYD
-----END PGP SIGNATURE-----

--PiSxprrvlvN3sWzR--
