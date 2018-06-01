From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Signed-off-by missing for commit in the drivers-x86
 tree
Date: Sat, 2 Jun 2018 01:26:46 +1000
Message-ID: <20180602012646.2a0801e8@canb.auug.org.au>
References: <20180601213639.74f49e51@canb.auug.org.au>
        <CAHp75VeULdbi3_V8JPffYCocmGtjC3QPdE-yPz5eDrkpONeE-A@mail.gmail.com>
        <20180601220832.73ad5b84@canb.auug.org.au>
        <7EC66A28-4E57-4B3C-A5AC-4D7D9CAF727E@infradead.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/0Zba2XOrRkS9AVC+4/Xhe+m"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <7EC66A28-4E57-4B3C-A5AC-4D7D9CAF727E@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Haruka Kawajiri <yukx00@gmail.com>
List-Id: linux-next.vger.kernel.org

--Sig_/0Zba2XOrRkS9AVC+4/Xhe+m
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, 01 Jun 2018 07:38:42 -0700 dvhart@infradead.org wrote:
>
> Stephen, are the tests you use available publicly?

I use the script below when I am fetching trees.  You don't want the
"gitk" invocation if you are doing this automatically, of course.  The
script just takes a commit range.

--=20
Cheers,
Stephen Rothwell

-------------------------------------------------------------
#!/bin/bash

if [ "$#" -lt 1 ]; then
	printf "Usage: %s <commit range>\n", "$0" 1>&2
	exit 1
fi

commits=3D$(git rev-list --no-merges "$@")
if [ -z "$commits" ]; then
	printf "No commits\n"
	exit 0
fi

for c in $commits; do
	ae=3D$(git log -1 --format=3D'%ae' "$c")
	aE=3D$(git log -1 --format=3D'%aE' "$c")
	an=3D$(git log -1 --format=3D'%an' "$c")
	aN=3D$(git log -1 --format=3D'%aN' "$c")
	ce=3D$(git log -1 --format=3D'%ce' "$c")
	cE=3D$(git log -1 --format=3D'%cE' "$c")
	cn=3D$(git log -1 --format=3D'%cn' "$c")
	cN=3D$(git log -1 --format=3D'%cN' "$c")
	sob=3D$(git log -1 --format=3D'%b' "$c" | grep -i '^[[:space:]]*Signed-off=
-by:')

	am=3Dfalse
	cm=3Dfalse
	grep -i -q "<$ae>" <<<"$sob" ||
		grep -i -q "<$aE>" <<<"$sob" ||
		grep -i -q ":[[:space:]]*$an[[:space:]]*<" <<<"$sob" ||
		grep -i -q ":[[:space:]]*$aN[[:space:]]*<" <<<"$sob" ||
		am=3Dtrue
	grep -i -q "<$ce>" <<<"$sob" ||
		grep -i -q "<$cE>" <<<"$sob" ||
		grep -i -q ":[[:space:]]*$cn[[:space:]]*<" <<<"$sob" ||
		grep -i -q ":[[:space:]]*$cN[[:space:]]*<" <<<"$sob" ||
		cm=3Dtrue

	if "$am" || "$cm"; then
		printf "Commit %s\n" "$c"
		"$am" && printf "\tauthor SOB missing\n"
		"$cm" && printf "\tcommitter SOB missing\n"
		printf "%s %s\n%s\n" "$ae" "$ce" "$sob"
	fi
done

exec gitk "$@"
-------------------------------------------------------------

--Sig_/0Zba2XOrRkS9AVC+4/Xhe+m
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlsRZbYACgkQAVBC80lX
0GwbDgf9HChXLyNZQY6Jwx+r5Lx3BQsWOzJLRNeGX9bq4G5QD6aoL9ZyJFyZbdcX
0MeW16lx+CS3c8m7GZJVWWg7cOokgLyPjSph4oGx2zQGwSsSDmgBBx1nD1LKN+XS
eC6AaozLS56SnEwu6t9SA7O93Y04ZvA49CzE/FuRMNImiG+LaXGbv4C/uAWzbIIS
0+COuGt8CIk/vhraN7GweMPoUUYaeFG10c70kEO/4fNAfqgMOOukcceh883253rC
s6toRacXswJJcNL1Xi999iGck7i98xjEvNV4kZ5HLN2/AyKoChAo4ApYK/0UDoOy
g7DhC8JLVywRwUkpX/PZEmhKuRDwAQ==
=Ttut
-----END PGP SIGNATURE-----

--Sig_/0Zba2XOrRkS9AVC+4/Xhe+m--
