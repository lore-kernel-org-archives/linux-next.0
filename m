From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Problem building i386_defconfig with next-20130920
Date: Mon, 23 Sep 2013 10:20:50 +1000
Message-ID: <20130923102050.bb0859b9b44d834a44facae1@canb.auug.org.au>
References: <CA+r1ZhjS+97EhQYXYSg-U9-SCrymoDmMu9JceBVyj7Wt0N3vgQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Mon__23_Sep_2013_10_20_50_+1000_Bxzg3p4Fj4z.CbU6"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:42678 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752210Ab3IWAVA (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 22 Sep 2013 20:21:00 -0400
In-Reply-To: <CA+r1ZhjS+97EhQYXYSg-U9-SCrymoDmMu9JceBVyj7Wt0N3vgQ@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jim Davis <jim.epost@gmail.com>
Cc: linux-next@vger.kernel.org

--Signature=_Mon__23_Sep_2013_10_20_50_+1000_Bxzg3p4Fj4z.CbU6
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jim,

On Fri, 20 Sep 2013 10:07:42 -0700 Jim Davis <jim.epost@gmail.com> wrote:
>
> Trying to build a x86 kernel is failing with
>=20
> kernel/bounds.c:1:0: error: CPU you selected does not support x86-64
> instruction set
>  /*
>  ^
> kernel/bounds.c:1:0: warning: -mregparm is ignored in 64-bit mode
> [enabled by default]
> make[1]: *** [kernel/bounds.s] Error 1
> make: *** [prepare0] Error 2
>=20
> Here's the steps I've gone through in detail, just in case it's pilot err=
or :/
>=20
> jim@krebstar:~/linux$ make distclean
>   CLEAN   arch/x86/tools
>   CLEAN   .tmp_versions
>   CLEAN   scripts/basic
>   CLEAN   scripts/kconfig
>   CLEAN   include/config include/generated arch/x86/include/generated
>   CLEAN   .config include/generated/uapi/linux/version.h
> jim@krebstar:~/linux$ git clean -fdx
> jim@krebstar:~/linux$ git remote -v
> linux-next    git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-ne=
xt.git
> (fetch)
> linux-next    git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-ne=
xt.git
> (push)
> origin    git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> (fetch)
> origin    git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> (push)
> jim@krebstar:~/linux$ git remote update
> Fetching origin
> Fetching linux-next
> jim@krebstar:~/linux$ git describe
> v3.12-rc1
> jim@krebstar:~/linux$ git tag | grep '^next-' | tail -1
> next-20130920
> jim@krebstar:~/linux$ make i386_defconfig

So, you are building v3.12-rc1, not linux-next ... i386_defconfig is one
of the builds I do before releasing linux-next (but not on just Linus'
tree) and it did not fail for me on Friday (gcc 4.6.3 if it matters), so
maybe this is fixed by something after -rc1 or in linux-next.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Mon__23_Sep_2013_10_20_50_+1000_Bxzg3p4Fj4z.CbU6
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBCAAGBQJSP4lnAAoJEECxmPOUX5FEz1gQAJaCO4FGo3cnY8IskWxtjJaj
f2JvmIXDG9af6JL/91dYu1CBP8AWzeMEOyo0kZDXwZTSVJ3QXf+EYMnRj/dpxbRX
54IyPCv5Q/mt3shsrCEwwCmHeWOeYceAwgqWnxV7CMNjypF6fI7VBrpbJLwMSoml
xBd3Oww3jnixORmI/QoeOAiR1/4CHT6OW3euJEx8JK/JuhNjfGbHH2108SDTZ5tp
AuO2U0iP1HDbZRJJOWcanf9CF4wZSgYprkrzfPYDNXyoD/ChQFwHccnqYlq66hfK
5hSezJ1Ws0CJ6UKKkXYZlybWK0tSBeQNLWZU5ShrcEOsp7Uxcy/h/9rAwYGKUWMz
EL+nWoQj8hs81MaV5fi5sAM6TSMnc47Ke0+LSZBf/SmgYsZStflOJVDgoqkKfVn4
Kvv6/hpZCTF7ywFED11zZyMc0IO031KrT80by6CSWnmmIlAjWAKbuioDmm/aZgTy
idWnhoo/FR6GWvS3OgdK3mGIGMg8Y9L/f1wO64anoms/HcAGseNGChubHGPTJV71
VuuPPWhVjdY3muxNNXAtvyGUAIq6VBmU+4nJS0v2tUG77OwsHc6mnPODpCeOF1M3
RJ1MVg6uc1g8V0gLCnMeZViEGskDfqHBn/7Cz0gsWuSLfsSsGPOFWX9YAqhu/1p2
C8W8npphzZNyKMQCyfb9
=mPB/
-----END PGP SIGNATURE-----

--Signature=_Mon__23_Sep_2013_10_20_50_+1000_Bxzg3p4Fj4z.CbU6--
