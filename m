Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795444647;
	b=zYv19KFBHj/ljoOQ0rR5vnA3oGM2WQAgr5Ge2/qblYbdswjsFL6/Hg7UnUBupvvfr4RZ
	 uNmh9bBB59p/WGkoJOf9n62U6j7U8vMty7X51hy1jkePNPjlIP78S917FG479RBQpv2PM
	 WAcDKc/zS/m1d2tYypCmFxO2tWM4O+SZCt6gfYkYDGZsAYsf5jGWnhdeGyX4aWPsob9AW
	 G5DcDWv0KrbA0IUGFCOl7ITsWiMhYdPabchb+WG8iNspMftg1h/xOA9cp0/1e+K6ZA1QT
	 khfLqje4W827bV5FGLjTzPC4dieOQzrg6Vr5N7Qbflxpuc9q4xRx3IkJ6g1RUbmsw6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795444647;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=VspRcK8r/bAxbnrJk3ARH5ZGSzxCu7C2u9+3Jvhwp3w=;
	b=rpt+2M+hYbEXYtE1X6hAncaJM+1HIzi3T6RKolLw5aL1FZzOZxqVzrRyrTyhTE7mhmPM
	 cwimn9Sp1amDIbCKeJRxG3jko/2idywL9nmzXVnxwu8kCuLr0EkFS6UIy54cfTWnZdDHR
	 qGl06Njo60uvdaXYSVAJ+lW8dyEwXNufzP0R7XzKPO91VKQI74H746bdarXaklgZ/7Vm5
	 IJWsLWuxfI98WaZI4fNU5dx2r7pNLgtbkzJ3NKkWYec6hpqrGwv49y2Na52J7TnuSOWjW
	 /BAhFnkLnIlvVqlToB6q0ugdHU2r3pgdsN3IedZLkfrnIQddXXxhhyuQtFGryc0MaIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Yw6bHTQc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACADC606A338;
	Mon, 23 Nov 2026 14:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Yw6bHTQc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D35FF1F000CF;
	Mon, 23 Nov 2026 14:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795444647;
	bh=VspRcK8r/bAxbnrJk3ARH5ZGSzxCu7C2u9+3Jvhwp3w=;
	h=Date:From:To:Cc:Subject;
	b=Yw6bHTQcHVgcqNULPpheAlLLu11BezjfsgfEgLVBzm5zcM0fZoaTVq0zvAQ21N5RW
	 qOr1Aat1CtC7n/iUzNsntRPzMbkxUWM84tPYn2PbDDsazKdI7aYVmlDDRb+c6uufqJ
	 UUALWSOO666PGKMB08kbQ3y2ZxJSsJAXALeebybRHDp6RKBQ5toRFb4FG1/aVz6P7/
	 fg5X1wn8bZLFbNnx2Bmr6QMU2pehf8asEH6OsMSfCosbPecN2A59yHKK1EEdZf7fse
	 1Oz3/acOKwckMfc40UYL3X2r9smAtzsFvCLqcEOXzFomIJXzIGoKsr9OP0iapoQNht
	 ye87HQdx9fLNg==
Date: Mon, 23 Nov 2026 14:37:23 +0000
From: Mark Brown <broonie@kernel.org>
To: Jeff Johnson <jjohnson@kernel.org>,
	Ath10k List <ath10k@lists.infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
	Yu Zhang <yu.zhang@oss.qualcomm.com>
Subject: linux-next: manual merge of the ath-next tree with the
 mm-nonmm-hotfixes-unstable tree
Message-ID: <awRPo1T3BGWPYOG7@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="BM+gsJGj69bNaxLO"
Content-Disposition: inline


--BM+gsJGj69bNaxLO
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the ath-next tree got a conflict in:

  .mailmap

between commit:

  7d72815bc36cc ("mailmap: add entry for Yuanfang Zhang")

=66rom the mm-nonmm-hotfixes-unstable tree and commit:

  92039549ef782 (".mailmap: add entry for Yu Zhang(Yuriy)")

=66rom the ath-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc .mailmap
index 2478b4943f8c1,da76f7b21654a..0000000000000
--- a/.mailmap
+++ b/.mailmap
@@@ -236,11 -225,8 +236,12 @@@ Christoph Paasch <cpaasch@openai.com> <
  Chuck Lever <cel@kernel.org> <chuck.lever@oracle.com>
  Chuck Lever <cel@kernel.org> <cel@netapp.com>
  Chuck Lever <cel@kernel.org> <cel@citi.umich.edu>
+ Chunkai Deng <chunkai.deng@oss.qualcomm.com> <quic_chunkaid@quicinc.com>
  Claudiu Beznea <claudiu.beznea@tuxon.dev> <claudiu.beznea@microchip.com>
 +Cl=E9ment L=E9ger <clement.leger@linux.dev> <cleger@kalray.eu>
 +Cl=E9ment L=E9ger <clement.leger@linux.dev> <clement.leger@bootlin.com>
 +Cl=E9ment L=E9ger <clement.leger@linux.dev> <cleger@rivosinc.com>
 +Cl=E9ment L=E9ger <clement.leger@linux.dev> <cleger@meta.com>
  Coiby Xu <coiby.xu@gmail.com> <coxu@redhat.com>
  Colin Ian King <colin.i.king@gmail.com> <colin.king@canonical.com>
  Corey Minyard <minyard@acm.org>
@@@ -1047,8 -1025,8 +1064,9 @@@ Yixun Lan <dlan@kernel.org> <dlan@gento
  Yixun Lan <dlan@kernel.org> <yixun.lan@amlogic.com>
  Yosry Ahmed <yosry@kernel.org> <yosryahmed@google.com>
  Yosry Ahmed <yosry@kernel.org> <yosry.ahmed@linux.dev>
- Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com> <quic_yuanfang@quicinc.c=
om>
+ Yu Zhang(Yuriy) <yu.zhang@oss.qualcomm.com> <quic_yuzha@quicinc.com>
  Yu-Chun Lin <eleanor.lin@realtek.com> <eleanor15x@gmail.com>
++Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com> <quic_yuanfang@quicinc.c=
om>
  Yusuke Goda <goda.yusuke@renesas.com>
  Zack Rusin <zack.rusin@broadcom.com> <zackr@vmware.com>
  Zhu Yanjun <zyjzyj2000@gmail.com> <yanjunz@nvidia.com>

--BM+gsJGj69bNaxLO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsET6IACgkQJNaLcl1U
h9Dd9wf+O5W91KshoUHKP4qzhSd0UxTthn86Xa21MNViawNhbFGcQrv0hB6vKQhd
VXzNc9c3z3hQNvukW+dSdqOhgLISHPkMszWM95bZ+ubcmQLqcKXkvVfUl0c/UY4D
93wpnn8GeAhXoIsoEGEuEw8yLAY4RIbVuSg2EBjhC3ZynX6nCbC53Y5vvhRhv/rx
Tf6JVFqp+RwW7GoXmQytNJ0Q+3rSKNfdhVuMhrII5cObRHn1wrohhxIMdIVh/5x2
hOYjOQyIThKQxgeglz05eEn69P06XKWxOkNFfqHU6VAIZlCjagNnd3vPvzMEIUOV
i7kWKpBrduB4bQugMmgWlRm47kh6NQ==
=aqLS
-----END PGP SIGNATURE-----

--BM+gsJGj69bNaxLO--
