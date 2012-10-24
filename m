From: Michal Nazarewicz <mina86@mina86.com>
Subject: Re: [PATCH] usb/gadget: let file storage gadget select libcomposite
Date: Wed, 24 Oct 2012 20:47:04 +0200
Message-ID: <xa1tehknlnbr.fsf@mina86.com>
References: <20121018144614.b61961cfae2274d52d340882@canb.auug.org.au> <50809624.30601@xenotime.net> <20121024144435.GF4368@breakpoint.cc> <xa1thapjlqv1.fsf@mina86.com> <20121024174508.GA6014@breakpoint.cc>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-=-="
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20121024174508.GA6014@breakpoint.cc>
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
Cc: Randy Dunlap <rdunlap@xenotime.net>, Felipe Balbi <balbi@ti.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, USB list <linux-usb@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

> On Wed, Oct 24, 2012 at 07:30:42PM +0200, Michal Nazarewicz wrote:
>> At first it looks strange as FSG does not use composite, but yeah:

On Wed, Oct 24 2012, Sebastian Andrzej Siewior wrote:
> Yeah. However, it should be removed in v3.8 anyway :)

Yep, that's what feature-removal-schedule.txt says. :]

--=20
Best regards,                                         _     _
.o. | Liege of Serenely Enlightened Majesty of      o' \,=3D./ `o
..o | Computer Science,  Micha=C5=82 =E2=80=9Cmina86=E2=80=9D Nazarewicz   =
 (o o)
ooo +----<email/xmpp: mpn@google.com>--------------ooO--(_)--Ooo--
--=-=-=
Content-Type: multipart/signed; boundary="==-=-=";
	micalg=pgp-sha1; protocol="application/pgp-signature"

--==-=-=
Content-Type: text/plain


--==-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQIcBAEBAgAGBQJQiDeoAAoJECBgQBJQdR/00W4P/01kbM2iZKHwCbNCqERqpTyI
c6+sflvLSS02m9FwHS7jrHjiPnnObC3TsMM0EMDVhptQqQgBI49h/ZsWOp+ZsEtY
ZLXVZVXz2odt2uSZOrhUzdMhE9BTddy93sXdf0BPN5OP2WGNY2NGNXAtWYa4rSoW
OKJrAeQOcmpVvSPC4D736upQsZ7t/7w2mZ2Ikbgg2PG7HaFB3CBF30JzWn3e6NuJ
DGunBE9rMmO1KsILImhQvywbv7UL3LIGqmVDoNu16iHuTpkbk6Q9/jpeaH0jjTb8
Bs4aSapNCYuAzkHuWbys/yousIKY8a7Qnf6AU13G5b1ysOcrZ3bpYgjdaei5MLl1
AJUH3RL/2JY+zM08JLnmr8WRpY75RQqmOkeWNpyZ6QM+6RtayTZF6s2tQS75jeTf
adWm0v7UuoIzbUW2ZxF/oNgtP6FbQesCQbW0m+ZSUA2nID1rNCV7yrDSuLPS8X0l
Y5CB2/WbY/+umcAcrGJZacO27KqyLC5qFceL6C1VGy664iDe3fBiUno0sH/ZdSBG
+oYuLLlgTHaixAn54Cs9ljbKDUMhnjrqVTzYGN2xMvkMILDYHHmpgYIzDxIFUQrC
7LXUYd/VwG1gqW5yG33cFj/hHWlwVXFi9qphI45ZcaB9Nz/s9g4B1wPxYL1kZhaO
K3ZLr+JjL0qkRmkATOf3
=pf8B
-----END PGP SIGNATURE-----
--==-=-=--

--=-=-=--
