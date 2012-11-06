From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Cloning error
Date: Tue, 6 Nov 2012 15:34:33 +1100
Message-ID: <20121106153433.5337203bc0d2d9e7a72a0f8f@canb.auug.org.au>
References: <CANBXnM=3r=kkOP0uoZJuJcsZ56fZozxGziBedFLkDH-YT-MQZw@mail.gmail.com>
	<CANBXnMm+b=cAFTg=S2rxnXLznudMLNm8FFPWCSzHhb_qUP=vPg@mail.gmail.com>
	<CANBXnMnBn1D0MqvRhOnQe=uRcXWFq-_8T4G1Zw5Y8ReE7SC1-Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Tue__6_Nov_2012_15_34_33_+1100_KQ7Xt9LXky2iCynX"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:58268 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751362Ab2KFEek (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 5 Nov 2012 23:34:40 -0500
In-Reply-To: <CANBXnMnBn1D0MqvRhOnQe=uRcXWFq-_8T4G1Zw5Y8ReE7SC1-Q@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Adil Mujeeb <mujeeb.adil@gmail.com>
Cc: linux-next@vger.kernel.org

--Signature=_Tue__6_Nov_2012_15_34_33_+1100_KQ7Xt9LXky2iCynX
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Adil,

On Tue, 6 Nov 2012 09:51:10 +0530 Adil Mujeeb <mujeeb.adil@gmail.com> wrote:
>
> I tried again and getting same error:
>=20
> ----------8<---------------------
> $ git clone git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
> Cloning into linux-next...
> remote: Counting objects: 2881327, done.
> remote: Compressing objects: 100% (457639/457639), done.
> remote: Total 2881327 (delta 2425431), reused 2850544 (delta 2394681)
> Receiving objects: 100% (2881327/2881327), 579.96 MiB | 175 KiB/s, done.
> Resolving deltas: 100% (2425431/2425431), done.
> error: unable to create file
> drivers/gpu/drm/nouveau/core/subdev/i2c/aux.c (No such file or
> directory)
> ----------8<---------------------
>=20
> Appreciate if anyone help me in this.

Sorry, but I am not sure what is going wrong here.  It works for me:

$ git clone --reference linus.git git://git.kernel.org/pub/scm/linux/kernel=
/git/next/linux-next.git testxx
Cloning into 'testxx'...
remote: Counting objects: 167917, done.
remote: Compressing objects: 100% (41765/41765), done.
remote: Total 161885 (delta 142584), reused 136545 (delta 117901)
Receiving objects: 100% (161885/161885), 23.55 MiB | 912 KiB/s, done.
Resolving deltas: 100% (142584/142584), completed with 5220 local objects.

(The "--reference linus.git" reduces the amount downloaded considerably -
linus.git is a (bare) clone of Linus' tree).

If you do the clone with the "-n" flag (so no checkout is done) does it
succeed?  If you then do "git checkout master" do all the files appear?

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Tue__6_Nov_2012_15_34_33_+1100_KQ7Xt9LXky2iCynX
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJQmJNZAAoJEECxmPOUX5FEKycP/ikytp3dAlP9usOac3sPzYyi
K1nHFs+LzrhCCcMGq0Gn78bF2Xo3itExWFP09jcVd0nI6102CQg0ud3FdH2D7VLu
dq9Ee7hG8+za2Vob1VbNQjvQ8Y/pDF6Witu1QyVC1gkoWEEfEuWKsfHejOjhZpv5
lFj4RI0gNsDgcML2AT4NlWJ2kkFcxgj7myXpSQbb5CJ2ezHeMaRDBrLngSno//X0
r/8dX/Wh5FibAlS/OoP51VplJVtzPZadQ5AfgMirT0+SsaELpVy3f4EgE58PZ5P7
0LXtau6fdnAdNVgVtuwkfdIRp/HDW6pD9JzbeUcI1hM4tT6p86k402N/hiTz/d71
ghA8IcD6gSMnoExaXpCoeh1tbw8tIOKZ434wlSMKJLONuCzMNF6+8taxAYXwnOpY
twcMLeCeT/+LHxs7ecbZdl9XzX0lpJ9/qjok0qnHVkR52lY+3Pkt9R1N5eG1PD0c
MXyriBjbXegL1Yu6dYJcgXTDP6L8jBRTH4sn+G7EswBS/tnuGDnI/o5KGUGT/itJ
h8sm3EzLCLMVFy3hNwmTM7jVGPT6oZaXUTwYHJLPRxnwTSPCyWxSAeT/sIsq2nGb
2uAJ6VHmYbsxa0bGqedonvmPEmCVGJ5U5DMAxoXnqQ57cb96DxGyiXM9pDuZE8ar
ZM8Ci+tQRyOM8WaYXou7
=Gain
-----END PGP SIGNATURE-----

--Signature=_Tue__6_Nov_2012_15_34_33_+1100_KQ7Xt9LXky2iCynX--
