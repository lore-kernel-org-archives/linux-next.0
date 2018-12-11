From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Signed-off-by missing for commit in the gfs2 tree
Date: Wed, 12 Dec 2018 09:51:07 +1100
Message-ID: <20181212095107.5e35982a@canb.auug.org.au>
References: <20181212072402.7b967df7@canb.auug.org.au>
        <20181212073802.2fc8dc53@canb.auug.org.au>
        <CAHpGcM+wCSrj0pk89ZoMENp+L_zSXbSFhEJcsdDEOh1F-GmGvg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/FSyM6y_exB6/NT96yZnpR92"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHpGcM+wCSrj0pk89ZoMENp+L_zSXbSFhEJcsdDEOh1F-GmGvg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas =?UTF-8?B?R3LDvG5iYWNoZXI=?= <andreas.gruenbacher@gmail.com>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, Steven Whitehouse <swhiteho@redhat.com>, Bob Peterson <rpeterso@redhat.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andreas Gruenbacher <agruenba@redhat.com>
List-Id: linux-next.vger.kernel.org

--Sig_/FSyM6y_exB6/NT96yZnpR92
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Andreas,

On Tue, 11 Dec 2018 21:47:43 +0100 Andreas Gr=C3=BCnbacher <andreas.gruenba=
cher@gmail.com> wrote:
>
> Yep, I've not asked for a way to get the server to reject or warn
> about such pushes without a reason.

Sure, but also here's the script I run (which could be run before
pushing) ...

----------------------------------------------------------------------
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

author_missing=3D
committer_missing=3D

print_commits()
{
	local t=3D"$1"

	shift

	s=3D
	is=3D'is'
	its=3D'its'
	[ "$#" -gt 1 ] && {
		s=3D's'
		is=3D'are'
		its=3D'their'
	}
	printf "Commit%s\n\n" "$s"
	git log --no-walk --pretty=3D'format:  %h ("%s")' "$@"
	printf "\n%s missing a Signed-off-by from %s %s%s.\n" "$is" "$its" "$t" "$=
s"
	printf "\n"
}

for c in $commits; do
	ae=3D$(git log -1 --format=3D'<%ae>%n<%aE>%n %an %n %aN ' "$c" | sort -u)
	ce=3D$(git log -1 --format=3D'<%ce>%n<%cE>%n %cn %n %cN ' "$c" | sort -u)
	msg=3D$(git log -1 --format=3D'%b' "$c")
	sob=3D$(echo "$msg" | sed -En 's/^\s*Signed-off-by:?\s*/ /ip')

	am=3Dfalse
	cm=3Dfalse
	grep -i -F -q "$ae" <<<"$sob" ||
		am=3Dtrue
	grep -i -F -q "$ce" <<<"$sob" ||
		cm=3Dtrue
	"$am" && author_missing+=3D" $c"
	"$cm" && committer_missing+=3D" $c"
done

if [ "$author_missing" ]; then
	print_commits "author" $author_missing
fi
if [ "$committer_missing" ]; then
	print_commits "committer" $committer_missing
fi
----------------------------------------------------------------------

--=20
Cheers,
Stephen Rothwell

--Sig_/FSyM6y_exB6/NT96yZnpR92
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwQP1sACgkQAVBC80lX
0GwJywf/byUJe37+q7abz6pFZ1C5eRE+KsHO0ZkxrPPkzrXxtjiVbo7VnITO0shv
LWcEhEYQcowuZhDr7dsyBCAXzvWtRrFbQW/za4GLvHsNqDAj/xqFudxsYURMOh4g
eSKuyU2ZpaT7dxhuEGYzEuF/IjTC+RZpL6rIaFA6H26EdrT5iQEUWT9Ab8BnvUpE
BzI6knPjhXFVEniVItFRb2gbQ6qikkDZ6dO9WFyTbSm98/+L9IzfYJjM9QbMtnpp
kWhj3lLZDJ/SsJlynGW6rc2pAoxyLhLnJhpFXmCEweGv0f2IjCYkIwlrUtm0m3Ut
jOBs3UEhRxvJwRGMKI38mtVObUwT6Q==
=B/mI
-----END PGP SIGNATURE-----

--Sig_/FSyM6y_exB6/NT96yZnpR92--
