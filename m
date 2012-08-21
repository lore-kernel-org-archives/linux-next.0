From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: expected linux-next conflicts from workqueue/for-3.7
Date: Tue, 21 Aug 2012 14:00:52 +1000
Message-ID: <20120821140052.d23547d171adf5cfd79f2413@canb.auug.org.au>
References: <20120820220421.GY24861@google.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Tue__21_Aug_2012_14_00_52_+1000_MZugLaY.pJ+7DuAv"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:37125 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750716Ab2HUEA5 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 21 Aug 2012 00:00:57 -0400
In-Reply-To: <20120820220421.GY24861@google.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tejun Heo <tj@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@redhat.com>, Bruno =?UTF-8?B?UHLDqW1v?= =?UTF-8?B?bnQ=?= <bonbons@linux-vserver.org>, linux-next@vger.kernel.org

--Signature=_Tue__21_Aug_2012_14_00_52_+1000_MZugLaY.pJ+7DuAv
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

git seems to have tracked and fixed these up

> * drivers/hid/hid-picolcd.c

I fixed this (the call has been removed).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Tue__21_Aug_2012_14_00_52_+1000_MZugLaY.pJ+7DuAv
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJQMwf0AAoJEECxmPOUX5FEkt4P/2krpU0sLgENwHFP27ZKdUqV
4A1kGEjZor7Rhk9YwMMER7gfunuQjFxMQhOY9cQXD8kplhH1rm80RcmuZtobn/pD
yup9gxx4i+uRgBAFfnySUqG8pg/iq8n23RlsPxQzZ3V26iZY+61saV0HGuRHgaH5
ZdZmdVTPHIhgwfC746BgglqR8bLMsPcXJkukaZ2oZF+oEE6tiW2qP//CDj24cwoM
50BDd7JDLLUP1o9zpqTlrIOZ77pQ/D1zDlFH+WX/5N8+jaMB+AvDBr8Y9464vgxZ
a9TTlZ4duCAlDDzy22lj74hThan/mjfSR3bhsGTAWe7Dg0b7hkpuGVgd2f9bM45X
JyyIKQ2na6R1k/Y7yXHeLxUOqDNKDLZ8KGvEsJLyk7Prb4+st+y7d/oo8ZUWr7x/
iDBfadwOlSTCMnTruJqwi4IcrYRwKLk3YpAL3pEaR4q/QsXoyldb9QSrzDWj7H90
Lhll8EWCJhESZhRwcmkAGSiM2GPaJFQAmUDkqi15PHskfrqJN3jiJgbBK0dQXZdn
zj9qfILUUxsZFNiXqqI9tHV5wchpbAKGEEDFcwDwtooEmg+39eKZewuprv3eBXb1
AZhpJj5/HlZDjXZo93HuEQMzEPz8o+i3EmXHeDMq3G/Y8poe3ZJ3Xjb3i72ZnMWP
oAtSSU6LCUYbmfdKkCih
=kTxj
-----END PGP SIGNATURE-----

--Signature=_Tue__21_Aug_2012_14_00_52_+1000_MZugLaY.pJ+7DuAv--
