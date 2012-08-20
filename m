From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: expected linux-next conflicts from workqueue/for-3.7
Date: Tue, 21 Aug 2012 08:48:49 +1000
Message-ID: <20120821084849.28745bdae85f36bebcf5cff9@canb.auug.org.au>
References: <20120820220421.GY24861@google.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Tue__21_Aug_2012_08_48_49_+1000_phnoa_CDSbtFTxLx"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:57731 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756618Ab2HTWtA (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 20 Aug 2012 18:49:00 -0400
In-Reply-To: <20120820220421.GY24861@google.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tejun Heo <tj@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@redhat.com>, Bruno =?UTF-8?B?UHLDqW1v?= =?UTF-8?B?bnQ=?= <bonbons@linux-vserver.org>, linux-next@vger.kernel.org

--Signature=_Tue__21_Aug_2012_08_48_49_+1000_phnoa_CDSbtFTxLx
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Tejun,

On Mon, 20 Aug 2012 15:04:21 -0700 Tejun Heo <tj@kernel.org> wrote:
>
> I just applied patch series to deprecate flush[_delayed]_work_sync().
> All in-kernel users are converted to use flush[_delayed]_work()
> instead.  It will cause conflicts in the following files on
> linux-next.
>=20
> * drivers/media/video/omap24xxcam.c
> * drivers/media/video/cx23885/cx23885-input.c
> * drivers/media/video/cx18/cx18-driver.c
> * drivers/hid/hid-picolcd.c
>=20
> The first three files have been renamed and the last file has been
> split.  Resolution should be simple and if not, for whatever reason,
> the changes can be safely skipped.

Thanks for the heads up.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Tue__21_Aug_2012_08_48_49_+1000_phnoa_CDSbtFTxLx
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJQMr7RAAoJEECxmPOUX5FEMBcP/3ymo4ZvzCwTzlkyJBr9gmsk
z7kVyTEVOffATh5uT91KFNLtKhRpJ2JEdkGF22cFjJroILJQjueyCScZPor0EZl+
a5QQjvT6H/3IAcECubhOgMrDK85FjPdzv/Lnr6WuW+9Gkhz6BkTL6FAcUS4QRo6b
CkVYQX87QuYBMQtblu1SZmcpfVQZ+T4DF0swbGIdNRl2dXg0cQhWkmRVSRo+4gDD
kxTtjwWC0ZwUJTg2ZGrnK8Cb/sCfcDkmyaP5lh105yOkRjnp2R5mKtQakw1EKWmM
0tCkGaYAr41mkyLGypkXXdGCvz2aZ8htXGj/27O0SrQPVQlivo25r8n4FR4G5Jvl
VfIsYZdgxNBrA7zrNEvmVInPvadvT2AlEqCBnFvZ4mEHQU3lZyRjP4uvM91lWgbZ
fJtl0WC0/9kImmMNDt2N9rLrTvDOytI4YFfnb4lCIk9on8UzZAXv6boy4f4fMELc
WrLcvBsc5Bq0F7ZCBv7di1P7rkvKF9x+WG4QLxjjW0zmisPymHy9SEQ4C3sc5BII
KYiHE2u4c3yRwA9iKX3cjkfXAQwukWdApOntwuTrW7y9QBFlrzEKyspYx1/Lo938
FiNNhwZAwdZv3X8SZcRkv5h6gthX4hXwzCSg0AYYqBHsHcjhDDGe1Bx4DcivVGCE
qKPevJenyJ+lp0wzmVNw
=KBlw
-----END PGP SIGNATURE-----

--Signature=_Tue__21_Aug_2012_08_48_49_+1000_phnoa_CDSbtFTxLx--
