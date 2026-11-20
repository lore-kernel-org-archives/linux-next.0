Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795186530;
	b=yfhF4SCK50BA0SvNtanLGGJaV+aY1eCuf05tbHykStGVXMgPMpNBklPmjmNKDThPxAeX
	 72TUITe5yCDWTcGBs10f3YsU5JoTQonRS1EWZGmJCkWxc4O41CE26+4vD7UlKtHQ8drrw
	 OiLcwSwfDrjGLiMXc+FVeIL////3dhimN576tumOaFW8S091FXG5JnL65ED3q2f4em0j+
	 eYEw6fqateTYhFjdLWxI1h1gB8e1UM/FBdPaD4d7zqf4QjRApo90WvwSIZO0JKtXK0ujF
	 3QWcQPFghcuyEADfQUsjl6jJmtYqcitN2hr2WnCKnshW2ucrVtASkEK11qZEPmHy9dQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186530;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=k2afYDSbhGUGiUhcoGzLE+xs9HwNUM5FrmXjgV49pcQ=;
	b=Roy+nZN1d6qJNRmpFfuAq/V2e4hUhM4jaKVUVG6n7ZlLjmLxSg/JAwXgx1EZz9iceeGG
	 +ETy1qsl8RVdt9GJ9N79yXNLPA51lkdf1AizffrMxzWrO+5X1O/+J9pREFqqp06+un/C7
	 D04bH4oAN2E5BMUyOtMEHcf0XTASSRkl0RdFQeUXo+AVCSZKom0obTHy5o1kxIWnZr3vm
	 kA58AlA4f0xBmD6JKD3gSlsJlxkRR6oI6GzypzbK7vaisLHpyOa+Esh3R+/hBTtUah2LF
	 94WMwrXVED4s7KcSmuzeojCLpLHJ4Ydw5xICLXehRxwy1iTeD+K8oM5hvuYj5zYlKrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AgdN17dR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B520D606A325;
	Fri, 20 Nov 2026 14:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AgdN17dR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33CCA1F000C4;
	Fri, 20 Nov 2026 14:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795186530;
	bh=k2afYDSbhGUGiUhcoGzLE+xs9HwNUM5FrmXjgV49pcQ=;
	h=Date:From:To:Cc:Subject;
	b=AgdN17dRiKJVb2NOYdow/OGv5jT+kvxYncPbB5koJOb4gpolT+I3ZNBDNvz5UqLR0
	 sYFZ4+BcPvysnAc0Ejheh2yX0iBQ7tYLP5H9CJhC8CeXbraXZ8G3l78B+rCldNx/TW
	 hGrSVUA4rxoarrN67weq6geef4WF00uHu6xblKITd/FqXR0DiYG6hq9zJ/BNn9qmZE
	 jEjA80Ye53+Xm8A02XvnXtrUNmrryDey6Mq58hjLk8w+tqTjkNZSOwLOzwrne3S4OQ
	 VOnQ8C5MTU4P+c7WogJt/TRtZS6wNw/G5l+UJzL3kglZLUutMe2q8ZA+q1vvAxtKug
	 oziMUC0eZjBlw==
Date: Fri, 20 Nov 2026 14:55:26 +0000
From: Mark Brown <broonie@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the hid tree
Message-ID: <awBfXhrj8dYTa53z@sirena.org.uk>
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ecbcHoamtLU6R967"
Content-Disposition: inline


--ecbcHoamtLU6R967
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the hid tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

/tmp/next/build/drivers/hid/hid-logitech-hidpp.c:4714:4: error: call to undeclared function 'hidinput_disconnect'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
 4714 |                         hidinput_disconnect(hdev);
      |                         ^
/tmp/next/build/drivers/hid/hid-logitech-hidpp.c:4714:4: note: did you mean 'hid_disconnect'?
/tmp/next/build/include/linux/hid.h:1051:6: note: 'hid_disconnect' declared here
 1051 | void hid_disconnect(struct hid_device *hid);
      |      ^
1 error generated.

Caused by commit

   a9c54220eaab7 (HID: logitech-hidpp: disable works before stopping transport)

I have used the tree from next-20261119 instead.

--ecbcHoamtLU6R967
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsAX10ACgkQJNaLcl1U
h9BODwf/aFqI49fgLDzSVZRvDEzWoHNnJxs89/sn03ET58BzeYKc9NNoZg1o+8Nu
BUiIFA1kkuBsb9qTf6SJgbeP9wCThRj+F/QydZZGzhDKZlQ8w6Eq89EpVfmuIcBJ
lJYwshfpPE2cTdaJRlTf4EnpRyrMvvs2bXk3BXNpQFG6BIAFY0y4ZiDCAwjsnNaP
jm3RSqQshqdPVcYZLSc04Oqod1atzWfFQoWLjtzj9u3M9PLQjQHes9CaFdlP0n+8
DXJoDRKNTgdP7v+mKPtS9qnQmWMI8fyCU6GBtexzVEQy1ATyDwEh6rM3MnvyZadu
R+92gjwKJVQelnMzZjz+102mWEe7zA==
=bj6Z
-----END PGP SIGNATURE-----

--ecbcHoamtLU6R967--
