From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the vfs tree
Date: Mon, 29 Oct 2018 21:29:52 +1100
Message-ID: <20181029212952.2d0641fb@canb.auug.org.au>
References: <20181029200620.75f71e94@canb.auug.org.au>
        <20180910133525.28c5dd20@canb.auug.org.au>
        <20181029153334.7c8d16cc@canb.auug.org.au>
        <5183.1540804880@warthog.procyon.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/KhcNM3A2bKsRes/np1wT8XW"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5183.1540804880@warthog.procyon.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: David Howells <dhowells@redhat.com>
Cc: Al Viro <viro@ZenIV.linux.org.uk>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/KhcNM3A2bKsRes/np1wT8XW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi David,

On Mon, 29 Oct 2018 09:21:20 +0000 David Howells <dhowells@redhat.com> wrot=
e:
>
> I think these changes should cover them all.

Yep, that fixes the build for me, thanks.

Tested-by: Stephen Rothwell <sfr@canb.auug.org.au>
--=20
Cheers,
Stephen Rothwell

--Sig_/KhcNM3A2bKsRes/np1wT8XW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlvW4SAACgkQAVBC80lX
0GySjAf+KkLkvzFyqH9eEg6RjjqHE5mW/UNqRpBjM7H8tJGaxT7xlvFF0r6XpKbP
fUOdQ/4/8CV4lfH48k++MyMtKh5risumjjTjzz4xZBFflXih/R1EzptuDP59agrw
+5PtvBp+mgS4fxRgI1esNeOSa+Zu24PrvePaNgM65BnzrkFDSv7UBdrK/IpUTs58
UAvc2uw8eOwmrdmpi54UYyTpQJdQOrYvTJyk0fH61MytuAITH3zp+fnEMutvmW1X
WuKFiMrThEQvwM9uWQ2G0C22T/WDk3HIgNbkYjyg4fftccdRmoZ0QIXhe7kcU7dG
MYKkvoiQuhXw/zKrkquE5NkCkJ341w==
=Vt2o
-----END PGP SIGNATURE-----

--Sig_/KhcNM3A2bKsRes/np1wT8XW--
